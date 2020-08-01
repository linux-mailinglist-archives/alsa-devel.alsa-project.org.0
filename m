Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0F23519A
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Aug 2020 12:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA1116D5;
	Sat,  1 Aug 2020 12:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA1116D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596276435;
	bh=qktnAtanpZbQ/NFpeCdKjFm++fBEygaFvv0sbf9I9Yc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exGQxtnImrLD0ExOnoi0mXf4mHiV/um5vExC9MZY/rn92DlKKMCY8IMmR1+ut4ITS
	 sqirrUfSsbphQDkPmaS1Bcsa/cifGso7oNIy1z0UG/eURDC0a8zS3NdsQ8Zm43GDXd
	 jRIZHto9GLneXN7WRYhx10y/gSzmdISzj/71EWXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 800FBF802BE;
	Sat,  1 Aug 2020 12:04:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4B5BF802BD; Sat,  1 Aug 2020 12:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65171F8021C
 for <alsa-devel@alsa-project.org>; Sat,  1 Aug 2020 12:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65171F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="PH1/SkyX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596276255;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=XWvOu54S0LJGbQq3Q4KDpCFi37RtmgZWkg+uKQEibNA=;
 b=PH1/SkyXdl6gAbltjlk5ggviOdS+R8py/amXhJRp4eyvwqKI70oY6PIYleATp3DhVW
 d+Z8ovnupbfFr8Y3JLjV9ho3N7JJjsaEQ3wLm2dszSI3uVjeG2ViqldTTbq1ORFKvcJT
 B7fvW+Pm5/aUf+yjtNG9H5HC6RSkkJihAnfaKPDX4/B3VHS6L+0ZgP19ll0WZ7Ds/uAJ
 Gb1TU7MJWnfYvEiEAiAiBrYkNS4IdrffosjalEoEhi0R+U5xtOuc6/ib5JW7ztmqayB6
 62LvCZH1sJTEbQL1qDq5VoSETD27aonqfeHobHZBYkJZtCvf7X/8NDepX+CASQf9uzcw
 bCfQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew71A41rZ8
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 1 Aug 2020 12:04:01 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: meson: Use snd_soc_of_parse_aux_devs()
Date: Sat,  1 Aug 2020 12:02:57 +0200
Message-Id: <20200801100257.22658-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801100257.22658-1-stephan@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
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

Use the new common snd_soc_of_parse_aux_devs() helper function
to parse auxiliary devices from the device tree. The new helper
is just a copy of meson_card_add_aux_devices() so there is no
functional change.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/meson/meson-card-utils.c | 33 +-----------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 6a64ac01b5ca..300ac8be46ef 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -254,37 +254,6 @@ static int meson_card_parse_of_optional(struct snd_soc_card *card,
 	return func(card, propname);
 }
 
-static int meson_card_add_aux_devices(struct snd_soc_card *card)
-{
-	struct device_node *node = card->dev->of_node;
-	struct snd_soc_aux_dev *aux;
-	int num, i;
-
-	num = of_count_phandle_with_args(node, "audio-aux-devs", NULL);
-	if (num == -ENOENT) {
-		return 0;
-	} else if (num < 0) {
-		dev_err(card->dev, "error getting auxiliary devices: %d\n",
-			num);
-		return num;
-	}
-
-	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-	card->aux_dev = aux;
-	card->num_aux_devs = num;
-
-	for_each_card_pre_auxs(card, i, aux) {
-		aux->dlc.of_node =
-			of_parse_phandle(node, "audio-aux-devs", i);
-		if (!aux->dlc.of_node)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 static void meson_card_clean_references(struct meson_card *priv)
 {
 	struct snd_soc_card *card = &priv->card;
@@ -357,7 +326,7 @@ int meson_card_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_err;
 
-	ret = meson_card_add_aux_devices(&priv->card);
+	ret = snd_soc_of_parse_aux_devs(&priv->card, "audio-aux-devs");
 	if (ret)
 		goto out_err;
 
-- 
2.27.0

