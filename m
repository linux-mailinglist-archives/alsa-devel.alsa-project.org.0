Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500C9446F8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:49:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E8B6367E;
	Thu,  1 Aug 2024 10:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E8B6367E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502141;
	bh=MPZvZJr2dKgEyoC5PT2bfOAWgLLDd/Ys8BCPH9ABZM8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aNEEoln7tqEw8eSh30VTAtB5BLFXKPsLADYegW1ixMNLupmpix+Jm1Hfr4Y4m1fn9
	 Cv76B7untN1z9uzNYKV/sb758z811sWNEsv9ra6GvqAoGFD9ZMetixm6U47qsm0dyE
	 YQkdWlvqnW9+ca2H0SUQsYnUI8efkMOdoag5iGlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 669D1F805B4; Thu,  1 Aug 2024 10:48:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C88F805AA;
	Thu,  1 Aug 2024 10:48:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A09FFF8026A; Thu,  1 Aug 2024 08:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EF09F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF09F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tp2CkYFN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2aB3Z48YtcnHCM2kGx0woEUw8ZE0hLZwSYpov/9FlXAxz/KQRiSkN1NJxV+5i9uRLC7en0tHZhb7y8p50nC+quM8cwNYlACOKvUBRYftXM7EJD94AMFErE43IOtqICgK2Fh7PHOWTXCPuhSKJDEHpgH+RbGLTZ7B6rNBN+LppklVsZMGsMtoZ463NFsXA1uRBgKZhbXJ6XR/2K/R3fmLp8b2gqRar2yPg+STGQjF8L1YJSisYxmAWZbSsRa0JAmBqQHI3mhTsXyO/KfkVVcFZ/IbcGt2Q8/N0W2NU7KrZCE6oqGOmgCaFZGx5ueh7g5OXGiB1QnDMFZ9Vopq9Bsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDKExy/DCIR6/246/oZSdxS0in9FcMvHavGaSS7dzj4=;
 b=UcqvTYHzocd4czqbpmLJrsST1c6blwFW0TmHbuqa6mq/idtdKIqmmdSraQ32KQjaI3XL8R6Ix1ot3WpWzrOXOdgtimjzFuO4qZ99Tvc7p9YibgRG6RR5R79x86KI43g00Knp/5gsor/Zd6smUpyWjMHzlfbwOzm2fTTJf6ZzKJKd93L1n1VebCTLlFYw8BSl1/zML98JjNEf+3KvIvgEcdGX7FsfA0GEKULMyuZ9TuPLn1YpTR5rfpn1ceAJeDOP9jxJ/EbX/eiZBvhyFD0aI38b/BCIC58JnzwQiFTLF+lw7lW05GXPWIFuAaiZ/ar67NbsRxqC61o2tjVH1SiX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDKExy/DCIR6/246/oZSdxS0in9FcMvHavGaSS7dzj4=;
 b=tp2CkYFNsk2/vrLSgirFrG3T1yes8mo+i96d0gS3aD5IwFC2fjlxM7DnbcwEBKKk9bofkPsWf2sJhPRNV4inAL8mp6kQHukmQEqUDtQ1llH5YPkXJYRmxkLWjuihnWJlcPTwztPt53tpUZNiEIQCeih6Talk5b0TwBExy0+3lZM=
