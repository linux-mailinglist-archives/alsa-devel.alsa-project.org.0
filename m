Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B547394487E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B02E43AE8;
	Thu,  1 Aug 2024 11:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B02E43AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504769;
	bh=KSTYiI0dytWJe6hGgmOuCegbFF0+e1QlYZSeZPMFj+g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lGZs3ArJvIFqCU3/sIh5RdI8qb0ufXc8G4MNXHsbRSatQxUJb2AAuSfV3lkvT8A0o
	 JHODBpRIO7j0HPlCZxwotxPHtTR96ggNnem8vwaCZm45N34oAlbMsDQj3dAT0HRfQF
	 wB1NNNH7RIZsh7KuO2N+B5Gs5JomiS4dxu+q6pWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 827B5F805A9; Thu,  1 Aug 2024 11:32:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62807F805B6;
	Thu,  1 Aug 2024 11:32:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94F69F8026A; Thu,  1 Aug 2024 11:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::620])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A93CF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A93CF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zKUKTsTE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXPEVQxrWtK+63qSi58cqvB/hAgRaQ6B51Kvx9iV4eThmRRLfTnSxIXvCD7hzuWPYmhu9SLtpVl3C/kw/tMfsvAtEoLyTvFgXtF4hzEgTYhPwmhfrvAdoPiW6SenXnVAUW0tYxUJ+YIusrW759zeL+jXHM7Banux+p8Z+K8mTQmxgXMkJjQHKllQ5yIqoUPTwmJbJw50RHfTNj+uv0sSxyCTs3QNaY7uZRemlwnEsGU82aEp6UQtCXjuKYLM2+hXFp6QhaQYlvsUBAGXkspZddMYUPtz3QKvGJh/r14zLzJV/0yh3uKV/rPUiGNuAVWffwOwpM9l+GqDvspxKkBT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cK5UcSHp7ey5i2K2Zi6QMQt6zdza61rvrmkQU0evU54=;
 b=SVyW8UqlFjHN3q78I07sG3YkfRi8PrBESTz9Brjgcv/Tb8/l8RHawgOK7g7MsNuzPy7voPKm2PWHp3LmjRr74x4oJ6AVbvzm1Wagk9OAlB67OG7eHDwXmOPH4xT59Kv0vNRP4xyWWtVlQcpjw8hrUIeMSC8mr2DzwSHv0UJqJGiO8Wu1w9AZuTmWCyboG7QvUq8B0WVBbhN3LQTISawTFH6lhtuRuYmk+NmP2R/lPmfOtlYNP9PrF39Hbpp3jy9EcXbSG9B8KhiqexT8tR5ScpIbmlFdbAiVNyZwk9GLamhsUeiFz43sHx7tm+xSLpjGXza8VWWKtdOQqYCDxwjLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cK5UcSHp7ey5i2K2Zi6QMQt6zdza61rvrmkQU0evU54=;
 b=zKUKTsTE8DJcW14qRSR2zGZ4MTVC0O1PDj6QE/WKcDSICO6SlSXF0q72GsnTOXhdtejwNrfEp8G/pe2Mqa5vWPSgdsWy/vHMR+XnoiEP+FfOolSHMV5i95tQ9b0GNLIfr0hvTUPQ+bElOpvb1SGLLNHM7PK/YELVyy8Riu9XfaQ=
