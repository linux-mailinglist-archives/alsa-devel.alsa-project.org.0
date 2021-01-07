Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 623862ECC52
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAEEF168D;
	Thu,  7 Jan 2021 10:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAEEF168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010516;
	bh=Xb+8ZGYOsL8phfYOktmhdoM5ZtF6qa53rCXeQJjCmXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NbwT3+Ce11hfdM5P7WpidlR7RRwmMiYoBkt730Ush2nQ0++CXEeUwcLUgpSR9HmdO
	 QwClr56kjV8MAmPecgcfOztsZl3OGTKpkbiSDDZwAW+fgFNfwmT+dKuh+lVNABiwTp
	 VKqE77xUHAXcAI4A/DFJ8HfVWk5Ia4RDxDzZlgsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 667F8F804C2;
	Thu,  7 Jan 2021 10:06:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D5B6F802C4; Thu,  7 Jan 2021 10:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40F78F801F5
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 10:06:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F78F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="thzLh1N9"
Received: by mail-pj1-x1034.google.com with SMTP id z12so1098100pjn.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 01:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/v7jmcVWhLsLyT6srKRYF+HsEWNOg2R2HWvMNn5cQRg=;
 b=thzLh1N9XQZBb6ehatjpl3RV1IrUsTvfalJ8qkKkCfvmuLZmIamyMWPsW55blLBoTm
 gAF10Du7MYQzHb49+SECwk3LYEzTegp1MV2IHUMzQ42MNqiALmnduXx2hkzgueb4l+86
 hC4RRfjEGmHg8erprT66SX7aH6QzvirlZwO8nkFgaM/BK+FleonRX6MUN21Y+Bstnlq4
 nmIF5YQUwrTAkqDpnnpNYGa4ZllHsNtV8P5pnIlWx07N6mPnDxnmb43vnazJGze8K4LN
 /Z5rMY8hog+An2FfKZmeMnC+AGfe5giwSnr/QflijlcuPkijB2ALnG8a8hgXJP450l4E
 5g7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/v7jmcVWhLsLyT6srKRYF+HsEWNOg2R2HWvMNn5cQRg=;
 b=JGjJwu8cBIwN7nHU4k/odSPVNXklcR7aw8oPc0uPNUsmB3tIAPRCM388VtGDtKCa+6
 UfOiwbvV6B7qA2GbQp4I6CtKp1ZEChBZbq/Qa6tM7SohZv1ttsKSCKqXqsQtyjUjsyNk
 ALBeYvZb0/vEsIIc0LUK7rOOA2Uc6qUztdIXsMejdTzEjpnk0urS0gIvZF5bepD7A8iK
 /NLeaCGwIuelWIvD2eYkvfdD7G9b0Aa+xo1AKvoFg09braqzUqe3fKShoNO+VD+mTpvA
 Oe4P+42D78sCssuxUjN96RSKpAIf1n/sGlGzhHo6xy5eCZkNoQhyVod2eLgfViPwsBT/
 Y6Aw==
X-Gm-Message-State: AOAM530EJZprOPcPU6qjnbT8crES1XqwHQAde5aVzHoMY61R1aX+ndWj
 MZw+o6CjqqzzuzRxqV0eo1spww==
X-Google-Smtp-Source: ABdhPJySebxs1m5St5fhhjLE4vYi0pG/2f2WyTXIaNm/Vx7xOnk8LVyFMk5gka4dCbStVDkx5On6Hw==
X-Received: by 2002:a17:90a:f40e:: with SMTP id
 ch14mr8326062pjb.172.1610010401941; 
 Thu, 07 Jan 2021 01:06:41 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id b2sm5006394pfo.164.2021.01.07.01.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:06:41 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 1/4] ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
Date: Thu,  7 Jan 2021 17:06:22 +0800
Message-Id: <20210107090625.107078-2-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210107090625.107078-1-chiu@endlessos.org>
References: <20210107090625.107078-1-chiu@endlessos.org>
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

