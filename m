Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47424352B3D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 16:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D060116B0;
	Fri,  2 Apr 2021 16:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D060116B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617372622;
	bh=pAe5ao4siIvO3aMdwIilotCqPSvP8N/dv8edS3Fyu4w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HD3aABUD2Pgw6o07QdtyaGmXn1bkcuxq9JN/FAYfIAmzL6DD6fEK31J3t+errKSxN
	 x3ZkW5lJ6Nax5zqDmkvv2lyu1ENlr6DdBm5XJAO//0gi5ClrR+5QgaN1GYuEc/vMM1
	 LJHqDi+H9LeJ/fHWOEf/NVQ7Z/GRmh0nzyLiuOCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD894F80423;
	Fri,  2 Apr 2021 16:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C13F6F80259; Fri,  2 Apr 2021 16:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38131F8016E
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 16:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38131F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="gTggCSRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617372479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZG8KiOPa/IuiUM1nVPwN33CDdNGX4bIYDrRRy/V77eY=;
 b=gTggCSRxC7/or373HMKW+yfV5/6u0yimkmHk3KisY1Kz+/M2qQK2Q4gHQHByICN0G8j66z
 YiK8e3dgunjWTrT6P7uODCHgVtTdQ264zqaLUBWe44x2voblacIWROvl+U4l7XRk4He0rF
 Bsvy9fXDCZ2UYoqgy/QY0HqedIgJIt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-e4LcWwLbMLeYMqVjnhR0YQ-1; Fri, 02 Apr 2021 10:07:57 -0400
X-MC-Unique: e4LcWwLbMLeYMqVjnhR0YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C7D0107ACCA;
 Fri,  2 Apr 2021 14:07:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-163.ams2.redhat.com
 [10.36.112.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDD0310023AC;
 Fri,  2 Apr 2021 14:07:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/6] ASoC: Intel: cht_bsw_rt5672: Add support for Bay Trail CR
 / SSP0
Date: Fri,  2 Apr 2021 16:07:44 +0200
Message-Id: <20210402140747.174716-4-hdegoede@redhat.com>
In-Reply-To: <20210402140747.174716-1-hdegoede@redhat.com>
References: <20210402140747.174716-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

The rt5672 codec is used on some Bay Trail CR boards, on these SoCs SSP2
is not available and SSP0 should be used instead. At support for this.

This has been tested on a Dell Venue 10 Pro 5055.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/cht_bsw_rt5672.c | 75 ++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 10c88ef2f85d..10d5ed20e4e8 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -21,6 +21,7 @@
 #include <sound/soc-acpi.h>
 #include "../../codecs/rt5670.h"
 #include "../atom/sst-atom-controls.h"
+#include "../common/soc-intel-quirks.h"
 
 
 /* The platform clock #3 outputs 19.2Mhz clock to codec as I2S MCLK */
@@ -31,6 +32,7 @@ struct cht_mc_private {
 	struct snd_soc_jack headset;
 	char codec_name[SND_ACPI_I2C_ID_LEN];
 	struct clk *mclk;
+	bool use_ssp0;
 };
 
 /* Headset jack detection DAPM pins */
