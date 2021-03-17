Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1333F9DF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 21:18:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79A716CA;
	Wed, 17 Mar 2021 21:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79A716CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616012329;
	bh=idnjX6CGe8d3vwpG41wvFMCswVZbYOcPAS1hT6xB7LM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iTgYmY1xlGMiI9U7JHyFHsjc5KzPdYs1ijRBdRFkleJJn4Iq0+3lvwmXjBzsTk6fq
	 3GuCuswmtbxnpZuxtefjORulleiCRVnr3NL0uoXgv6ONsYHKMdT2GFl/5Qku5nUjVg
	 uGPRC1Kf1V3RW7B+5Bts0I8Cj9PEVzButPq/JmSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EAAFF80254;
	Wed, 17 Mar 2021 21:17:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35B33F80253; Wed, 17 Mar 2021 21:17:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3FE0F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 21:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3FE0F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="k1bksCW8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRurIh2d0XzFxSa4ATRNRuHD/9Js2dITpzxdOVpTb6SMLbreosWMvRsuyK3LrD/PhA3KDNLuLI5ZmVKCXewgMUFDepRQSpGj3e+cZkSh4aPvWYAAFTs7pWN2HYIUvYnthnWKX6Mk9vILP/3rkdInc8EcPVq8inlnpjME2/SHF6UbwBpeCbVq/04/UhjnaTqkFSOe/qt6yEoMLkSUgCn7WaynL2z9dj3+2eUI7J7+0/QWCj0gmM7qBJSW3qQ9WTbl6+cVTxBhSIgd9PkNd6Q0FDUTiz1KUvr0oOtmsFfK3g4ltbiW0fJTSWKbyvxyyMx4A1jHunXqgjLp30eS48WfMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlGSzVNWsHs/KBKWgz0gZr5/jjqJ/uWZktiy725XdUg=;
 b=IO5CgfpeVoaNpO48bZL6EChQs5i34KBAk9NT72Qy/ht2XtT5uYFvvDjW5gEpWZVz/CxlI52bD+Fk3johqgOg9I/4SvWm4h630MNyJfkZZZRyhaX0e5z93IRxSmZeHXuxAT/EFud/FwjcL1xDPTvWpx0SfN+ACXwvGQK6oP8VxZ3avXJW806/28rEQ8kSoHkKLSb/k/PIm+XFfBA1xwSPCsJBR1kCAimr2N58dlvRYWfsbJur+TBzCL03o8UXUqnOxh2SLntH1TW7tzCAnvg2EQY+9+wedKqiQa0jECzd+cxART/JchTtVwUcrmWXnEKpdnMrZZ0pdGDcINBc+0SX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlGSzVNWsHs/KBKWgz0gZr5/jjqJ/uWZktiy725XdUg=;
 b=k1bksCW8H7vM3om85TFmfViB7LpLwe1i0m/V6+Sa01KsBPfPrf2KSnssBPH1rn1ZAxTCQqaioXIuwwRhkO9lejMMvf0v0LnaQHDuH7mrrkv52M1eBeCAEagnNV09Go1r1xF4Vk6ICd98E9f9YZe5F6tnaoTpNVI+Ecdb/vBr1Qo=
Received: from DS7PR03CA0291.namprd03.prod.outlook.com (2603:10b6:5:3ad::26)
 by MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 20:16:46 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::a1) by DS7PR03CA0291.outlook.office365.com
 (2603:10b6:5:3ad::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 17 Mar 2021 20:16:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB01.amd.com;
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 20:16:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 15:16:45 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 17 Mar 2021 15:16:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 1/2] ASoC: amd: Add support for RT5682 codec in machine
 driver
