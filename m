Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B840629265
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 08:21:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFDDF1682;
	Tue, 15 Nov 2022 08:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFDDF1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668496905;
	bh=8MVwJq2ub1xD1yFZWs2ki3R3z6KSIjItzv5RbULtfxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqQhNbN+q/B8tYz7JtlIjFMsMRNAENGfJVLokEChFEkz3uDSXvK7PH7jg4z0TC7KK
	 lnSL8PYw42+BzXhRATIEPwkuEQg7qOyAbAbCdPfODK6nmSUimgdXCQTTJv65bT1sjG
	 H3phlU22nw5CqE1PBgatnmMGd60P+Rgm/GGJsI6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 813ADF80542;
	Tue, 15 Nov 2022 08:20:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF0AEF80542; Tue, 15 Nov 2022 08:20:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BABADF80171;
 Tue, 15 Nov 2022 08:20:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BABADF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="wNYtARA8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EiAK1ks0o7jzKEM9e6g/Cu8tA4akdl31xWmn2cZRamJ2TA6PU9ZEtVnvIbt/GavAC8eHy0E01Ku9IVaRCyon3/rXXw4OhUZdRyE/5hxr3Xg4+h9tDpVr8jIy5TQsDXsVbZGzXuLsf/NVnMv49CDoUKD4J7P3uVK1k7SrDrTZ715dCVAXLCXQ9YQFv+GkS4YQ49faCSTo77nStppi7D/SI9q1/A/z2g4vb/5KtfVHiM4DfvFZZhPhHbiCHPRpnhfxfwIQ5hpgB19WnEfk+YhvlC0B/2McJh4Mn9jzDpAp/RM44CklEv+dFK7YXTmXcS/85IhGqtyAq0M5USDQutez0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sktex+Cr+nJJveF0gSzefdLFbimCxVcsgk2n1cK2lWM=;
 b=EHqI+OmeOY35rx4m5SPpyb8Nn97qU+LOVT2R0zFH6ZIHlEuhY692WekRTrE/FcxYIC9MwhCVBtdm/4qPLXdQxeTDp8agZPIWeyFi43lpF1McAuiawnqo0nupO+apJqdnwMMUGeanFgNhpC/746GLWJXRXPlrM8bqLDnaAnyH+NMvIqbce89YQsv9h9fFZyKasHyLkHx40tbmMc6Qvq/3891qL2H9f77jSnh/HDbnok+odOZFOVyH0aThIBn4Se3A89EloSr/BqUCwRrJT26wevNJbvdxlVIzDyHuNo9zzATTTuuD6WRAQaSWW2FxqvEnRMFfOrsgb+cUq9eXO/6vYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sktex+Cr+nJJveF0gSzefdLFbimCxVcsgk2n1cK2lWM=;
 b=wNYtARA8l8/G1dpEJvI/2LpDp32ryaeV6Nhrbg5p5TRLyUnvWQM2c+OlrnguuaMnolQPTMwFIlF9gTHvwU1D5DK8TorexmVjFEoEhUCMjKjD8apI2IkA7Okxds6ZBJAQzUR6XxWcpnxARo1Alx0qP9FOCL/qgQ49fvdIU0HBu3M=
Received: from BL1PR13CA0387.namprd13.prod.outlook.com (2603:10b6:208:2c0::32)
 by DM6PR12MB4878.namprd12.prod.outlook.com (2603:10b6:5:1b8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 07:20:41 +0000
Received: from BL02EPF0000EE3F.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::41) by BL1PR13CA0387.outlook.office365.com
 (2603:10b6:208:2c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 07:20:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3F.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Tue, 15 Nov 2022 07:20:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 01:20:35 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 14 Nov
 2022 23:20:17 -0800
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 15 Nov 2022 01:20:11 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 4/4] ASoC: SOF: Add DAI configuration support for AMD
 platforms.
