Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF74531100
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A5CC1711;
	Mon, 23 May 2022 15:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A5CC1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653312314;
	bh=gns1rEpUY2Gtx2rDiqwUupZkl0QuIBB99YzBzYB8XnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W90NAJ2oyAMW67fDJFvUVjScB5oTCn8Xw9s6MyOGNEz2Lm2YPJtJFfCD9j813L56r
	 kgAdaiqxCVK03z2W1saZzL3YWjBDpgIeTbuuXtx99qroznT6OnGOQJ7QiLevoZP5Ez
	 QmqhSKFHpR2oC7E0eowQ69eL8+uPh3RCESWqq17k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31A21F804D0;
	Mon, 23 May 2022 15:24:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2879DF804AB; Mon, 23 May 2022 15:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B8D8F80236
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B8D8F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="uSPhJnFf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ8ZeND6t+KaB1VryaSstd7qEZYOCMY17SBMOZuk4z1nK+ks4kR/IakYYc9DfxJWnQgz1Zw4H+JMbniiKZbmyEwuyjTul/AWnVh2eNvHd8qf4wZEFII11THlZdoqfM94fSvCKScV0Jkw3GhwEmhso7UU2Ri3nV6KlYPrrHasPtL+5+R6G7B1Qi4RCGdv6GhGlEklpUL1AHNrgYOmteTOrwZ8QHX7YXQOHIvMI6VxJGK6syr7yNUWunNMsuDIS0lSPSLKOsUL5F5mV7etRKym2c8OA9rPkIuGtbgiykZiZOX8zeDOF8tU5siBcDkvKAMoz6qnYGhwcL9IuTJHtfIAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUWL2JZx+xBmkoJMMuzm43c9Ha21khrQblk0I+yvAp0=;
 b=n9i90ZnOrFpGKTlpNxZyfYR/2h6hLHMcv4qmGYv8hXGYZ+occA7ZcR+8gzL75aDcpxgaB6rnUgDHqW0Ez1/C1DsHfzg3N8XueyAYPFtnjOQluhND3FPkPlCSrw00VQNTYNYREd6P5+6Czf6RIsfUk7DPd46HhY5cpcLrHpP9b9rXj+ZAdQtDuCUqKlhonM23AIMi4t6m18bS2GSo+6rShxjNaXYAY4zJ8+N2KNCzzbxShfTwDZ/FF+H9ujfORNutvOKrQSqAlkxXP36ig+T/9VX9hBZXiHehU8+g+ErKjlCqMwqb+KYfimzeBVMIpKPejFrP3OJe309RkWtRswXzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUWL2JZx+xBmkoJMMuzm43c9Ha21khrQblk0I+yvAp0=;
 b=uSPhJnFfx72catnyEHFWB2rZYtQ81jhLJ1RvgHBvH1+7B7dgA30vwu2xrMp8c+vRrEI+S31NT3teWbEZN/+6wElWRwD14Els6DU07Bp/iFAQQUvDGRx97oUba0C/bfdtA/QGmqHT6fIxS6R+y/tcF3xs9nYlpb9vvRdXKB3Mi40=
Received: from BN0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:408:e6::20)
 by BYAPR12MB3624.namprd12.prod.outlook.com (2603:10b6:a03:aa::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 13:23:57 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::46) by BN0PR03CA0015.outlook.office365.com
 (2603:10b6:408:e6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Mon, 23 May 2022 13:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 13:23:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 08:23:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 06:23:55 -0700
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Mon, 23 May 2022 08:23:45 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 1/2] ASoC: amd: acp: Add support for nau8825 and max98360
 card
