Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB9272A63
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 17:41:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5FD16D5;
	Mon, 21 Sep 2020 17:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5FD16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600702863;
	bh=A9rrwX8m3rjmT3UoV8LpHEzO/R+7fC7ArmZnN1Na9jg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBWj+zkk7mYRoNg0weLbkDjxHR0HYSUbplfEA2zN4e3Yzy7WRSPaGkrKmMwV8huCE
	 CCw3P7pGoSYwjYdVRQSHomcoIYAxjtjnFw9dAQPTmx02y7Fd5/p6Skv6Ez8P/k8SsY
	 i9NIdpMLF14P+FDUnQcFDOCMwnFIqfzdU8oyOkq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 125E4F8028D;
	Mon, 21 Sep 2020 17:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B215F80171; Mon, 21 Sep 2020 17:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B49DF80161
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 17:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B49DF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FmoNGwzh"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08LFcQXS019657;
 Mon, 21 Sep 2020 10:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600702706;
 bh=WPzzTvm3Gpm9FyUBJ5mqjKeyBuFDmSHo/ooDo7Lm7is=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=FmoNGwzhoW+o/vdmTutHFfGFiDUlLt2Cjpx+XkbDqtUO95cLZB0C22379O/Dmelwu
 hWSj7Z1+tV5EtCRSoRzvxuZP7mlNMZkBzJndrOPO6h+ClR1K0Kvx2UtyvPu+HtUP7R
 5f5xcoS0y4lWdPA2vesj718lLwdakeAnMRfpF2Ts=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08LFcQBg116322;
 Mon, 21 Sep 2020 10:38:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 21
 Sep 2020 10:38:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 21 Sep 2020 10:38:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08LFcQXx074505;
 Mon, 21 Sep 2020 10:38:26 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 2/2] ASoC: tas2562: Add the TAS2110 class-D amplifier
Date: Mon, 21 Sep 2020 10:38:20 -0500
Message-ID: <20200921153820.18357-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200921153820.18357-1-dmurphy@ti.com>
References: <20200921153820.18357-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Add the TAS2110 amplifier to the TAS2562 driver. The TAS2110 is register
and bitmap compatible. The chips differ in that the TAS2110 does not
have the I/V Sense feedback path. Since these features do not exist the
device needs to be registered without these controls.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

This patchset is based on top of patchset https://lore.kernel.org/patchwork/project/lkml/list/?series=463709

 sound/soc/codecs/tas2562.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 56d410141ee0..da820e8d59a1 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -53,12 +53,14 @@ struct tas2562_data {
 	int v_sense_slot;
 	int i_sense_slot;
 	int volume_lvl;
+	int model_id;
 };
 
 enum tas256x_model {
 	TAS2562,
 	TAS2563,
 	TAS2564,
+	TAS2110,
 };
 
 static int tas2562_set_bias_level(struct snd_soc_component *component,
@@ -569,6 +571,40 @@ static const struct snd_kcontrol_new tas2562_snd_controls[] = {
 	},
 };
 
+static const struct snd_soc_dapm_widget tas2110_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2562_asi1_mux),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2562_dac_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route tas2110_audio_map[] = {
+	{"ASI1 Sel", "I2C offset", "ASI1"},
+	{"ASI1 Sel", "Left", "ASI1"},
+	{"ASI1 Sel", "Right", "ASI1"},
+	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
+	{ "DAC", NULL, "ASI1 Sel" },
+	{ "OUT", NULL, "DAC" },
+};
+
+static const struct snd_soc_component_driver soc_component_dev_tas2110 = {
+	.probe			= tas2562_codec_probe,
+	.suspend		= tas2562_suspend,
+	.resume			= tas2562_resume,
+	.set_bias_level		= tas2562_set_bias_level,
+	.controls		= tas2562_snd_controls,
+	.num_controls		= ARRAY_SIZE(tas2562_snd_controls),
+	.dapm_widgets		= tas2110_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tas2110_dapm_widgets),
+	.dapm_routes		= tas2110_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tas2110_audio_map),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
 static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2562_asi1_mux),
@@ -703,6 +739,9 @@ static int tas2562_parse_dt(struct tas2562_data *tas2562)
 		tas2562->sdz_gpio = NULL;
 	}
 
+	if (tas2562->model_id == TAS2110)
+		return ret;
+
 	ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
 			&tas2562->i_sense_slot);
 	if (ret) {
@@ -741,6 +780,7 @@ static int tas2562_probe(struct i2c_client *client,
 
 	data->client = client;
 	data->dev = &client->dev;
+	data->model_id = id->driver_data;
 
 	tas2562_parse_dt(data);
 
@@ -753,6 +793,12 @@ static int tas2562_probe(struct i2c_client *client,
 
 	dev_set_drvdata(&client->dev, data);
 
+	if (data->model_id == TAS2110)
+		return devm_snd_soc_register_component(dev,
+						       &soc_component_dev_tas2110,
+						       tas2562_dai,
+						       ARRAY_SIZE(tas2562_dai));
+
 	return devm_snd_soc_register_component(dev, &soc_component_dev_tas2562,
 					       tas2562_dai,
 					       ARRAY_SIZE(tas2562_dai));
@@ -763,6 +809,7 @@ static const struct i2c_device_id tas2562_id[] = {
 	{ "tas2562", TAS2562 },
 	{ "tas2563", TAS2563 },
 	{ "tas2564", TAS2564 },
+	{ "tas2110", TAS2110 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2562_id);
@@ -771,6 +818,7 @@ static const struct of_device_id tas2562_of_match[] = {
 	{ .compatible = "ti,tas2562", },
 	{ .compatible = "ti,tas2563", },
 	{ .compatible = "ti,tas2564", },
+	{ .compatible = "ti,tas2110", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tas2562_of_match);
-- 
2.28.0

