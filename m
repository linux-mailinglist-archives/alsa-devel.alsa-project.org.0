Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8DD9B891E
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2024 03:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE82DED1;
	Fri,  1 Nov 2024 03:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE82DED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730427028;
	bh=IWhoqvlnLIixO1EP2uq8YzwvZEBRen5XSx6ptqaV330=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sNqf8NZtaYRVMWmIbmBk/gySevIeUketdL3dnMbnrlW8QdPOy6ikwueup1J5RTTKJ
	 XLzqvQv/ON3xfWk2A8jyrtMlT4fuCbGHON2yIl4vd3w1fyYJor4kLg1a+CDV1oNZbd
	 dXzxyqT90lgQ/jp3FTFZFWBEzDHRLdvzcMMwYtQc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A29C1F805A1; Fri,  1 Nov 2024 03:09:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B78F8059F;
	Fri,  1 Nov 2024 03:09:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3702F80301; Fri,  1 Nov 2024 03:09:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4007AF801F5
	for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2024 03:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4007AF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KwJMebnK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0+lfd86cJqWjDwk3dLOemlgaJ783Xynqe/7VcKSX75GyA6dMXOeg9MWMdm0nLk4Wmw55hnhAJsY+he22hq0J0r8k0B3gZ5QutMTGwQhYX9LO+9COCR//shMRL+66i1u8FvvJ9p+15/Vw1kcYEzSsffAzeC84AHSqTWljy4a1Ljn/UyGHpf6KiJ9c0dJajn7VKkpSEroGUykt6RDm3H6288iSbgqQCfwzBPE3Cki/5MCFm4YniqrZ+QMc9LN87srtsEUuVrUIKQCq/MDRQ/BAEvseTOMYvciaBstK107mVan2iMzKi4grKHA+EzPzBXejdQ3ZyehdFCpmcBVDhtwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfpdbmsLNWo4PAJQrgN6rD60LlEcyWPm2xz6l7SB/NQ=;
 b=xK+/pNt8CyRVGFkljTgRPHTTr+O9jPVsPqNEiC5tQJcxBUvc89V7ugYfad4jv8t2Y/JwsOlQTjwKpq8luNh9vVACAtssgB/cgSDP1dE/+NrfIZN6A0r/PVKhr/U8kCqYIukuTRK0MOLps/IilnvnjXTHpW3yTV5C5d4tV/EiZRsOkIRHjRXzgN0w9YdcFVionVZ1tCOOarNE+iThbefLAsZgNRE2wfnIlnESGndPMjOoXTwbVipFrmpme1Yinskpoum0yPsQLRcfMTgrDGeh+za3nBNwv+lcv55gc880sukW/7ZxF7Sz75EKEUCveuIbfFuPVbm/oyiD6l8fEhWF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfpdbmsLNWo4PAJQrgN6rD60LlEcyWPm2xz6l7SB/NQ=;
 b=KwJMebnK9XVm5xGEN9ZX7M4biYXVhEkwU7sm7ra8FNYduB2/3MQgocsp/WSDDreOyqtN+Awq25JkuiIzOImZMWrDypX92U+aa7CNuCKWlXA+7i+cJeDfioaIU2yj0ojJ3shj1Alh/gcYMq3mbvNlGuUVgpvd2dhVRYNdLiLgZgQ=
