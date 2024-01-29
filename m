Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2E683FDEF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 07:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 782AF850;
	Mon, 29 Jan 2024 07:00:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 782AF850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706508027;
	bh=6Oh0AeqAs3GSRQ7LlJY6ezIsZ7gv2kjaHXykuOEAlAk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BUG7DhC7aR1PqKyw1JM9H+AqAa5qxAB/RVqOiR4VN/oCxplVIIcUDDwgTctw/TVGV
	 oYYokFVi1UWfeVb7eoE6YaLsAl2xxsGpaa19ncWPWBNq54SYgIQd3jayC4bQ7sy6mU
	 Fmn0z7etgLXtA45+BIoz/XHDCmtboeimvcgLYh9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36408F80580; Mon, 29 Jan 2024 06:58:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AFAEF8061E;
	Mon, 29 Jan 2024 06:58:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6A19F80431; Mon, 29 Jan 2024 06:54:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42DFCF80520;
	Mon, 29 Jan 2024 06:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DFCF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mC+uU8la
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfq+dycgv4cEze+Nxv9/jesYz4ZiZxXIwbtYdpMj4pKTn4pTGqqyEYcUW4zOqhNmd87ljqHtUGrm3FkuIFZd6BRxo6+AN4Lth2k80VZFby4cOiO+dZpAyLTSxRw5fr+RYUgOpa+IieNI5QSRFCwTF1OI+TgKICl2ngY8xNVWuslAsZxPdfVEqwWL2bPFLRebL01jGOUCHEmRGJak9iCvvvjtCETQllrVW5ftkMqHu4Umk2LsPrOZcwvzEN0hP6qOeV1uI2tdZ7gmB3dNvtcKU8+2gg5jKbvTDPlvUCHFEvqvK7ufCJOUGarI7OX/M7d3o4CRpJom276OG+xZ/ZFOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iPqL8D8sIUEJdIE9QqRF4FLGLmz9V6QPJ3PtGhXMEUs=;
 b=Vk1/o9UWxlWMBIIRALqyM3zDZTl63G1G9Kp/1+qcpDgSmVj78TCN/9+CS9sbN9jKFCGDRBMhrifxSFcDaDe57D05R3h/NBDmg8fhEA1woz2IFNKPcdovJz6I1iow2BomThA+gVMPFBcgIdLVFCybe6APUCzxvXLaPQ/Fu5UUvmIcHYLoyhsOVmdKfbwSCTowrnKmON1WyP1/h2+bss+9iCG4tBNozFwDiSiPc0h3XSBtwSPWMk5pJlkRB/qOzyXHgkMrZhCY9reixqNPSeHfKdLTN1y6PT4b8VHQcC3Y+s54jiNXTKAakOvwaaHpaGjk1hUpOYrAX99W4EUeKYHS6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iPqL8D8sIUEJdIE9QqRF4FLGLmz9V6QPJ3PtGhXMEUs=;
 b=mC+uU8lahc5frkB89U/sTq8HNn1VATx/nryGQQ32DQ0WMptyG7fZC2AyK3fWhWFkO6LBKVYItcJf+7E90bfJ0s3ISy4iZ9v1h63SyQlsSzjFzX36nWB/tPOktyUC00PAlf05IDxs2qtYWAEfrVEmH7lIICG5oVAQJAKyY9vB39E=
Received: from BN9PR03CA0904.namprd03.prod.outlook.com (2603:10b6:408:107::9)
 by SJ0PR12MB5408.namprd12.prod.outlook.com (2603:10b6:a03:305::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:53:22 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::e0) by BN9PR03CA0904.outlook.office365.com
 (2603:10b6:408:107::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Mon, 29 Jan 2024 05:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:53:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:53:16 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sun, 28 Jan
 2024 21:53:15 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:53:10 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jyri Sarha
	<jyri.sarha@intel.com>, Curtis Malainey <cujomalainey@chromium.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH V4 09/13] ASoC: SOF: amd: Add Soundwire DAI configuration
 support for AMD platforms
