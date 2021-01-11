Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433522F0C98
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 06:45:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15C316D6;
	Mon, 11 Jan 2021 06:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15C316D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610343959;
	bh=Sumx0Ps5kXpKF6T6bCZ0dLxRobtzXZQ5jXM3zLNi/MY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ti2jX6UGFfvT/onVpU39dJm4UN2Xe9lSWqSFwC0l7ziQAsl/i6ojVgJS94Ld3hKNG
	 NeEz7gzjFKT1IwIGiZ18PHNT4+vrXaabpsbwFkxgWZnHakOMZ6VA3Eazsuy8k3QnU2
	 J/YXpElmaBTdYwkE32KPA6lXOYCO+w6pttjAektw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C09F8016D;
	Mon, 11 Jan 2021 06:43:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64CB3F8025F; Mon, 11 Jan 2021 06:43:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77948F800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 06:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77948F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="vNYf09dS"
Received: by mail-pl1-x634.google.com with SMTP id x18so8921150pln.6
 for <alsa-devel@alsa-project.org>; Sun, 10 Jan 2021 21:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cZ/EQIt6H/y8SQLMWPm2hmgqxZ9ZXY3uZLH1G1eLd6I=;
 b=vNYf09dSEmnLqjpb9fwlPPtOVuiCpYHZhpUrFh4vGT2j14zeEUKsCQrBXONT+LscW2
 O/3PHI6D27Q3O2R/beN3nYGGWj7WdBsRWKxfc7nCrxTKG51JB3FIjL/j7DwfAdEnubow
 L90DGccWjme4lkmESgGM0EYinKWHQsH8R4JS0BDU6jQV1RAxP+1J9uzepmR7sYAffN0P
 VBSJTbpaip0InnrLeTM6WhESqC76gvq5bNozmQZpoPyteXOH0CxUMZjsMEjWU2HJfvHY
 f7LmdaG9uzDGnZO6hl3LPzyH2FvX0WQmIDcEmnefGMHkhuAp0YRi5Vr6QanrjGZI1LZm
 GSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cZ/EQIt6H/y8SQLMWPm2hmgqxZ9ZXY3uZLH1G1eLd6I=;
 b=DMhFBw7OKCSBfEsHPpcXalauhzUQmUaI0tThRwj0ZhHIjVQPRfVc9wlZPqlGp/066R
 AcFvN+hGkS6F5uIyhtwoiePrXOwY738x9I4kJvbgaQ01neAl/+aVqcq+yQbxcxgQfdZm
 kH7ksyeLUJzVjRzFZeLGujHsNtqK4wSQLYHFswO8f7O7FLfdyDMgDV1+9N0sjHeV5mDR
 9bd6H2+53/Gm0sUa2WVEug/1yHLgZhArG5U3suaZB/6x7j2+52miCZfHv5jjwwPyrcGX
 t9FlwOWZzWZ+74KnyajkF20cObFOw2bZqP+e7rGeHtM1V7dL0IX+a8nutCJX22mv6LKx
 JnEw==
X-Gm-Message-State: AOAM530ZABoaUEdLcZ7reACjA2UViFD/721iPLRQ6qIE6ceihFi6bDwo
 GuNCGpIrhlRrvlEsa7bQfQ9RLA==
X-Google-Smtp-Source: ABdhPJygrqxArlu5P5B8h2ks1EBMZPzSzd2paE64adL5FqbBS1d+WCnpwz4d40w1WmhkvzazRazv3A==
X-Received: by 2002:a17:902:ba97:b029:db:f662:a547 with SMTP id
 k23-20020a170902ba97b02900dbf662a547mr17654842pls.68.1610343797639; 
 Sun, 10 Jan 2021 21:43:17 -0800 (PST)
Received: from localhost.localdomain (61-231-198-38.dynamic-ip.hinet.net.
 [61.231.198.38]) by smtp.googlemail.com with ESMTPSA id
 x15sm16726267pfn.118.2021.01.10.21.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:43:17 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 1/4] ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
Date: Mon, 11 Jan 2021 13:41:38 +0800
Message-Id: <20210111054141.4668-2-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210111054141.4668-1-chiu@endlessos.org>
References: <20210111054141.4668-1-chiu@endlessos.org>
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
  v2 -> v3:
	- restore the terminator {} of the dmi_platform_data[]
  v1 -> v2:
        - none

 sound/soc/codecs/rt5645.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 420003d062c7..af8f95644f11 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -42,6 +42,8 @@ static unsigned int quirk = -1;
 module_param(quirk, uint, 0444);
 MODULE_PARM_DESC(quirk, "RT5645 pdata quirk override");
 
+static const struct acpi_gpio_mapping *cht_rt5645_gpios;
+
 #define RT5645_DEVICE_ID 0x6308
 #define RT5650_DEVICE_ID 0x6419
 
@@ -3848,6 +3850,10 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
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

