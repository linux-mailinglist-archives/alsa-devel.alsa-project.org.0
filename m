Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BD944A4D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5064B3DDD;
	Thu,  1 Aug 2024 13:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5064B3DDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511559;
	bh=QMNEOoGzo3XzF+++wuTEgJWGz08Or/NtiJu9tpYijdo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o2OPOEfbatkKbwowZBKhLa215cwfSJFSNOGyQME40a4a7GQm45Tqfkk063FriRixy
	 tW1vauCGQ1lqFNa8x0t0kXJHfP7FrgRkqGEDWDQMb3w2mT5caUD9ReOe2CEGAHhv4Y
	 /xtFH6SBxKQK8ENlb+Ar5ANdsu47+JxHCij9pGp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 648E3F8061E; Thu,  1 Aug 2024 13:24:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E07CFF8061F;
	Thu,  1 Aug 2024 13:24:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF85EF802DB; Thu,  1 Aug 2024 13:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 235A1F80269
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 235A1F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=j2jKUd9w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsDuAzDtvVx6aFU1n1hcNpwENhwFc6seqv5QvIFc/4sXpxW27leJbMGKukp5N5bgjKIVleO94jh7RDRs7ulTi+LhtBLt6lBbkGD2jYHMuqnGf3dRGddgGpZYcEaq/HIXqFqocAta/WINji6O6ZP1bbqjvqnI9zwnBiiiNFthrLiz8vBBctJn+fxRrRTzDtbzNeiNUVY2pRPgcx3ZlEy412GusaY6grHavZz8eQwlSqE3z5MgWuJtm1FE2ishcJ7w20fTWMX5O018j6wsAGGM8H+radrG9FnUPzcVh8nxHtMg9pYmA8Ac5FpCBJ/zTz3jCTzf/SeOp4bq4ckbsIYG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjtQQClIt6U9a31QsowB1Jj/TP8RmNVNK0FwQHtf2CY=;
 b=etpmB4RJdc26g/bjQyo/xw5MJbaGQ4rKWICaT8iFr9Zj0c0lonOa23f3uW+vtqd7GEaogQF73IsT3lwUeWrIO80nBL21nyQ9osNhSmENTWETiu7+fA9T5CwjF6sldvdAIujNs0BTQIGGYJo0XeEZxVmxtuJPxE9kiBYYYs/4UkVVq9Zm9ggPr4ltqXvQc9/4h8mbnzd5NmYBE8tZdRDgAf8RKh1vUwQydERLwN3GBXyNZrUdkHqiQIK2nwAKNw03jE5OnY5+xGn3J9lVLI93g1k5m+JoNkcdU+qVdYxSE9yWXOFCGbTuSlWly0VT2X1scNsbKzrcpmribaTTsCqorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjtQQClIt6U9a31QsowB1Jj/TP8RmNVNK0FwQHtf2CY=;
 b=j2jKUd9w++D+N1jINYY7IU2aHX1dDZ72vkrxOrzGXLBkTiLleMWQuuvduFN4hoi8kVu/fsPxKqlfBXnmHY3G9R7o0Fp6n45/pLlYNEKxi43r5KBt7bazR9/ZR7paXbEeRCfzL9p+Q17rlMZX5xvCiiikmg0nJYAP8+Kqczc6+fE=
Received: from BYAPR07CA0027.namprd07.prod.outlook.com (2603:10b6:a02:bc::40)
 by PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 11:20:03 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a02:bc:cafe::9a) by BYAPR07CA0027.outlook.office365.com
 (2603:10b6:a02:bc::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Thu, 1 Aug 2024 11:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:20:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:20:00 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:19:51 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 26/31] ASoC: intel/sdw_utils: refactor init_dai_link()
 and init_simple_dai_link()
