Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B643C357C95
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 08:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887FB16DF;
	Thu,  8 Apr 2021 08:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887FB16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617863160;
	bh=/Pf7gptIKvFpRxx8OUKcpfm/E4qI+642KBMYMSo/xGI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=idX2WFDacX750WZeKlnT5Xi59QO+Toc5u8e0j6RTPCe0UBOfiJWXFl6SQZHZUPvs6
	 7Ayz2v5PB/cUavqqr+ThxCi2qbwB7yzTc+nSt1QQL4JYAzn59sMkUH8A1L3YQPe4s2
	 9EMI8+0vxGHCZb5iZBmyFBZHwg8fB8gdQyZuleMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22D12F80246;
	Thu,  8 Apr 2021 08:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACC43F8020B; Thu,  8 Apr 2021 08:25:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92410F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 08:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92410F800BD
Received: from localhost (localhost [127.0.0.1])
 by router.aksignal.cz (Postfix) with ESMTP id 92E4F420E1;
 Thu,  8 Apr 2021 08:24:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
 by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id Sp3bXXX5El-r; Thu,  8 Apr 2021 08:24:54 +0200 (CEST)
Received: from pc-gameroom.prchals.tk (unknown [83.240.30.185])
 (Authenticated sender: jiri.prchal@aksignal.cz)
 by router.aksignal.cz (Postfix) with ESMTPSA id 30D07420E0;
 Thu,  8 Apr 2021 08:24:54 +0200 (CEST)
From: Jiri Prchal <jiri.prchal@aksignal.cz>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: tlv320aic3x: add AIC3106
Date: Thu,  8 Apr 2021 08:24:50 +0200
Message-Id: <20210408062450.7835-1-jiri.prchal@aksignal.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, Liam Girdwood <lgirdwood@gmail.com>
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

In DT binding is mentioned that this driver is compatible with 3106.
So added compatibility string and model number.

Signed-off-by: Jiri Prchal <jiri.prchal@aksignal.cz>
---
 sound/soc/codecs/tlv320aic3x-i2c.c | 2 ++
 sound/soc/codecs/tlv320aic3x-spi.c | 2 ++
 sound/soc/codecs/tlv320aic3x.h     | 1 +
 3 files changed, 5 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
index 4535bb8dbadc..cd0558ed4dd4 100644
--- a/sound/soc/codecs/tlv320aic3x-i2c.c
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -40,6 +40,7 @@ static const struct i2c_device_id aic3x_i2c_id[] = {
 	{ "tlv320aic33", AIC3X_MODEL_33 },
 	{ "tlv320aic3007", AIC3X_MODEL_3007 },
 	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ "tlv320aic3106", AIC3X_MODEL_3106 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aic3x_i2c_id);
@@ -49,6 +50,7 @@ static const struct of_device_id aic3x_of_id[] = {
 	{ .compatible = "ti,tlv320aic33" },
 	{ .compatible = "ti,tlv320aic3007" },
 	{ .compatible = "ti,tlv320aic3104" },
+	{ .compatible = "ti,tlv320aic3106" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, aic3x_of_id);
diff --git a/sound/soc/codecs/tlv320aic3x-spi.c b/sound/soc/codecs/tlv320aic3x-spi.c
index bd78ab0910da..8c7b6bb9223f 100644
--- a/sound/soc/codecs/tlv320aic3x-spi.c
+++ b/sound/soc/codecs/tlv320aic3x-spi.c
@@ -45,6 +45,7 @@ static const struct spi_device_id aic3x_spi_id[] = {
 	{ "tlv320aic33", AIC3X_MODEL_33 },
 	{ "tlv320aic3007", AIC3X_MODEL_3007 },
 	{ "tlv320aic3104", AIC3X_MODEL_3104 },
+	{ "tlv320aic3106", AIC3X_MODEL_3106 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, aic3x_spi_id);
@@ -54,6 +55,7 @@ static const struct of_device_id aic3x_of_id[] = {
 	{ .compatible = "ti,tlv320aic33" },
 	{ .compatible = "ti,tlv320aic3007" },
 	{ .compatible = "ti,tlv320aic3104" },
+	{ .compatible = "ti,tlv320aic3106" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, aic3x_of_id);
diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
index 00908f1734a7..7e0063913017 100644
--- a/sound/soc/codecs/tlv320aic3x.h
+++ b/sound/soc/codecs/tlv320aic3x.h
@@ -20,6 +20,7 @@ int aic3x_remove(struct device *dev);
 #define AIC3X_MODEL_33 1
 #define AIC3X_MODEL_3007 2
 #define AIC3X_MODEL_3104 3
+#define AIC3X_MODEL_3106 4
 
 /* AIC3X register space */
 #define AIC3X_CACHEREGNUM		110
-- 
2.25.1