Received: from SJ0PR13CA0155.namprd13.prod.outlook.com (2603:10b6:a03:2c7::10)
 by DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Thu, 1 Aug
 2024 06:34:18 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::22) by SJ0PR13CA0155.outlook.office365.com
 (2603:10b6:a03:2c7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.6 via Frontend
 Transport; Thu, 1 Aug 2024 06:34:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:34:17 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:34:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:34:16 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:34:10 -0500
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
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 21/31] ASoC: intel/sdw_utils: move dai id common macros
Date: Thu, 1 Aug 2024 11:54:06 +0530
Message-ID: <20240801062416.2203673-22-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 750ed3e2-a415-4df2-e308-08dcb1f3f813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rEBfyxFJSxcoU54926BUpoJf8ndDryi0E5Ws/u6HcUqpsUwTYvAI3iV/wfmk?=
 =?us-ascii?Q?D8A5HENUTmK9IQBOE3VDK/7F9k+0zinRL59Crpmn9l/+IWvY0oXNxt51luYg?=
 =?us-ascii?Q?kE7c8xapkCIqKxYA6OyuUB+NNJqU8k3pFNt0RhzYLRo8hq0gS5Dd3jHn7o3i?=
 =?us-ascii?Q?9PjEyvsCCjB/5TwPiiKaxgU6IU/8tWOauuNCB3Xub1Rh+4vUsFToo6QRq42y?=
 =?us-ascii?Q?r841KKqS9c/8sdt9RPZaYGPysJF52tGQxyhLsUh2+ncXmNKaCzlfQQRri3/u?=
 =?us-ascii?Q?Ygja20ISwELoLgHpO1tImZJqfV2YTR9lxOnU6VYhTkiwilnukq7ha6wJGx7v?=
 =?us-ascii?Q?GPfc/gzbSXd2DmE+z5Exs2GbY8rtIAok3vZfZBQyrH8tcGEMc7+x//J8zfvG?=
 =?us-ascii?Q?nxa6tsKRuWtJjr0B/M7ZXDtvASY3w4bGj/OpKj6CKeFwHjhudSdPnFNSMKNc?=
 =?us-ascii?Q?P/o/lcDtESDC4r8VohJc6Zpd1v0j2/jyg0ybJm8kYImNJ0GLLSDEgwWJXy2B?=
 =?us-ascii?Q?o8GernCmS10/Jyf693amBUa6i9ZlSLbAsSR0wbnaluemRR5fkkAofIeziBEw?=
 =?us-ascii?Q?H7nvxTeB88nwExUKVEMziBrdfx/m7cmNVBizvDXs+j9oexMLPGT1rKVugKwK?=
 =?us-ascii?Q?3I73kv+SCPlk7gr+Xt2QqhUv8c7fPvlsAooHSCELdfQzugqcuIKmm+LZlp0f?=
 =?us-ascii?Q?HMhMmyF0aLGR3NWnX+JdeCuxFnvWeMlloTs1U1h5bmuPaJ5Hl0sEcGOB07i8?=
 =?us-ascii?Q?t8UKMVWEvxtjxsN7cayP7obB+G/XdOyZG8pCcavqlC33etu4YAHo4fzy2pwY?=
 =?us-ascii?Q?bq46dRDfdYT+1EGp3x//g50+YvkTpcN2fRwD78cDr77ujABhaLLfZz1gwwBF?=
 =?us-ascii?Q?9hE28xeq8zxgyzP/OPMw/OqZJV06hlqOxvoN0sus+n+gh3IMCIuGCjckcvDw?=
 =?us-ascii?Q?DKBkw8L6Ki/yw0LctBR+nF5LayF8vFrvCQqyjqb37NfGkm6iCcnnHEQyf1sg?=
 =?us-ascii?Q?LqYYKLpEbeYHWXot+PmlpD6pncrcff8CJYj+gRblQzM/2vp0acCULpFqPU5E?=
 =?us-ascii?Q?+Txf26h6PMylJdW3qNmZGI1nMAE0V0kB+9fHmeEzj7Hh7nLr0HkkZeCx3DkM?=
 =?us-ascii?Q?j2hI2t91/v9maDWh/uHRHlwJAVaObLPkfc3AiVPJAy46kTL6n1AQkzk9A7hS?=
 =?us-ascii?Q?SpKygYjEj9TvxGw8uoSOT50lQdu17VFeazGl0UOGsq7TOnLpfpf0xgqupInn?=
 =?us-ascii?Q?goWziC8tLkosRg1RRh0LyEWn+D4OqViLwb1NCBRKM3DuiaoEio3pAA9NyJ7u?=
 =?us-ascii?Q?u6aa3E0ig35Smnde8iu+nyOI/pyxztJ/t2TM1dyyDjY2lViGv2oBwUhRS1jc?=
 =?us-ascii?Q?mv45VeDNuOod7MjYCfemRCLz9A2jJBIQZHxoJXCeOjw+yWNiHQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:34:17.5427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 750ed3e2-a415-4df2-e308-08dcb1f3f813
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865
Message-ID-Hash: VLFIB2ELO3E5CEXENILMS25YRDT5Y5AB
X-Message-ID-Hash: VLFIB2ELO3E5CEXENILMS25YRDT5Y5AB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLFIB2ELO3E5CEXENILMS25YRDT5Y5AB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move dai id common macros from intel SoundWire generic driver to
soc_sdw_utils.h file so that it can be used by other platform machine
driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h           | 7 +++++++
 sound/soc/intel/boards/sof_sdw_common.h | 6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 9e84d1ab6cd0..13941ddd24c8 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -29,6 +29,13 @@
  */
 #define SOC_SDW_SIDECAR_AMPS		BIT(16)
 
+#define SOC_SDW_UNUSED_DAI_ID		-1
+#define SOC_SDW_JACK_OUT_DAI_ID		0
+#define SOC_SDW_JACK_IN_DAI_ID		1
+#define SOC_SDW_AMP_OUT_DAI_ID		2
+#define SOC_SDW_AMP_IN_DAI_ID		3
+#define SOC_SDW_DMIC_DAI_ID		4
+
 struct asoc_sdw_codec_info;
 
 struct asoc_sdw_dai_info {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 664c3404eb81..8bfdffde16a3 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -16,12 +16,6 @@
 #include "sof_hdmi_common.h"
 
 #define MAX_HDMI_NUM 4
-#define SOC_SDW_UNUSED_DAI_ID -1
-#define SOC_SDW_JACK_OUT_DAI_ID 0
-#define SOC_SDW_JACK_IN_DAI_ID 1
-#define SOC_SDW_AMP_OUT_DAI_ID 2
-#define SOC_SDW_AMP_IN_DAI_ID 3
-#define SOC_SDW_DMIC_DAI_ID 4
 #define SOC_SDW_MAX_CPU_DAIS 16
 #define SOC_SDW_INTEL_BIDIR_PDI_BASE 2
 
-- 
2.34.1