Date: Thu, 1 Aug 2024 16:48:12 +0530
Message-ID: <20240801111821.18076-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: c3378900-cb52-43ca-ea21-08dcb21be38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MwilPzXWOd55obUMLhUkXD04uCmN4sHqImQa6WhSUenhhQGN85I0ZQfJrO2B?=
 =?us-ascii?Q?yaThqaQkeje80ukGndomn7oeLxXReaH424urh/vJO6lAlkELL/KUoWVv/ssb?=
 =?us-ascii?Q?WGRA7lnnrQWOWTJCfJzmk64rA9fR0fqNK/EnEeMqpTo4gIXoQrLJC+Hk0DAg?=
 =?us-ascii?Q?0KXimylj74LGibQ9c6rVATxGLAN5obVczxsBroR5jjupdxL5H3n+SaweuamQ?=
 =?us-ascii?Q?0fqyx6PUQXOk+2pIBH1yFEhEZfJgqElyRlsJYArD7H+4Cygc9Kvj5itrTdDn?=
 =?us-ascii?Q?xuGexJ681hWMUs3qDERRd8QERcdsuVao1PmaocXfQdQDQVtp9iPaG5iampK+?=
 =?us-ascii?Q?wpCvNWrXcYtWyh8V7gsSFzs5ZQBomnmg0cZCwdkm/EDxGGPSk3U5xhwNjyyY?=
 =?us-ascii?Q?E8pOaduNk7hxPsmSjfHG0Bevfz2W+A4egLiMt5/zB1EPdT7NUKq9GL9VTrYU?=
 =?us-ascii?Q?OoGInWhjlsMg2DDAv61ypuvSjUOxNZo9Ewjb3xoLDGYc3jV3xV/eYAGWDjNy?=
 =?us-ascii?Q?B6iY6FcNXj6tXZ478MVD1D65wwMow1OcNS8zCgTUwVvDvaYkKqzEV0Ds0vKA?=
 =?us-ascii?Q?1KikBbTrmH4vMum2cMG8xUCjvW6J/IXPdCMq2veZVVpA82fvQmV4lUfXoQCx?=
 =?us-ascii?Q?F+SiFrQYM7IoF9rdtFh+bHxF8UxG9kG8JvY8HcD9oePAPawkUaq1zS5RnzuJ?=
 =?us-ascii?Q?IOlCMPeSelEHTgB3F3OlIkQrS4Eek4M6CZkIX2rGl45aCpFGnLyj3R13Zyse?=
 =?us-ascii?Q?Ml9jv3f1chIf5jRIO/CBkimG3v4NHQgPeqbs2l020HEyBxbHu4g8daOpBuN/?=
 =?us-ascii?Q?XLl1F6yGSD9pDExCQABeiUHDvfs3/fBFagaHZufr/dEd/Qh4o7KX0VvPS0jW?=
 =?us-ascii?Q?i0weTSz9iGjeaa7BC6iA3nyz9Bh4JOm+GozJ/8ojyc8pzofS2MOr9M+2ampP?=
 =?us-ascii?Q?Iu2WseWer6Q6eYLeF+N3P6IRevoFRDuYpxINTcXUA73Z7m1k4pE575YVwo4m?=
 =?us-ascii?Q?Pdx8Zqh5wnOzWFaH4rk/sSmRPB6xUuZ/U2wtQRiVd+p3QvzVPLttIGmLCvWZ?=
 =?us-ascii?Q?5I40zBFC967VbBxqTftSaMRB4aDj/u6aGnXevqfl5hPE4b1SvBd/40s33Jr6?=
 =?us-ascii?Q?DSq/Z6VLnN9PxrqZrXZsPyqh+YtvZgnyHkx68hmUGxqI/hNfiGzj0DMv3nLN?=
 =?us-ascii?Q?p0jKxPyx7wS/hzfwdb3GWziQvBr4BpZXBpX/5AGfqoLsxrRMhdGRaZzRN14R?=
 =?us-ascii?Q?h6LtTht46yp4XHep+ObkrSzddVg/4IwgqySQFuDpu6nrZNUlVMTiAZL65kHD?=
 =?us-ascii?Q?GJWA6n0z/6XeH16YkrAYLSHjQSlb2ZA7D3dU5suHRWmG8bpluTngI2XFSNCD?=
 =?us-ascii?Q?u6Xa4DamzRxJXPi13kx5NtchnNbZNrMRCG37kMdsJuxZtr9pIw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:20:02.9351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c3378900-cb52-43ca-ea21-08dcb21be38b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914
Message-ID-Hash: K6PO652Q76FIOZ7ZPYQNHZHBEULYRM35
X-Message-ID-Hash: K6PO652Q76FIOZ7ZPYQNHZHBEULYRM35
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6PO652Q76FIOZ7ZPYQNHZHBEULYRM35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To make it generic, refactor existing implementation for
init_dai_link() and init_simple_dai_link() as mentioned below.
- Move init_dai_link() and init_simple_dai_link() to common place holder
- Rename the functions with "asoc_sdw" as prefix.
- Pass the platform specific 'platform_component' structure and its size as
arguments for init_simple_dai_link() function and allocate one more
extra dlc for platform component.
- Pass the 'platform_component' and 'num_platforms' as arguments for
init_dai_link().

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  16 +++++
 sound/soc/intel/boards/sof_sdw.c    | 105 +++++++++-------------------
 sound/soc/sdw_utils/soc_sdw_utils.c |  54 ++++++++++++++
 3 files changed, 104 insertions(+), 71 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 14e21a992f56..e366b7968c2d 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -124,6 +124,22 @@ void asoc_sdw_mc_dailink_exit_loop(struct snd_soc_card *card);
 
 int asoc_sdw_card_late_probe(struct snd_soc_card *card);
 
