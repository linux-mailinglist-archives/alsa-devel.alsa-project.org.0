Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4D1609CA
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 06:07:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 025F23E;
	Mon, 17 Feb 2020 06:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 025F23E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581916055;
	bh=b1Uffa0r/cnJE+jlY6gZJToJlTW2RV4zv9dS6HhcPcQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UV9LcCK7PFBhZnWhvkJI411gdu0DQQGHA0DV2S9webWvwbvMQDUmNTCMEp2Np51P4
	 iTMcMpzhxpCQD1rgNNNATDQUBVhrH7Cciz62WRyrxDSOpaR76YL+dSG7RnCANQBd9U
	 YFOBQoFGTuayLgjDPFkQS3IJufihUkviiBWX0qso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13788F80096;
	Mon, 17 Feb 2020 06:05:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36F85F80172; Mon, 17 Feb 2020 06:05:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C801F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 06:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C801F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="PTkKASjj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6/yzWW+xSgqpcNn0jaCPGPGWBYbITDszF4gzSOV7JomlGhbTmSYBi8uaBDsV4OQg2qnb3dgKJ0tQMpQJryWY6YjGdU1CwHX/Z55/eWzU8I7bFQaCDXD+P6tPRj058gGDESVzij2JZGqL5+UdRLjyL7M/JOy9K6RPVZj7r/xSme3mHFGU5EMLjBNWE+FAV0WilkNcI2LR0FDyI8JjPu2NHrXTpLPPY9bFnp3El10pbnSm9x5Kl6v2CK89v1j1S5nykv9evSs2SMWHD7xK6cf2PoN4CyN4L+jQyIJWqhwWMJYNOJiwMpC2VZB6eaEhKyBWY/eOlj3nDC95pMGhIav9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWTuDSNktA9MV3qSi6GCej+KSbGw6FWdcoy6A01LNsY=;
 b=niHuGeRDUBXkTmq7l0cTAJyq+CEgMN2d/s+oH+b2cshQRXa25WkMCIq63/RFd7m9JaZ+Ymy0haWTA938KYhb+YYxLGhxt6AYgJArxxkSn1umc1KLVW/N0NDfOGHfh6N61FSCEB+HS954LBBMo6puOx5vjZtbjpR8RYcuDfoMNe552bM5xdSaB49rWx/URpOTNMhdm08yiUsvRRDxWnhCrMzSL3CJ/MFmoQw2DrDDF0mTgJo5gUmDqv19fgq9Gv2FV71O8zLcqeqAljOxslJp3dybqJYlm8zAITZmGwO75CRUjxl7/ZeeTLRAJR+KKNLDutwQCaXbfex2YAGbCWgfkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWTuDSNktA9MV3qSi6GCej+KSbGw6FWdcoy6A01LNsY=;
 b=PTkKASjjUAs9HjV9R7KrqQUgGWtxhEU8/YZsE6zCf3UsYbPq9muMPw86v0L+QpQ4Oe/YcF0GSI1TXvqmg/XAPwxvjibKqGzE94Cry4z4wuIZqhZ0u4NPHVEdVZBHHUi1vEe8OBUJrgQLTbxMTc4GOoK4CtcywN4Awzuf3+fy4zY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB3693.namprd12.prod.outlook.com (10.255.86.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Mon, 17 Feb 2020 05:05:44 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::11fb:70af:b3dd:203d]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::11fb:70af:b3dd:203d%6]) with mapi id 15.20.2729.028; Mon, 17 Feb 2020
 05:05:44 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Date: Mon, 17 Feb 2020 10:35:01 +0530
