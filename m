Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E0535B457
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Apr 2021 14:52:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CD02165E;
	Sun, 11 Apr 2021 14:51:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CD02165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618145564;
	bh=bfMUjBHRhy1NJyj2ip9AY6nyADlrMwGHIMFmyHv9CO8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FkBd5sFXRjCljfAKX+9mx47/Dn75ql32ub8Dc5fBs3bbdWVYiMuYaOvfuU2tPFmwT
	 mXCz+odAtnu9qmGlBDgSUcIHYZQEiPBDCFgsAnFkcKEn1uvZ/9NLpPUWBxYquASjm0
	 zhfehfCEIuRyVqc15QrnP49LdwMpbk1Xyps21EDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34F0AF8022D;
	Sun, 11 Apr 2021 14:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 122D5F8022B; Sun, 11 Apr 2021 14:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_BL_SPAMCOP_NET, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D1D2F8013D
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 14:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D1D2F8013D
Received: from localhost.localdomain ([90.126.11.170]) by mwinf5d63 with ME
 id rQr7240063g7mfN03Qr7CW; Sun, 11 Apr 2021 14:51:09 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Apr 2021 14:51:09 +0200
X-ME-IP: 90.126.11.170
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: cs35l35: Fix an error handling path in
 'cs35l35_i2c_probe()'
Date: Sun, 11 Apr 2021 14:51:06 +0200
Message-Id: <15720439769ba94ffb65c90217392b0758b08f61.1618145369.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

If 'devm_regmap_init_i2c()' fails, there is no need to goto err. We should
return directly as already done by the surrounding error handling paths.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/cs35l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 55d529aa0011..7b9f5498f8a7 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1488,7 +1488,7 @@ static int cs35l35_i2c_probe(struct i2c_client *i2c_client,
 	if (IS_ERR(cs35l35->regmap)) {
 		ret = PTR_ERR(cs35l35->regmap);
 		dev_err(dev, "regmap_init() failed: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cs35l35_supplies); i++)
-- 
2.27.0

