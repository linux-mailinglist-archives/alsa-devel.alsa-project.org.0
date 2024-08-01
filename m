Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213FC9446EE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35A1E363B;
	Thu,  1 Aug 2024 10:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35A1E363B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501962;
	bh=99tx3e05MDyfL4o7hhPthNzNR7WFUko4pk2+NFAhRmc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PXAifhufWCV4UjM2hCLxRDLagWBFWjlHHTSvzZnmoi3epJCthsNboTJyV1J0zzaPA
	 wBI3UhruT/81II1P4RAWbAMrSRv0ImsGPNEF0JOKs2lwhlS4Pkh6ZYau1YgOl/XwqY
	 RftZ4gfgebpPGW68Pq4MbE19MrNXrfWMXILrlu9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28E0DF805E7; Thu,  1 Aug 2024 10:44:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC45F805CB;
	Thu,  1 Aug 2024 10:44:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29E0BF8026A; Thu,  1 Aug 2024 08:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FE07F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE07F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=po5mPeHB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/IrzrjI4/tFQfHVFH+T3s+fo4VvlQFiTdnBHi11KEbMhoCAfTfznJGR5j5XjbP0DXQYK+rqMx+klhdr1la7GBWQy7EHHtFXIIeZBBBZ8MRCL3gLXwJrdwxQaztu2AJynGsunuJZ5ztqUekMQh6FievG+HsE4PpadTRt26o13GzKfR0diWexNsePbRt6AiT3cZZOqQL8ena3laeZQNrdEFEjz41JLdjcoLApLx+t9HcPPYERtLN2ne2DIP27v4j+okzC7E4aKuJxLRJTWLue/H67W7ihmaeXfj5PnGFFnQDVycxwzM1IFKAFll9NeqsMbM5IxnAvgowYipupQx0Hyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we75CDPL7ANvzTnjyftxd/aOT+5qqjwvgSAZNMOidSo=;
 b=N5z1uMlzGb8a/IiDPROQgIaWITcEYo2UXz3lxUlfoIqjhzkagr+OoxhOKxC4OCl/+YjYSx6L0JeMU9JNmA7r1iJKdQ/ieqv3t8qZQRKyqb6DAbyZ8bjB+Vd0mLUMzUO3bugo4QGjsj0W0caPAQlzYJiW0w0Fd5HEN+4okh8wICYuNcn113VuXhE1h3OlxeAY4lRWmmhn7LImjt3SUp83WrA4Yto5lAXf58MdZxrYTgX+zWOEcmtX0Gr/YCJhVnmdPJ0KVTjzp61y3C76Y0pwvgLymp+DZ6DNAV/i/Mb6IS+PY4z7tm1L8aWYlwR+y9sblRcGQX7ATKrL8Jvm6cCp1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we75CDPL7ANvzTnjyftxd/aOT+5qqjwvgSAZNMOidSo=;
 b=po5mPeHBEgpY04dKa9xrqorOZpb+7i2FDMnXSx1CQ/c+l9WKrm3Sfu3YCNwHquneKUuf+Eklde9k4TE7X/1CLNTrTuULnGdevCSTvu6JrnurcyAB1eJwSw0mMB1s0wvmW/a9tf3di/2Uec+ZVPJ3HbWWwNrzZazIs+3c3dAV4no=
Received: from SJ0PR03CA0123.namprd03.prod.outlook.com (2603:10b6:a03:33c::8)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 06:33:43 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::69) by SJ0PR03CA0123.outlook.office365.com
 (2603:10b6:a03:33c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 06:33:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:33:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:33:41 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:33:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	jairaj-arava <jairaj.arava@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Richard Fitzgerald
	<rf@opensource.cirrus.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 19/31] ASoC: intel/sdw_utils: move cirrus soundwire codec
 helper functions
