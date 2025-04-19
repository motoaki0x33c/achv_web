<script setup>
import { Head } from '@inertiajs/vue3';
import { useForm } from '@inertiajs/vue3';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import TextArea from '@/Components/TextArea.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';

const form = useForm({
    title: '',
    content: '',
});

const submit = () => {
    // 待實現文章發布功能
    console.log('發布文章:', form.value);
};
</script>

<template>
    <Head title="探索" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                探索
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <!-- 今日任務提示 -->
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg mb-6">
                    <div class="p-6 text-gray-900">
                        <h3 class="text-lg font-semibold mb-2">今日任務</h3>
                        <p class="text-gray-600">
                            今天，請嘗試在您所在的城市找到一個您從未去過的咖啡廳，並在那裡度過一個悠閒的下午。
                        </p>
                        <div class="mt-4">
                            <PrimaryButton>開始任務</PrimaryButton>
                        </div>
                    </div>
                </div>

                <div class="flex gap-6">
                    <!-- 主要內容區 -->
                    <div class="flex-1">
                        <!-- 文章輸入區 -->
                        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg mb-6">
                            <div class="p-6">
                                <form @submit.prevent="submit">
                                    <div class="mb-4">
                                        <InputLabel for="title" value="標題" />
                                        <TextInput
                                            id="title"
                                            type="text"
                                            class="mt-1 block w-full"
                                            v-model="form.title"
                                            required
                                            autofocus
                                        />
                                        <InputError
                                            class="mt-2"
                                            :message="form.errors.title"
                                        />
                                    </div>

                                    <div class="mb-4">
                                        <InputLabel for="content" value="內容" />
                                        <TextArea
                                            id="content"
                                            class="mt-1 block w-full"
                                            v-model="form.content"
                                            required
                                        />
                                        <InputError
                                            class="mt-2"
                                            :message="form.errors.content"
                                        />
                                    </div>

                                    <div class="flex items-center justify-end">
                                        <PrimaryButton class="ml-4">
                                            發布文章
                                        </PrimaryButton>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- 文章列表 -->
                        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                            <div class="p-6">
                                <div class="space-y-6">
                                    <!-- 文章項目 -->
                                    <div class="border-b border-gray-200 pb-6">
                                        <div class="flex items-center justify-between mb-2">
                                            <div class="flex items-center">
                                                <img
                                                    class="h-10 w-10 rounded-full"
                                                    src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                                    alt=""
                                                />
                                                <div class="ml-3">
                                                    <p class="text-sm font-medium text-gray-900">
                                                        使用者名稱
                                                    </p>
                                                    <p class="text-sm text-gray-500">
                                                        2小時前
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <h3 class="text-lg font-semibold text-gray-900 mb-2">
                                            探索城市中的隱藏寶藏
                                        </h3>
                                        <p class="text-gray-600">
                                            今天在城市的角落發現了一家超棒的咖啡廳，環境優雅，咖啡香醇。推薦大家有空可以去試試！
                                        </p>
                                        <div class="mt-4 flex items-center space-x-4">
                                            <button
                                                class="text-gray-500 hover:text-gray-700"
                                            >
                                                <svg
                                                    class="h-5 w-5"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    viewBox="0 0 24 24"
                                                >
                                                    <path
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
                                                    />
                                                </svg>
                                            </button>
                                            <button
                                                class="text-gray-500 hover:text-gray-700"
                                            >
                                                <svg
                                                    class="h-5 w-5"
                                                    fill="none"
                                                    stroke="currentColor"
                                                    viewBox="0 0 24 24"
                                                >
                                                    <path
                                                        stroke-linecap="round"
                                                        stroke-linejoin="round"
                                                        stroke-width="2"
                                                        d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"
                                                    />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>

                                    <!-- 更多文章項目... -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 側邊欄 -->
                    <div class="w-80">
                        <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                            <div class="p-6">
                                <h3 class="text-lg font-semibold mb-4">
                                    熱門探索
                                </h3>
                                <div class="space-y-4">
                                    <div class="flex items-center">
                                        <div class="flex-1">
                                            <p class="text-sm font-medium text-gray-900">
                                                城市夜景探索
                                            </p>
                                            <p class="text-xs text-gray-500">
                                                32人參與
                                            </p>
                                        </div>
                                        <span
                                            class="inline-flex items-center rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-medium text-green-800"
                                        >
                                            進行中
                                        </span>
                                    </div>
                                    <div class="flex items-center">
                                        <div class="flex-1">
                                            <p class="text-sm font-medium text-gray-900">
                                                週末市集尋寶
                                            </p>
                                            <p class="text-xs text-gray-500">
                                                45人參與
                                            </p>
                                        </div>
                                        <span
                                            class="inline-flex items-center rounded-full bg-green-100 px-2.5 py-0.5 text-xs font-medium text-green-800"
                                        >
                                            進行中
                                        </span>
                                    </div>
                                    <div class="flex items-center">
                                        <div class="flex-1">
                                            <p class="text-sm font-medium text-gray-900">
                                                咖啡廳巡禮
                                            </p>
                                            <p class="text-xs text-gray-500">
                                                28人參與
                                            </p>
                                        </div>
                                        <span
                                            class="inline-flex items-center rounded-full bg-gray-100 px-2.5 py-0.5 text-xs font-medium text-gray-800"
                                        >
                                            已結束
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
