Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE084F3CB1
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 18:59:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4E11863;
	Tue,  5 Apr 2022 18:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4E11863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649177965;
	bh=TKj/Gdf3upOujc9HOwY9/yVgEBOdEJpY7NOsYt4MUt0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ppXR2d3vRgSNRdfDAzGDfHYFjCl5jOCT4q0uZhC80RplpB28c/Aix2CfDrxXqIySn
	 LULMHjsg4BeszF3DOpMUhw7618/4TaB6z/Cpy7fwyunFRriYDgx2GyHg2gwBsE9II3
	 tlu9mpYABjdeTW8BqfXYax4mll4KHR0FEhmMOCRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06D4BF80516;
	Tue,  5 Apr 2022 18:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3724FF8016B; Tue,  5 Apr 2022 18:57:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25060F8016A
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 18:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25060F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sLjhPxKB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3385EB81B14;
 Tue,  5 Apr 2022 16:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B99C385A1;
 Tue,  5 Apr 2022 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649177866;
 bh=TKj/Gdf3upOujc9HOwY9/yVgEBOdEJpY7NOsYt4MUt0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLjhPxKBSrpwXS5A8EWIIkEak001fUnpZol7Yuk6pHxjC+lRXq/aT1HSu+2Di5ICa
 OQ+7e+yMEXVdVtBMaHZfWOxrefF1fJ/Q+4DWRfT10DZdwQeb0lGxfvH8U9BuHT0b0K
 R92RQ//OsY4L5MM1nv4aeIxBerZ0OKBGmbk69yHjbfZAVFDxWR+BKIIPWFPnmUPCG6
 kDqNmZhTdlsAbqwQ9y2CQVTBbCfYA/JGuI+/083okepz6UcZCkySf36XBlxlOedyzy
 tatiOSITnJV4Q/h1mBT8oJmONJgctog+CC1z4a9m5uuK6YTBG6yc4owenwoh91Mu0P
 8GrQzujSWGXsg==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nbmUx-002uYS-EY; Tue, 05 Apr 2022 18:57:43 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/3] ASoC: Intel: sof_es8336: support a separate gpio to
 control headphone
Date: Tue,  5 Apr 2022 18:57:33 +0200
Message-Id: <535454c0c598a8454487fe29b164527370e2db81.1649177516.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649177516.git.mchehab@kernel.org>
References: <cover.1649177516.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Some devices may use both gpio0 and gpio1 to independently switch
the speaker and the headphone.

Add support for that.

Acked-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v3 0/3] at: https://lore.kernel.org/all/cover.1649177516.git.mchehab@kernel.org/

 sound/soc/intel/boards/sof_es8336.c | 59 ++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index e4829a376b79..d15a58666cc6 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -30,6 +30,7 @@
 #define SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK	BIT(4)
 #define SOF_ES8336_ENABLE_DMIC			BIT(5)
 #define SOF_ES8336_JD_INVERTED			BIT(6)
+#define SOF_ES8336_HEADPHONE_GPIO		BIT(7)
 
 static unsigned long quirk;
 
@@ -39,7 +40,7 @@ MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
 struct sof_es8336_private {
 	struct device *codec_dev;
-	struct gpio_desc *gpio_speakers;
+	struct gpio_desc *gpio_speakers, *gpio_headphone;
 	struct snd_soc_jack jack;
 	struct list_head hdmi_pcm_list;
 	bool speaker_en;
@@ -51,15 +52,27 @@ struct sof_hdmi_pcm {
 	int device;
 };
 
-static const struct acpi_gpio_params speakers_enable_gpio0 = { 0, 0, true };
+static const struct acpi_gpio_params enable_gpio0 = { 0, 0, true };
+static const struct acpi_gpio_params enable_gpio1 = { 1, 0, true };
+
 static const struct acpi_gpio_mapping acpi_speakers_enable_gpio0[] = {
-	{ "speakers-enable-gpios", &speakers_enable_gpio0, 1 },
+	{ "speakers-enable-gpios", &enable_gpio0, 1 },
 	{ }
 };
 
-static const struct acpi_gpio_params speakers_enable_gpio1 = { 1, 0, true };
 static const struct acpi_gpio_mapping acpi_speakers_enable_gpio1[] = {
-	{ "speakers-enable-gpios", &speakers_enable_gpio1, 1 },
+	{ "speakers-enable-gpios", &enable_gpio1, 1 },
+};
+
+static const struct acpi_gpio_mapping acpi_enable_both_gpios[] = {
+	{ "speakers-enable-gpios", &enable_gpio0, 1 },
+	{ "headphone-enable-gpios", &enable_gpio1, 1 },
+	{ }
+};
+
+static const struct acpi_gpio_mapping acpi_enable_both_gpios_rev_order[] = {
+	{ "speakers-enable-gpios", &enable_gpio1, 1 },
+	{ "headphone-enable-gpios", &enable_gpio0, 1 },
 	{ }
 };
 
@@ -73,6 +86,8 @@ static void log_quirks(struct device *dev)
 		dev_info(dev, "quirk DMIC enabled\n");
 	if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
 		dev_info(dev, "Speakers GPIO1 quirk enabled\n");
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO)
+		dev_info(dev, "quirk headphone GPIO enabled\n");
 	if (quirk & SOF_ES8336_JD_INVERTED)
 		dev_info(dev, "quirk JD inverted enabled\n");
 }
@@ -83,13 +98,24 @@ static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_card *card = w->dapm->card;
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
 
+	if (priv->speaker_en == !SND_SOC_DAPM_EVENT_ON(event))
+		return 0;
+
+	priv->speaker_en = !SND_SOC_DAPM_EVENT_ON(event);
+
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		priv->speaker_en = false;
-	else
-		priv->speaker_en = true;
+		msleep(70);
 
 	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_en);
 
+	if (!(quirk & SOF_ES8336_HEADPHONE_GPIO))
+		return 0;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		msleep(70);
+
+	gpiod_set_value_cansleep(priv->gpio_headphone, priv->speaker_en);
+
 	return 0;
 }
 
@@ -114,7 +140,7 @@ static const struct snd_soc_dapm_route sof_es8316_audio_map[] = {
 
 	/*
 	 * There is no separate speaker output instead the speakers are muxed to
-	 * the HP outputs. The mux is controlled by the "Speaker Power" supply.
+	 * the HP outputs. The mux is controlled Speaker and/or headphone switch.
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
@@ -233,8 +259,14 @@ static int sof_es8336_quirk_cb(const struct dmi_system_id *id)
 {
 	quirk = (unsigned long)id->driver_data;
 
-	if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
+	if (quirk & SOF_ES8336_HEADPHONE_GPIO) {
+		if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK)
+			gpio_mapping = acpi_enable_both_gpios;
+		else
+			gpio_mapping = acpi_enable_both_gpios_rev_order;
+	} else if (quirk & SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK) {
 		gpio_mapping = acpi_speakers_enable_gpio1;
+	}
 
 	return 1;
 }
@@ -592,6 +624,13 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		goto err_put_codec;
 	}
 
+	priv->gpio_headphone = gpiod_get_optional(codec_dev, "headphone-enable", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpio_headphone)) {
+		ret = dev_err_probe(dev, PTR_ERR(priv->gpio_headphone),
+				    "could not get headphone-enable GPIO\n");
+		goto err_put_codec;
+	}
+
 	INIT_LIST_HEAD(&priv->hdmi_pcm_list);
 
 	snd_soc_card_set_drvdata(card, priv);
-- 
2.35.1