Date: Thu, 1 Aug 2024 11:54:04 +0530
Message-ID: <20240801062416.2203673-20-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 85fbcb83-e5ed-4c2d-15fc-08dcb1f3e35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oi6Q/kfedadRvurpyFmTQn3HQ7zE7N4x6Iir8eNM55KEOvG9oI8+KC7tP8v/?=
 =?us-ascii?Q?iQObj880wHNQecWjfU6j+mwFESzg10o3cBINjeicPoWZB8HOKH+CGLU5GZgK?=
 =?us-ascii?Q?yk0kzWMNQ3t6rt1WVK4lqharDFmUusKGLTkMlQQEytuck5Z0YHWw1szFjw9L?=
 =?us-ascii?Q?DGsWrMgcXzNKALgAQeJdjDwjn3nmAB/zSk5BU4QOLQkwS/VKshfBpaPtkbNQ?=
 =?us-ascii?Q?QPvbZc4S0Pf9BcANJ50f7k1VFoKpxKkN7w+TWdGaEpMw5Ca/0PVA0aCPckyv?=
 =?us-ascii?Q?4fD69njQr75A8c4CtvmP3AXQzZlvorrhFHJceayKIsUNclG0JgmoCAb/AcgO?=
 =?us-ascii?Q?jD+qmb1upLZb2kRDt1dvWKaZssYl0xP+LZKJ7P2GP7rQRXvVbz/khLNZAdJZ?=
 =?us-ascii?Q?vt7N9PpaxxI1aoo59NlGpSeV/KcWg9imBaMVWS/fj8NbYD0ef1P7naoASRnD?=
 =?us-ascii?Q?5BOHcIyvEMI/yZETNXiSaVwoxL6BsP0+AyftRtGkUaxu5VaZM4xlcbBBb1UX?=
 =?us-ascii?Q?UtsIwtL1HEox71sUU6KZAVAEXJCfmkf9gaofR11VIOoe4m6lR4uv/KP/InS+?=
 =?us-ascii?Q?Fa9cDJzvMv92CwYIqJ+z9JHE8Wzus6EuF2/gFIZBseQ0OlpQj4RBZgoflAUG?=
 =?us-ascii?Q?a6ilWuyvMjEGUYRZlay6Hy1uwmEDrw2trD4WQf6JDMSV/+8ru5gSzTYZs6Zc?=
 =?us-ascii?Q?OIIwAhWOQ1Gm9Os2EIpX22UUJtn0qNBJ/xNCRIoYcBXqeijMTJOq1qWGj7oS?=
 =?us-ascii?Q?oYUUqg/MopwR1+9yHVj+lGOtbxaap6z54nzCWUCntFqimgIpjSPke/B5nk8u?=
 =?us-ascii?Q?Hfa+2WZ5E3XR+6bUflh2yRyWv8NSD+VCMpZq5mq3MWs7laS/WEACa//4KGDy?=
 =?us-ascii?Q?L+g3SiahIiNplHq6wcYf/ZoBsscM/bAdxpx7vhnZIqI/OW89y5OFrd183LBO?=
 =?us-ascii?Q?l/ngM0nIsQCdd5L7VQFSzeu0e6fOp4IQbr5XS8dnOcFye4ZTjoM7v5xz4VjC?=
 =?us-ascii?Q?6AmlrIR6lV1Wv2UXS0lYO/50258jnkvfLu9v9KFKiwsru/7vS8UZ8TZBJw7a?=
 =?us-ascii?Q?YSMXFvNgDzsGg3lAFC6Gt7UeNxxWy7l7Ir0Hki8mCm1RuZpbe/42raxqxISk?=
 =?us-ascii?Q?9xl+nMc4ZJejMCCmEicDO6ToqDILfz9k1jRsOO/CCgWs45PW1Um4D4/BwTqR?=
 =?us-ascii?Q?4uCb9Njm9mL1P7WQACApevHIjhGN8d6SuHqz7fj0lyil34w8tMUVNkZd3nNj?=
 =?us-ascii?Q?mbh5Jwki4YxEUGXFbByefd+8wrIAbBYE2mmztDHHjK6aHjulnzYVuB1iPcdT?=
 =?us-ascii?Q?zxeMyTuZ0MD7uijUJYzKqQ93Bqwtji0mYzUA3mThq/A2odP/rghsaMOQLLeQ?=
 =?us-ascii?Q?y9gjEgVfgRyYpXiHVIZkqQNpetzd5hX2btsQdpXE6jlHVQvbhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:33:42.8190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85fbcb83-e5ed-4c2d-15fc-08dcb1f3e35f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
