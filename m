Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A04520A5AB
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:22:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC4B1ADA;
	Thu, 25 Jun 2020 21:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC4B1ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112933;
	bh=0B09WaXVimNGu162vQylHoPmEvk9VBACdOYMW+18ip4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MF+3iM+1Xy3FPvT0RBLMf+M4nSPjZ5C4pONmK2vLoFSkXf2aFxtPMmN32sLboGUdV
	 YXpLekI/eXuPkfv4DmzkvcBKWvKmryQ2TQnh9HIkP8CQb0ec9DfRrey++bHjkhEl4g
	 utMnQNFpW4jK7OvICxbzFS3nYlqx5z+KCsoyaVnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA6A6F80336;
	Thu, 25 Jun 2020 21:14:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 542F3F802E7; Thu, 25 Jun 2020 21:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54F73F802C2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54F73F802C2
IronPort-SDR: oQ9lZX1qHOFju1MwLnNQ9r0c1Iq5lO2sZ1FPRhbiI9HcpSXwbdTsHyW3M/EGONZYQnb8fOWTHx
 sqHyArFLKo4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120839"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:41 -0700
IronPort-SDR: jzO6g8Adz1JZsHjXV83aAmaNSaMtwm1Ah3L2CiKy7uxnJxEFdVFbsKoVwIy+guKtAWaVEmW4iV
 Fz+NZeE7ACRA==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559528"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/17] ASoC: Intel: Boards: cml_rt1011_rt5682: use statically
 define codec config
Date: Thu, 25 Jun 2020 14:13:02 -0500
Message-Id: <20200625191308.3322-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

When the cml_rt1011_rt5682_dailink[].codecs pointer is overridden by
a quirk with a devm allocated structure and the probe is deferred,
in the next probe we will see an use-after-free condition
(verified with KASAN). This can be avoided by using statically allocated
configurations - which simplifies the code quite a bit as well.

KASAN issue fixed.
[   23.301373] cml_rt1011_rt5682 cml_rt1011_rt5682: sof_rt1011_quirk = f
[   23.301875] ==================================================================
[   23.302018] BUG: KASAN: use-after-free in snd_cml_rt1011_probe+0x23a/0x3d0 [snd_soc_cml_rt1011_rt5682]
[   23.302178] Read of size 8 at addr ffff8881ec6acae0 by task kworker/0:2/105
[   23.302320] CPU: 0 PID: 105 Comm: kworker/0:2 Not tainted 5.7.0-rc7-test+ #3
[   23.302322] Hardware name: Google Helios/Helios, BIOS  01/21/2020
[   23.302329] Workqueue: events deferred_probe_work_func
[   23.302331] Call Trace:
[   23.302339]  dump_stack+0x76/0xa0
[   23.302345]  print_address_description.constprop.0.cold+0xd3/0x43e
[   23.302351]  ? _raw_spin_lock_irqsave+0x7b/0xd0
[   23.302355]  ? _raw_spin_trylock_bh+0xf0/0xf0
[   23.302362]  ? snd_cml_rt1011_probe+0x23a/0x3d0 [snd_soc_cml_rt1011_rt5682]
[   23.302365]  __kasan_report.cold+0x37/0x86
[   23.302371]  ? snd_cml_rt1011_probe+0x23a/0x3d0 [snd_soc_cml_rt1011_rt5682]
[   23.302375]  kasan_report+0x38/0x50
[   23.302382]  snd_cml_rt1011_probe+0x23a/0x3d0 [snd_soc_cml_rt1011_rt5682]
[   23.302389]  platform_drv_probe+0x66/0xc0

Fixes: 629ba12e9998 ("ASoC: Intel: boards: split woofer and tweeter support")
Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 83 ++++++----------------
 1 file changed, 23 insertions(+), 60 deletions(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 4ad6a3acf887..d29b4a8ff70d 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -34,7 +34,6 @@
 #define SOF_RT1011_SPEAKER_WR		BIT(1)
 #define SOF_RT1011_SPEAKER_TL		BIT(2)
 #define SOF_RT1011_SPEAKER_TR		BIT(3)
-#define SPK_CH 4
 
 /* Default: Woofer speakers  */
 static unsigned long sof_rt1011_quirk = SOF_RT1011_SPEAKER_WL |
@@ -383,10 +382,17 @@ SND_SOC_DAILINK_DEF(ssp0_codec,
 
 SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
-SND_SOC_DAILINK_DEF(ssp1_codec,
+SND_SOC_DAILINK_DEF(ssp1_codec_2spk,
 	DAILINK_COMP_ARRAY(
 	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
 	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI)));
+SND_SOC_DAILINK_DEF(ssp1_codec_4spk,
+	DAILINK_COMP_ARRAY(
+	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
+	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI),
+	/* TL */ COMP_CODEC("i2c-10EC1011:02", CML_RT1011_CODEC_DAI),
+	/* TR */ COMP_CODEC("i2c-10EC1011:03", CML_RT1011_CODEC_DAI)));
+
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
@@ -483,7 +489,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.no_pcm = 1,
 		.init = cml_rt1011_spk_init,
 		.ops = &cml_rt1011_ops,
-		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
+		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec_2spk, platform),
 	},
 };
 