Date: Mon, 23 May 2022 18:53:52 +0530
Message-ID: <20220523132353.1767614-2-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
References: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7724575-88e0-4692-6437-08da3cbf7d3e
X-MS-TrafficTypeDiagnostic: BYAPR12MB3624:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB362493C1E9FFD68731099D8B92D49@BYAPR12MB3624.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uolm7SRCteo2XVnDL4zmvC09141YxLvIcAbPWsavHyUsMHvUxcZOxVuyxmercw7+RxQpQgiWUQi7ypKRGPzcR0PuA8ZlfC5Usw7F1ksFZrV8P3Ph7PB5kf3+Pj2WZQ0sp1qnSmHpitZZ4g24PMGzRyL3KMS61fO7ZbdnS+qdnicf8UfB/aAi+HxzwkOilb9xq/K3zsd6DhevcarAwn6JsxJ3G3GXQHFZOmzdw7RcwH/zrSXufPaf0xyjDV5Cyiw+NZ5gV/g/tGbUFQjDBgJstYsL+b3ty8iihbgRt9pbhjU47rqWPXE359gaGcO3eq/BbhcpnGlQxDd45iS5IfLesJ7oCftwmHKjj3mMtJw8imhAgRGG0m/JzeO04OJMMz8BGbaxDV5lQ3UXsWzSxJT9oU3Ye6z+hCqP3+cZmYWvftg5IyOf5JwKdVzooOjL0+f92T/JpNicjkV2KwRRN4esAd7qNzMpHBcSQIsfIYcQIemEJbeompN55sWkZzcdFByRqov7s17f/QRNdQKPzN6LO/tIboy+56f6oKtErlVeOEc7oN7jwPJB2vvO+XGTs+esEj4VjG8Do/LOQ4bZjMf6hyEOkVR4KipFWifE5dhOzW4nvrIkaNEMznVIoyINdqaE+CE8qOoSGcSHx57o7mCbLuOqPfLmAZ1aq6PmNkJYv8E08BTHbjeU8oStt1vXXQjuqEKyMcwvF03CwG+VpDUwjw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(81166007)(30864003)(508600001)(36756003)(5660300002)(2906002)(7696005)(8936002)(6666004)(7416002)(36860700001)(8676002)(4326008)(356005)(83380400001)(110136005)(316002)(54906003)(40460700003)(186003)(70586007)(70206006)(1076003)(82310400005)(86362001)(2616005)(47076005)(336012)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 13:23:56.3382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7724575-88e0-4692-6437-08da3cbf7d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3624
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <bard.liao@intel.com>
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

We have new platform with nau8825 as a primary codec and max98360 as an
amp codec. Add machine struct to register sof audio based sound card
on such Chrome machine.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/amd/acp-config.c          |  21 ++++
 sound/soc/amd/acp/Kconfig           |   1 +
 sound/soc/amd/acp/acp-mach-common.c | 166 +++++++++++++++++++++++++++-
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  15 +++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 201 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 5cbc82eca4c9..f73c187fee03 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -130,4 +130,25 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_sof_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
+	{
+		.id = "AMDI1019",
+		.drv_name = "rmb-dsp",
+		.pdata = (void *)&acp_quirk_data,
+		.fw_filename = "sof-rmb.ri",
+		.sof_tplg_filename = "sof-acp-rmb.tplg",
+	},
+	{
+		.id = "10508825",
+		.drv_name = "nau8825-max",
+		.pdata = (void *)&acp_quirk_data,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+		.fw_filename = "sof-rmb.ri",
+		.sof_tplg_filename = "sof-acp-rmb.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_rmb_sof_machines);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 9dae2719084c..7e56d2644105 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -49,6 +49,7 @@ config SND_SOC_AMD_MACH_COMMON
 	select SND_SOC_RT1019
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682S
+	select SND_SOC_NAU8825
 	help
 	  This option enables common Machine driver module for ACP.
 
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 6ae454bf60af..4f5cfa26c58d 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -24,6 +24,7 @@
 #include "../../codecs/rt5682.h"
 #include "../../codecs/rt1019.h"
 #include "../../codecs/rt5682s.h"
+#include "../../codecs/nau8825.h"
 #include "acp-mach.h"
 
 #define PCO_PLAT_CLK 48000000
@@ -175,7 +176,8 @@ static void acp_card_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 
-	clk_disable_unprepare(drvdata->wclk);
+	if (!drvdata->soc_mclk)
+		clk_disable_unprepare(drvdata->wclk);
 }
 
 static const struct snd_soc_ops acp_card_rt5682_ops = {
@@ -363,7 +365,7 @@ static int acp_card_amp_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	int ret;
+	int ret = 0;
 
 	runtime->hw.channels_max = DUAL_CHANNEL;
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
@@ -371,10 +373,13 @@ static int acp_card_amp_startup(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				      &constraints_rates);
 
-	ret = acp_clk_enable(drvdata);
-	if (ret < 0)
-		dev_err(rtd->card->dev, "Failed to enable AMP clk: %d\n", ret);
-
+	if (!drvdata->soc_mclk) {
+		ret = acp_clk_enable(drvdata);
+		if (ret < 0) {
+			dev_err(rtd->card->dev, "Failed to enable AMP clk: %d\n", ret);
+			return ret;
+		}
+	}
 	return ret;
 }
 