Message-Id: <20200217050515.3847-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: MAXPR0101CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:e::18) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MAXPR0101CA0056.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Mon, 17 Feb 2020 05:05:41 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 52620d1a-b810-4aa1-b04c-08d7b3670a8f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3693:|MN2PR12MB3693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3693FBF191B4C386E336ACE5F8160@MN2PR12MB3693.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:59;
X-Forefront-PRVS: 0316567485
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(199004)(189003)(316002)(52116002)(956004)(2616005)(2906002)(8936002)(7696005)(66556008)(54906003)(6666004)(66946007)(36756003)(1076003)(66476007)(6486002)(4326008)(186003)(81166006)(109986005)(81156014)(478600001)(26005)(5660300002)(30864003)(44832011)(86362001)(16526019)(8676002)(966005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3693;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FQ9FlafgaIUM4yg3JoDslSgdkPFRFxHdDZ3RWjD3O/+EyJgDAHGYysaDK9caAbhsw7fUa8/jzY01+CjtsO/l14cDmXj7rZZxv5klaUFkUkIWIYooRUmw2R1GBDIBtJ0hKNi+z4Akl/1dVqxLrHRYfJVQjI9OqdhAjtEheCvwRH5xEmz7sIN3iNh37V+hWy4+qJHXKzvcw62iUuthT5ShuryHzvewHVZNZ5OCVd7cEDGJcegQry8ANw+gVbPGJXSprqiwLMizdrFw79fBssK1VR1L7BduQltyclE4bx2jwriQKL9kZ8o05GRGFuUp25yDhFQVEhnKMgf45jJhg+BHWA+woLSs8Z20yoo4mKA5UlGwArXKy6Ksvd6Tdc5XANfA22IIVie22s9BvmVqzHcTpsDfyFsv1rJMdL+sqUafj5ZesrShMD9knSd2OXjn61Zmc9dXkYaKjNpf9NT2t2kmz5s+f+M3Yno23eas34abX5NZ9m8TOdunUo/JPCqpNleUtvcp+ThdUyqYw/a7cvo4J36ENVwL6oviUiqRSaoZCnNJsz//K66Jzhi7EMLBAYtU
X-MS-Exchange-AntiSpam-MessageData: AThLov0UewaIB5McwFfhnW/notauixzLU+7CeXD4sT8i67WtP6N4lENPCZmdWPt8RPdtl4Vk4e9/9Ki0fSs7u/BftXm7rfZ5RfXXRPnyT1mMQiWlOTFiEfEHLeuHDI9skPVV8XftKzoexdgnXmraxQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52620d1a-b810-4aa1-b04c-08d7b3670a8f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2020 05:05:44.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAwntgdhhT+AsL6SFB7E479GmEpn1dU+66eHGJyIhfm11ueWGCH2uxF/LSsXDh/OyH1Owgh8sYJlaMjiQ1MAxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3693
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 akshu.agrawal@amd.com, open list <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: amd: Add machine driver for Raven based
	platform
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add machine driver for Raven based platform using
RT5682 + MAX9836 + CROS_EC codecs

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
This patch is dependent on https://patchwork.kernel.org/patch/11381839/

 sound/soc/amd/Kconfig                |  10 +
 sound/soc/amd/Makefile               |   2 +
 sound/soc/amd/acp3x-rt5682-max9836.c | 334 +++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)
 create mode 100644 sound/soc/amd/acp3x-rt5682-max9836.c

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 5f40517717c4..b29ef1373946 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -26,3 +26,13 @@ config SND_SOC_AMD_ACP3x
 	depends on X86 && PCI
 	help
 	 This option enables ACP v3.x I2S support on AMD platform
+
+config SND_SOC_AMD_RV_RT5682_MACH
+	tristate "AMD RV support for RT5682"
+	select SND_SOC_RT5682
+	select SND_SOC_MAX98357A
+	select SND_SOC_CROS_EC_CODEC
+	select I2C_CROS_EC_TUNNEL
+	depends on SND_SOC_AMD_ACP3x && I2C
+	help
+	 This option enables machine driver for RT5682 and MAX9835.
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index c4ddc6adb6f0..e6f3d9b469f3 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -2,8 +2,10 @@
 acp_audio_dma-objs := acp-pcm-dma.o
 snd-soc-acp-da7219mx98357-mach-objs := acp-da7219-max98357a.o
 snd-soc-acp-rt5645-mach-objs := acp-rt5645.o
