Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 341CA9446C2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E70FA336F;
	Thu,  1 Aug 2024 10:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E70FA336F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501462;
	bh=KSTYiI0dytWJe6hGgmOuCegbFF0+e1QlYZSeZPMFj+g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nQIC7ZC/+vMi/GW3l0du3UWA7XHJInDAXoEdpieSezgRdIlgwzxTOZm5B1g0OFbwK
	 pJaIdAqcD2+MSVCkodpcNcvdRFPdCR3GhBfwSV/RLobXZNB/m3GRVAAyHzez62kcz+
	 /STOCJ2fNAQfK3YoBL8+5UR59fD87qs/JhRuiLQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF878F8057A; Thu,  1 Aug 2024 10:37:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C117F805A0;
	Thu,  1 Aug 2024 10:37:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 305CEF8026A; Thu,  1 Aug 2024 08:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C4EBF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C4EBF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wxhD0AbX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNAvxGDk+6HfojLcrqSuTfc2e+gRUdWsmxRKCA4zcQlnaKu8OX3ZehMsxo98SrtaQrSsgi1jnfsPcR428rBQJEZtBRwVq5IGhCdtbdPBPhzopXmeweEh1e5WKcLjwTm5SR8/Kpo96gMGN1nc+7Kp1tKprOTLe483ofp7Swqvd3BMjgyGAemGgzX0j+ozeqYOY0vvj4DdmoHlD491vj/ST9AnN7312Vvz03acAWzQ9T8QY4hZTo9Q1Ai5kdj4NY1BdMRnFOcmqm7+gY7I/npgILGRu+x5czOt8KrELBYWg9DYOX/mJM3pPJor3WkDvI3htdDhDSm/H1Kvn6/liSu1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK5UcSHp7ey5i2K2Zi6QMQt6zdza61rvrmkQU0evU54=;
 b=YoUd52xNte58KKmnRtGZwW0JAJjOAPJxwDstPYOfQf1Tb6zokb51ZWNnBdqtd3QwIWBWs9pJyiEhvp78W4L4LIysQLoUivq1q1GAUi+hM0Vgzlh5caYuzNzgA1r4yZTxEjsl7NqZhP+FFlVIz+xNXNmZXAQC4jW+pg+2KJbyyoPesjBGEKqMYzg9tuVTlkSqCongPuzvfZv19FZx1LI70BLfZe5+3KyytfTVnntMACqBFBITaTDsX9fYZp6Bl4lTQHtZhdjXvY87QaJopWrAXhPcIB4nsjU+f1r8xHaiYBm0qnXN14w9nmmt1dEqPXAVlAji1dd4lHzOevalbFz2Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cK5UcSHp7ey5i2K2Zi6QMQt6zdza61rvrmkQU0evU54=;
 b=wxhD0AbXdrfiuNslrvpQHlpEpHEbOZSoOPZXHSVRUKOKYi6Lay3ja2YwL/W9j8A50qeNOwRQNzJ/pyYN2OodmBeE0aii+0d7un/1C33SarQX8ITeBdnm2b153J1qn2qfY1nV31x3kuZXsZg3E9pZFZz07TRUFinvr/kdmU3Gog0=