Received: from DS7PR03CA0243.namprd03.prod.outlook.com (2603:10b6:5:3b3::8) by
 DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 09:18:46 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::f) by DS7PR03CA0243.outlook.office365.com
 (2603:10b6:5:3b3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 09:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:18:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:18:45 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:18:39 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
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
Subject: [PATCH RESEND 08/31] ASoC: intel: move soundwire machine driver
 common structures
Date: Thu, 1 Aug 2024 14:44:23 +0530
Message-ID: <20240801091446.10457-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|DM6PR12MB4436:EE_
X-MS-Office365-Filtering-Correlation-Id: 0601411a-4c1f-45d5-54a4-08dcb20af278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dLBXfkNs40cZVwq17o17XXHyi2tt0vXAYQWkJxnJv8+W2JrmRSIso6K4LXte?=
 =?us-ascii?Q?r0mYdgFoL7mU5yrzogE1XuI+jjiRAG1vbfDquOzw8a9bDVbIkHdPNdr08I5Y?=
 =?us-ascii?Q?d29K8Fj9HJ6ndQadpwbtn8v+dxisXhHhNHv/Vtw0ir2zaXW45uedxusyFRRx?=
 =?us-ascii?Q?LEiykzOXu6eAUnwHqQtVl1hQWhKC5TUsWhvABHdV8qMPADzC/GGa6CqXZYyy?=
 =?us-ascii?Q?ecloWrp9G6fVTP/06ek7j6m9rxYu4o2KiqKEQenMACDKyrTdsRb4iccWCpaS?=
 =?us-ascii?Q?FoTLwxkEvm4s6cffsAzvxUTCw8UNINsOQ/Eyvkz5zpkDmlnxhm394nbQg/Ic?=
 =?us-ascii?Q?AV7epj71+2Vff12E49W7znOSSMWDth4bXPnefrAtoYIcdzZi6HausObg9kuG?=
 =?us-ascii?Q?zwLC2pWQthjzhzOYGpJimtDH8ykholtSdoISx9W7Oh23PusYv4wp9CdFU4sh?=
 =?us-ascii?Q?s+81yoqFYyYR1RV0P1iAi5d6F/aB035rxVJla8Slg0APoGGiNV+ySyhgLWtN?=
 =?us-ascii?Q?T8NTXcpYMjW45oHhl1GgggkXCf66vrM268QxGaM+gVB30z5Dw2j98SjSLZWL?=
 =?us-ascii?Q?w9kqefq1EiwB2d8dT36OSjHFAnCwbJggsISzwEaDSJD1AYlNfvOBscGJuZT5?=
 =?us-ascii?Q?5wcCNyS/UjBU8ZduFw7TVdLSkrgPPxumNEESfgkie2YF5lCBrv2dvx5l1YnQ?=
 =?us-ascii?Q?zmulr1iaxaodXBP2BcRC2Ct/pqksgxbjCh0qtdVGMKp0etQMwOfOSsAe0Crx?=
 =?us-ascii?Q?5E1EoX/FpgLZ1g+CFkl46TNZCLaV4/NlI6TZomWwX7fZtgK4soZ/ddav/cdX?=
 =?us-ascii?Q?dKrSb+lyr3cBDlwwvbWBvehWWvrgOOrgxzJiiLiIqiIwDi5TpUxt7PeccT5A?=
 =?us-ascii?Q?Z3S0xTBemaOOLiHmCfrLo6bCpHwSmbevY9h4gRzxJbJrLMm6pDPi6NnVdPKX?=
 =?us-ascii?Q?dTb4xyrPs67AfxUrp8vV4Tb7mjiMn09Mby1/YP/O68B6v8vy74tQ3QoLM2Jr?=
 =?us-ascii?Q?WAC15oxqURLpOqJBx3u/Hvh/IDov/3/pgGthS0i46IGxI7HpB+5ePKy8GnF3?=
 =?us-ascii?Q?i0zfHYHLLRUFHlYxzcIJhKJMRxHPViTdWWAVvyP4MKv5QATDIPHxUPxtH+rk?=
 =?us-ascii?Q?LMoHNq1A4KDnVb8/9UsTQIR9z4AxQwqVDAsApOxdYpsD4LzF5YKkuEzPbGmh?=
 =?us-ascii?Q?mC0P5b/i6Z7DDM6LCkvvT5sZB0KQh+XJLQS7A/M8nJfOXAJthPsVLpmHDvWh?=
 =?us-ascii?Q?5C9rcSwuDhGdosGsfn4CyGFuN/nj4JMSIDGfDDsanZezWdSshf12CseyBsqt?=
 =?us-ascii?Q?q3PRODfjo56NCelabRuEP4zrP9jrrDOpHWjLj2aJUlzZVAFqpchQdVjrMPuQ?=
 =?us-ascii?Q?NMrv+8BME5qU8xa0lNaxnjVD/mtN?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:18:46.6063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0601411a-4c1f-45d5-54a4-08dcb20af278
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
Message-ID-Hash: OXASWGFIV5TODC4UFSI7Q3EHHGENF55M
X-Message-ID-Hash: OXASWGFIV5TODC4UFSI7Q3EHHGENF55M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXASWGFIV5TODC4UFSI7Q3EHHGENF55M/>
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

