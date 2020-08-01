Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C7235199
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Aug 2020 12:06:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63FF16C3;
	Sat,  1 Aug 2020 12:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63FF16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596276416;
	bh=vUmtSeXlQZlcxBEzzX/yTSNCfa1a707fW42KAD8sxbA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dygTXmALM6N04DyBoRQlHUhUJTdsi49ceJPmSDHj7pmRzbhsRtQufP2HN1XizbNPb
	 ndp35WGPjmF2ZITpRXQ+o/2i3wS0EGZvf2fPJFDEauiE10KyIsfcZSIMTwbnftrb7i
	 K9KJ4CIUKftUArREfEzziUxun55yQlGrJCBhiZYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D8AF8028D;
	Sat,  1 Aug 2020 12:04:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBAF0F8011C; Sat,  1 Aug 2020 12:04:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6757F8015C
 for <alsa-devel@alsa-project.org>; Sat,  1 Aug 2020 12:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6757F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="lObvsHuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596276255;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=Pmv7+iLSVshdoV6ocv6fKYKPavqAIV2Sg/urAg838/A=;
 b=lObvsHuub2Amd8bN8vsM9VtCSb6fTK4cYzfzlvVRJDwbVsDr1fS7PeBZtxJRVFOlGw
 U3KzNKrNcUlk7T8s4fJOaaSFPM8XV53Ujfi3PW0tgIO2EdWIAdaPM7IzqTzGB8ANnYqh
 tLUaroeodwJeJ7Cm3bZxA6tvrKapuPleJMTGlzcdVxNNVxrVWjPK8jzTq5eE2citSpl2
 n4VnIDrfnnaP8X9xdwADmt+zwqgn/Vdj+IW1D1oYM529DW9xwR8EZFMO6M4RdeKN16Rc
 aOdwp3fiZwdQ6jkTSc7ERwxQJ/MsUp9wWHZRRsn1wKmJnVeo7LJ7rPgnewlG1Sc4ZfSq
 FFcA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew71A40rZ6
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 1 Aug 2020 12:04:00 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
Date: Sat,  1 Aug 2020 12:02:55 +0200
Message-Id: <20200801100257.22658-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

simple-card.c and meson-card-utils.c use pretty much the same
helper function to parse auxiliary devices from the device tree.

Make it easier for other drivers to parse these from the device tree
as well by adding a shared helper function to soc-core.c.

snd_soc_of_parse_aux_devs() is pretty much a copy of
meson_card_add_aux_devices() from meson-card-utils.c
with two minor changes:

  - Make property name configurable as parameter
  - Change dev_err() message slightly for consistency with other
    error messages in soc-core.c

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
I have another patch set that I will submit separately which makes
use of this function to parse aux devs from the device tree within
qcom_snd_parse_of(). This is preparation for that patch set.
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 5e3919ffb00c..a0918d159fd3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1331,6 +1331,7 @@ void snd_soc_of_parse_audio_prefix(struct snd_soc_card *card,
 
 int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 				   const char *propname);
+int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname);
 unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
 				     const char *prefix,
 				     struct device_node **bitclkmaster,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2fe1b2ec7c8f..bf46f410c8c6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2827,6 +2827,37 @@ int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_audio_routing);
 
+int snd_soc_of_parse_aux_devs(struct snd_soc_card *card, const char *propname)
+{
+	struct device_node *node = card->dev->of_node;
+	struct snd_soc_aux_dev *aux;
+	int num, i;
+
+	num = of_count_phandle_with_args(node, propname, NULL);
+	if (num == -ENOENT) {
+		return 0;
+	} else if (num < 0) {
+		dev_err(card->dev, "ASOC: Property '%s' could not be read: %d\n",
+			propname, num);
+		return num;
+	}
+
+	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
+	if (!aux)
+		return -ENOMEM;
+	card->aux_dev = aux;
+	card->num_aux_devs = num;
+
+	for_each_card_pre_auxs(card, i, aux) {
+		aux->dlc.of_node = of_parse_phandle(node, propname, i);
+		if (!aux->dlc.of_node)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_parse_aux_devs);
+
 unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
 				     const char *prefix,
 				     struct device_node **bitclkmaster,
-- 
2.27.0