Date: Thu, 18 Mar 2021 02:03:46 +0530
Message-ID: <1616013238-12254-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb5266aa-570c-462e-19d7-08d8e98196b4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4344:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43445FE608D1B0632FA2C1DD976A9@MN2PR12MB4344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WAYUI9MAikQEE6uPFK1fbVJCWcrpFmt/1v5VRoBAhKS54mB0zKMHM/zwlGlg3K7ek9C6hBIjjua7iFJs1KSyAkfd0APt6Oy6uTP8moeAXn3BChoof4yf3CgCJRro1CKLHYcLYOuWZv+5UsDMXD45ZCUjGvLfz1h5Ut2el1j00biAx5oFIK5IYN/5sAgQY5DnLPAX/P29a+ottuuxqVJKwMQnzWllY5tspng9OcrA1Cusj7PCzAfe3d2uUsiyIYKrfyXHOQf+ACFbFgLCiRA54RO5hB9xjxj4uSjUNRPKwTazmiLc1GkXhPN0clpwyuWWj1I13GXGsvM/ClSBAiepfvrY02y72TO91arES1NW4I76aHlw3ylzsrMS3gudtLD3dtDloWqIT5CAS1ub4HwkaaU3PuqqlX/Ukt9hY0O29k3CuxAhMoPmvGuFV6f5DiZzxGpcyaPpyju85NJUNZ/jJFLrndVmConlkhvB/C5TY2RLhAI7g1pQ6bTJ6AoxTReSe+FZpO/ntlta4jaOspdLqBKRpVF9YNSTbQIBtVtYKEq73XjRvba2il0/YMhSOH9ALaKX18lB89xI2COct8y+QViXAkoTqxYlAoDFwYxWBZlukBU8/mPKIr+vFySKUOCF7K4Vri1GJLMa0CKKzKvf3ERT/hdnAhRbbPuRu5FKK2LIOtT+6jAaljiZhT8UG5MF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(36840700001)(8936002)(5660300002)(2906002)(336012)(8676002)(82310400003)(70586007)(110136005)(2616005)(47076005)(54906003)(426003)(478600001)(86362001)(81166007)(36756003)(186003)(356005)(26005)(83380400001)(4326008)(7416002)(36860700001)(316002)(82740400003)(70206006)(30864003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 20:16:46.0354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5266aa-570c-462e-19d7-08d8e98196b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4344
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sunil-kumar.Dommati@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Chuhong Yuan <hslester96@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander.Deucher@amd.com, derek.fang@realtek.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, shumingf@realtek.com,
 flove@realtek.com
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

Add support for RT5682 codec in machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v3->v4: fixed clk_prepare_enable() for wclk instead of bclk
v2->v3: updated SPDX license
v1->v2: updated kconfig, spdx license, removed unnecessary
initialization and updated comment
 sound/soc/amd/Kconfig                |   5 +-
 sound/soc/amd/acp-da7219-max98357a.c | 378 +++++++++++++++++++++++++++++++----
 2 files changed, 342 insertions(+), 41 deletions(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index a6ce000..43f5d29 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -5,14 +5,15 @@ config SND_SOC_AMD_ACP
 	 This option enables ACP DMA support on AMD platform.
 
 config SND_SOC_AMD_CZ_DA7219MX98357_MACH
-	tristate "AMD CZ support for DA7219 and MAX9835"
+	tristate "AMD CZ support for DA7219, RT5682 and MAX9835"
 	select SND_SOC_DA7219
+	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
 	select SND_SOC_ADAU7002
 	select REGULATOR
 	depends on SND_SOC_AMD_ACP && I2C && GPIOLIB
 	help
-	 This option enables machine driver for DA7219 and MAX9835.
+	 This option enables machine driver for DA7219, RT5682 and MAX9835.
 
 config SND_SOC_AMD_CZ_RT5645_MACH
 	tristate "AMD CZ support for RT5645"
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 849288d..7fca4e78 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -1,27 +1,8 @@
-/*
- * Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec
- *
- * Copyright 2017 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
+// SPDX-License-Identifier: MIT
+//
+// Machine driver for AMD ACP Audio engine using DA7219, RT5682 & MAX98357 codec
+//
+//Copyright 2017-2021 Advanced Micro Devices, Inc.
 
 #include <sound/core.h>
 #include <sound/soc.h>
@@ -41,14 +22,19 @@
 #include "acp.h"
 #include "../codecs/da7219.h"
 #include "../codecs/da7219-aad.h"
+#include "../codecs/rt5682.h"
 
 #define CZ_PLAT_CLK 48000000
 #define DUAL_CHANNEL		2
+#define RT5682_PLL_FREQ (48000 * 512)
 
 static struct snd_soc_jack cz_jack;
 static struct clk *da7219_dai_wclk;
 static struct clk *da7219_dai_bclk;
+static struct clk *rt5682_dai_wclk;
+static struct clk *rt5682_dai_bclk;
 extern bool bt_uart_enable;
+void *soc_is_rltk_max(struct device *dev);
 
 static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -128,6 +114,88 @@ static void da7219_clk_disable(void)
 	clk_disable_unprepare(da7219_dai_bclk);
 }
 
+static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	dev_info(codec_dai->dev, "codec dai name = %s\n", codec_dai->name);
+
+	/* Set codec sysclk */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
+				     RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev,
+			"Failed to set rt5682 SYSCLK: %d\n", ret);
+		return ret;
+	}
+	/* set codec PLL */
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL2, RT5682_PLL2_S_MCLK,
+				  CZ_PLAT_CLK, RT5682_PLL_FREQ);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set rt5682 PLL: %d\n", ret);
+		return ret;
+	}
+
+	rt5682_dai_wclk = devm_clk_get(component->dev, "rt5682-dai-wclk");
+	if (IS_ERR(rt5682_dai_wclk))
+		return PTR_ERR(rt5682_dai_wclk);
+
+	rt5682_dai_bclk = devm_clk_get(component->dev, "rt5682-dai-bclk");
+	if (IS_ERR(rt5682_dai_bclk))
+		return PTR_ERR(rt5682_dai_bclk);
+
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    &cz_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(cz_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, &cz_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int rt5682_clk_enable(struct snd_pcm_substream *substream)
+{
+	int ret;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+
+	/*
+	 * Set wclk to 48000 because the rate constraint of this driver is
+	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
+	 * minimum of 64x the LRCLK sample rate." RT5682 is the only clk
+	 * source so for all codecs we have to limit bclk to 64X lrclk.
+	 */
+	clk_set_rate(rt5682_dai_wclk, 48000);
+	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
+	ret = clk_prepare_enable(rt5682_dai_wclk);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't enable wclk %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
+
+static void rt5682_clk_disable(void)
+{
+	clk_disable_unprepare(rt5682_dai_wclk);
+}
+
 static const unsigned int channels[] = {
 	DUAL_CHANNEL,
 };
@@ -260,6 +328,118 @@ static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
 	da7219_clk_disable();
 }
 
+static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->play_i2s_instance = I2S_SP_INSTANCE;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+	machine->capture_channel = CAP_CHANNEL1;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->play_i2s_instance = I2S_BT_INSTANCE;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->cap_i2s_instance = I2S_BT_INSTANCE;
+	return rt5682_clk_enable(substream);
+}
+
+static int cz_rt5682_dmic1_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	/*
+	 * On this platform for PCM device we support stereo
+	 */
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+	machine->capture_channel = CAP_CHANNEL0;
+	return rt5682_clk_enable(substream);
+}
+
+static void cz_rt5682_shutdown(struct snd_pcm_substream *substream)
+{
+	rt5682_clk_disable();
+}
+
 static const struct snd_soc_ops cz_da7219_play_ops = {
 	.startup = cz_da7219_play_startup,
 	.shutdown = cz_da7219_shutdown,
@@ -285,6 +465,31 @@ static const struct snd_soc_ops cz_dmic1_cap_ops = {
 	.shutdown = cz_da7219_shutdown,
 };
 
+static const struct snd_soc_ops cz_rt5682_play_ops = {
+	.startup = cz_rt5682_play_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_cap_ops = {
+	.startup = cz_rt5682_cap_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_max_play_ops = {
+	.startup = cz_rt5682_max_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_dmic0_cap_ops = {
+	.startup = cz_rt5682_dmic0_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
+static const struct snd_soc_ops cz_rt5682_dmic1_cap_ops = {
+	.startup = cz_rt5682_dmic1_startup,
+	.shutdown = cz_rt5682_shutdown,
+};
+
 SND_SOC_DAILINK_DEF(designware1,
 	DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.1.auto")));
 SND_SOC_DAILINK_DEF(designware2,
@@ -294,6 +499,8 @@ SND_SOC_DAILINK_DEF(designware3,
 
 SND_SOC_DAILINK_DEF(dlgs,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-DLGS7219:00", "da7219-hifi")));
+SND_SOC_DAILINK_DEF(rt5682,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 SND_SOC_DAILINK_DEF(mx,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
 SND_SOC_DAILINK_DEF(adau,
@@ -353,6 +560,57 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 	},
 };
 
+static struct snd_soc_dai_link cz_dai_5682_98357[] = {
+	{
+		.name = "amd-rt5682-play",
+		.stream_name = "Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.init = cz_rt5682_init,
+		.dpcm_playback = 1,
+		.ops = &cz_rt5682_play_ops,
+		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
+	},
+	{
+		.name = "amd-rt5682-cap",
+		.stream_name = "Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_capture = 1,
+		.ops = &cz_rt5682_cap_ops,
+		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
+	},
+	{
+		.name = "amd-max98357-play",
+		.stream_name = "HiFi Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_playback = 1,
+		.ops = &cz_rt5682_max_play_ops,
+		SND_SOC_DAILINK_REG(designware3, mx, platform),
+	},
+	{
+		/* C panel DMIC */
+		.name = "dmic0",
+		.stream_name = "DMIC0 Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_capture = 1,
+		.ops = &cz_rt5682_dmic0_cap_ops,
+		SND_SOC_DAILINK_REG(designware3, adau, platform),
+	},
+	{
+		/* A/B panel DMIC */
+		.name = "dmic1",
+		.stream_name = "DMIC1 Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_capture = 1,
+		.ops = &cz_rt5682_dmic1_cap_ops,
+		SND_SOC_DAILINK_REG(designware2, adau, platform),
+	},
+};
+
 static const struct snd_soc_dapm_widget cz_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
@@ -368,6 +626,14 @@ static const struct snd_soc_dapm_route cz_audio_route[] = {
 	{"PDM_DAT", NULL, "Int Mic"},
 };
 
+static const struct snd_soc_dapm_route cz_rt5682_audio_route[] = {
+	{"Headphones", NULL, "HPOL"},
+	{"Headphones", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"Speakers", NULL, "Speaker"},
+	{"PDM_DAT", NULL, "Int Mic"},
+};
+
 static const struct snd_kcontrol_new cz_mc_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
@@ -388,6 +654,28 @@ static struct snd_soc_card cz_card = {
 	.num_controls = ARRAY_SIZE(cz_mc_controls),
 };
 
+static struct snd_soc_card cz_rt5682_card = {
+	.name = "acpr5682m98357",
+	.owner = THIS_MODULE,
+	.dai_link = cz_dai_5682_98357,
+	.num_links = ARRAY_SIZE(cz_dai_5682_98357),
+	.dapm_widgets = cz_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(cz_widgets),
+	.dapm_routes = cz_rt5682_audio_route,
+	.controls = cz_mc_controls,
+	.num_controls = ARRAY_SIZE(cz_mc_controls),
+};
+
+void *soc_is_rltk_max(struct device *dev)
+{
+	const struct acpi_device_id *match;
+
+	match = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!match)
+		return NULL;
+	return (void *)match->driver_data;
+}
+
 static struct regulator_consumer_supply acp_da7219_supplies[] = {
 	REGULATOR_SUPPLY("VDD", "i2c-DLGS7219:00"),
 	REGULATOR_SUPPLY("VDDMIC", "i2c-DLGS7219:00"),
@@ -425,29 +713,39 @@ static int cz_probe(struct platform_device *pdev)
 	struct snd_soc_card *card;
 	struct acp_platform_info *machine;
 	struct regulator_dev *rdev;
-
-	acp_da7219_cfg.dev = &pdev->dev;
-	rdev = devm_regulator_register(&pdev->dev, &acp_da7219_desc,
-				       &acp_da7219_cfg);
-	if (IS_ERR(rdev)) {
-		dev_err(&pdev->dev, "Failed to register regulator: %d\n",
-			(int)PTR_ERR(rdev));
-		return -EINVAL;
+	struct device *dev = &pdev->dev;
+
+	card = (struct snd_soc_card *)soc_is_rltk_max(dev);
+	if (!card)
+		return -ENODEV;
+	if (!strcmp(card->name, "acpd7219m98357")) {
+		acp_da7219_cfg.dev = &pdev->dev;
+		rdev = devm_regulator_register(&pdev->dev, &acp_da7219_desc,
+					       &acp_da7219_cfg);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "Failed to register regulator: %d\n",
+				(int)PTR_ERR(rdev));
+			return -EINVAL;
+		}
 	}
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp_platform_info),
 			       GFP_KERNEL);
 	if (!machine)
 		return -ENOMEM;
-	card = &cz_card;
-	cz_card.dev = &pdev->dev;
+	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
-	ret = devm_snd_soc_register_card(&pdev->dev, &cz_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev,
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
-				cz_card.name, ret);
+				card->name, ret);
+		else
+			dev_dbg(&pdev->dev,
+				"devm_snd_soc_register_card(%s) probe deferred: %d\n",
+				card->name, ret);
 		return ret;
 	}
 	bt_uart_enable = !device_property_read_bool(&pdev->dev,
@@ -457,7 +755,8 @@ static int cz_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cz_audio_acpi_match[] = {
-	{ "AMD7219", 0 },
+	{ "AMD7219", (unsigned long)&cz_card },
+	{ "AMDI5682", (unsigned long)&cz_rt5682_card},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, cz_audio_acpi_match);
@@ -475,5 +774,6 @@ static struct platform_driver cz_pcm_driver = {
 module_platform_driver(cz_pcm_driver);
 
 MODULE_AUTHOR("akshu.agrawal@amd.com");
-MODULE_DESCRIPTION("DA7219 & MAX98357A audio support");
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("DA7219, RT5682 & MAX98357A audio support");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

