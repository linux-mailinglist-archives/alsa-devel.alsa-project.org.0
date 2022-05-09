Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4CF51F760
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 11:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5149F18B8;
	Mon,  9 May 2022 11:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5149F18B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652086851;
	bh=2JBUJWoR4th6ORhkmKKOK3+wW6I+/EVtmzCmPqbHVLA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nODKDMcSF8ozXt3E4sArLE8GtZTwUhXICUj2EUqoEIwl2om84ZopRzh2DHh3y8b9l
	 CRyowFutBrEPJ/Fv2yJJzaKMfwcL505OnxcpXTMA8rBjJsa4Jc4B73wVwakVSagFSb
	 GyDRIpiKHJH1qGGR45X+QbV7VY4e6a+y4c/LapMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B21A1F8014C;
	Mon,  9 May 2022 10:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32498F8025D; Mon,  9 May 2022 10:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88766F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88766F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RTlCVXMR"
Received: by mail-pl1-x632.google.com with SMTP id i17so13234483pla.10
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sx4X5idiTB8diHSkHofGP7McwC9VOX2bxNNbtsqQ25g=;
 b=RTlCVXMRkBRx7ZUc8I4lCbIk1BB+b9OR4ZKDkuCW8re6QEYw7hwZB3O7t3HZGsPpVX
 8+9CANeoTlvXFyxID9IUrFZjtLX0lgWFhRDKB/IJb6m701ulacPVPInNOwbjLcsWsC6a
 rA2O4a98nRz8o+wDHPdBKWhfGRmn2ynDZL8uY5Guat4KzCLWX90WLm3yB6v57kyC+cfF
 29QLm4X/ty4ir2S1FKPJbujvf7oIyRJV30Xrr+IE2OfkfbeLKbifEX6EgJz81u46grF1
 Pn05W4Y+UCDp6zj7rasqXbbiiTzyqgQ+P0uSo6PDguSEeh7uKwseBPSKhnG6rUS1F/3v
 0waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sx4X5idiTB8diHSkHofGP7McwC9VOX2bxNNbtsqQ25g=;
 b=26zhv5Y27kER+z4RIcLYFbytSzymsFMJ0eqNRqy8JUq6UNALlxOFI3c1b9euuW16tH
 gblh56emVeotUWMb63FKc9vsh0KUlhhiAitAET7AScPtav91rtzp9wOJsxNoR7sAuf0V
 gOO4HSvOkfsjq6xbcSMYKbfn5qwEUiYB24v2vPq+laUbkC/iZmJM0vR+woymRfq+GzIl
 oLgWG+80ivDsD+fTBZ79nXg7ROEFijXAHTrTlE2PBT2onjnDvNOlZQl6G7Cv7aTnIWdO
 Ub5hCJRN/pVFRk7xJ3RNpZSEwbeYR5gFxj/w0vxqpXfsDIqA9+t4WG5hkK9xlW6wGVGB
 uPBQ==
X-Gm-Message-State: AOAM530DoQmKcHM5jSSS65ceJXNJAYJllfotLEMc6cBUKibcDZsn/eWu
 PDrPpOIxir4EpIq3x6HQ6Q==
X-Google-Smtp-Source: ABdhPJwSUOEf5enWGUDjDGUYXVYfE7P7K5G3N+W0oPGsMNLPlQZ1JtL9o+AiSKOGqoPSgCM6dHWZWA==
X-Received: by 2002:a17:90b:3445:b0:1d6:91a5:29fe with SMTP id
 lj5-20020a17090b344500b001d691a529femr25286739pjb.138.1652086784472; 
 Mon, 09 May 2022 01:59:44 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a1709028c8f00b0015e8d4eb1d7sm6455346plo.33.2022.05.09.01.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 01:59:44 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: tlv320adcx140: Register a callback to disable the
 regulator_disable
Date: Mon,  9 May 2022 16:59:25 +0800
Message-Id: <20220509085925.1548328-1-zheyuma97@gmail.com>
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
 sound/soc/codecs/tlv320adcx140.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 32b120d624b2..f70ea59259f1 100644
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
 static int adcx140_i2c_probe(struct i2c_client *i2c,
 			     const struct i2c_device_id *id)
 {
@@ -1113,6 +1120,10 @@ static int adcx140_i2c_probe(struct i2c_client *i2c,
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