Date: Tue, 15 Nov 2022 12:49:56 +0530
Message-ID: <20221115072001.1931617-4-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115072001.1931617-1-Vsujithkumar.Reddy@amd.com>
References: <20221115072001.1931617-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3F:EE_|DM6PR12MB4878:EE_
X-MS-Office365-Filtering-Correlation-Id: b0841cfc-46ba-4da1-3acb-08dac6d9e6ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dilc/juPZxeTHsVFiL/TYAvUCm4YtzkU0cthr2H9FyqbhcNHwsuH/BAYj+lmgZHN49uWNcgDh8yStploN8n/TsPKd0ZzdIF/45PN7Iqhr+kE/iF8yhd7j5HFYBxXdEJc4PB4huO8xQTrXa+oElg8v2ON7DNlaj1JzAncajN3CmUL6BZJ6ytMrxz8+xVO0jO0faN13lvCzRd26iXzrbikKK8eKorknnr2sQLVOHcsePIV8OaYNSDKtH7LX/xUtPlNWLyBpAv8v5qo9FQcopO8NThQ1c18DM86iG1dI2VWKzTqy6hDMWpdblpLVrACGRgkojaYcTMwD1ztLK9qCr/t8+Kj8C372nbtjPG9C3G+kfrWRYAsyFCSDQRxMDE4ZgDJawGZlbxpFa0nAN4adEhoSkpistNaMwc/PsHivdEvqpW7IIg6x54r9ZuLKXlZ8DVtD4ZWpZmqT3Wq+EuejpRXAC1ry699df8ShK4RI8lqfnZgu+zfHLIbCx2ulVO0ZvTZZa+iYMHJqT/rENLQQ6a3akekqH39z9iOtAjXXBxG4/07VnqDTaOqvxfFYMD0Arsisr4PFYPEWxFlwtNN3UOu+xOWzmS2MuIqwBwNmkj+EmmzZPkwOG4IX//JycBQ3hF3EUGklyfa8Hv6N992qdX8v7qVaobzfGQ+0wfYSKv4OOJJDvq1uRtpFWIqKXySymYG67vLfMMeICrEfueOrVrhFAsriMwq6rdJxB0lwJM0oDrT9Bl/5WH9Uv4g2+T5uAJVxjhgisv1JfXQV7RNFVJyyyWO9QbL2AVbAAWoHaABqIM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(6666004)(54906003)(7696005)(110136005)(478600001)(70206006)(8936002)(26005)(36756003)(4326008)(8676002)(70586007)(336012)(2616005)(7416002)(41300700001)(1076003)(5660300002)(186003)(83380400001)(82310400005)(40460700003)(81166007)(356005)(47076005)(426003)(36860700001)(2906002)(316002)(82740400003)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 07:20:40.6193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0841cfc-46ba-4da1-3acb-08dac6d9e6ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4878
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, "moderated
 list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for configuring sp and hs DAI from topology.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/ipc3-pcm.c      |  2 ++
 sound/soc/sof/ipc3-topology.c | 36 +++++++++++++++++++++++++++--------
 sound/soc/sof/sof-audio.h     |  1 +
 sound/soc/sof/topology.c      | 10 ++++++++++
 4 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index dad57bef38f6..f10bfc9bd5cb 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -336,6 +336,7 @@ static int sof_ipc3_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_AMD_SP:
+	case SOF_DAI_AMD_SP_VIRTUAL:
 		rate->min = private->dai_config->acpsp.fsync_rate;
 		rate->max = private->dai_config->acpsp.fsync_rate;
 		channels->min = private->dai_config->acpsp.tdm_slots;
@@ -347,6 +348,7 @@ static int sof_ipc3_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 			channels->min, channels->max);
 		break;
 	case SOF_DAI_AMD_HS:
+	case SOF_DAI_AMD_HS_VIRTUAL:
 		rate->min = private->dai_config->acphs.fsync_rate;
 		rate->max = private->dai_config->acphs.fsync_rate;
 		channels->min = private->dai_config->acphs.tdm_slots;
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 0720e1eae084..b94cc40485ed 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -276,6 +276,16 @@ static const struct sof_topology_token acpdmic_tokens[] = {
 		offsetof(struct sof_ipc_dai_acpdmic_params, pdm_ch)},
 };
 
+/* ACPI2S */
+static const struct sof_topology_token acpi2s_tokens[] = {
+	{SOF_TKN_AMD_ACPI2S_RATE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acp_params, fsync_rate)},
+	{SOF_TKN_AMD_ACPI2S_CH, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acp_params, tdm_slots)},
+	{SOF_TKN_AMD_ACPI2S_TDM_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_acp_params, tdm_mode)},
+};
+
 /* Core tokens */
 static const struct sof_topology_token core_tokens[] = {
 	{SOF_TKN_COMP_CORE_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -311,6 +321,7 @@ static const struct sof_token_info ipc3_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_SAI_TOKENS] = {"SAI tokens", sai_tokens, ARRAY_SIZE(sai_tokens)},
 	[SOF_AFE_TOKENS] = {"AFE tokens", afe_tokens, ARRAY_SIZE(afe_tokens)},
 	[SOF_ACPDMIC_TOKENS] = {"ACPDMIC tokens", acpdmic_tokens, ARRAY_SIZE(acpdmic_tokens)},
+	[SOF_ACPI2S_TOKENS]   = {"ACPI2S tokens", acpi2s_tokens, ARRAY_SIZE(acpi2s_tokens)},
 };
 
 /**
@@ -1193,6 +1204,7 @@ static int sof_link_acp_sp_load(struct snd_soc_component *scomp, struct snd_sof_
 	struct snd_soc_tplg_hw_config *hw_config = slink->hw_configs;
 	struct sof_dai_private_data *private = dai->private;
 	u32 size = sizeof(*config);
+	int ret;
 
 	/* handle master/slave and inverted clocks */
 	sof_dai_set_format(hw_config, config);
