Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AFF258FB2
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 15:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96F8E17D5;
	Tue,  1 Sep 2020 15:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96F8E17D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598968789;
	bh=jnmTMI2+1+sj8Fq2xbtJYMyqNAL4OmBGX4EENLRmG/U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tQUUnOURCus4DLiLukVYt3SRtsDuN6VLbV+gQOJQJ609IcFoRwaJ7THGTkyC9VzAw
	 m0BxxjJjQogqPNDF5AjfJCx1eRapuIs/TWX3Nm1CQ72+Sz5wTGqW3FCzjRCZoM21bP
	 nFKxN78d80A9JsOwCFxTLIFKp6gx25NzlSMd/BC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D5FF801EB;
	Tue,  1 Sep 2020 15:58:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23627F801DA; Tue,  1 Sep 2020 15:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A9BF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 15:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A9BF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="nh0DXFE3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1199; q=dns/txt; s=axis-central1;
 t=1598968681; x=1630504681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SlWuRwEsUGOOrcOy4jOz87uO5umOVIDCT/hBp78/e1c=;
 b=nh0DXFE3aN8aiv7D/e0hIYxk9nOvnNOn+pGY5XSAYZ3ZiIxA2ndvluHK
 961mYI1dCjU6WxNxQL8QqqqqHuasgT4fM4p2bTtHp95ZKB7n2KX5H23Gm
 CIoX+N6O4CVIAxMPmjfTVfkrsDjtc4kqeeZn2ISKhYJ1O4m5UGePUnDO6
 gUFsWrBFstWIHrW1cDDR12dsY+ccGAiLLXR8mN0C/lG37jIkORYc1pfct
 efZp4iOUUFMnq0E/xa++FU1CfEJ+PhzC3ulqKiVaFoLiiVjnOZ4BQkiri
 z4Y9gpV+0j4Fhk+aYdfh4BoQQrhCbV2QwlyJ5+Nhzqh3bhLs71fsXyxW7 g==;
IronPort-SDR: FNOXj4xYEMBEdlzdI3cWvh4yLFmW7LQ/mba46vkxuXEnfZJXXUaKDzHTzbLhxPc/o9KBfJiH4j
 YYrTnkxSRTdZLmK+yk8IEzParOm9YsDNfuZP92z1rcK0vcHXUKVZ911an2Kd9jg8IAJf3YGvj+
 yduPs7lAvQA5fh+lnfUiuBb9UDH/y3GfakqW304En+sycjcXktfCVPF2qIa8Sf8d1gbH3hUBef
 IcBF4Zj2vP4/6Jjtw7KBpe86JReYGoTPAGwaGe1JDPAPpKL9cJnsFfmiOEIqxML5lZbAxyv/Fc
 xMY=
X-IronPort-AV: E=Sophos;i="5.76,379,1592863200"; d="scan'208";a="12087816"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <dmurphy@ti.com>
Subject: [PATCH v4] ASoC: tlv320adcx140: Fix accessing uninitialized
 adcx140->dev
Date: Tue, 1 Sep 2020 15:57:35 +0200
Message-ID: <20200901135736.32036-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

In adcx140_i2c_probe, adcx140->dev is accessed before its
initialization. This commit fixes this bug.

Fixes: 689c7655b50c ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")
Acked-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Camel Guo <camel.guo@axis.com>
---
 v4:
   - Add Acked-By from Dan
 v3:
   - Add Fixes tag
 v2:
   - Fix typo

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

