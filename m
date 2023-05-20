Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7544A70A89B
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 16:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 841FD1F6;
	Sat, 20 May 2023 16:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 841FD1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684594620;
	bh=Z/R4mmeHsP49TYkTgS4cqGnaYEMW61PCfS8aseuU0to=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZA7iFmhv92kHamJKm6UkYFUce1tCIw0xL6nDQNw0/OKnvRH1kx74DEH9dljAcmYf1
	 r3mzvBwkHC3/5iqh8CofhJ7iOrVygBtbhLXupi9ca1u1kCP9nIJ9T1v8ZREU+GafpN
	 1mzhHhiCqILGLZyiMJp/HQVNoDwoe37y6Uj8S6Nc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 479D9F8053D; Sat, 20 May 2023 16:56:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDAEF8025A;
	Sat, 20 May 2023 16:56:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 693CBF80272; Sat, 20 May 2023 16:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5358FF8016A
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 16:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5358FF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=esUdMWBL
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 0O00q7RjWHWsH0O01qRG48; Sat, 20 May 2023 16:56:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684594563;
	bh=bpLpYwHdElG8Zrz72XZdWqpkdWbasWrKHm81qJngWNM=;
	h=From:To:Cc:Subject:Date;
	b=esUdMWBLA/phoUXHm4JrlWfMI2UdxVyfevFMmMduOK0jOBFkLSDf3VzJpbi/iO2Rj
	 9Jv1y74+6CMKzngQNBOl0ul5oJ2dlSxrYU/mJA3ZcNelQjj4wcZBpWrDDdNv/oP49q
	 C2PTMQmDBu1OfRWeknabq78rfQE57kp8AWWXK1dXMuIzqIzn9OF34r5Hq76d+3oX3u
	 BTa8VDKgyir2/HrIH5zN+xuhTQrmM/D6GyWdZn2lWHBaqblzqZHKY7jcCcRfebZ7il
	 M/WvdvtmLtie2wXciOf/Ey6Xgi/3I3eV36zXk6ZfRr7WPx64IfaX+08f3glUi9AP1N
	 1yvBcMnrcPc7Q==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 16:56:03 +0200
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
Subject: [PATCH] ASoC: rt5659: Use the devm_clk_get_optional() helper
Date: Sat, 20 May 2023 16:56:00 +0200
Message-Id: 
 <5b44b2fddd8973e949e4ae2132971b147cfd1ec1.1684594544.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WS5FQVRVGTYQNXAM2XWWME2BNYBCGKWT
X-Message-ID-Hash: WS5FQVRVGTYQNXAM2XWWME2BNYBCGKWT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WS5FQVRVGTYQNXAM2XWWME2BNYBCGKWT/>
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
 sound/soc/codecs/rt5659.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 22bb57029bc0..df6f0d769bbd 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4141,13 +4141,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 
 	/* Check if MCLK provided */
-	rt5659->mclk = devm_clk_get(&i2c->dev, "mclk");
-	if (IS_ERR(rt5659->mclk)) {
-		if (PTR_ERR(rt5659->mclk) != -ENOENT)
-			return PTR_ERR(rt5659->mclk);
-		/* Otherwise mark the mclk pointer to NULL */
-		rt5659->mclk = NULL;
-	}
+	rt5659->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5659->mclk))
+		return PTR_ERR(rt5659->mclk);
 
 	rt5659_calibrate(rt5659);
 
-- 
2.34.1

