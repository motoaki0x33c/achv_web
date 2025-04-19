<script setup>
defineProps({
    modelValue: {
        type: String,
        required: true,
    },
    id: {
        type: String,
        required: true,
    },
});

defineEmits(['update:modelValue']);
</script>

<template>
    <textarea
        :id="id"
        class="border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm w-full"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
    ></textarea>
</template> 