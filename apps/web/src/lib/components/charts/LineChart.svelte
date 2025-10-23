<script lang="ts">
	import { Line } from 'svelte-chartjs';
	import {
		Chart as ChartJS,
		Title,
		Tooltip,
		Legend,
		LineElement,
		CategoryScale,
		LinearScale,
		PointElement,
		Filler
	} from 'chart.js';

	ChartJS.register(Title, Tooltip, Legend, LineElement, CategoryScale, LinearScale, PointElement, Filler);

	interface Props {
		data: {
			labels: string[];
			datasets: {
				label: string;
				data: number[];
				borderColor?: string;
				backgroundColor?: string;
				fill?: boolean;
				tension?: number;
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
	<Line {data} {options} />
</div>