Message-ID-Hash: PVOASXBFI32Q3DXEWLH3I2KZNJMDVNCI
X-Message-ID-Hash: PVOASXBFI32Q3DXEWLH3I2KZNJMDVNCI
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVOASXBFI32Q3DXEWLH3I2KZNJMDVNCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To make it generic, move Cirrus Soundwire codec helper functions to
common place holder so that it can be used by other platform machine
driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                 | 40 +++++++++++++++++++
 sound/soc/intel/boards/Makefile               |  3 --
 sound/soc/intel/boards/sof_sdw_common.h       | 39 ------------------
 sound/soc/sdw_utils/Makefile                  |  5 ++-
 .../soc_sdw_bridge_cs35l56.c}                 | 38 ++++++++++++------
 .../soc_sdw_cs42l42.c}                        |  9 +++--
 .../soc_sdw_cs42l43.c}                        | 20 ++++++----
 .../soc_sdw_cs_amp.c}                         |  8 +++-
 8 files changed, 94 insertions(+), 68 deletions(-)
 rename sound/soc/{intel/boards/bridge_cs35l56.c => sdw_utils/soc_sdw_bridge_cs35l56.c} (73%)
 rename sound/soc/{intel/boards/sof_sdw_cs42l42.c => sdw_utils/soc_sdw_cs42l42.c} (88%)
 rename sound/soc/{intel/boards/sof_sdw_cs42l43.c => sdw_utils/soc_sdw_cs42l43.c} (85%)
 rename sound/soc/{intel/boards/sof_sdw_cs_amp.c => sdw_utils/soc_sdw_cs_amp.c} (80%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 450542eb3ea0..d5dd887b9d15 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -16,6 +16,19 @@
 #define SOC_SDW_MAX_NO_PROPS		2
 #define SOC_SDW_JACK_JDSRC(quirk)	((quirk) & GENMASK(3, 0))
 
+/* If a CODEC has an optional speaker output, this quirk will enable it */
+#define SOC_SDW_CODEC_SPKR			BIT(15)
+/*
+ * If the CODEC has additional devices attached directly to it.
+ *
+ * For the cs42l43:
+ *   - 0 - No speaker output
+ *   - SOC_SDW_CODEC_SPKR - CODEC internal speaker
+ *   - SOC_SDW_SIDECAR_AMPS - 2x Sidecar amplifiers + CODEC internal speaker
+ *   - SOC_SDW_CODEC_SPKR | SOF_SIDECAR_AMPS - Not currently supported
+ */
+#define SOC_SDW_SIDECAR_AMPS		BIT(16)
+
 struct asoc_sdw_codec_info;
 
 struct asoc_sdw_dai_info {
@@ -109,6 +122,28 @@ int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 			 bool playback);
 int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
+/* CS42L43 support */
+int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			      struct snd_soc_dai_link *dai_links,
+			      struct asoc_sdw_codec_info *info,
+			      bool playback);
+
+/* CS AMP support */
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+					  int *num_dais, int *num_devs);
+int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
+					struct snd_soc_dai_link **dai_links,
+					struct snd_soc_codec_conf **codec_conf);
+int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
+				     struct snd_soc_dai_link *dai_links,
+				     struct asoc_sdw_codec_info *info,
+				     bool playback);
+
+int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
+
 /* dai_link init callbacks */
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
@@ -118,5 +153,10 @@ int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 70c56bdc180c..1ee903e12249 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -36,9 +36,6 @@ snd-soc-ehl-rt5660-y := ehl_rt5660.o
 snd-soc-sof-ssp-amp-y := sof_ssp_amp.o
 snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_maxim.o 		\
