Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706A677D59
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 15:00:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CED7333D;
	Mon, 23 Jan 2023 15:00:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CED7333D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674482455;
	bh=UQbkVhpMTpgnTILbluOV+VuN9hK/Oq7ugvCkZKxXYuo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q+uCqWWIGl9yhEjxd2kwAxo9XTebXbAMdRrXFsm90P463mt6HJAWcPLk2x9RItHE9
	 tjM89zZ4LcZIbYAgEfh5tQG9AZLi2KHxxrYIgzyDtes4FazYKVCxQjg7rTN37rzaQX
	 j/QmPV6GhV82gboyWC9FlvRg1YTNIq5EKtqoUrss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 745E1F80533;
	Mon, 23 Jan 2023 14:59:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4609F804FC; Mon, 23 Jan 2023 14:59:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F67FF804C2
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F67FF804C2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=WtsP1yoQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674482362;
 x=1706018362; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vpu9tETurwEUff35qr7E5xH/0FKUrT9IUn9FLfI3fJw=;
 b=WtsP1yoQHRwbD4IBUaz5mInityEHanWm1iZmvSIuCVvsU0bNsGT1i2DC
 NKYs59oUHDz9AsFgBpsqOP1t+y8/02Rzb87ogTMIvaNN+nk2dqJJU0jgp
 GCTbPIKHZoTSDfbdIDXwx4AVxEj0L1cGoLCiDh1F90nPhmYPXRiN5PtMH
 XBBW3ax1W0s/sXFrYmSEpTZXdi/T6zn5u4u4FOojSGnwqDRDJDT4LFAUb
 EDG/lgUy67Hlj/O4im/6OAANhix16/GysvDt2TOQuIp8BPyNkBZtqKkUU
 fXhcN6Zu+2QWycd1pgs4GAZM9rZbGtUi2s1aIXA1KlVKy3+PxBDORNIiM Q==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 2/3] ASoC: simple-card-utils: create jack inputs for
 aux_devs
Date: Mon, 23 Jan 2023 14:59:12 +0100
Message-ID: <20230123135913.2720991-3-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123135913.2720991-1-astrid.rost@axis.com>
References: <20230123135913.2720991-1-astrid.rost@axis.com>
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
device list (aux_devs). A device which returns a valid value on
get_jack_type counts as jack device; set_jack is required
to add the jack to the device.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 include/sound/simple_card_utils.h     |  3 ++
 sound/soc/generic/simple-card-utils.c | 49 +++++++++++++++++++++++++++
 sound/soc/generic/simple-card.c       |  4 +++
 3 files changed, 56 insertions(+)

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
index e35becce9635..56552a616f21 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -786,6 +786,55 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_init_jack);
 
+int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
+{
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+	struct snd_soc_component *component;
+	int found_jack_index = 0;
+	int type = 0;
+	int num = 0;
+	int ret;
+
+	if (priv->aux_jacks)
+		return 0;
+
+	for_each_card_auxs(card, component) {
+		type = snd_soc_component_get_jack_type(component);
+		if (type > 0)
+			num++;
+	}
+	if (num < 1)
+		return 0;
+
+	priv->aux_jacks = devm_kcalloc(card->dev, num,
+				       sizeof(struct snd_soc_jack), GFP_KERNEL);
+	if (!priv->aux_jacks)
+		return -ENOMEM;
+
+	for_each_card_auxs(card, component) {
+		char id[128];
+		struct snd_soc_jack *jack;
+
+		if (found_jack_index >= num)
+			break;
+
+		type = snd_soc_component_get_jack_type(component);
+		if (type <= 0)
+			continue;
+
+		/* create jack */
+		jack = &(priv->aux_jacks[found_jack_index++]);
+		snprintf(id, sizeof(id), "%s-jack", component->name);
+		ret = snd_soc_card_jack_new(card, id, type, jack);
+		if (ret)
+			continue;
+
+		(void)snd_soc_component_set_jack(component, jack, NULL);
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