Received: from MN2PR05CA0039.namprd05.prod.outlook.com (2603:10b6:208:236::8)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 06:28:08 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::62) by MN2PR05CA0039.outlook.office365.com
 (2603:10b6:208:236::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20 via Frontend
 Transport; Thu, 1 Aug 2024 06:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:28:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:28:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:28:06 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:28:00 -0500
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
Subject: [PATCH 08/31] ASoC: intel: move soundwire machine driver common
 structures
Date: Thu, 1 Aug 2024 11:53:53 +0530
Message-ID: <20240801062416.2203673-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bf0e97-8c65-4bae-4031-08dcb1f31ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MBTKyyHeb69tlhOI7tsc2dqUvhNNL3VOoPTXwTWq+9+bWkPnJhPThx7KbfCo?=
 =?us-ascii?Q?Y571sNWExhsUIBSNzqAyV1Xqqew2jnkWS4eMrtZt7SGNjFC0oNDyFArlFIV0?=
 =?us-ascii?Q?lYxl+oeJfVa5Hm71HE16OEBunyOkh4qBfgfQhjGY0HiXYmqrEEUH4oANx3IM?=
 =?us-ascii?Q?D/+IZh/WwdDAcsr6Kb89ifOma2DGW8NWtlRTZcG3xN/GZTYAO/DjqtOj1WW9?=
 =?us-ascii?Q?blxCPCNpo+yjWS4MP9KcPQr+E4HnHBQGNgMu2zgSfe2F+hnxCV0Wj3EzxlTK?=
 =?us-ascii?Q?wL8IsiTlzOd6ns0M+67kiqmTB/+29bkOJ/3D7dnfUwPbyVDvoPkVcVSO1ffY?=
 =?us-ascii?Q?4gM3q5eqcdyhpuaQKURgd1TgeVUPZdP2o3eVT4N2HfeRWYE91YhvkfJ9x/Ib?=
 =?us-ascii?Q?QkWxJEqQuyLTyYSTk9p/uSLizSAUyV4hDLMmMrwn1jrj+gkyyuGLuNCKAies?=
 =?us-ascii?Q?mwCckn0DiR6LRpE0ReajmrsyRypeufSQSRgwFMuifVfgi0Czlvb69CsTPA5a?=
 =?us-ascii?Q?Vx/hzEKkhZ7I7cssdHx7vOIs20b0wcy2VWcTR+ibWPyf9jfRahe44xZDQJ6F?=
 =?us-ascii?Q?mnjs07k+2w79VzPMccFk4GtkUr+KTcDNXRc2paA8fkRuV8lavCw5FjgumZQY?=
 =?us-ascii?Q?Zu2xPjwDXQoB6zyB1X3AbKSTU24nexM1/2nqL49OJbfxUjzuO6U7oHpsUyBe?=
 =?us-ascii?Q?gIj3yv1oo5CSQ9mYlhZFSMf/uASl9PENjvqHKFkPePfT6N6e5Cu+aOqpDQBM?=
 =?us-ascii?Q?mmLEmfrge/oIwBdn9JRbTJEde70He8ljYqoGBcPBSwsL996DbY9Wq8A35MQN?=
 =?us-ascii?Q?pi/5Muc2wkzr7fMrll/o7kCMaHYAQJDId2s/jgsEgcrCY40UxZI9btiHd/+S?=
 =?us-ascii?Q?0nC3tqAT4TxZDpQW5nA6wumKjK0Of5Re/9k3ANUOqVmU0i3o1YIJ/jda1ZEy?=
 =?us-ascii?Q?z5XfqnMo6ZA+5+4Qq5L8BnlVq3xqobm2mlpZcI+IGOB5ueE290r5L9kFPEup?=
 =?us-ascii?Q?gmF94GqMRAeqcQ/8B240ND/rs1r5ixVxBJsvcjrWVLpZkduKD2aSjOU8jE4/?=
 =?us-ascii?Q?wAITrodylU+7g2nwaQ7bXNjgqFPOiE+9uCTvz75BUjEwNPFJkSgMR3Sj1iEn?=
 =?us-ascii?Q?/YFN5JcAiyYy8ptnHKZAR57SNm+/c2tceKepV31a6yjHAWUfPRLRgPEesGbb?=
 =?us-ascii?Q?88IhZ/5fwZQmcAJew7m5EdpXtS1VAoLMyuBVPBnnQHP8XHkVtSOMvRDLiCms?=
 =?us-ascii?Q?36n3wbWc1j46VoeKGAPs1pjKR/7H2GKdOhOtmKV6CQgSgMWvw1oBJgXrqnZ4?=
 =?us-ascii?Q?tcnXUA5qqwVdY1KgDowAl8/hQ4o79pjDQh3cH5WHow7XUryq12tE6z9aLw3h?=
 =?us-ascii?Q?oUkl+Adozxolp9eS+FzmRl7/IXfx?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:28:07.8061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 49bf0e97-8c65-4bae-4031-08dcb1f31ba4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775
Message-ID-Hash: 2M5FJPG46ZLNEQUXIMOXEVXT5XEGM6DC
X-Message-ID-Hash: 2M5FJPG46ZLNEQUXIMOXEVXT5XEGM6DC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2M5FJPG46ZLNEQUXIMOXEVXT5XEGM6DC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move intel generic SoundWire machine driver common structures to
soc_sdw_utils.h file. These structures will be used in other platform
SoundWire machine driver code.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h           | 43 +++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h | 43 -------------------------
 2 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index cf4cdb66b2de..1ae5523bbcf8 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -11,6 +11,49 @@
 
 #include <sound/soc.h>
 
+#define SOC_SDW_MAX_DAI_NUM             8
+
+struct asoc_sdw_codec_info;
+
+struct asoc_sdw_dai_info {
+	const bool direction[2]; /* playback & capture support */
+	const char *dai_name;
+	const int dai_type;
+	const int dailink[2]; /* dailink id for each direction */
+	const struct snd_kcontrol_new *controls;
+	const int num_controls;
+	const struct snd_soc_dapm_widget *widgets;
+	const int num_widgets;
+	int  (*init)(struct snd_soc_card *card,
+		     struct snd_soc_dai_link *dai_links,
+		     struct asoc_sdw_codec_info *info,
+		     bool playback);
+	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
+	unsigned long quirk;
+};
+
+struct asoc_sdw_codec_info {
+	const int part_id;
+	const int version_id;
+	const char *codec_name;
+	int amp_num;
+	const u8 acpi_id[ACPI_ID_LEN];
+	const bool ignore_internal_dmic;
+	const struct snd_soc_ops *ops;
+	struct asoc_sdw_dai_info dais[SOC_SDW_MAX_DAI_NUM];
+	const int dai_num;
+
+	int (*codec_card_late_probe)(struct snd_soc_card *card);
+
+	int  (*count_sidecar)(struct snd_soc_card *card,
+			      int *num_dais, int *num_devs);
+	int  (*add_sidecar)(struct snd_soc_card *card,
+			    struct snd_soc_dai_link **dai_links,
+			    struct snd_soc_codec_conf **codec_conf);
+};
+
 int asoc_sdw_startup(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index d97aedeef9e8..688cbc3afb29 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -78,49 +78,6 @@ enum {
 #define SOC_SDW_DAI_TYPE_AMP		1
 #define SOC_SDW_DAI_TYPE_MIC		2
 
-#define SOC_SDW_MAX_DAI_NUM		8
-
-struct asoc_sdw_codec_info;
-
-struct asoc_sdw_dai_info {
-	const bool direction[2]; /* playback & capture support */
-	const char *dai_name;
-	const int dai_type;
-	const int dailink[2]; /* dailink id for each direction */
-	const struct snd_kcontrol_new *controls;
-	const int num_controls;
-	const struct snd_soc_dapm_widget *widgets;
-	const int num_widgets;
-	int  (*init)(struct snd_soc_card *card,
-		     struct snd_soc_dai_link *dai_links,
-		     struct asoc_sdw_codec_info *info,
-		     bool playback);
-	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
-	unsigned long quirk;
-};
-
-struct asoc_sdw_codec_info {
-	const int part_id;
-	const int version_id;
-	const char *codec_name;
-	int amp_num;
-	const u8 acpi_id[ACPI_ID_LEN];
-	const bool ignore_internal_dmic;
-	const struct snd_soc_ops *ops;
-	struct asoc_sdw_dai_info dais[SOC_SDW_MAX_DAI_NUM];
-	const int dai_num;
-
-	int (*codec_card_late_probe)(struct snd_soc_card *card);
-
-	int  (*count_sidecar)(struct snd_soc_card *card,
-			      int *num_dais, int *num_devs);
-	int  (*add_sidecar)(struct snd_soc_card *card,
-			    struct snd_soc_dai_link **dai_links,
-			    struct snd_soc_codec_conf **codec_conf);
-};
-
 struct mc_private {
 	struct snd_soc_card card;
 	struct snd_soc_jack sdw_headset;
-- 
2.34.1

