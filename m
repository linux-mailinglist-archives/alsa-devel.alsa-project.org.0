Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80842258CA7
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:21:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27BFF16D7;
	Tue,  1 Sep 2020 12:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27BFF16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955693;
	bh=HCG2fjaitL+76mG3LXvxjmcK6aj37bvOt3WYb0MHmq0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iSt5BalQ6KDhuNN8xpOxRbklGlXdxpDKsE0+H6BEU9JYgV0pwhxWT9T/UF4lraNSt
	 9kKLhLcZudiL930pHtsr5Ef0xCd1O7tAfe4IPwp4PGvWhf3PbvwoDgXrXoh7pkOhbO
	 KbqjFF5N0fBCpaaSy+sQRd9mDWLtFWr0G/PE//j8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 343E5F802F8;
	Tue,  1 Sep 2020 12:15:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B741F80217; Tue,  1 Sep 2020 09:27:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D595CF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 09:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D595CF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="IzV0qiHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=995; q=dns/txt; s=axis-central1;
 t=1598945245; x=1630481245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ShxaEFx48sdlmYl8Cn29yMPtphJjPlK3B3A8bgDbuVQ=;
 b=IzV0qiHq7zh9Wu31UQVfBWUc+G6+3vpDeQHr+rvAYASIVC/i9fovA452
 JzPaIb1Kr2LdRlOHTLglGwcs/s/ycT4X79aaNQZqsYghfMlCJ9y5SUQwr
 D51Mm598+iJoQeTsErgL/XBUiJoR8DZCK9/xE106/yQHB44UPawCEIUlP
 Q27ZXk2HmPDHAMnrUsJXjuzoZS6rFtFysQnABdhpMbz6jflwLYbcLKIhH
 Adl+sG6vHmOr/YWJUtNqt7PFX+gJhw7KN1eTrtD69zbKBQIcuAP6Ej62b
 ZnGTR0T8HrE+oE1MTfN9Frod82TzsWzMiHdKGRaaPOpBTT09SBGsm3dVU g==;
IronPort-SDR: 6wvZqcrh8ZvNMxqhgd4/XGbB+UlSLzwDBAWg/RS3zxVpQu80m5TPFiDIX2iMUBowe98gnwm//z
 8VJnQFFVcQZgKFAlO0NK3/issBqDOp0IpfG7EMJdVaKWuW7qCpsO/T/3+Cyv7wcZ+pX6a1O4f7
 P6CIfANY+XDAcnHaHxzBTfTOo/w+hqD0FgaGvjEbsanfOI9mH1KMTXpf3XgoC2vKf9ugoEx5EG
 9zepESA3jj9btI5RD2ktpSnvPEB9ddQ09a40wwGEL9ADjXChE7nX6iv29iCGO1keMGecn1cC7R
 xJE=
X-IronPort-AV: E=Sophos;i="5.76,378,1592863200"; d="scan'208";a="12070617"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <dmurphy@ti.com>
Subject: [PATCH] ASoC: tlv320adcx140: Fix accessing uninitialized abcx140->dev
Date: Tue, 1 Sep 2020 09:27:10 +0200
Message-ID: <20200901072710.2031-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
Cc: Camel Guo <camel.guo@axis.com>, alsa-devel@alsa-project.org,
 kernel@axis.com, linux-kernel@vger.kernel.org, Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

in adcx140_i2c_probe, adcx140->dev is accessed before its
initialization. This commit fixes this bug.

Signed-off-by: Camel Guo <camel.guo@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 5cd50d841177..7ae6ec374be3 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -980,6 +980,8 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 	if (!adcx140)
 		return -ENOMEM;
 
+	adcx140->dev = &i2c->dev;
+
 	adcx140->gpio_reset = devm_gpiod_get_optional(adcx140->dev,
 						      "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(adcx140->gpio_reset))
@@ -1007,7 +1009,7 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
 			ret);
 		return ret;
 	}
-	adcx140->dev = &i2c->dev;
+
 	i2c_set_clientdata(i2c, adcx140);
 
 	return devm_snd_soc_register_component(&i2c->dev,
-- 
2.20.1

