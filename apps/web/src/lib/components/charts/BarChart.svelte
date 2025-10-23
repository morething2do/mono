<script lang="ts">
	import { Bar } from 'svelte-chartjs';
	import {
		Chart as ChartJS,
		Title,
		Tooltip,
		Legend,
		BarElement,
		CategoryScale,
		LinearScale
	} from 'chart.js';

	ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale);

	interface Props {
		data: {
			labels: string[];
			datasets: {
				label: string;
				data: number[];
				backgroundColor?: string | string[];
				borderColor?: string | string[];
				borderWidth?: number;
			}[];
		};
		title?: string;
	}

	let { data, title = '' }: Props = $props();

	const options = {
		responsive: true,
		maintainAspectRatio: false,
		plugins: {
			legend: {
				display: true,
				position: 'top' as const
			},
			title: {
				display: !!title,
				text: title
			}
		},
		scales: {
			y: {
				beginAtZero: true
			}
		}
	};
</script>

<div class="h-full">
	<Bar {data} {options} />
</div>
