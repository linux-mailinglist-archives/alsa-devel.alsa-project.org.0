Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C400481411
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 15:25:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182D117BF;
	Wed, 29 Dec 2021 15:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182D117BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640787904;
	bh=mJZbUJwRHeDPtocpi2IbwMtnDzzMO+WSDhY8NDfn1kc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VU2XdJ3Txtv/tpGqUNJgyUliTvavrbx40W+MLXnti9N2dfgjbpdgsuJ3Kg//XG7v6
	 P0Z3tXMRcIMcCQxPVKp1uGKeLBfD1sb7rAVsDQqlxl/orjRzyfUJoC7cPhrObMUcxV
	 1gXu7XeGEZsp9z/e7I7CI3KXVVKma7dVoiBxrCeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47DB8F80539;
	Wed, 29 Dec 2021 15:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF591F80224; Tue, 28 Dec 2021 19:10:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 347ECF800D1
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 19:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 347ECF800D1
ARC-Seal: i=1; a=rsa-sha256; t=1640714974; cv=none; d=zohomail.eu; s=zohoarc; 
 b=b+2at6/dS3v78Y4eHWBZ+2wS9KgpDxcfg90OGlhKXFSnZpa1Iy7LrzS41PAghefXVdxUWhrLSlgAajpDxXVhVk3gkwA8uVLGCfG6PjhGbFJD/EBYmvyrbMIduCYJuvbsbWov3l6VjuRUPcDNSFUjT5QGFvY82Ej5fimGi4sHVY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1640714974;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=oynB9R8k0PLl1IH46elp4NZHwnEBnjiXaZcMGJZ+cRY=; 
 b=EJoBw4b5ePgr40U5SjGlpKS2nEGxPrKIrV9RZRwOx6vYwkXJBvzGcTfOnR/ql9qzKm03QSDuUyDX+q4gBupGbpVEhS+Nr78rE/z+Yi4Lez7GOxkjl7S3jJDLB5eEZ7+1gUJ0IuPgnLcTBqsIzHZONcEkCu4dYY18zcH22VY+f30=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-113.unity-media.net
 [37.201.192.113]) by mx.zoho.eu
 with SMTPS id 1640714972300267.32556141033467;
 Tue, 28 Dec 2021 19:09:32 +0100 (CET)
Date: Tue, 28 Dec 2021 19:09:31 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/3] ASoC: simple-card-utils: add support for componants
 provideing jack events via set_jack
Message-Id: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 29 Dec 2021 15:20:41 +0100
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 sre@kernel.org, kuninori.morimoto.gx@renesas.com
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

This allows componants that want a jack to report state on to do so by calling
set_jack on components implementing this function.

Im not entirely sure this is the right way to do this so RFC

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 include/sound/simple_card_utils.h     |  6 ++--
 sound/soc/generic/simple-card-utils.c | 47 +++++++++++++++++++--------
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 51b3b485a92e..547ad537613d 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -57,8 +57,8 @@ struct asoc_simple_priv {
 		struct prop_nums num;
 		unsigned int mclk_fs;
 	} *dai_props;
-	struct asoc_simple_jack hp_jack;
-	struct asoc_simple_jack mic_jack;
+	struct asoc_simple_jack *hp_jack;
+	struct asoc_simple_jack *mic_jack;
 	struct snd_soc_dai_link *dai_link;
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
@@ -173,7 +173,7 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
-			       struct asoc_simple_jack *sjack,
+			       struct asoc_simple_jack **sjack,
 			       int is_hp, char *prefix, char *pin);
 int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 10c63b73900c..1899feba16cc 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -395,6 +395,7 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
 	struct asoc_simple_dai *dai;
+	struct snd_soc_component *component;
 	int i, ret;
 
 	for_each_prop_dai_codec(props, i, dai) {
@@ -412,6 +413,21 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret < 0)
 		return ret;
 
+	for_each_rtd_components(rtd, i, component) {
+		if (component->driver->set_jack) {
+			if (!priv->hp_jack) {
+				priv->hp_jack = devm_kzalloc(priv->snd_card.dev,
+					sizeof(*priv->hp_jack), GFP_KERNEL);
+				snd_soc_card_jack_new(&priv->snd_card,
+					"Headphones",
+					SND_JACK_HEADPHONE,
+					&priv->hp_jack->jack,
+					NULL, 0);
+			}
+			snd_soc_component_set_jack(component, &priv->hp_jack->jack, NULL);
+		}
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
@@ -554,7 +570,7 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
-			  struct asoc_simple_jack *sjack,
+			  struct asoc_simple_jack **sjack,
 			  int is_hp, char *prefix,
 			  char *pin)
 {
@@ -569,8 +585,6 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 	if (!prefix)
 		prefix = "";
 
-	sjack->gpio.gpio = -ENOENT;
-
 	if (is_hp) {
 		snprintf(prop, sizeof(prop), "%shp-det-gpio", prefix);
 		pin_name	= pin ? pin : "Headphones";
@@ -588,21 +602,26 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 		return -EPROBE_DEFER;
 
 	if (gpio_is_valid(det)) {
-		sjack->pin.pin		= pin_name;
-		sjack->pin.mask		= mask;
+		struct asoc_simple_jack *sjack_d;
+
+		sjack = devm_kzalloc(dev, sizeof(*(*sjack)), GFP_KERNEL);
+		sjack_d = *sjack;
+
+		sjack_d->pin.pin		= pin_name;
+		sjack_d->pin.mask		= mask;
 
-		sjack->gpio.name	= gpio_name;
-		sjack->gpio.report	= mask;
-		sjack->gpio.gpio	= det;
-		sjack->gpio.invert	= !!(flags & OF_GPIO_ACTIVE_LOW);
-		sjack->gpio.debounce_time = 150;
+		sjack_d->gpio.name	= gpio_name;
+		sjack_d->gpio.report	= mask;
+		sjack_d->gpio.gpio	= det;
+		sjack_d->gpio.invert	= !!(flags & OF_GPIO_ACTIVE_LOW);
+		sjack_d->gpio.debounce_time = 150;
 
 		snd_soc_card_jack_new(card, pin_name, mask,
-				      &sjack->jack,
-				      &sjack->pin, 1);
+				      &sjack_d->jack,
+				      &sjack_d->pin, 1);
 
-		snd_soc_jack_add_gpios(&sjack->jack, 1,
-				       &sjack->gpio);
+		snd_soc_jack_add_gpios(&sjack_d->jack, 1,
+				       &sjack_d->gpio);
 	}
 
 	return 0;
-- 
2.34.1
