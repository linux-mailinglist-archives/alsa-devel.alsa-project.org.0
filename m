Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D434370A895
	for <lists+alsa-devel@lfdr.de>; Sat, 20 May 2023 16:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07D02827;
	Sat, 20 May 2023 16:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07D02827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684594537;
	bh=1s6XLro0lXvhLVx3ly6dPly3R9ZHgeLXXPmDrrYCj8Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U9boDkuwvGVZHfHWN/uqLSEwfKQ8Puwk2mcUfG0UfYxJURyHH5jRvrrNUbRn/fNKt
	 iTAM60K8di4hQhxUSRpap/pH5hBwPJQKKRXvoh4qHryC/O4zPsEowJ2w2CMatdVPd0
	 iJtxEbfZNQ8tD1IYHwo4jLlHF7GtAriDedNu1NoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33A87F80431; Sat, 20 May 2023 16:54:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55388F8025A;
	Sat, 20 May 2023 16:54:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B0D6F80272; Sat, 20 May 2023 16:54:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11F01F8016D
	for <alsa-devel@alsa-project.org>; Sat, 20 May 2023 16:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F01F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=CQsi4hW5
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 0NyCq5nVtRkO40NyCqQaRc; Sat, 20 May 2023 16:54:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1684594450;
	bh=4Jkf7tHnTYvxjLJZ8lnVCybLulN7KeUyeXRkBsmgzrk=;
	h=From:To:Cc:Subject:Date;
	b=CQsi4hW5hW8Fi6yChUdbDdgH8S3NNSLxiKVNSkKVHPjl1VoDPJ3kAezwkUamXg7xr
	 pkaR5tD7fPeTqTejMYZzMX/7m8DJVFCGqyaQCSqeYsgzI82E7SRHweAZ20iyS7w2dH
	 nYO2sdq/e4yK91+N5su1cuC89GaajG3e/UWjY546vTZUA87XOsZyzuKD3fd9UgNNrR
	 x5pGqWAH12CrIanHxxFo6dKPWxXeEUF14DEQfLngxmh3Sh0JzwQdjN+jIuqwQE7Wjq
	 VlI5LLoNDS2sXTny/zYkgNBE6yxnY8ro3IQhCR43HUtxCpYSQ5w3gs4LPtEx7k4TfH
	 8qQDCVAbS+96w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 May 2023 16:54:10 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs53l30: Use the devm_clk_get_optional() helper
Date: Sat, 20 May 2023 16:54:06 +0200
Message-Id: 
 <3219effee5c7f190530bdb1ef8ec35cb142e3611.1684594433.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BYNE6N2XZ43UCH6UUCIRCYDQ3WD3MDOE
X-Message-ID-Hash: BYNE6N2XZ43UCH6UUCIRCYDQ3WD3MDOE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYNE6N2XZ43UCH6UUCIRCYDQ3WD3MDOE/>
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
 sound/soc/codecs/cs53l30.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 51ca66e7b3ea..21962b828ab1 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -990,14 +990,10 @@ static int cs53l30_i2c_probe(struct i2c_client *client)
 	}
 
 	/* Check if MCLK provided */
-	cs53l30->mclk = devm_clk_get(dev, "mclk");
+	cs53l30->mclk = devm_clk_get_optional(dev, "mclk");
 	if (IS_ERR(cs53l30->mclk)) {
-		if (PTR_ERR(cs53l30->mclk) != -ENOENT) {
-			ret = PTR_ERR(cs53l30->mclk);
-			goto error;
-		}
-		/* Otherwise mark the mclk pointer to NULL */
-		cs53l30->mclk = NULL;
+		ret = PTR_ERR(cs53l30->mclk);
+		goto error;
 	}
 
 	/* Fetch the MUTE control */
-- 
2.34.1