@@ -409,6 +414,104 @@ static const struct snd_soc_ops acp_card_maxim_ops = {
 	.shutdown = acp_card_shutdown,
 };
 
+/* Declare nau8825 codec components */
+SND_SOC_DAILINK_DEF(nau8825,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10508825:00", "nau8825-hifi")));
+
+static const struct snd_soc_dapm_route nau8825_map[] = {
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+};
+
+static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct acp_card_drvdata *drvdata = card->drvdata;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	unsigned int fmt;
+	int ret;
+
+	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
+
+	if (drvdata->hs_codec_id != NAU8825)
+		return -EINVAL;
+
+	if (drvdata->soc_mclk)
+		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
+	else
+		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
+
+	ret =  snd_soc_dai_set_fmt(codec_dai, fmt);
+	if (ret < 0) {
+		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
+		return ret;
+	}
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
+					 &pco_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, nau8825_map, ARRAY_SIZE(nau8825_map));
+}
+
+static int acp_nau8825_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS,
+				     (48000 * 256), SND_SOC_CLOCK_IN);
+	if (ret < 0)
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
+
+	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, params_rate(params),
+				  params_rate(params) * 256);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set FLL: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int acp_nau8825_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	runtime->hw.channels_max = 2;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	snd_pcm_hw_constraint_list(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
+	return 0;
+}
+
+static const struct snd_soc_ops acp_card_nau8825_ops = {
+	.startup =  acp_nau8825_startup,
+	.hw_params = acp_nau8825_hw_params,
+};
+
 /* Declare DMIC codec components */
 SND_SOC_DAILINK_DEF(dmic_codec,
 		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
@@ -437,6 +540,8 @@ SND_SOC_DAILINK_DEF(i2s_sp,
 	DAILINK_COMP_ARRAY(COMP_CPU("acp-i2s-sp")));
 SND_SOC_DAILINK_DEF(sof_sp,
 	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-sp")));
+SND_SOC_DAILINK_DEF(sof_hs,
+		    DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-hs")));
 SND_SOC_DAILINK_DEF(sof_dmic,
 	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-dmic")));
 SND_SOC_DAILINK_DEF(pdm_dmic,
@@ -491,6 +596,31 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		i++;
 	}
 
+	if (drv_data->hs_cpu_id == I2S_HS) {
+		links[i].name = "acp-headset-codec";
+		links[i].id = HEADSET_BE_ID;
+		links[i].cpus = sof_hs;
+		links[i].num_cpus = ARRAY_SIZE(sof_hs);
+		links[i].platforms = sof_component;
+		links[i].num_platforms = ARRAY_SIZE(sof_component);
+		links[i].dpcm_playback = 1;
+		links[i].dpcm_capture = 1;
+		links[i].nonatomic = true;
+		links[i].no_pcm = 1;
+		if (!drv_data->hs_codec_id) {
+			/* Use dummy codec if codec id not specified */
+			links[i].codecs = dummy_codec;
+			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+		}
+		if (drv_data->hs_codec_id == NAU8825) {
+			links[i].codecs = nau8825;
+			links[i].num_codecs = ARRAY_SIZE(nau8825);
+			links[i].init = acp_card_nau8825_init;
+			links[i].ops = &acp_card_nau8825_ops;
+		}
+		i++;
+	}
+
 	if (drv_data->amp_cpu_id == I2S_SP) {
 		links[i].name = "acp-amp-codec";
 		links[i].id = AMP_BE_ID;
@@ -523,6 +653,30 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		i++;
 	}
 
+	if (drv_data->amp_cpu_id == I2S_HS) {
+		links[i].name = "acp-amp-codec";
+		links[i].id = AMP_BE_ID;
+		links[i].cpus = sof_hs;
+		links[i].num_cpus = ARRAY_SIZE(sof_hs);
+		links[i].platforms = sof_component;
+		links[i].num_platforms = ARRAY_SIZE(sof_component);
+		links[i].dpcm_playback = 1;
+		links[i].nonatomic = true;
+		links[i].no_pcm = 1;
+		if (!drv_data->amp_codec_id) {
+			/* Use dummy codec if codec id not specified */
+			links[i].codecs = dummy_codec;
+			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+		}
+		if (drv_data->amp_codec_id == MAX98360A) {
+			links[i].codecs = max98360a;
+			links[i].num_codecs = ARRAY_SIZE(max98360a);
+			links[i].ops = &acp_card_maxim_ops;
+			links[i].init = acp_card_maxim_init;
+		}
+		i++;
+	}
+
 	if (drv_data->dmic_cpu_id == DMIC) {
 		links[i].name = "acp-dmic-codec";
 		links[i].id = DMIC_BE_ID;
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 5dc47cfbff10..c95ee1c52eb1 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -26,6 +26,7 @@ enum be_id {
 
 enum cpu_endpoints {
 	NONE = 0,
+	I2S_HS,
 	I2S_SP,
 	I2S_BT,
 	DMIC,
@@ -37,6 +38,7 @@ enum codec_endpoints {
 	RT1019,
 	MAX98360A,
 	RT5682S,
+	NAU8825,
 };
 
 struct acp_card_drvdata {
@@ -49,6 +51,7 @@ struct acp_card_drvdata {
 	unsigned int dai_fmt;
 	struct clk *wclk;
 	struct clk *bclk;
+	bool soc_mclk;
 };
 
 int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index d1531cdab110..adbae809f2aa 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -56,6 +56,16 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.dmic_codec_id = DMIC,
 };
 
+static struct acp_card_drvdata sof_nau8825_data = {
+	.hs_cpu_id = I2S_HS,
+	.amp_cpu_id = I2S_HS,
+	.dmic_cpu_id = DMIC,
+	.hs_codec_id = NAU8825,
+	.amp_codec_id = MAX98360A,
+	.dmic_codec_id = DMIC,
+	.soc_mclk = true,
+};
+
 static const struct snd_kcontrol_new acp_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -124,6 +134,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "rt5682s-rt1019",
 		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
 	},
+	{
+		.name = "nau8825-max",
+		.driver_data = (kernel_ulong_t)&sof_nau8825_data
+	},
 	{ }
 };
 static struct platform_driver acp_asoc_audio = {
@@ -143,4 +157,5 @@ MODULE_ALIAS("platform:rt5682-rt1019");
 MODULE_ALIAS("platform:rt5682-max");
 MODULE_ALIAS("platform:rt5682s-max");
 MODULE_ALIAS("platform:rt5682s-rt1019");
+MODULE_ALIAS("platform:nau8825-max");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 0a54567a2841..7b4c625da40d 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -19,6 +19,7 @@
 #define ACP_PCI_DEV_ID			0x15E2
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
 
 struct config_entry {
 	u32 flags;
-- 
2.25.1