@@ -121,16 +123,26 @@ static const struct snd_soc_dapm_route cht_audio_map[] = {
 	{"Ext Spk", NULL, "SPOLN"},
 	{"Ext Spk", NULL, "SPORP"},
 	{"Ext Spk", NULL, "SPORN"},
+	{"Headphone", NULL, "Platform Clock"},
+	{"Headset Mic", NULL, "Platform Clock"},
+	{"Int Mic", NULL, "Platform Clock"},
+	{"Ext Spk", NULL, "Platform Clock"},
+};
+
+static const struct snd_soc_dapm_route cht_audio_ssp0_map[] = {
+	{"AIF1 Playback", NULL, "ssp0 Tx"},
+	{"ssp0 Tx", NULL, "modem_out"},
+	{"modem_in", NULL, "ssp0 Rx"},
+	{"ssp0 Rx", NULL, "AIF1 Capture"},
+};
+
+static const struct snd_soc_dapm_route cht_audio_ssp2_map[] = {
 	{"AIF1 Playback", NULL, "ssp2 Tx"},
 	{"ssp2 Tx", NULL, "codec_out0"},
 	{"ssp2 Tx", NULL, "codec_out1"},
 	{"codec_in0", NULL, "ssp2 Rx"},
 	{"codec_in1", NULL, "ssp2 Rx"},
 	{"ssp2 Rx", NULL, "AIF1 Capture"},
-	{"Headphone", NULL, "Platform Clock"},
-	{"Headset Mic", NULL, "Platform Clock"},
-	{"Int Mic", NULL, "Platform Clock"},
-	{"Ext Spk", NULL, "Platform Clock"},
 };
 
 static const struct snd_kcontrol_new cht_mc_controls[] = {
@@ -197,6 +209,18 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 				| RT5670_AD_MONO_R_FILTER,
 				RT5670_CLK_SEL_I2S1_ASRC);
 
+	if (ctx->use_ssp0) {
+		ret = snd_soc_dapm_add_routes(&runtime->card->dapm,
+					      cht_audio_ssp0_map,
+					      ARRAY_SIZE(cht_audio_ssp0_map));
+	} else {
+		ret = snd_soc_dapm_add_routes(&runtime->card->dapm,
+					      cht_audio_ssp2_map,
+					      ARRAY_SIZE(cht_audio_ssp2_map));
+	}
+	if (ret)
+		return ret;
+
         ret = snd_soc_card_jack_new(runtime->card, "Headset",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2,
@@ -239,18 +263,26 @@ static int cht_codec_init(struct snd_soc_pcm_runtime *runtime)
 static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_pcm_hw_params *params)
 {
+	struct cht_mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
-	int ret;
+	int ret, bits;
 
 	/* The DSP will covert the FE rate to 48k, stereo, 24bits */
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
 
-	/* set SSP2 to 24-bit */
-	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+	if (ctx->use_ssp0) {
+		/* set SSP0 to 16-bit */
+		params_set_format(params, SNDRV_PCM_FORMAT_S16_LE);
+		bits = 16;
+	} else {
+		/* set SSP2 to 24-bit */
+		params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
+		bits = 24;
+	}
 
 	/*
 	 * The default mode for the cpu-dai is TDM 4 slot. The default mode
@@ -274,6 +306,12 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
+	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_cpu(rtd, 0), 0x3, 0x3, 2, bits);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set I2S config, err %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
@@ -414,6 +452,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	bool sof_parent;
+	int dai_index = 0;
 	int i;
 
 	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
@@ -422,19 +461,27 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 
 	strcpy(drv->codec_name, RT5672_I2C_DEFAULT);
 
+	/* find index of codec dai */
+	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {
+		if (!strcmp(cht_dailink[i].codecs->name, RT5672_I2C_DEFAULT)) {
+			dai_index = i;
+			break;
+		}
+	}
+
 	/* fixup codec name based on HID */
 	adev = acpi_dev_get_first_match_dev(mach->id, NULL, -1);
 	if (adev) {
 		snprintf(drv->codec_name, sizeof(drv->codec_name),
 			 "i2c-%s", acpi_dev_name(adev));
 		put_device(&adev->dev);
-		for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {
-			if (!strcmp(cht_dailink[i].codecs->name,
-				    RT5672_I2C_DEFAULT)) {
-				cht_dailink[i].codecs->name = drv->codec_name;
-				break;
-			}
-		}
+		cht_dailink[dai_index].codecs->name = drv->codec_name;
+	}
+
+	/* Use SSP0 on Bay Trail CR devices */
+	if (soc_intel_is_byt() && mach->mach_params.acpi_ipc_irq_index == 0) {
+		cht_dailink[dai_index].cpus->dai_name = "ssp0-port";
+		drv->use_ssp0 = true;
 	}
 
 	/* override plaform name, if required */
-- 
2.30.2