+void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
+			    int *be_id, char *name, int playback, int capture,
+			    struct snd_soc_dai_link_component *cpus, int cpus_num,
+			    struct snd_soc_dai_link_component *platform_component,
+			    int num_platforms, struct snd_soc_dai_link_component *codecs,
+			    int codecs_num, int (*init)(struct snd_soc_pcm_runtime *rtd),
+			    const struct snd_soc_ops *ops);
+
+int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
+				  int *be_id, char *name, int playback, int capture,
+				  const char *cpu_dai_name, const char *platform_comp_name,
+				  int num_platforms, const char *codec_name,
+				  const char *codec_dai_name,
+				  int (*init)(struct snd_soc_pcm_runtime *rtd),
+				  const struct snd_soc_ops *ops);
+
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd);
 
 /* DMIC support */
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 65b15f594aed..d258728d64cf 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -557,54 +557,6 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = asoc_sdw_shutdown,
 };
 
-static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
-			  int *be_id, char *name, int playback, int capture,
-			  struct snd_soc_dai_link_component *cpus, int cpus_num,
-			  struct snd_soc_dai_link_component *codecs, int codecs_num,
-			  int (*init)(struct snd_soc_pcm_runtime *rtd),
-			  const struct snd_soc_ops *ops)
-{
-	dev_dbg(dev, "create dai link %s, id %d\n", name, *be_id);
-	dai_links->id = (*be_id)++;
-	dai_links->name = name;
-	dai_links->platforms = platform_component;
-	dai_links->num_platforms = ARRAY_SIZE(platform_component);
-	dai_links->no_pcm = 1;
-	dai_links->cpus = cpus;
-	dai_links->num_cpus = cpus_num;
-	dai_links->codecs = codecs;
-	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
-	dai_links->init = init;
-	dai_links->ops = ops;
-}
-
-static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
-				int *be_id, char *name, int playback, int capture,
-				const char *cpu_dai_name,
-				const char *codec_name, const char *codec_dai_name,
-				int (*init)(struct snd_soc_pcm_runtime *rtd),
-				const struct snd_soc_ops *ops)
-{
-	struct snd_soc_dai_link_component *dlc;
-
-	/* Allocate two DLCs one for the CPU, one for the CODEC */
-	dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
-	if (!dlc || !name || !cpu_dai_name || !codec_name || !codec_dai_name)
-		return -ENOMEM;
-
-	dlc[0].dai_name = cpu_dai_name;
-
-	dlc[1].name = codec_name;
-	dlc[1].dai_name = codec_dai_name;
-
-	init_dai_link(dev, dai_links, be_id, name, playback, capture,
-		      &dlc[0], 1, &dlc[1], 1, init, ops);
-
-	return 0;
-}
-
 struct sof_sdw_endpoint {
 	struct list_head list;
 
@@ -897,9 +849,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
 
-		init_dai_link(dev, *dai_links, be_id, name, playback, capture,
-			      cpus, num_cpus, codecs, num_codecs,
-			      asoc_sdw_rtd_init, &sdw_ops);
+		asoc_sdw_init_dai_link(dev, *dai_links, be_id, name, playback, capture,
+				       cpus, num_cpus, platform_component,
+				       ARRAY_SIZE(platform_component), codecs, num_codecs,
+				       asoc_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
@@ -969,10 +922,12 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 		int playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
 		int capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 
-		ret = init_simple_dai_link(dev, *dai_links, be_id, name,
-					   playback, capture, cpu_dai_name,
-					   codec_name, ssp_info->dais[0].dai_name,
-					   NULL, ssp_info->ops);
+		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
+						    playback, capture, cpu_dai_name,
+						    platform_component->name,
+						    ARRAY_SIZE(platform_component), codec_name,
+						    ssp_info->dais[0].dai_name, NULL,
+						    ssp_info->ops);
 		if (ret)
 			return ret;
 
@@ -992,20 +947,24 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	struct device *dev = card->dev;
 	int ret;
 
-	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
-				   0, 1, // DMIC only supports capture
-				   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
-				   asoc_sdw_dmic_init, NULL);
+	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
+					    0, 1, // DMIC only supports capture
+					    "DMIC01 Pin", platform_component->name,
+					    ARRAY_SIZE(platform_component),
+					    "dmic-codec", "dmic-hifi",
+					    asoc_sdw_dmic_init, NULL);
 	if (ret)
 		return ret;
 
 	(*dai_links)++;
 
