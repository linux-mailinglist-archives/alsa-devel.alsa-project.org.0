Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F14ED0AE
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 02:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A1661A7C;
	Thu, 31 Mar 2022 02:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A1661A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648685239;
	bh=rBZ5kdZEm45+7toWL2Y9t32Mwdi3yHCkGCKxOzwcfqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j3WOpkmcrI6nHIjtZVCVqxdN0EtjP53cfKxAX2G7s9uirjoJZDaW4OlHa9EUysWyT
	 fhCivPbApC222F8tp7f/ohQzTB+qCEq0KRSzmoBEwTZUd8Tz2RKwtE5tx6+1PUZk/I
	 qATo0a+vOofopd8DsaGld4rHy/2p8C0Kew8p8JNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CEFF8051A;
	Thu, 31 Mar 2022 02:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77331F80516; Thu, 31 Mar 2022 02:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3752FF80155
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 02:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3752FF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="FZrLxYPz"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648685131; bh=oMsX2lTEPQEK2x2Rm91zW3XEoYZk41C902ihhdHgcmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FZrLxYPzeBxfH6RbWuq4gr3J4obaU7b9fmLpOLOA+Sa2UZy7WmQ9VcEvOAL0m65EB
 flON1zWDnWeDV6WRuy5zBRelHYv20CzbsWGEQT6jylhYjjkaR5+RQnVpANfFbmbR9d
 Yr6Hc1aFeAEakrYcVoDV0EXf4zNTewH/E0nMf6Iw=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 2/5] HACK: ASoC: Add card->filter_controls hook
Date: Thu, 31 Mar 2022 02:04:46 +0200
Message-Id: <20220331000449.41062-3-povik+lin@cutebit.org>
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Add a new ASoC card callback for filtering the kcontrols of the card's
constituent components. This lets the card take over some of the
controls, deciding their value instead of leaving it up to userspace.

Also, and here's the HACK: part, move dapm_new_widgets call in front
of the card's late_probe call. This way all kcontrols should have been
created (and are safe to use) by the time late_probe is called.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 include/sound/soc.h  |  3 +++
 sound/soc/soc-core.c | 45 +++++++++++++++++++++++++++-----------------
 sound/soc/soc-dapm.c | 34 ++++++++++++++++++++++++++++-----
 3 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7a1650b303f1..0ab664500b8f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -897,6 +897,9 @@ struct snd_soc_card {
 	int (*late_probe)(struct snd_soc_card *card);
 	int (*remove)(struct snd_soc_card *card);
 
+	int (*filter_controls)(struct snd_soc_card *card,
+			struct snd_kcontrol *kcontrol);
+
 	/* the pre and post PM functions are used to do any PM work before and
 	 * after the codec and DAI's do any PM work. */
 	int (*suspend_pre)(struct snd_soc_card *card);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a088bc9f7dd7..0bf05d98ec0d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2069,12 +2069,12 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 		}
 	}
 
+	snd_soc_dapm_new_widgets(card);
+
 	ret = snd_soc_card_late_probe(card);
 	if (ret < 0)
 		goto probe_end;
 