Date: Mon, 29 Jan 2024 11:21:43 +0530
Message-ID: <20240129055147.1493853-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SJ0PR12MB5408:EE_
X-MS-Office365-Filtering-Correlation-Id: 08833b05-bb15-4c07-23b1-08dc208e9a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BwzyzUi4gV4OhnGZc1aaY6BYLNuI6lFFc4K5YFJ22zWSYPKWlE77nqGVMQRZgzt351Zmw0dS0+AfWf41p74bE4FqqATHHyauX5fIY6Sl0wycLQG3wXaSOj9skRpB+EfwcZpRyj+ky7sPybBqRJHx7zgUalpIRRCXcxP4qnHqrQe7rE87oUUdqfXIN24rwOa1bu079RX057ldF8MqbCTazrTFLIQGYjDaVfoPnHfvU7FVKqeo2uTV39DRXK+RNnYJERWjOkC/7IGmHvbLmNGsHbJuZOLK2cKBbgVjIu3tTXtJb0B5hM86WAyaQvUmj4BD4mL4HJoimwPnsvpPGlBcmxh97LlE4WT1W/EZMUf45EROwKyOgGJzCq/XP7OGet+aDHC4H650KbLs6jqMGuYm2c1qY6UW3/fUf08PSxWSlpfl0ABea2AO5KY7Kjx398em9XQiT82WUCZyz5LCZzapv6nT5LB8eDRpjd3g5pkfxBhM9RawYSpY3duDduTPRikD+3smYHb/GAp3sHXpFEaArzCkBGtLVmENvWty04cxYSL+r/VpyHhJPL2X0mtbNm6vxpxMSFQ8C0HVZuPBIdJEgqpO0A7EJxQFNjn342HjdiEJF24welHxauqHJpmwG/4LZLRnqJEAz2CXlKa61QDX7VfjlOsj0wD5WkSkglhQH8pLPMTnomorMEXAt6pyVA2nwH26UB94fUzZokU54endtv/DMZ5BsTgBbajzs+6LsQDX5y2XlYDN3iRpUeFIaZEl657fqVvsGWWf6SDPqXtcCQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(7416002)(2906002)(7696005)(5660300002)(6666004)(2616005)(70206006)(110136005)(316002)(70586007)(4326008)(1076003)(426003)(26005)(336012)(54906003)(8676002)(8936002)(36860700001)(47076005)(82740400003)(356005)(83380400001)(81166007)(478600001)(86362001)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:53:22.0575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08833b05-bb15-4c07-23b1-08dc208e9a02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5408
Message-ID-Hash: 7QEEPKPQ64VAAPTUL3MXMBWTR5N4SYSL
X-Message-ID-Hash: 7QEEPKPQ64VAAPTUL3MXMBWTR5N4SYSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QEEPKPQ64VAAPTUL3MXMBWTR5N4SYSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for configuring AMD Soundwire DAI from topology.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 include/sound/sof/dai-amd.h     |  7 ++++++
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/tokens.h |  4 ++++
 sound/soc/sof/ipc3-pcm.c        | 25 +++++++++++++++++++++
 sound/soc/sof/ipc3-topology.c   | 40 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h       |  1 +
 sound/soc/sof/topology.c        |  5 +++++
 7 files changed, 84 insertions(+)

diff --git a/include/sound/sof/dai-amd.h b/include/sound/sof/dai-amd.h
index 9df7ac824efe..59cd014392c1 100644
--- a/include/sound/sof/dai-amd.h
+++ b/include/sound/sof/dai-amd.h
@@ -26,4 +26,11 @@ struct sof_ipc_dai_acpdmic_params {
 	uint32_t pdm_ch;
 } __packed;
 
+/* ACP_SDW Configuration Request - SOF_IPC_DAI_AMD_SDW_CONFIG */
+struct sof_ipc_dai_acp_sdw_params {
+	struct sof_ipc_hdr hdr;
+	u32 rate;
+	u32 channels;
+} __packed;
+
 #endif
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 4773a5f616a4..0764a80c17a9 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -89,6 +89,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_AMD_SP_VIRTUAL,		/**< AMD ACP SP VIRTUAL */
 	SOF_DAI_AMD_HS_VIRTUAL,		/**< AMD ACP HS VIRTUAL */
 	SOF_DAI_IMX_MICFIL,		/** < i.MX MICFIL PDM */
+	SOF_DAI_AMD_SDW,		/**< AMD ACP SDW */
 };
 
 /* general purpose DAI configuration */
@@ -119,6 +120,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_acp_params acphs;
 		struct sof_ipc_dai_mtk_afe_params afe;
 		struct sof_ipc_dai_micfil_params micfil;
+		struct sof_ipc_dai_acp_sdw_params acp_sdw;
 	};
 } __packed;
 
diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index ee5708934614..6bf00c09d30d 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -218,4 +218,8 @@
 #define SOF_TKN_IMX_MICFIL_RATE			2000
 #define SOF_TKN_IMX_MICFIL_CH			2001
 
+/* ACP SDW */
+#define SOF_TKN_AMD_ACP_SDW_RATE		2100
+#define SOF_TKN_AMD_ACP_SDW_CH			2101
+
 #endif
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index 330f04bcd75d..35769dd7905e 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -395,6 +395,31 @@ static int sof_ipc3_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		dev_dbg(component->dev, "MICFIL PDM channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
 		break;
+	case SOF_DAI_AMD_SDW:
+		/* change the default trigger sequence as per HW implementation */
+		for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
+			struct snd_soc_pcm_runtime *fe = dpcm->fe;
+
+			fe->dai_link->trigger[SNDRV_PCM_STREAM_PLAYBACK] =
+					SND_SOC_DPCM_TRIGGER_POST;
+		}
+
+		for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
+			struct snd_soc_pcm_runtime *fe = dpcm->fe;
+
+			fe->dai_link->trigger[SNDRV_PCM_STREAM_CAPTURE] =
+					SND_SOC_DPCM_TRIGGER_POST;
+		}
+		rate->min = private->dai_config->acp_sdw.rate;
+		rate->max = private->dai_config->acp_sdw.rate;
+		channels->min = private->dai_config->acp_sdw.channels;
+		channels->max = private->dai_config->acp_sdw.channels;
+
+		dev_dbg(component->dev,
+			"AMD_SDW rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev, "AMD_SDW channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
 	default:
 		dev_err(component->dev, "Invalid DAI type %d\n", private->dai_config->type);
 		break;
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index a8832a1c1a24..0970dbdfa78a 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -298,6 +298,14 @@ static const struct sof_topology_token micfil_pdm_tokens[] = {
 		offsetof(struct sof_ipc_dai_micfil_params, pdm_ch)},
 };
 