-			bridge_cs35l56.o			\
-			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
-			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 7f856c6018aa..b95daa32e343 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -52,18 +52,6 @@ enum {
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
 /* Deprecated and no longer supported by the code */
 #define SOC_SDW_NO_AGGREGATION		BIT(14)
-/* If a CODEC has an optional speaker output, this quirk will enable it */
-#define SOC_SDW_CODEC_SPKR		BIT(15)
-/*
- * If the CODEC has additional devices attached directly to it.
- *
- * For the cs42l43:
- *   - 0 - No speaker output
- *   - SOC_SDW_CODEC_SPKR - CODEC internal speaker
- *   - SOC_SDW_SIDECAR_AMPS - 2x Sidecar amplifiers + CODEC internal speaker
- *   - SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS - Not currently supported
- */
-#define SOC_SDW_SIDECAR_AMPS		BIT(16)
 
 /* BT audio offload: reserve 3 bits for future */
 #define SOF_BT_OFFLOAD_SSP_SHIFT	15
@@ -95,35 +83,8 @@ int asoc_sdw_maxim_init(struct snd_soc_card *card,
 			struct asoc_sdw_codec_info *info,
 			bool playback);
 
-/* CS42L43 support */
-int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
-			      struct snd_soc_dai_link *dai_links,
-			      struct asoc_sdw_codec_info *info,
-			      bool playback);
-
-/* CS AMP support */
-int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
-					  int *num_dais, int *num_devs);
-int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
-					struct snd_soc_dai_link **dai_links,
-					struct snd_soc_codec_conf **codec_conf);
-int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
-				     struct snd_soc_dai_link *dai_links,
-				     struct asoc_sdw_codec_info *info,
-				     bool playback);
-
-int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
-			 struct snd_soc_dai_link *dai_links,
-			 struct asoc_sdw_codec_info *info,
-			 bool playback);
-
 /* dai_link init callbacks */
 
-int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 7851af9b8593..c15b08f3ab0b 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -3,5 +3,8 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_rt700.o soc_sdw_rt711.o 			\
 		       soc_sdw_rt712_sdca.o soc_sdw_rt722_sdca.o	\
 		       soc_sdw_rt5682.o soc_sdw_rt_sdca_jack_common.o	\