Received: from BYAPR06CA0035.namprd06.prod.outlook.com (2603:10b6:a03:d4::48)
 by SJ2PR12MB8807.namprd12.prod.outlook.com (2603:10b6:a03:4d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Fri, 1 Nov
 2024 02:09:12 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::94) by BYAPR06CA0035.outlook.office365.com
 (2603:10b6:a03:d4::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Fri, 1 Nov 2024 02:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 02:09:12 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 21:09:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood
	<liam.r.girdwood@intel.com>
Subject: [PATCH 1/2] ASoC: sdw_utils/intel/amd: refactor dai link init logic
Date: Fri, 1 Nov 2024 07:38:01 +0530
Message-ID: <20241101020802.1103181-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101020802.1103181-1-Vijendar.Mukunda@amd.com>
References: <20241101020802.1103181-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|SJ2PR12MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: e29d9368-7ce3-42c7-4b1c-08dcfa1a2e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0wg5S17dPCB+u4qxa4E+JITIXH5slFZ6KDeQqzIzaboHDJO7QGwgR2sM4Aop?=
 =?us-ascii?Q?jr/pbkrjXIy2NgmMIdmvMYM3FBkO+G7VhxzI1hjmYW+pr0sHIDO3ghZcWsDY?=
 =?us-ascii?Q?gun9VxWXlF5YpjxnzRgQiV+x0F/LyuLTJAtbkBXdC4qt431BoJcjza8iSZWq?=
 =?us-ascii?Q?3P47TIngyMI7nPu5eFslYDY6zlY35XfNYDuc3/D81U+iDBci4rwYKCAFY0IW?=
 =?us-ascii?Q?Qvhr5XSqCdq2t3uULarDwQ25ViMJkUPeisbU9fYrjUivpKxyh5zImXsnX6gA?=
 =?us-ascii?Q?b8781CJL7y2KTGBiJP7rpn8aDs+T9rvIvywSFRoZcDUI9esAjH/OXPdaRUlM?=
 =?us-ascii?Q?M4odnO7w+CV0xvVMqlvK7WRHwtIpbuEqCAaipvhKFxove0ZW1lejNLHSmRng?=
 =?us-ascii?Q?hhXXeABN8nupIuKlhJT8XhtZURCWT5qhvYvH/g88yZR4BztGYv6kVOCBwbEa?=
 =?us-ascii?Q?QyrzCjOjRlAl+o7VYXOLFgGghN8qX+hkaIcndSjDdw2xIhohmT1wHJ2025ZM?=
 =?us-ascii?Q?y3RBxpiGz4r3j4/S9p8Uw+ellBOmWnFHmn6OG2MFy+ObLXi0w6B3F9PMzx19?=
 =?us-ascii?Q?zeUGPBfaJ85SSg7XZFk0LmP5ZwkKTsqKkZkSnCYrlB+TOerTvdNIoSTS+zmt?=
 =?us-ascii?Q?LQSCENDi//MInd4TDp5g7D18lk99WPl4ekhlZ5rLetezcY9Fml67tToo+ZSG?=
 =?us-ascii?Q?7DZ/LNzNGUmyJJFaXegj0GpkU7kjvdVVLygAxq2eadJGZYYZ5FovCkuWLyyT?=
 =?us-ascii?Q?10eeODXph7SmYUNwyyA0qK68hUkk3MCa8l83smT2cvjpbs0off1buuwY3riL?=
 =?us-ascii?Q?qX44tRCaGLboazn3nzyO7yBj4K+vdrgZWJSHNmUBH6/7ylXAivPNN7kHMd2T?=
 =?us-ascii?Q?sy3c6KUAPASPwyg7cvoMpNXX6hv4h1159gXzU0l3KYlAqED6lwPxwjsz+Tns?=
 =?us-ascii?Q?qcz9gVr3vIcsgODwZ4ipsY6g4r0DUA/pLfY4aUpsnBTBJE34I1y73ZowxITh?=
 =?us-ascii?Q?3bD4QqV4whNX7TNXFOAAMImPDl6a7k3xwJC52ze+tK0HS4c6WJxEIzBr1tRP?=
 =?us-ascii?Q?3rMmgeXDkK15y+yxKVDph2OgwzAUp8twA1/nM+lBMgIFdYztrqb6vDztbo1p?=
 =?us-ascii?Q?MbXElYZhJAhAmeT7cN4MiyACQIcY2UY5YvyY7zS2O96MFhQC8GhNYLhWIvv2?=
 =?us-ascii?Q?K9ZYh+upCbygVWKXSSAd0bZ3+Fqg/MsDEL2Ke4mPFgLB0Fsv6P4twUXL4z37?=
 =?us-ascii?Q?HQBB82Vunhrf5ta7Ei1u6+91SaFJN+LOkKOviOBaZ6g76vbWqU54Bj2W1DAH?=
 =?us-ascii?Q?RauadxF/SphrxNR7PnUt6bk4n3sOOhIhqOuJyzCPQKnkMCHeyRLexZa2DTiR?=
 =?us-ascii?Q?XIE65WE7a7VKOuoL/1vsamnS66L4j46KRP/fHipQbo77li0AmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 02:09:12.6463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e29d9368-7ce3-42c7-4b1c-08dcfa1a2e06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8807
Message-ID-Hash: TAUECAXUA6L6PW5NZFHSMVZAC4R4GQXU
X-Message-ID-Hash: TAUECAXUA6L6PW5NZFHSMVZAC4R4GQXU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAUECAXUA6L6PW5NZFHSMVZAC4R4GQXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'no_pcm' as parameter for asoc_sdw_init_dai_link() so that
same function can be used for SOF and legacy(No DSP) stack.
Pass 'no_pcm' as 1 for Intel and AMD SOF based machine drivers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc_sdw_utils.h        |  5 +++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c |  8 ++++----
 sound/soc/intel/boards/sof_sdw.c     | 12 ++++++------
 sound/soc/sdw_utils/soc_sdw_utils.c  |  9 +++++----
 4 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index a25f94d6eb67..0e82598e10af 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -152,14 +152,15 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 			    struct snd_soc_dai_link_component *cpus, int cpus_num,
 			    struct snd_soc_dai_link_component *platform_component,
 			    int num_platforms, struct snd_soc_dai_link_component *codecs,
-			    int codecs_num, int (*init)(struct snd_soc_pcm_runtime *rtd),
+			    int codecs_num, int no_pcm,
+			    int (*init)(struct snd_soc_pcm_runtime *rtd),
 			    const struct snd_soc_ops *ops);
 
 int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 				  int *be_id, char *name, int playback, int capture,
 				  const char *cpu_dai_name, const char *platform_comp_name,
 				  int num_platforms, const char *codec_name,