+/* ACP_SDW */
+static const struct sof_topology_token acp_sdw_tokens[] = {
+	{SOF_TKN_AMD_ACP_SDW_RATE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acp_sdw_params, rate)},
+	{SOF_TKN_AMD_ACP_SDW_CH, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acp_sdw_params, channels)},
+};
+
 /* Core tokens */
 static const struct sof_topology_token core_tokens[] = {
 	{SOF_TKN_COMP_CORE_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -336,6 +344,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_ACPI2S_TOKENS]   = {"ACPI2S tokens", acpi2s_tokens, ARRAY_SIZE(acpi2s_tokens)},
 	[SOF_MICFIL_TOKENS] = {"MICFIL PDM tokens",
 		micfil_pdm_tokens, ARRAY_SIZE(micfil_pdm_tokens)},
+	[SOF_ACP_SDW_TOKENS]   = {"ACP_SDW tokens", acp_sdw_tokens, ARRAY_SIZE(acp_sdw_tokens)},
 };
 
 /**
@@ -1315,6 +1324,34 @@ static int sof_link_acp_hs_load(struct snd_soc_component *scomp, struct snd_sof_
 	return 0;
 }
 
+static int sof_link_acp_sdw_load(struct snd_soc_component *scomp, struct snd_sof_dai_link *slink,
+				 struct sof_ipc_dai_config *config, struct snd_sof_dai *dai)
+{
+	struct sof_dai_private_data *private = dai->private;
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* parse the required set of ACP_SDW tokens based on num_hw_cfgs */
+	ret = sof_update_ipc_object(scomp, &config->acp_sdw, SOF_ACP_SDW_TOKENS, slink->tuples,
+				    slink->num_tuples, size, slink->num_hw_configs);
+	if (ret < 0)
+		return ret;
+
+	/* init IPC */
+	config->hdr.size = size;
+	dev_dbg(scomp->dev, "ACP SDW config rate %d channels %d\n",
+		config->acp_sdw.rate, config->acp_sdw.channels);
+
+	/* set config for all DAI's with name matching the link name */
+	dai->number_configs = 1;
+	dai->current_config = 0;
+	private->dai_config = kmemdup(config, size, GFP_KERNEL);
+	if (!private->dai_config)
+		return -ENOMEM;
+
+	return 0;
+}
+
 static int sof_link_afe_load(struct snd_soc_component *scomp, struct snd_sof_dai_link *slink,
 			     struct sof_ipc_dai_config *config, struct snd_sof_dai *dai)
 {
@@ -1629,6 +1666,9 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 		case SOF_DAI_MEDIATEK_AFE:
 			ret = sof_link_afe_load(scomp, slink, config, dai);
 			break;
+		case SOF_DAI_AMD_SDW:
+			ret = sof_link_acp_sdw_load(scomp, slink, config, dai);
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 8874ee5f557f..f98242a404db 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -276,6 +276,7 @@ enum sof_tokens {
 	SOF_ACPDMIC_TOKENS,
 	SOF_ACPI2S_TOKENS,
 	SOF_MICFIL_TOKENS,
+	SOF_ACP_SDW_TOKENS,
 
 	/* this should be the last */
 	SOF_TOKEN_COUNT,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 617a225fff24..25fb0d1443b6 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -297,6 +297,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ACPSP_VIRTUAL", SOF_DAI_AMD_SP_VIRTUAL},
 	{"ACPHS_VIRTUAL", SOF_DAI_AMD_HS_VIRTUAL},
 	{"MICFIL", SOF_DAI_IMX_MICFIL},
+	{"ACP_SDW", SOF_DAI_AMD_SDW},
 
 };
 
@@ -1968,6 +1969,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		token_id = SOF_MICFIL_TOKENS;
 		num_tuples += token_list[SOF_MICFIL_TOKENS].count;
 		break;
+	case SOF_DAI_AMD_SDW:
+		token_id = SOF_ACP_SDW_TOKENS;
+		num_tuples += token_list[SOF_ACP_SDW_TOKENS].count;
+		break;
 	default:
 		break;
 	}
-- 
2.34.1

