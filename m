Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B617520D38
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 07:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEE00846;
	Tue, 10 May 2022 07:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEE00846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652160715;
	bh=/k6VFQ9t/ronBLztUmAlQro3MBzNH8LigzxDBXwFkC4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZTyjzYrUA1758GrqsIOYOGTsek45fDzg9hOguD55Z4XjLMYRVpBeunHSqyoHYO2qt
	 F4vExTPm4ng3ScrG8IuQEMtHzpmhzEDs+650fBF7ydTsnHX2r/OjvBIzHaa0rWT32o
	 Xzw3VFoLRBw045eCyorpZ6xaSxZPfRKtzER91+pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 892AAF801F5;
	Tue, 10 May 2022 07:30:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49666F8019D; Tue, 10 May 2022 07:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C51CCF8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 07:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51CCF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jw/srrS0"
Received: by mail-pl1-x634.google.com with SMTP id m12so2062219plb.4
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 22:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mZBTRCetz4f8JjwfC8Y2BGBpMlfsgeXFFqeHVV3ckOA=;
 b=jw/srrS0ZfUDJ8keMulrQPjAw7MT4o+47nOXcHWUxrKOxQL4O5nQUr8Kq49LQ0Go5D
 GrF0x3TZyChuMYBM+dernNDY1QslDGXEUP4tf3snZB+mX21Uo52ie19mIBalAUtYUg3M
 qhweROzoXjmE6g2BeBbrhYwjGoE/1KMVDw9p9WnfJ+66cqDUbDLFO0F+n/6+fJHuWotA
 z1tLeE/ziJT0rDUi/yB9NEIKjB+Mst4G6oQatN7f3fjAjdLqqN2Yq/ieWMyUntP4pOoj
 d8zPL+Mg+sQd2L3/rEbvDTc84woLxjljrLXTFFSYSeBRC//k1HtKA5sd7BqbqNgmZ2wR
 Tkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mZBTRCetz4f8JjwfC8Y2BGBpMlfsgeXFFqeHVV3ckOA=;
 b=v18xNw1oRnsGb+8ZGaJIAZ1ejxqdwuWIcK/vU2JaurC50PL245zXtyhbYXXCkJ9FUR
 2BJpeqFKUe2P7o6DBvLajyJ1RIBhKThpCO27fle2iyO3pcLeTdCgOzHCFiXJRTdM9SQ/
 1j+V63Jfm+qlu9fGLQq8nbNc/Yb2JE9oGMNMiLyXKPpyzAM42kejHPJ5j8oedhcxJweA
 2iYIdXyGSotxKE5o+y3kuWwOU/mdFYRqQwaxQFd+7iTspwumt2FhTfkrfqT9oQV2AWAv
 w26MImeM7Sn0ahNpVjPygI481NxTGVcuZipUUiP5dOi6sGbpnZoslOjcHovzsQbEf+Mm
 kVMw==
X-Gm-Message-State: AOAM5306Di1TGxc1l9Jw/iaOJfS6HOlA+Y+xD3BmMe3bhPb37Og8rCcm
 TPvS+Mo3lbtV/1qDHn3YzQ==
X-Google-Smtp-Source: ABdhPJww23i8t0fb9Ibrlq2hy+Be5xXcM/Aqi2CmI/X1KigvrQ83dU1sRY+YbgPQjrmP6cYYQBxZ2g==
X-Received: by 2002:a17:902:e5c7:b0:15e:9bba:d4dc with SMTP id
 u7-20020a170902e5c700b0015e9bbad4dcmr18989466plf.95.1652160648124; 
 Mon, 09 May 2022 22:30:48 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 205-20020a6219d6000000b0050dc762814bsm9676527pfz.37.2022.05.09.22.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 22:30:47 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2] ASoC: tlv320adcx140: Register a callback to disable the
 regulator_disable
Date: Tue, 10 May 2022 13:30:31 +0800
Message-Id: <20220510053031.1685337-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org
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

The driver should register a callback that will deal with the disabling
when it fails to probe.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
Changes in v2:
    - Generate the patch based on the latest source tree
---
 sound/soc/codecs/tlv320adcx140.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 0b06fbb14171..b55f0b836932 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1083,6 +1083,13 @@ static const struct of_device_id tlv320adcx140_of_match[] = {
 MODULE_DEVICE_TABLE(of, tlv320adcx140_of_match);
 #endif
 
+static void adcx140_disable_regulator(void *arg)
+{
+	struct adcx140_priv *adcx140 = arg;
+
+	regulator_disable(adcx140->supply_areg);
+}
+
 static int adcx140_i2c_probe(struct i2c_client *i2c)
 {
 	struct adcx140_priv *adcx140;
@@ -1112,6 +1119,10 @@ static int adcx140_i2c_probe(struct i2c_client *i2c)
 			dev_err(adcx140->dev, "Failed to enable areg\n");
 			return ret;
 		}
+
+		ret = devm_add_action_or_reset(&i2c->dev, adcx140_disable_regulator, adcx140);
+		if (ret)
+			return ret;
 	}
 
 	adcx140->regmap = devm_regmap_init_i2c(i2c, &adcx140_i2c_regmap);
-- 
2.25.1

