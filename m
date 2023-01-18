Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F33D671CB4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 13:54:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88495777D;
	Wed, 18 Jan 2023 13:53:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88495777D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674046457;
	bh=vI+85DL5z+EfzHC7+lvRQwkvQMBxVhx3WaRZJzarmV4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CPP7raZTU1uM8q9z0+IG+5wdzhIT+BEaeTutBwI+aN2gcMzQUyCGZo8ysArpHzOZR
	 HwJr1tWIvCrWi5PnoyLk67p1bYhe+JaUrW+tN3yiTbTCSu0xYOHWLzOl6OLi7s1YmM
	 zOH6xU7GdF7zlkHRQjKtY7zhs/iBzXIY6kmmKp/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA9AF8021D;
	Wed, 18 Jan 2023 13:52:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B7ADF80495; Wed, 18 Jan 2023 13:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A7CEF8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A7CEF8021D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=n9p3JwfP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674046352;
 x=1705582352; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDuZPaHsxgFdJEIP3i2Sn6P/NroSujvTJa3yqm7oHHI=;
 b=n9p3JwfPY9TxVbx5u8UMOxd/dhSZYoBqCDll3/aGS1AGvE91ctIJTrGY
 regvK3W4qqElNLkcoqxnLunTwROGRnQUoZ2biGkquJcUbytnGE6imQIW8
 d8tAYWGLaQRJIfJBeq6VyM8zkqDTz+oQVjdC8IQ/sxjj0sXbQDX9l4sfN
 WvXNZxtnbRmRZQVSmWAA+T++kL+MD1ObJ75z1SZ2gzR0HV7B4TLQLVhTY
 poGaezo1CVjmT3cQfBZrsS3ihJf/HG9oK+z2NmqC3Lb3xm1/Z/mZsoeHz
 QG2CUAktvCZ6LAF27fDUz7wif9LNDg5Y6GBvlPBEYKdZpcIbhto656Gv8 Q==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 2/4] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Date: Wed, 18 Jan 2023 13:52:24 +0100
Message-ID: <20230118125226.333214-3-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118125226.333214-1-astrid.rost@axis.com>
References: <20230118125226.333214-1-astrid.rost@axis.com>
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

Add a generic way to create jack inputs for auxiliary jack detection
drivers (e.g. via i2c, spi), which are not part of any real codec.
The simple-card can be used as combining card driver to add the jacks,
no new one is required.

Create a jack (for input-events) for jack devices in the auxiliary
device list (aux_devs). A device which has the functions set_jack and
get_jack_supported_type counts as jack device.

Add a devicetree entry, in case not all input types are required.
 simple-card,aux-jack-types:
Array of snd_jack_type to create jack-input-event for jack devices in
aux-devs. If the setting is 0, the supported type of the device is used.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 include/sound/simple_card_utils.h     |  3 ++
 sound/soc/generic/simple-card-utils.c | 63 +++++++++++++++++++++++++++
 sound/soc/generic/simple-card.c       |  4 ++
 3 files changed, 70 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 38590f1ae9ee..a3f3f3aa9e6e 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -69,6 +69,7 @@ struct asoc_simple_priv {
 	} *dai_props;
 	struct asoc_simple_jack hp_jack;
 	struct asoc_simple_jack mic_jack;
+	struct snd_soc_jack *aux_jacks;
 	struct snd_soc_dai_link *dai_link;
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
@@ -187,6 +188,8 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			       struct asoc_simple_jack *sjack,
 			       int is_hp, char *prefix, char *pin);
+int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv,
+				char *prefix);
 int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			       struct link_info *li);
 int asoc_simple_remove(struct platform_device *pdev);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index e35becce9635..668123549fbf 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -786,6 +786,69 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_init_jack);
 
+int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
+{
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+	struct device *dev = card->dev;
+	struct snd_soc_component *component;
+	char prop[128];
+	int found_jack_index = 0;
+	int num = 0;
+	int ret;
+
+	if (priv->aux_jacks)
+		return 0;
+
+	snprintf(prop, sizeof(prop), "%saux-jack-types", prefix);
+	num = of_property_count_u32_elems(dev->of_node, prop);
+	if (num < 1)
+		return 0;
+
+	priv->aux_jacks = devm_kcalloc(card->dev, num,
+				       sizeof(struct snd_soc_jack), GFP_KERNEL);
+	if (!priv->aux_jacks)
+		return -ENOMEM;
+
+	for_each_card_auxs(card, component) {
+		if (found_jack_index >= num)
+			break;
+
+		if (component->driver->set_jack &&
+		    component->driver->get_jack_supported_type) {
+			char id[128];
+			int type = 0;
+			struct snd_soc_jack *jack =
+				&(priv->aux_jacks[found_jack_index]);
+			int type_supp_mask =
+				snd_soc_component_get_jack_supported_type(
+					component);
+
+			ret = of_property_read_u32_index(
+				dev->of_node, prop, found_jack_index++, &type);
+			if (ret)
+				continue;
+
+			if (type)
+				type &= type_supp_mask; /* use only supported types */
+			else
+				type = type_supp_mask; /* use all supported types */
+
+			if (!type)
+				continue;
+
+			/* create jack */
+			snprintf(id, sizeof(id), "%s-jack", component->name);
+			ret = snd_soc_card_jack_new(card, id, type, jack);
+			if (ret)
+				continue;
+
+			(void)snd_soc_component_set_jack(component, jack, NULL);
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_init_aux_jacks);
+
 int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			  struct link_info *li)
 {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index feb55b66239b..e98932c16754 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -623,6 +623,10 @@ static int simple_soc_probe(struct snd_soc_card *card)
 	if (ret < 0)
 		return ret;
 
+	ret = asoc_simple_init_aux_jacks(priv, PREFIX);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
-- 
2.30.2

