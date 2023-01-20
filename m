Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 097BD675260
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 11:27:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 985DF307E;
	Fri, 20 Jan 2023 11:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 985DF307E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674210428;
	bh=/cYsyk6S8mKmdkJVw8NuthCs9s4VSCdzI66QCpUJD8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gMH/wMNAhFNmy/n2Mc3mtDaLHIsZq95umhUSbLocdAPmbI7rfb8axJluHq//YkrwF
	 l8DVTyLr57OKzuXDBRi/pcOKiwuPGF6ZsFJc9/Dio+Dfb/UJcfOGnbcBq5/ffSDj9Z
	 GlK25RYPnXyJa1SStv+W0vaMmpwrKZcqvQGIL4DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 716C3F804A9;
	Fri, 20 Jan 2023 11:26:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E431FF804FE; Fri, 20 Jan 2023 11:26:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55319F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 11:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55319F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=cS3zSBYi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674210365;
 x=1705746365; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U2imJO+1R/ob6ECocsNc0QXBaMhDnHjJe1WKPivTPyc=;
 b=cS3zSBYiP6ELvWA5DFzEW/5wbkEsy3SrmwX0mrege+DuFVl8LqKghAPR
 pSJQRRbbTaqKzFNyd5H3XuUdNpJQuHKwxfVJEX5CFyytmu+jfGWmeBTdD
 KO3DA19EP8pX8cE78nEHW8m1xhRxIdU9WPc65kGt/DyKuwMcqoboZXWor
 Yah4mLgIftYbPJ8rvTKEponll+UiA6Trg41M14JNOgNCm1U9vb3KJg1WL
 wKyuZsqcTpMgfwIyhAOD83vxjZyXtZ79l1U+hHaas/AFOqUEu4HlEFz9j
 HbGJ5x1xoUPsErydFBHclJjCdI9plZRHd4QlEYFeKaLVeAxCXIRHJQJ1r w==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/4] ASoC: ts3a227e: add set_jack and get_jack_type
Date: Fri, 20 Jan 2023 11:25:53 +0100
Message-ID: <20230120102555.1523394-4-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230120102555.1523394-1-astrid.rost@axis.com>
References: <20230120102555.1523394-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Astrid Rost <astrid.rost@axis.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add set_jack and get_jack_type to allow simple-card-utils to add
a jack for it.

Add a devicetree entry jack-type of type snd_jack_type, in case not
all input types are required.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 sound/soc/codecs/ts3a227e.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index 2305a472d132..432a327c6eb7 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -28,6 +28,7 @@ struct ts3a227e {
 	bool mic_present;
 	unsigned int buttons_held;
 	int irq;
+	int jack_type;
 };
 
 /* Button values to be reported on the jack */
@@ -258,7 +259,27 @@ int ts3a227e_enable_jack_detect(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(ts3a227e_enable_jack_detect);
 
-static struct snd_soc_component_driver ts3a227e_soc_driver;
+static int ts3a227e_set_jack(struct snd_soc_component *component,
+			     struct snd_soc_jack *jack, void *data)
+{
+	if (jack == NULL)
+		return -EINVAL;
+
+	return ts3a227e_enable_jack_detect(component, jack);
+}
+
+static int ts3a227e_get_jack_type(struct snd_soc_component *component)
+{
+	struct ts3a227e *ts3a227e = snd_soc_component_get_drvdata(component);
+
+	return ts3a227e->jack_type;
+}
+
+static const struct snd_soc_component_driver ts3a227e_soc_driver = {
+	.name = "ti,ts3a227e",
+	.set_jack = ts3a227e_set_jack,
+	.get_jack_type = ts3a227e_get_jack_type,
+};
 
 static const struct regmap_config ts3a227e_regmap_config = {
 	.val_bits = 8,
@@ -283,6 +304,12 @@ static int ts3a227e_parse_device_property(struct ts3a227e *ts3a227e,
 	u32 setting3_mask = 0;
 	int err;
 
+	err = device_property_read_u32(dev, "jack-type", &value);
+	if (!err)
+		ts3a227e->jack_type = value & SND_JACK_HEADSET;
+	else
+		ts3a227e->jack_type = SND_JACK_HEADSET;
+
 	err = device_property_read_u32(dev, "ti,micbias", &value);
 	if (!err) {
 		setting3_mask = MICBIAS_SETTING_MASK;
-- 
2.30.2

