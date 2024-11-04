Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DE9BAF5A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 10:14:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAA185D;
	Mon,  4 Nov 2024 10:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAA185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730711655;
	bh=s/ttbCKYGCQAyBg3k8aAJ8YN3CnoFMqeymrKJHMbdKQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GZ/Fvhh9Tmq6w2AKnJhPq4pwpwwFjwDKeMkpgUL7pHnqDNqdvGrXaHKxxzRT2IWj8
	 BCIdYNej5IohKgabuPdKDKx9dxgj4k4rcNfjhghJpi+/xi2szslzbSv7Ys6yPlmypg
	 NcGdeKbiOP2pRONBm9g3RSaHSRXrcxF0XdLMW3/k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24596F8026A; Mon,  4 Nov 2024 10:13:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C249F8049C;
	Mon,  4 Nov 2024 10:13:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B916DF8026A; Mon,  4 Nov 2024 10:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::602])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53D60F80104
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 10:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D60F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QnmO26VV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRpu+8kNT0+zVxdMnCwERxqBph+mIJ697wktfo12YACaAxftpEcDW0L2VNlTTFZvfHXMFOsvenfI+zEIQgVJDkPaJuaudGw0b2ZZTGquv4Uy7TuBTNXw/EOJOxdeGY5ykDK4eB5735RSTZmZPAv4gA0rFwv+AEEhjlx4MjPkRgj6qGV95y52paTvBMpjmfC8zFM5gFtoc5vVkC4kyN7/MvhZQvyP+ttKvyqMgwVxxckKW/w1Ec229UA/znuFF8yyb58AXjfjvjnzfSyDJjSY8+3hkFXptHJYs6B2l4vDhofQuhQN3+QnGBCaCF3R4Kb+VKd8K0657SVPSu1lAefo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3XTEcGdcJdq740imtppkEgkuDroXgp5hq4UxzUuc64=;
 b=FqHu6Q5OwT87hjQ3TX7C4A2/BEjPaC8VjDfkKaVH70gIL79+JxZncJCiS2j9cClBzdM9Y1rLn4ijP4lyeVhA/4q/YnTzPhjlsdb+5V00aJrXbayHv72XcktxM2ut7aAM1v9fS8zHoDqVnvVx2FPEubEkduUGXxjf1cWwfqF7oJcZHQQQf4zBC/QUTqo01938kB67k4uAJjb4siLC3DWTkTYRactyW+SuKMGe5SpGc5p/y17euxqjDbWwD9k3uGk9djYV4g18bTZed706c8kJp54tutN+HsyNgiKWueDHInbEhzbLmF+Sl5Tj5SHFBiPpajEKXhQx9GGQFhF3r/LyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3XTEcGdcJdq740imtppkEgkuDroXgp5hq4UxzUuc64=;
 b=QnmO26VVByeHWETT05EZMGvU12EOvsg67vVwKQ9VnMzwSwUO2MpGRQKsw2qaKUCQNFtNqTQ37VECn5KM2s3jxTRDiN7ERia0DAJxo9vczgooeP6whx4U3gPhoj12VZcFz2ahNVetopx/CSBoXr+UVmN+MmB3vADwK6GwDE671dk=
