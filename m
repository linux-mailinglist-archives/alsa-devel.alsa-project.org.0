Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9752ECE45
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 11:55:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7877168D;
	Thu,  7 Jan 2021 11:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7877168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610016948;
	bh=8+iwY3VC2agUxbO5q7ctp7r8IIuVv5+RFLHQUqnuDDM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ML2pjxNdeDRltbXPYjF8g4ICK+2Yd0aa8e71LTAh5PQp0ZDtVsLTC0CH+oIjYSiyr
	 KikZ3Cb4NUvHZJBbXmKPI+SJSMCEp80gZmv2jG1F7MSzcfhcXVafoc/HVIn9XnuIoS
	 slf48qj7JhqjSVCSacvmaY+8m1l+TA83f9THDeCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B70F80271;
	Thu,  7 Jan 2021 11:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9230F804BD; Thu,  7 Jan 2021 11:54:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F42BF801F5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 11:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F42BF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="XgAYbgAD"
Received: by mail-pj1-x1035.google.com with SMTP id j13so3469106pjz.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 02:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12r/7rOzox/JK2DCf9N0SI8WA+cddx4BrIGJoo+tj8g=;
 b=XgAYbgADc1HGmz3Rs4DbWeqU4nQhtXSZRRLZVCYuIVRpipDojplFv45ggi6d9xCxQp
 3FnCYgwhuF3vB181VeZyIT6TiK9mS3nyQMPP//z7s/+JR5QjlpgDsFQhBK7gIXL72kFQ
 xt0iyY0j/OEyluwkq7hxLjRxqfQUnwtwyyILTiCDXpqNIHqcJafLcSAZDbxGayTlEfXA
 sHnm0Fh5jt8nxPL6xEdmVC+jT+iHytDkz1hl6YL0B29SKs9u6pPWBR7Dn58D2EtQBnKY
 rF9MSKBqRozxkwDaT/HK6T/ANwSvXfw905Zv++p9n8snqfadnLbEiphV+ZS2JkB4N/AX
 Lt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12r/7rOzox/JK2DCf9N0SI8WA+cddx4BrIGJoo+tj8g=;
 b=ESTB1TTW4soFLrzv8ECGEV1a2aBabmMeiNvQxeJZdTprSewOeKbM1LgdWnT09mDBcJ
 +QJszPW5KoU4yVeoAps8DT/pbC/tTIg28mRGf/YzfpFPyffV94xKTorvq8CTIk/TIUYJ
 +ceWPMFCW2oY1cVgs18ILaNBINknvISpjcaExr8QjaEhGu88d2z86C4Y5DUrk02UYV7x
 RGSOo+5+KA8NJCFYs1dm9bL3Cz7Ko1/z0c0oLYOKp6nGOp/exXQC5bxXZ3UeVJH1h3je
 +TMV03G2CC6EsWVN4B+/4EM8VPiM5SZTlGtVj30TaYr7TMBgLOm37iXcww7ZmK9fvbiZ
 Ji9w==
X-Gm-Message-State: AOAM530YadN65/TeRUVohaKeCnCX+zjhq/iWitIrBvHaXwvuES2/2b5r
 Mf7P2FLXD9pvlzRA64uILbKC5g==
X-Google-Smtp-Source: ABdhPJwSJlWjDnGj6RPJ/lxCdUcf40Qfbpy7gvlLcv+Fnk3pluwpeOJg8qnPEvY/6h4tPkRsn/F9Iw==
X-Received: by 2002:a17:90b:e0d:: with SMTP id
 ge13mr8557626pjb.111.1610016838576; 
 Thu, 07 Jan 2021 02:53:58 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p187sm5426042pfp.60.2021.01.07.02.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:53:58 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 1/4] ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
Date: Thu,  7 Jan 2021 18:53:26 +0800
Message-Id: <20210107105329.146988-2-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107105329.146988-1-chiu@endlessos.org>
References: <20210107105329.146988-1-chiu@endlessos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessos.org>,
 linux-kernel@vger.kernel.org, linux@endlessos.org
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

On at least one laptop (ECS EF20EA) the 'hp-detect' GPIO is defined in
the DSDT table by the ACPI GpioIo resources in _CRS. The GPIO related
information should be mapped to the rt5645 driver to enable the jack
detection also on non-DT platforms.

Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
  v1 -> v2:
        - none

 sound/soc/codecs/rt5645.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 420003d062c7..78f0ab0a008e 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -42,6 +42,8 @@ static unsigned int quirk = -1;
 module_param(quirk, uint, 0444);
 MODULE_PARM_DESC(quirk, "RT5645 pdata quirk override");
 
+static const struct acpi_gpio_mapping *cht_rt5645_gpios;
+
 #define RT5645_DEVICE_ID 0x6308
 #define RT5650_DEVICE_ID 0x6419
 
@@ -3780,7 +3782,6 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&intel_braswell_platform_data,
 	},
-	{ }
 };
 
 static bool rt5645_check_dp(struct device *dev)
@@ -3848,6 +3849,10 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 		rt5645->pdata.dmic2_data_pin = QUIRK_DMIC2_DATA_PIN(quirk);
 	}
 
+	if (cht_rt5645_gpios && has_acpi_companion(&i2c->dev))
+		if (devm_acpi_dev_add_driver_gpios(&i2c->dev, cht_rt5645_gpios))
+			dev_dbg(&i2c->dev, "Failed to add driver gpios\n");
+
 	rt5645->gpiod_hp_det = devm_gpiod_get_optional(&i2c->dev, "hp-detect",
 						       GPIOD_IN);
 
-- 
2.20.1

