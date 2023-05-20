Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC7970A8A1
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 16:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 073027F1;
	Sat, 20 May 2023 16:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 073027F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684594765;
	bh=eIaAnBX+OfGwDQcqrOHdj65X3JfVCqE97C53ywMmkwI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YRVhfKJc0w0iVvN4jCcymBUL1Om5SONrWpaGn7ZBZ9QuWpYPC8vD6jACPSk/qaYy+
	 QUaUACMol9XiL6DTDmE1jpC1c0zB3tcyzrPPkJTgEVsuJl3VvUeEnB4b99hFbTxtK0
	 XbSpEi2UnpbXCAAGQclN8i57yrSApB8B9QT00lWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0D94F8016A; Sat, 20 May 2023 16:58:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89C6FF8025A;
	Sat, 20 May 2023 16:58:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B3DF80272; Sat, 20 May 2023 16:58:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3C77F8016A
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 16:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3C77F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=nww41qSi
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 0O2LqG7MhArAu0O2Mqmq31; Sat, 20 May 2023 16:58:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684594708;
	bh=an1jU7hzklQhAPlftBGuyvpE99sqJqwyCvQdIs09g5U=;
	h=From:To:Cc:Subject:Date;
	b=nww41qSiv8Xnw/kdeokRlCyp37wJMyyNKn/rHP5EU6NjljbHg+hmJ01LiuLbO0pKH
	 /Iakel18zuGasaCdwlZu22ApMilwLlHdOsE0qBNq8FvjfNJpXGt+920OZabAu0JwyX
	 OJlaC0BE7W0vuNoHk0iLmNDq8J3AWigVeHJfaQIDoWAk9RzWnOxOBMif75sLDgjDwy
	 iseb/rFVaqYryiAmIkOr4J/tgkpAceavcc4j3xDZhVB2TLjsFvY6pbzA8HBfJ87DtY
	 c0LMzQxzMoilvaNA2pwR3hJWgYUnValLS7L43uQzPiqIc5H1Au0Cm+Mzr20YjEjE/Z
	 MW4RFEfSFQTJQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 16:58:28 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: rt5682s: Use the devm_clk_get_optional() helper
Date: Sat, 20 May 2023 16:58:24 +0200
Message-Id: 
 <f538c24ad7b1926478347a03b5b7f0432e195e3b.1684594691.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3W2KPSSGT2GNTNJLFW6TR4ZSHSMMPCDR
X-Message-ID-Hash: 3W2KPSSGT2GNTNJLFW6TR4ZSHSMMPCDR
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3W2KPSSGT2GNTNJLFW6TR4ZSHSMMPCDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use devm_clk_get_optional() instead of hand writing it.
This saves some LoC and improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/rt5682s.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 81163b026b9e..a01de405c22c 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2848,14 +2848,9 @@ static int rt5682s_dai_probe_clks(struct snd_soc_component *component)
 	int ret;
 
 	/* Check if MCLK provided */
-	rt5682s->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(rt5682s->mclk)) {
-		if (PTR_ERR(rt5682s->mclk) != -ENOENT) {
-			ret = PTR_ERR(rt5682s->mclk);
-			return ret;
-		}
-		rt5682s->mclk = NULL;
-	}
+	rt5682s->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5682s->mclk))
+		return PTR_ERR(rt5682s->mclk);
 
 	/* Register CCF DAI clock control */
 	ret = rt5682s_register_dai_clks(component);
-- 
2.34.1