-		       soc_sdw_rt_amp.o
+		       soc_sdw_rt_amp.o					\
+		       soc_sdw_bridge_cs35l56.o 			\
+		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
+		       soc_sdw_cs_amp.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
similarity index 73%
rename from sound/soc/intel/boards/bridge_cs35l56.c
rename to sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index 55e5cfbb2f14..fcc3ef685af7 100644
--- a/sound/soc/intel/boards/bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -1,6 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
-//
-// Intel SOF Machine Driver with Cirrus Logic CS35L56 Smart Amp
+// This file incorporates work covered by the following copyright notice:
+// Copyright (c) 2024 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
+
+/*
+ * soc_sdw_bridge_cs35l56 - codec helper functions for handling CS35L56 Smart AMP
+ */
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -9,7 +14,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_widget bridge_widgets[] = {
 	SND_SOC_DAPM_SPK("Bridge Speaker", NULL),
@@ -25,7 +30,7 @@ static const char * const bridge_cs35l56_name_prefixes[] = {
 	"AMPR",
 };
 
-static int bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
+static int asoc_sdw_bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int i, ret;
@@ -73,7 +78,7 @@ static int bridge_cs35l56_asp_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static const struct snd_soc_pcm_stream bridge_params = {
+static const struct snd_soc_pcm_stream asoc_sdw_bridge_params = {
 	.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	.rate_min = 48000,
 	.rate_max = 48000,
@@ -81,7 +86,7 @@ static const struct snd_soc_pcm_stream bridge_params = {
 	.channels_max = 2,
 };
 
-SND_SOC_DAILINK_DEFS(bridge_dai,
+SND_SOC_DAILINK_DEFS(asoc_sdw_bridge_dai,
 		     DAILINK_COMP_ARRAY(COMP_CODEC("cs42l43-codec", "cs42l43-asp")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC("spi-cs35l56-left", "cs35l56-asp1"),
 					COMP_CODEC("spi-cs35l56-right", "cs35l56-asp1")),
@@ -89,28 +94,33 @@ SND_SOC_DAILINK_DEFS(bridge_dai,
 
 static const struct snd_soc_dai_link bridge_dai_template = {
 	.name = "cs42l43-cs35l56",
-	.init = bridge_cs35l56_asp_init,
-	.c2c_params = &bridge_params,
+	.init = asoc_sdw_bridge_cs35l56_asp_init,
+	.c2c_params = &asoc_sdw_bridge_params,
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_IB_IF | SND_SOC_DAIFMT_CBC_CFC,
-	SND_SOC_DAILINK_REG(bridge_dai),
+	SND_SOC_DAILINK_REG(asoc_sdw_bridge_dai),
 };
 
 int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 					  int *num_dais, int *num_devs)
 {
-	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS) {
 		(*num_dais)++;
 		(*num_devs) += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
 	}
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_count_sidecar, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 					struct snd_soc_dai_link **dai_links,
 					struct snd_soc_codec_conf **codec_conf)
 {
-	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS) {
 		**dai_links = bridge_dai_template;
 
 		for (int i = 0; i < ARRAY_SIZE(bridge_cs35l56_name_prefixes); i++) {
@@ -124,14 +134,18 @@ int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_add_sidecar, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
 				     struct snd_soc_dai_link *dai_links,
 				     struct asoc_sdw_codec_info *info,
 				     bool playback)
 {
-	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)
 		info->amp_num += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_spk_init, SND_SOC_SDW_UTILS);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/sdw_utils/soc_sdw_cs42l42.c
similarity index 88%
rename from sound/soc/intel/boards/sof_sdw_cs42l42.c
rename to sound/soc/sdw_utils/soc_sdw_cs42l42.c
index 3ce2f65f994a..78a6cb059ac0 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l42.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2023 Intel Corporation
-
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 /*
- *  sof_sdw_cs42l42 - Helpers to handle CS42L42 from generic machine driver
+ *  soc_sdw_cs42l42 - Helpers to handle CS42L42 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -15,7 +16,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
 #include <sound/jack.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_route cs42l42_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
@@ -87,4 +88,4 @@ int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 
 	return ret;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l42_rtd_init, SND_SOC_SDW_UTILS);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
similarity index 85%
rename from sound/soc/intel/boards/sof_sdw_cs42l43.c
rename to sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 47d05fe7de53..adb1c008e871 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Based on sof_sdw_rt5682.c
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_cs42l43 - Helpers to handle CS42L43 from generic machine driver
+ *  soc_sdw_cs42l43 - Helpers to handle CS42L43 from generic machine driver
  */
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -16,7 +18,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "Headphone", NULL, "cs42l43 AMP3_OUT" },
@@ -37,7 +39,7 @@ static const struct snd_soc_dapm_route cs42l43_dmic_map[] = {
 	{ "cs42l43 PDM2_DIN", NULL, "DMIC" },
 };
 
-static struct snd_soc_jack_pin sof_jack_pins[] = {
+static struct snd_soc_jack_pin soc_jack_pins[] = {
 	{
 		.pin    = "Headphone",
 		.mask   = SND_JACK_HEADPHONE,
@@ -73,8 +75,8 @@ int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
 					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
-					 jack, sof_jack_pins,
-					 ARRAY_SIZE(sof_jack_pins));
+					 jack, soc_jack_pins,
+					 ARRAY_SIZE(soc_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "Failed to create jack: %d\n", ret);
 		return ret;
@@ -98,13 +100,15 @@ int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;
 
-	if (!(sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)) {
+	if (!(ctx->mc_quirk & SOC_SDW_SIDECAR_AMPS)) {
 		/* Will be set by the bridge code in this case */
 		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
 						  "%s spk:cs42l43-spk",
@@ -120,6 +124,7 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 
 	return ret;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_rtd_init, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			      struct snd_soc_dai_link *dai_links,
@@ -134,6 +139,7 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 
 	return asoc_sdw_bridge_cs35l56_spk_init(card, dai_links, info, playback);
 }
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_init, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
@@ -152,4 +158,4 @@ int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 
 	return ret;
 }
-
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_dmic_rtd_init, SND_SOC_SDW_UTILS);
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
similarity index 80%
rename from sound/soc/intel/boards/sof_sdw_cs_amp.c
rename to sound/soc/sdw_utils/soc_sdw_cs_amp.c
index 6479974bd2c3..58b059b68016 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2023 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_cs_amp - Helpers to handle CS35L56 from generic machine driver
+ *  soc_sdw_cs_amp - Helpers to handle CS35L56 from generic machine driver
  */
 
 #include <linux/device.h>
@@ -10,7 +12,7 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 #define CODEC_NAME_SIZE	8
 
@@ -44,6 +46,7 @@ int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_cs_spk_rtd_init, SND_SOC_SDW_UTILS);
 
 int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_links,
@@ -58,3 +61,4 @@ int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 
 	return 0;
 }
+EXPORT_SYMBOL_NS(asoc_sdw_cs_amp_init, SND_SOC_SDW_UTILS);
-- 
2.34.1

