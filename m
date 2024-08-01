Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EF3944A4E
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AC4C3DC6;
	Thu,  1 Aug 2024 13:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AC4C3DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511547;
	bh=mJMiRgC/EE0St9/5OFuSm9BnXXR+Ye5BLGAcPnl1QCw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XVYcpshKV7vZeznq4cPCIvituYuUNhUMQnSwV3nliKodYtq/lwDnRHfjVq+UjWjU9
	 JBVyaFk45bZ/2CEtPJDQ2AzDQrY2p6zGcHSeYtWd+2syTFDB30nPjNqwETXX7F8X51
	 DVxX7sXRkTubR7ztyUn3oPnT+gbnCVssRkfBiYEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 562E5F80600; Thu,  1 Aug 2024 13:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D511F805ED;
	Thu,  1 Aug 2024 13:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 246ABF802DB; Thu,  1 Aug 2024 13:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31CC5F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CC5F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UrOx9D4r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aNmPSavdvvB5aF5hMlLWY5xiKiflN4Gf2Gi4GhZbVGu+afpQUopK+DhI1YKHwGks/VtDFxqUuyvuRtp+J2koeGnIO5JwKKtEkpw6NHxzo+7RMvci8Ipgc285bz190kclapTN5lguWrVLFkLSMPZium4rukMNuK4PLVMWHGd7o9IOWZQPvzxdIB1IhYE/AzyWndvse8xFEwIWa4oqzsJLKgItcPXdmPLYlUr/ub5RDsIR2ZrC9Af4y5PCTBx02vL5HgeCc2Nt7rEZMDdHzsV5Aj1PsY7/fpV+1ewFt5X6nKke2Pyk03mDS+MRZHx2jlmkFBzTnSzmh9n67I8KqpR28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gr7TtzcY/Q5vCZ1FmuPCuTPDvg8NAO9FoJlDcy6q1Ao=;
 b=dsJKJxaZ/o8z/md18z8Sl5BGFC1xoOXHD+SHRm/DnuS1kiFmTM+oecU8ztmsSKQ+IgnV2yo21ZT12CCislVZZs+5rI/xeeR1jhMEHLwutdRNPYn3FL0uPP3+6U5p2iB8gde9KfNRhkQ6QzTSkQ4nX9GlElr+w5iQzzcDFR6skTktiC7lF9qV0jgnMPFzGpo4XmnFKVQdNScTw5gaXwMrLXBB3G0XJyUWqj+Pm+gsFfYuBTUY9lpsoP+9cJYpsqhhvHC4Wczcf0rfUG3BytjNl6O/pqavQ8IAbEJWZU85Vj7uwPUlhcMbs5xYoMpJdILDA2yZaXb5i9iIq5Ck8h/KJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gr7TtzcY/Q5vCZ1FmuPCuTPDvg8NAO9FoJlDcy6q1Ao=;
 b=UrOx9D4r7go7vC8NyBXk3ymo6SZ7j5XMDxvicvAJrZFFtyndHpawFTN7ikO6bhyTglon1z83QHPiBaio5jxr9gDQiLdmrR9HFXNKNKDNy0jFOjCD0PwHssONKhd4X6B5bQNgZp4aZDuHKaf/GjVi8+lO0bPJ2NkDvg090lZMcmo=