+snd-soc-acp-rt5682-mach-objs := acp3x-rt5682-max9836.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP) += acp_audio_dma.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mach.o
 obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
+obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
new file mode 100644
index 000000000000..96fbcd29e3ed
--- /dev/null
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -0,0 +1,334 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec.
+//
+//Copyright 2016 Advanced Micro Devices, Inc.
+
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include <sound/jack.h>
+#include <linux/clk.h>
+#include <linux/gpio.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/acpi.h>
+
+#include "raven/acp3x.h"
+#include "../codecs/rt5682.h"
+
+#define PCO_PLAT_CLK 48000000
+#define RT5682_PLL_FREQ (48000 * 512)
+#define DUAL_CHANNEL		2
+
+static struct snd_soc_jack pco_jack;
+static struct clk *rt5682_dai_wclk;
+static struct clk *rt5682_dai_bclk;
+
+static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_component *component = codec_dai->component;
+
+	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
+
+	/* set rt5682 dai fmt */
+	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S
+			| SND_SOC_DAIFMT_NB_NF
+			| SND_SOC_DAIFMT_CBM_CFM);
+	if (ret < 0) {
+		dev_err(rtd->card->dev,
+				"Failed to set rt5682 dai fmt: %d\n", ret);
+		return ret;
+	}
+
+	/* set codec PLL */
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682_PLL2, RT5682_PLL2_S_MCLK,
+				  PCO_PLAT_CLK, RT5682_PLL_FREQ);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set rt5682 PLL: %d\n", ret);
+		return ret;
+	}
+
+	/* Set codec sysclk */
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL2,
+			RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev,
+			"Failed to set rt5682 SYSCLK: %d\n", ret);
+		return ret;
+	}
+
+	/* Set tdm/i2s1 master bclk ratio */
+	ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+	if (ret < 0) {
+		dev_err(rtd->dev,
+			"Failed to set rt5682 tdm bclk ratio: %d\n", ret);
+		return ret;
+	}
+
+	rt5682_dai_wclk = clk_get(component->dev, "rt5682-dai-wclk");
+	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
+
+	ret = snd_soc_card_jack_new(card, "Headset Jack",
+				SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				&pco_jack, NULL, 0);
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int rt5682_clk_enable(struct snd_pcm_substream *substream)
+{
+	int ret = 0;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+
+	/* RT5682 will support only 48K output with 48M mclk */
+	clk_set_rate(rt5682_dai_wclk, 48000);
+	clk_set_rate(rt5682_dai_bclk, 48000 * 64);
+	ret = clk_prepare_enable(rt5682_dai_wclk);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't enable wclk %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static void rt5682_clk_disable(void)
+{
+	clk_disable_unprepare(rt5682_dai_wclk);
+}
+
+static const unsigned int channels[] = {
+	DUAL_CHANNEL,
+};
+
+static const unsigned int rates[] = {
+	48000,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_rates = {
+	.count = ARRAY_SIZE(rates),
+	.list  = rates,
+	.mask = 0,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_channels = {
+	.count = ARRAY_SIZE(channels),
+	.list = channels,
+	.mask = 0,
+};
+
+static int acp3x_5682_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->play_i2s_instance = I2S_SP_INSTANCE;
+	machine->cap_i2s_instance = I2S_SP_INSTANCE;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+	return rt5682_clk_enable(substream);
+}
+
+static int acp3x_max_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->play_i2s_instance = I2S_BT_INSTANCE;
+
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &constraints_rates);
+	return rt5682_clk_enable(substream);
+}
+
+static int acp3x_ec_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
+
+	machine->cap_i2s_instance = I2S_BT_INSTANCE;
+	snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+
+	return rt5682_clk_enable(substream);
+}
+
+static void rt5682_shutdown(struct snd_pcm_substream *substream)
+{
+	rt5682_clk_disable();
+}
+
+static const struct snd_soc_ops acp3x_5682_ops = {
+	.startup = acp3x_5682_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+static const struct snd_soc_ops acp3x_max_play_ops = {
+	.startup = acp3x_max_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+static const struct snd_soc_ops acp3x_ec_cap_ops = {
+	.startup = acp3x_ec_startup,
+	.shutdown = rt5682_shutdown,
+};
+
+SND_SOC_DAILINK_DEF(acp3x_i2s,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp3x_i2s_playcap.0")));
+SND_SOC_DAILINK_DEF(acp3x_bt,
+	DAILINK_COMP_ARRAY(COMP_CPU("acp3x_i2s_playcap.2")));
+
+SND_SOC_DAILINK_DEF(rt5682,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
+SND_SOC_DAILINK_DEF(max,
+	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
+SND_SOC_DAILINK_DEF(cros_ec,
+	DAILINK_COMP_ARRAY(COMP_CODEC("GOOG0013:00", "EC Codec I2S RX")));
+
+SND_SOC_DAILINK_DEF(platform,
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("acp3x_rv_i2s_dma.0")));
+
+static struct snd_soc_dai_link acp3x_dai_5682_98357[] = {
+	{
+		.name = "acp3x-5682-play",
+		.stream_name = "Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.init = acp3x_5682_init,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		.ops = &acp3x_5682_ops,
+		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
+	},
+	{
+		.name = "acp3x-max98357-play",
+		.stream_name = "HiFi Playback",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBM_CFM,
+		.dpcm_playback = 1,
+		.ops = &acp3x_max_play_ops,
+		SND_SOC_DAILINK_REG(acp3x_bt, max, platform),
+	},
+	{
+		.name = "acp3x-ec-capture",
+		.stream_name = "Capture",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		.ops = &acp3x_ec_cap_ops,
+		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
+	},
+};
+
+static const struct snd_soc_dapm_widget acp3x_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_SPK("Spk", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route acp3x_audio_route[] = {
+	{"Headphone Jack", NULL, "HPOL"},
+	{"Headphone Jack", NULL, "HPOR"},
+	{"IN1P", NULL, "Headset Mic"},
+	{"Spk", NULL, "Speaker"},
+};
+
+static const struct snd_kcontrol_new acp3x_mc_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Spk"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_card acp3x_card = {
+	.name = "acp3xalc5682m98357",
+	.owner = THIS_MODULE,
+	.dai_link = acp3x_dai_5682_98357,
+	.num_links = ARRAY_SIZE(acp3x_dai_5682_98357),
+	.dapm_widgets = acp3x_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(acp3x_widgets),
+	.dapm_routes = acp3x_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(acp3x_audio_route),
+	.controls = acp3x_mc_controls,
+	.num_controls = ARRAY_SIZE(acp3x_mc_controls),
+};
+
+static int acp3x_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *machine;
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(*machine), GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	card = &acp3x_card;
+	acp3x_card.dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_card);
+	if (ret) {
+		dev_err(&pdev->dev,
+				"devm_snd_soc_register_card(%s) failed: %d\n",
+				acp3x_card.name, ret);
+		return ret;
+	}
+	return 0;
+}
+
+static const struct acpi_device_id acp3x_audio_acpi_match[] = {
+	{ "AMDI5682", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
+
+static struct platform_driver acp3x_audio = {
+	.driver = {
+		.name = "acp3x-alc5682-max98357",
+		.acpi_match_table = ACPI_PTR(acp3x_audio_acpi_match),
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = acp3x_probe,
+};
+
+module_platform_driver(acp3x_audio);
+
+MODULE_AUTHOR("akshu.agrawal@amd.com");
+MODULE_DESCRIPTION("ALC5682 & MAX98357 audio support");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
