<script setup>
import { Head, Link } from '@inertiajs/vue3';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
    laravelVersion: {
        type: String,
        required: true,
    },
    phpVersion: {
        type: String,
        required: true,
    },
});

function handleImageError() {
    document.getElementById('screenshot-container')?.classList.add('!hidden');
    document.getElementById('docs-card')?.classList.add('!row-span-1');
    document.getElementById('docs-card-content')?.classList.add('!flex-row');
    document.getElementById('background')?.classList.add('!hidden');
}
</script>

<template>
    <Head title="歡迎" />

    <div class="min-h-screen bg-gray-100">
        <!-- Banner -->
        <div class="relative">
            <div class="absolute inset-0">
                <img
                    class="h-full w-full object-cover"
                    src="/images/banner.jpg"
                    alt="探索生活"
                />
                <div
                    class="absolute inset-0 bg-gray-900 mix-blend-multiply"
                ></div>
            </div>
            <div class="relative mx-auto max-w-7xl py-24 px-6 sm:py-32 lg:px-8">
                <h1
                    class="text-4xl font-bold tracking-tight text-white sm:text-5xl lg:text-6xl"
                >
                    探索城市生活
                </h1>
                <p class="mt-6 max-w-3xl text-xl text-gray-300">
                    每天一個小任務，讓生活更有趣。加入我們，一起探索城市的美好！
                </p>
                <div class="mt-10 flex items-center gap-x-6">
                    <Link
                        v-if="!$page.props.auth.user"
                        :href="route('login')"
                        class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                    >
                        立即登入
                    </Link>
                    <Link
                        v-if="!$page.props.auth.user"
                        :href="route('register')"
                        class="text-sm font-semibold leading-6 text-white"
                    >
                        註冊帳號 <span aria-hidden="true">→</span>
                    </Link>
                    <Link
                        v-if="$page.props.auth.user"
                        :href="route('dashboard')"
                        class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
                    >
                        進入探索
                    </Link>
                </div>
            </div>
        </div>

        <!-- 特色介紹 -->
        <div class="bg-white py-24 sm:py-32">
            <div class="mx-auto max-w-7xl px-6 lg:px-8">
                <div class="mx-auto max-w-2xl lg:text-center">
                    <h2
                        class="text-base font-semibold leading-7 text-indigo-600"
                    >
                        探索生活
                    </h2>
                    <p
                        class="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl"
                    >
                        每天一個小任務
                    </p>
                    <p class="mt-6 text-lg leading-8 text-gray-600">
                        我們提供簡單、趣味、可執行的城市生活任務，讓您的每一天都充滿驚喜！
                    </p>
                </div>
                <div
                    class="mx-auto mt-16 max-w-2xl sm:mt-20 lg:mt-24 lg:max-w-none"
                >
                    <dl
                        class="grid max-w-xl grid-cols-1 gap-x-8 gap-y-16 lg:max-w-none lg:grid-cols-3"
                    >
                        <div class="flex flex-col">
                            <dt
                                class="flex items-center gap-x-3 text-base font-semibold leading-7 text-gray-900"
                            >
                                <svg
                                    class="h-5 w-5 flex-none text-indigo-600"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                    aria-hidden="true"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M5.5 17a4.5 4.5 0 01-1.44-8.765 4.5 4.5 0 018.302-3.046 3.5 3.5 0 014.504 4.272A4 4 0 0115 17H5.5zm3.75-2.75a.75.75 0 001.5 0V9.66l1.95 2.1a.75.75 0 101.1-1.02l-3.25-3.5a.75.75 0 00-1.1 0l-3.25 3.5a.75.75 0 101.1 1.02l1.95-2.1v4.59z"
                                        clip-rule="evenodd"
                                    />
                                </svg>
                                每日任務
                            </dt>
                            <dd
                                class="mt-4 flex flex-auto flex-col text-base leading-7 text-gray-600"
                            >
                                <p class="flex-auto">
                                    每天提供一個簡單有趣的任務，讓您探索城市的不同面貌。
                                </p>
                            </dd>
                        </div>
                        <div class="flex flex-col">
                            <dt
                                class="flex items-center gap-x-3 text-base font-semibold leading-7 text-gray-900"
                            >
                                <svg
                                    class="h-5 w-5 flex-none text-indigo-600"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                    aria-hidden="true"
                                >
                                    <path
                                        fill-rule="evenodd"
                                        d="M10 1a4.5 4.5 0 00-4.5 4.5V9H5a2 2 0 00-2 2v6a2 2 0 002 2h10a2 2 0 002-2v-6a2 2 0 00-2-2h-.5V5.5A4.5 4.5 0 0010 1zm3 8V5.5a3 3 0 10-6 0V9h6z"
                                        clip-rule="evenodd"
                                    />
                                </svg>
                                打卡分享
                            </dt>
                            <dd
                                class="mt-4 flex flex-auto flex-col text-base leading-7 text-gray-600"
                            >
                                <p class="flex-auto">
                                    完成任務後打卡分享，記錄您的探索足跡，激勵更多人參與。
                                </p>
                            </dd>
                        </div>
                        <div class="flex flex-col">
                            <dt
                                class="flex items-center gap-x-3 text-base font-semibold leading-7 text-gray-900"
                            >
                                <svg
                                    class="h-5 w-5 flex-none text-indigo-600"
                                    viewBox="0 0 20 20"
                                    fill="currentColor"
                                    aria-hidden="true"
                                >
                                    <path
                                        d="M10 9a3 3 0 100-6 3 3 0 000 6zM2 9a3 3 0 100-6 3 3 0 000 6zM17 9a3 3 0 100-6 3 3 0 000 6zM10 12a6 6 0 00-6 6v1h12v-1a6 6 0 00-6-6zM2 12a6 6 0 00-6 6v1h12v-1a6 6 0 00-6-6zM17 12a6 6 0 00-6 6v1h12v-1a6 6 0 00-6-6z"
                                    />
                                </svg>
                                社群互動
                            </dt>
                            <dd
                                class="mt-4 flex flex-auto flex-col text-base leading-7 text-gray-600"
                            >
                                <p class="flex-auto">
                                    與其他探索者互動，分享經驗，建立屬於您的探索社群。
                                </p>
                            </dd>
                        </div>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</template>