Received: from PH7PR03CA0028.namprd03.prod.outlook.com (2603:10b6:510:339::18)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 11:19:44 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:339:cafe::c3) by PH7PR03CA0028.outlook.office365.com
 (2603:10b6:510:339::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Thu, 1 Aug 2024 11:19:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:19:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:19:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:19:42 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:19:32 -0500
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
Subject: [PATCH RESEND 25/31] ASoC: sdw_utils: refactor
 sof_sdw_card_late_probe function
Date: Thu, 1 Aug 2024 16:48:11 +0530
Message-ID: <20240801111821.18076-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9173fe-35d5-4815-5745-08dcb21bd7f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+dg2S+CFNLAsMekq9J8lHwkRk0NgG/2qWBbp6IeASAlz1YouIqmZlvTY28ST?=
 =?us-ascii?Q?d8vCW47NYSMi7ApXR87nadS6f6dB4o5W6clVvTXbpsXIbC572NbOFIEyhJdT?=
 =?us-ascii?Q?ka5tNZbXb+XlTjGfA2lIkD9KB6m7Yomz6+PgCxGsd0uRuDJmKq+eOuxLFVxx?=
 =?us-ascii?Q?G/tYYGlJ6lY6YJGwXjy10Caw9SzcG5SZZvdX4rHHBpFMGs3fCQPxoi0K/SfW?=
 =?us-ascii?Q?/7WBwD7LagIH+SJ6kuI0x4Ex+nDXEmzh66doiEC9vAIksxrZfUUiP8W+hIXr?=
 =?us-ascii?Q?/wZeL4uAvXdXmVTHFfDgaShonidYxzGLm7B62VtnbjEIwOASOh/HtQrvzfZB?=
 =?us-ascii?Q?BsuqH0uKMVjM3XwgcH5zcDPn5Pd6Lj6wDzJuuGCNh1MIhh2lU+OCSTBsYhZe?=
 =?us-ascii?Q?49i5xha51Z+H0iZlCacUfthRpZH4D38/AbX5mfXoTG8Szzjd+T3fGxVF9vWH?=
 =?us-ascii?Q?2ks5y4Z1UFWPyUVoqyPU6Zk0SSsARHdOVMjqw+yRrj0PUWZ83zEsnC+ftDns?=
 =?us-ascii?Q?A0eZJfZGTJA9lLKcRPGLVEUROO2D3jlS2XWT5fYSxNWouUqED1IKIw5Sx3bg?=
 =?us-ascii?Q?FOOa+XkCqCWyDWJpS2XhWss/G+O3gxBdRD2wJAzMh4yK5zl5H8P8p4BcCgs+?=
 =?us-ascii?Q?uTv9Dd683yi3fW7o5Re36LO7wflUrYzgQF5u5lQXI07gvblMJzTarxpxuhuw?=
 =?us-ascii?Q?RzIsH4mnAU10e+f+WTNWjQJ8hlo8Sm+wzgng9+wNVUu0z2ABq7pH15kRRUNS?=
 =?us-ascii?Q?yULM71bWgklrreNs9cfSDIvLI9Hrmg7vyDHn53CfvibndkogfsZ+/F34wxzX?=
 =?us-ascii?Q?6zXKjQ5LmMZOHiW2cRZzNhSKs9l3Dw02NGhxTlVhri1d3XtTPYasmHiB6klP?=
 =?us-ascii?Q?E6HvbrwbzLS0eV6EpDidlKHi6HCMonJF4Zjym/FvmObDprAwp07H6f1ZBfEV?=
 =?us-ascii?Q?jUc7b/D1F4ebJQcxtBA7omW6mbvCVTS/exmIuKb9HDIsJv6UIZ6TMrkZ6CfV?=
 =?us-ascii?Q?Lzj+wlJOoqZ6xHaJ4jln0uOnO8j/oaF0DPXshVoL54EEXzO0uplWf71X5Q/1?=
 =?us-ascii?Q?lyFnfFoVudOSrGM39yy2Xfs659qN03Re7GaoPKnkbEUFmSWU1TFfkYewab3A?=
 =?us-ascii?Q?qPy7b5USz/lieFjctHNHwzNkOXdmdzMI2ncHg7TO7gKn7RUPjiAu0AaQSLwO?=
 =?us-ascii?Q?78h5+d0S/bW5YJZPBx2bbZEPMzjsod6/9l5jycmXLoaOXluR036zJ+UnxSFi?=
 =?us-ascii?Q?R5Lkq2Bfd019VvFvO0pdEP3/J7uhij3PaG7vZq48y6bzwjmk0VZ3V38nHttU?=
 =?us-ascii?Q?pNNQ80bKW/+/zsY3ndFbbhBc/TgzShvlsm13MIYbg1UbEKBogf42CmgAH4Rs?=
 =?us-ascii?Q?nkrZTxSXXlM8WW1nuLX/LD3GwmHXKLXJmDfkvdjIBfhzGf6L5Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:19:43.4934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f9173fe-35d5-4815-5745-08dcb21bd7f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
Message-ID-Hash: 3J4E3XYFHVXWU7WK26Z63Q36SIRVMAIQ
X-Message-ID-Hash: 3J4E3XYFHVXWU7WK26Z63Q36SIRVMAIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3J4E3XYFHVXWU7WK26Z63Q36SIRVMAIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor sof_sdw_card_late_probe() function and derive a generic
function soc_sdw_card_late_probe() function which can be used by
SoundWire generic machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  2 ++
 sound/soc/intel/boards/sof_sdw.c    | 12 +++---------
 sound/soc/sdw_utils/soc_sdw_utils.c | 16 ++++++++++++++++
 3 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index b3b6d6b7ce2f..14e21a992f56 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -122,6 +122,8 @@ struct snd_soc_dai_link *asoc_sdw_mc_find_codec_dai_used(struct snd_soc_card *ca
 
 void asoc_sdw_mc_dailink_exit_loop(struct snd_soc_card *card);
 
+int asoc_sdw_card_late_probe(struct snd_soc_card *card);
+
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd);
 
 /* DMIC support */
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 07b1d6994304..65b15f594aed 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1221,16 +1221,10 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int ret = 0;
-	int i;
-
-	for (i = 0; i < ctx->codec_info_list_count; i++) {
-		if (codec_info_list[i].codec_card_late_probe) {
-			ret = codec_info_list[i].codec_card_late_probe(card);
 
-			if (ret < 0)
-				return ret;
-		}
-	}
+	ret = asoc_sdw_card_late_probe(card);
+	if (ret < 0)
+		return ret;
 
 	if (intel_ctx->hdmi.idisp_codec)
 		ret = sof_sdw_hdmi_card_late_probe(card);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 409a50147349..613ecc3bed92 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -916,5 +916,21 @@ void asoc_sdw_mc_dailink_exit_loop(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(asoc_sdw_mc_dailink_exit_loop, SND_SOC_SDW_UTILS);
 
+int asoc_sdw_card_late_probe(struct snd_soc_card *card)
+{
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		if (codec_info_list[i].codec_card_late_probe) {
+			ret = codec_info_list[i].codec_card_late_probe(card);
+			if (ret < 0)
+				return ret;
+		}
+	}
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_card_late_probe, SND_SOC_SDW_UTILS);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SoundWire ASoC helpers");
-- 
2.34.1