-	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
-				   0, 1, // DMIC only supports capture
-				   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
-				   /* don't call asoc_sdw_dmic_init() twice */
-				   NULL, NULL);
+	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
+					    0, 1, // DMIC only supports capture
+					    "DMIC16k Pin", platform_component->name,
+					    ARRAY_SIZE(platform_component),
+					    "dmic-codec", "dmic-hifi",
+					    /* don't call asoc_sdw_dmic_init() twice */
+					    NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -1037,10 +996,12 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 			codec_dai_name = "snd-soc-dummy-dai";
 		}
 
-		ret = init_simple_dai_link(dev, *dai_links, be_id, name,
-					   1, 0, // HDMI only supports playback
-					   cpu_dai_name, codec_name, codec_dai_name,
-					   i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
+		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
+						    1, 0, // HDMI only supports playback
+						    cpu_dai_name, platform_component->name,
+						    ARRAY_SIZE(platform_component),
+						    codec_name, codec_dai_name,
+						    i == 0 ? sof_sdw_hdmi_init : NULL, NULL);
 		if (ret)
 			return ret;
 
@@ -1060,9 +1021,11 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 	char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 	int ret;
 
-	ret = init_simple_dai_link(dev, *dai_links, be_id, name,
-				   1, 1, cpu_dai_name, snd_soc_dummy_dlc.name,
-				   snd_soc_dummy_dlc.dai_name, NULL, NULL);
+	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
+					    1, 1, cpu_dai_name, platform_component->name,
+					    ARRAY_SIZE(platform_component),
+					    snd_soc_dummy_dlc.name, snd_soc_dummy_dlc.dai_name,
+					    NULL, NULL);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 613ecc3bed92..6183629d1754 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -932,5 +932,59 @@ int asoc_sdw_card_late_probe(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(asoc_sdw_card_late_probe, SND_SOC_SDW_UTILS);
 
+void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
+			    int *be_id, char *name, int playback, int capture,
+			    struct snd_soc_dai_link_component *cpus, int cpus_num,
+			    struct snd_soc_dai_link_component *platform_component,
+			    int num_platforms, struct snd_soc_dai_link_component *codecs,
+			    int codecs_num, int (*init)(struct snd_soc_pcm_runtime *rtd),
+			    const struct snd_soc_ops *ops)
+{
+	dev_dbg(dev, "create dai link %s, id %d\n", name, *be_id);
+	dai_links->id = (*be_id)++;
+	dai_links->name = name;
+	dai_links->platforms = platform_component;
+	dai_links->num_platforms = num_platforms;
+	dai_links->no_pcm = 1;
+	dai_links->cpus = cpus;
+	dai_links->num_cpus = cpus_num;
+	dai_links->codecs = codecs;
+	dai_links->num_codecs = codecs_num;
+	dai_links->dpcm_playback = playback;
+	dai_links->dpcm_capture = capture;
+	dai_links->init = init;
+	dai_links->ops = ops;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_init_dai_link, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
+				  int *be_id, char *name, int playback, int capture,
+				  const char *cpu_dai_name, const char *platform_comp_name,
+				  int num_platforms, const char *codec_name,
+				  const char *codec_dai_name,
+				  int (*init)(struct snd_soc_pcm_runtime *rtd),
+				  const struct snd_soc_ops *ops)
+{
+	struct snd_soc_dai_link_component *dlc;
+
+	/* Allocate three DLCs one for the CPU, one for platform and one for the CODEC */
+	dlc = devm_kcalloc(dev, 3, sizeof(*dlc), GFP_KERNEL);
+	if (!dlc || !name || !cpu_dai_name || !platform_comp_name || !codec_name || !codec_dai_name)
+		return -ENOMEM;
+
+	dlc[0].dai_name = cpu_dai_name;
+	dlc[1].name = platform_comp_name;
+
+	dlc[2].name = codec_name;
+	dlc[2].dai_name = codec_dai_name;
+
+	asoc_sdw_init_dai_link(dev, dai_links, be_id, name, playback, capture,
+			       &dlc[0], 1, &dlc[1], num_platforms,
+			       &dlc[2], 1, init, ops);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_init_simple_dai_link, SND_SOC_SDW_UTILS);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SoundWire ASoC helpers");
-- 
2.34.1