@@ -1201,12 +1213,15 @@ static int sof_link_acp_sp_load(struct snd_soc_component *scomp, struct snd_sof_
 	memset(&config->acpsp, 0, sizeof(config->acpsp));
 	config->hdr.size = size;
 
-	config->acpsp.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
-	config->acpsp.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+	ret = sof_update_ipc_object(scomp, &config->acpsp, SOF_ACPI2S_TOKENS, slink->tuples,
+				    slink->num_tuples, size, slink->num_hw_configs);
+	if (ret < 0)
+		return ret;
 
-	dev_info(scomp->dev, "ACP_SP config ACP%d channel %d rate %d\n",
+
+	dev_info(scomp->dev, "ACP_SP config ACP%d channel %d rate %d tdm_mode %d\n",
 		 config->dai_index, config->acpsp.tdm_slots,
-		 config->acpsp.fsync_rate);
+		 config->acpsp.fsync_rate, config->acpsp.tdm_mode);
 
 	dai->number_configs = 1;
 	dai->current_config = 0;
@@ -1223,6 +1238,7 @@ static int sof_link_acp_hs_load(struct snd_soc_component *scomp, struct snd_sof_
 	struct snd_soc_tplg_hw_config *hw_config = slink->hw_configs;
 	struct sof_dai_private_data *private = dai->private;
 	u32 size = sizeof(*config);
+	int ret;
 
 	/* Configures the DAI hardware format and inverted clocks */
 	sof_dai_set_format(hw_config, config);
@@ -1231,12 +1247,14 @@ static int sof_link_acp_hs_load(struct snd_soc_component *scomp, struct snd_sof_
 	memset(&config->acphs, 0, sizeof(config->acphs));
 	config->hdr.size = size;
 
-	config->acphs.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
-	config->acphs.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+	ret = sof_update_ipc_object(scomp, &config->acphs, SOF_ACPI2S_TOKENS, slink->tuples,
+				    slink->num_tuples, size, slink->num_hw_configs);
+	if (ret < 0)
+		return ret;
 
-	dev_info(scomp->dev, "ACP_HS config ACP%d channel %d rate %d\n",
+	dev_info(scomp->dev, "ACP_HS config ACP%d channel %d rate %d tdm_mode %d\n",
 		 config->dai_index, config->acphs.tdm_slots,
-		 config->acphs.fsync_rate);
+		 config->acphs.fsync_rate, config->acphs.tdm_mode);
 
 	dai->number_configs = 1;
 	dai->current_config = 0;
@@ -1545,9 +1563,11 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 			ret = sof_link_acp_bt_load(scomp, slink, config, dai);
 			break;
 		case SOF_DAI_AMD_SP:
+		case SOF_DAI_AMD_SP_VIRTUAL:
 			ret = sof_link_acp_sp_load(scomp, slink, config, dai);
 			break;
 		case SOF_DAI_AMD_HS:
+		case SOF_DAI_AMD_HS_VIRTUAL:
 			ret = sof_link_acp_hs_load(scomp, slink, config, dai);
 			break;
 		case SOF_DAI_AMD_DMIC:
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 1b5b3ea53a6e..29cf951e3526 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -248,6 +248,7 @@ enum sof_tokens {
 	SOF_COPIER_FORMAT_TOKENS,
 	SOF_GAIN_TOKENS,
 	SOF_ACPDMIC_TOKENS,
+	SOF_ACPI2S_TOKENS,
 
 	/* this should be the last */
 	SOF_TOKEN_COUNT,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9d9fcaa2a948..c668bd9d21ec 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -289,6 +289,9 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ACPDMIC", SOF_DAI_AMD_DMIC},
 	{"ACPHS", SOF_DAI_AMD_HS},
 	{"AFE", SOF_DAI_MEDIATEK_AFE},
+	{"ACPSP_VIRTUAL", SOF_DAI_AMD_SP_VIRTUAL},
+	{"ACPHS_VIRTUAL", SOF_DAI_AMD_HS_VIRTUAL},
+
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -1895,6 +1898,13 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		token_id = SOF_ACPDMIC_TOKENS;
 		num_tuples += token_list[SOF_ACPDMIC_TOKENS].count;
 		break;
+	case SOF_DAI_AMD_SP:
+	case SOF_DAI_AMD_HS:
+	case SOF_DAI_AMD_SP_VIRTUAL:
+	case SOF_DAI_AMD_HS_VIRTUAL:
+		token_id = SOF_ACPI2S_TOKENS;
+		num_tuples += token_list[SOF_ACPI2S_TOKENS].count;
+		break;
 	default:
 		break;
 	}
-- 
2.25.1