Received: from SJ0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:a03:39f::24)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Mon, 4 Nov 2024 09:13:27 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c3) by SJ0PR03CA0229.outlook.office365.com
 (2603:10b6:a03:39f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 09:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Mon, 4 Nov 2024 09:13:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 03:13:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Nov
 2024 03:13:22 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 4 Nov 2024 03:13:18 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <mario.limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load
 failure
Date: Mon, 4 Nov 2024 14:43:10 +0530
Message-ID: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 3452061f-21b1-464d-6598-08dcfcb0f18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xcez+bzxBA6JbyKIKIYJ4bbQfbenEpcV13FOGskoFriTcssYG9NiwCDZ6tTZ?=
 =?us-ascii?Q?obH+GhfjAhM1jF9aienidVWA0oB59Jy8ExFh2u/ZBtCqf01qtzYjkwovyy5L?=
 =?us-ascii?Q?yad8E6QLNCIJnFFHiiJkwn6gZHWzE+kIlTu/bnGnCTTAWh029tZ63Q4zVZWM?=
 =?us-ascii?Q?O84VDA54moiYKG9abVeZPjKV3a4MXw/086aythQagt8kuDJIrQTj5PmaFB6/?=
 =?us-ascii?Q?IQMAlnwGqwoDJisQwZKwCNuUXxsZCt2rIR8ifSFQxG5qOl1MtYQtDUfS7LMt?=
 =?us-ascii?Q?5Fjd9BFCpD0Sv9B+REAXtAAZ2SEbxFwqz+gFGAGjXMHejS/EWVp3UUDOGBVT?=
 =?us-ascii?Q?rfCQN8+j0RlfDYeI26Wug5WmeDq3e78iu1HKgt4V+4kkl8HwQnU6vK/H4JPL?=
 =?us-ascii?Q?QAA8gEkh5uoT5gMy/WQ+v2SVovovpHJjwH/LH0EQDvdCZvAmZYk+2S/SArgE?=
 =?us-ascii?Q?KzhXUEH/c8lhw5Y45njmW6kJ/BXf9WnpNT5zdBvRSLfH5eRyitOwDjLVS2kU?=
 =?us-ascii?Q?CumE8aAmqsyd5gV54IyDw2m6/6WoSjJ+7kelpAMQEInjgE8jeyZemQfrwcey?=
 =?us-ascii?Q?TFKt+Iv2438QrjU/MrqdOvOZi+2ZRJ5HkNNBiQnIY2i6zMZcTTE2Fw9acarR?=
 =?us-ascii?Q?iu95fzECAZTgbqGoGdiQ71W5b1mTtiRVcGcz2A7PjUfPWiWbQZNv0ONmsqj1?=
 =?us-ascii?Q?ZD8f6bp7P4TBOoaHr8kz3iRP1Ur/+B/jhVVWxlAqtMd+02hWGDuYh6AgF3UX?=
 =?us-ascii?Q?/QsXruQSphVPokJksdqpGzml4KYfRfhGRn1GlLGmN7lEHA1UpxpFUB289fSE?=
 =?us-ascii?Q?GmZWinVmGx2wwwIZOcsusFado4RsG6ytPLfX4zennoGVmpe0B4naVaGvfN+F?=
 =?us-ascii?Q?m6vaRbW/buocs7n7XMazEFdgsPvsKh62OX5Dh4t0W+8oIj1xKZRNkpJzX3ce?=
 =?us-ascii?Q?rtGWOe3zWJRKwa043wd7j2CwHUYgB9WEysmKcEWpgvdTOy3jQFYd9RNcR4le?=
 =?us-ascii?Q?l46/15k8E3Q5iMgGLg2gre1kp8Z6VJrl4V/gOMbCopG6iX+d7v5sQMsif+am?=
 =?us-ascii?Q?bJ+kJznfr++DjdUupihZwHHdGANp4d1zapzb9xNucuw0vdd5Y6exhJoCjhPI?=
 =?us-ascii?Q?9vX5lI6Ft5QKVW8vWZW+oY/Vom/PA+QgANORIFOPN8s5sHgGX61UnPSOZsI3?=
 =?us-ascii?Q?UkQUiIBghC4RT990lxtBZ+JjTBWyUTQN0Gqj6HTJ3D/+JpqnjfoXqH1I05gN?=
 =?us-ascii?Q?6Iku1YI7M3qRxWG9o7ZT7B0PIk8FOeoTcfVeHEyiK3ItHYGxZe0WN54Md3Ti?=
 =?us-ascii?Q?oXU9gUGML5YRVvdag8E+DVWmCO5w28J+w3zrWdou4Ju7Vnik+GgVnN4R2HQm?=
 =?us-ascii?Q?FSWXiCzydJkqpwum4tZrH3dW+umA2zHqH+K+NfE4FVjs2fjBaQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 09:13:27.5355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3452061f-21b1-464d-6598-08dcfcb0f18f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
Message-ID-Hash: PT4CW2ZIIHMZYFVUJJQKPMHCNTSQ2SEW
X-Message-ID-Hash: PT4CW2ZIIHMZYFVUJJQKPMHCNTSQ2SEW
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT4CW2ZIIHMZYFVUJJQKPMHCNTSQ2SEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Stream name mismatch with topology file causes tplg load failure.

As SOF framework assigns dailink->stream name, overriding stream name
other than link name causes SOF dmic component load failure.

[   35.474995] snd_sof_amd_acp70 0000:c4:00.5: error: can't connect DAI ACPDMIC0.IN stream acp-dmic-codec
[   35.475001] snd_sof_amd_acp70 0000:c4:00.5: failed to add widget type 28 name : ACPDMIC0.IN stream acp-dmic-codec
[   35.475013] sof_mach acp70-dsp: ASoC: failed to load widget ACPDMIC0.IN
[   35.475018] sof_mach acp70-dsp: ASoC: topology: could not load header: -22
[   35.475072] snd_sof_amd_acp70 0000:c4:00.5: error: tplg component load failed -22
[   35.475083] snd_sof_amd_acp70 0000:c4:00.5: error: failed to load DSP topology -22
[   35.475090] snd_sof_amd_acp70 0000:c4:00.5: ASoC: error at snd_soc_component_probe on 0000:c4:00.5: -22
[   35.475117] sof_mach acp70-dsp: ASoC: failed to instantiate card -22
[   35.475254] sof_mach acp70-dsp: error -EINVAL: Failed to register card(sof-acp70-dsp)
[   35.475261] sof_mach acp70-dsp: probe with driver sof_mach failed with error -22

Fixes: b2385de2ae11 ("ASoC: amd: acp: Add stream name to ACP PDM DMIC devices")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 67aa0ad83486..d314253207d5 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1561,7 +1561,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 
 	if (drv_data->dmic_cpu_id == DMIC) {
 		links[i].name = "acp-dmic-codec";
-		links[i].stream_name = "DMIC capture";
 		links[i].id = DMIC_BE_ID;
 		links[i].codecs = dmic_codec;
 		links[i].num_codecs = ARRAY_SIZE(dmic_codec);
-- 
2.39.2