-	snd_soc_dapm_new_widgets(card);
-
 	ret = snd_card_register(card->snd_card);
 	if (ret < 0) {
 		dev_err(card->dev, "ASoC: failed to register soundcard %d\n",
@@ -2209,19 +2209,34 @@ struct snd_kcontrol *snd_soc_cnew(const struct snd_kcontrol_new *_template,
 }
 EXPORT_SYMBOL_GPL(snd_soc_cnew);
 
-static int snd_soc_add_controls(struct snd_card *card, struct device *dev,
+static int snd_soc_add_controls(struct snd_soc_card *card, struct device *dev,
 	const struct snd_kcontrol_new *controls, int num_controls,
 	const char *prefix, void *data)
 {
-	int i;
+	int i, err;
 
 	for (i = 0; i < num_controls; i++) {
-		const struct snd_kcontrol_new *control = &controls[i];
-		int err = snd_ctl_add(card, snd_soc_cnew(control, data,
-							 control->name, prefix));
+		const struct snd_kcontrol_new *control_new = &controls[i];
+		struct snd_kcontrol *control;
+
+		control = snd_soc_cnew(control_new, data,
+					control_new->name, prefix);
+
+		if (card->filter_controls) {
+			err = card->filter_controls(card, control);
+			if (err < 0) {
+				snd_ctl_free_one(control);
+				return err;
+			} else if (err) {
+				continue;
+			}
+		}
+
+		err = snd_ctl_add(card->snd_card, control);
+
 		if (err < 0) {
 			dev_err(dev, "ASoC: Failed to add %s: %d\n",
-				control->name, err);
+				control_new->name, err);
 			return err;
 		}
 	}
@@ -2241,9 +2256,7 @@ static int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 int snd_soc_add_component_controls(struct snd_soc_component *component,
 	const struct snd_kcontrol_new *controls, unsigned int num_controls)
 {
-	struct snd_card *card = component->card->snd_card;
-
-	return snd_soc_add_controls(card, component->dev, controls,
+	return snd_soc_add_controls(component->card, component->dev, controls,
 			num_controls, component->name_prefix, component);
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component_controls);
@@ -2258,13 +2271,11 @@ EXPORT_SYMBOL_GPL(snd_soc_add_component_controls);
  *
  * Return 0 for success, else error.
  */
-int snd_soc_add_card_controls(struct snd_soc_card *soc_card,
+int snd_soc_add_card_controls(struct snd_soc_card *card,
 	const struct snd_kcontrol_new *controls, int num_controls)
 {
-	struct snd_card *card = soc_card->snd_card;
-
-	return snd_soc_add_controls(card, soc_card->dev, controls, num_controls,
-			NULL, soc_card);
+	return snd_soc_add_controls(card, card->dev, controls, num_controls,
+			NULL, card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_card_controls);
 
@@ -2281,7 +2292,7 @@ EXPORT_SYMBOL_GPL(snd_soc_add_card_controls);
 int snd_soc_add_dai_controls(struct snd_soc_dai *dai,
 	const struct snd_kcontrol_new *controls, int num_controls)
 {
-	struct snd_card *card = dai->component->card->snd_card;
+	struct snd_soc_card *card = dai->component->card;
 
 	return snd_soc_add_controls(card, dai->dev, controls, num_controls,
 			NULL, dai);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b06c5682445c..56ecbabe5453 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -873,7 +873,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 	int kci)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_card *card = dapm->card->snd_card;
+	struct snd_soc_card *card = dapm->card;
 	const char *prefix;
 	size_t prefix_len;
 	int shared;
@@ -957,7 +957,19 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 			goto exit_free;
 		}
 
-		ret = snd_ctl_add(card, kcontrol);
+		if (card->filter_controls) {
+			ret = card->filter_controls(card, kcontrol);
+			if (ret < 0) {
+				snd_ctl_free_one(kcontrol);
+				goto exit_free;
+			}
+
+			if (!ret)
+				ret = snd_ctl_add(card->snd_card, kcontrol);
+		} else {
+			ret = snd_ctl_add(card->snd_card, kcontrol);
+		}
+
 		if (ret < 0) {
 			dev_err(dapm->dev,
 				"ASoC: failed to add widget %s dapm kcontrol %s: %d\n",
@@ -1074,7 +1086,7 @@ static int dapm_new_pga(struct snd_soc_dapm_widget *w)
 /* create new dapm dai link control */
 static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
 {
-	int i;
+	int i, ret;
 	struct snd_soc_pcm_runtime *rtd = w->priv;
 
 	/* create control for links with > 1 config */
@@ -1084,10 +1096,22 @@ static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
 	/* add kcontrol */
 	for (i = 0; i < w->num_kcontrols; i++) {
 		struct snd_soc_dapm_context *dapm = w->dapm;
-		struct snd_card *card = dapm->card->snd_card;
+		struct snd_soc_card *card = dapm->card;
 		struct snd_kcontrol *kcontrol = snd_soc_cnew(&w->kcontrol_news[i],
 							     w, w->name, NULL);
-		int ret = snd_ctl_add(card, kcontrol);
+
+		if (card->filter_controls) {
+			ret = card->filter_controls(card, kcontrol);
+			if (ret < 0) {
+				snd_ctl_free_one(kcontrol);
+				return ret;
+			}
+
+			if (!ret)
+				ret = snd_ctl_add(card->snd_card, kcontrol);
+		} else {
+			ret = snd_ctl_add(card->snd_card, kcontrol);
+		}
 
 		if (ret < 0) {
 			dev_err(dapm->dev,
-- 
2.33.0