@@ -496,6 +502,15 @@ static struct snd_soc_codec_conf rt1011_conf[] = {
 		.dlc = COMP_CODEC_CONF("i2c-10EC1011:01"),
 		.name_prefix = "WR",
 	},
+	/* single configuration structure for 2 and 4 channels */
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1011:02"),
+		.name_prefix = "TL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("i2c-10EC1011:03"),
+		.name_prefix = "TR",
+	},
 };
 
 /* Cometlake audio machine driver for RT1011 and RT5682 */
@@ -518,8 +533,6 @@ static struct snd_soc_card snd_soc_card_cml = {
 
 static int snd_cml_rt1011_probe(struct platform_device *pdev)
 {
-	struct snd_soc_dai_link_component *rt1011_dais_components;
-	struct snd_soc_codec_conf *rt1011_dais_confs;
 	struct card_private *ctx;
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
@@ -538,65 +551,15 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
 
+	/* when 4 speaker is available, update codec config */
 	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
 				SOF_RT1011_SPEAKER_TR)) {
-		rt1011_dais_confs = devm_kzalloc(&pdev->dev,
-					sizeof(struct snd_soc_codec_conf) *
-					SPK_CH, GFP_KERNEL);
-
-		if (!rt1011_dais_confs)
-			return -ENOMEM;
-
-		rt1011_dais_components = devm_kzalloc(&pdev->dev,
-					sizeof(struct snd_soc_dai_link_component) *
-					SPK_CH, GFP_KERNEL);
-
-		if (!rt1011_dais_components)
-			return -ENOMEM;
-
-		for (i = 0; i < SPK_CH; i++) {
-			rt1011_dais_confs[i].dlc.name = devm_kasprintf(&pdev->dev,
-								GFP_KERNEL,
-								"i2c-10EC1011:0%d",
-								i);
-
-			if (!rt1011_dais_confs[i].dlc.name)
-				return -ENOMEM;
-
-			switch (i) {
-			case 0:
-				rt1011_dais_confs[i].name_prefix = "WL";
-				break;
-			case 1:
-				rt1011_dais_confs[i].name_prefix = "WR";
-				break;
-			case 2:
-				rt1011_dais_confs[i].name_prefix = "TL";
-				break;
-			case 3:
-				rt1011_dais_confs[i].name_prefix = "TR";
-				break;
-			default:
-				return -EINVAL;
-			}
-			rt1011_dais_components[i].name = devm_kasprintf(&pdev->dev,
-								GFP_KERNEL,
-								"i2c-10EC1011:0%d",
-								i);
-			if (!rt1011_dais_components[i].name)
-				return -ENOMEM;
-
-			rt1011_dais_components[i].dai_name = CML_RT1011_CODEC_DAI;
-		}
-
-		snd_soc_card_cml.codec_conf = rt1011_dais_confs;
-		snd_soc_card_cml.num_configs = SPK_CH;
-
 		for (i = 0; i < ARRAY_SIZE(cml_rt1011_rt5682_dailink); i++) {
 			if (!strcmp(cml_rt1011_rt5682_dailink[i].codecs->dai_name,
-					CML_RT1011_CODEC_DAI)) {
-				cml_rt1011_rt5682_dailink[i].codecs = rt1011_dais_components;
-				cml_rt1011_rt5682_dailink[i].num_codecs = SPK_CH;
+				    CML_RT1011_CODEC_DAI)) {
+				cml_rt1011_rt5682_dailink[i].codecs = ssp1_codec_4spk;
+				cml_rt1011_rt5682_dailink[i].num_codecs =
+						ARRAY_SIZE(ssp1_codec_4spk);
 			}
 		}
 	}
-- 
2.20.1