-				  const char *codec_dai_name,
+				  const char *codec_dai_name, int no_pcm,
 				  int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops);
 
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 36e6d6db90c1..8fce8cb957c9 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -236,7 +236,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
 				       cpus, num_cpus, platform_component,
 				       ARRAY_SIZE(platform_component), codecs, num_codecs,
-				       asoc_sdw_rtd_init, &sdw_ops);
+				       1, asoc_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
@@ -285,7 +285,7 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 }
 
 static int create_dmic_dailinks(struct snd_soc_card *card,
-				struct snd_soc_dai_link **dai_links, int *be_id)
+				struct snd_soc_dai_link **dai_links, int *be_id, int no_pcm)
 {
 	struct device *dev = card->dev;
 	int ret;
@@ -294,7 +294,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 					    0, 1, // DMIC only supports capture
 					    "acp-sof-dmic", platform_component->name,
 					    ARRAY_SIZE(platform_component),
-					    "dmic-codec", "dmic-hifi",
+					    "dmic-codec", "dmic-hifi", no_pcm,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
 		return ret;
@@ -377,7 +377,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ctx->ignore_internal_dmic) {
 			dev_warn(dev, "Ignoring ACP DMIC\n");
 		} else {
-			ret = create_dmic_dailinks(card, &dai_links, &be_id);
+			ret = create_dmic_dailinks(card, &dai_links, &be_id, 1);
 			if (ret)
 				return ret;
 		}
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5614e706a0bb..9ca284a1d666 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -790,7 +790,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
 				       cpus, num_cpus, platform_component,
 				       ARRAY_SIZE(platform_component), codecs, num_codecs,
-				       asoc_sdw_rtd_init, &sdw_ops);
+				       1, asoc_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
@@ -867,7 +867,7 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 						    playback, capture, cpu_dai_name,
 						    platform_component->name,
 						    ARRAY_SIZE(platform_component), codec_name,
-						    ssp_info->dais[0].dai_name, NULL,
+						    ssp_info->dais[0].dai_name, 1, NULL,
 						    ssp_info->ops);
 		if (ret)
 			return ret;
@@ -892,7 +892,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 					    0, 1, // DMIC only supports capture
 					    "DMIC01 Pin", platform_component->name,
 					    ARRAY_SIZE(platform_component),
-					    "dmic-codec", "dmic-hifi",
+					    "dmic-codec", "dmic-hifi", 1,
 					    asoc_sdw_dmic_init, NULL);
 	if (ret)
 		return ret;
@@ -903,7 +903,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 					    0, 1, // DMIC only supports capture
 					    "DMIC16k Pin", platform_component->name,
 					    ARRAY_SIZE(platform_component),
-					    "dmic-codec", "dmic-hifi",
+					    "dmic-codec", "dmic-hifi", 1,
 					    /* don't call asoc_sdw_dmic_init() twice */
 					    NULL, NULL);
 	if (ret)
@@ -947,7 +947,7 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 						    1, 0, // HDMI only supports playback
 						    cpu_dai_name, platform_component->name,
 						    ARRAY_SIZE(platform_component),
-						    codec_name, codec_dai_name,
+						    codec_name, codec_dai_name, 1,
 						    i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
 			return ret;
@@ -975,7 +975,7 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 					    1, 1, cpu_dai_name, platform_component->name,
 					    ARRAY_SIZE(platform_component),
 					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
-					    NULL, NULL);
+					    1, NULL, NULL);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6610efe8af18..e7f5938701ef 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1015,7 +1015,8 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 			    struct snd_soc_dai_link_component *cpus, int cpus_num,
 			    struct snd_soc_dai_link_component *platform_component,
 			    int num_platforms, struct snd_soc_dai_link_component *codecs,
-			    int codecs_num, int (*init)(struct snd_soc_pcm_runtime *rtd),
+			    int codecs_num, int no_pcm,
+			    int (*init)(struct snd_soc_pcm_runtime *rtd),
 			    const struct snd_soc_ops *ops)
 {
 	dev_dbg(dev, "create dai link %s, id %d\n", name, *be_id);
@@ -1023,7 +1024,7 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 	dai_links->name = name;
 	dai_links->platforms = platform_component;
 	dai_links->num_platforms = num_platforms;
-	dai_links->no_pcm = 1;
+	dai_links->no_pcm = no_pcm;
 	dai_links->cpus = cpus;
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
@@ -1039,7 +1040,7 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 				  int *be_id, char *name, int playback, int capture,
 				  const char *cpu_dai_name, const char *platform_comp_name,
 				  int num_platforms, const char *codec_name,
-				  const char *codec_dai_name,
+				  const char *codec_dai_name, int no_pcm,
 				  int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops)
 {
@@ -1058,7 +1059,7 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 
 	asoc_sdw_init_dai_link(dev, dai_links, be_id, name, playback, capture,
 			       &dlc[0], 1, &dlc[1], num_platforms,
-			       &dlc[2], 1, init, ops);
+			       &dlc[2], 1, no_pcm, init, ops);
 
 	return 0;
 }
-- 
2.34.1

