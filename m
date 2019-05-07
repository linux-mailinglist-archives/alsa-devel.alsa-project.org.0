Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF516D65
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 00:05:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA59B1813;
	Wed,  8 May 2019 00:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA59B1813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557266717;
	bh=8bZ2SNi5u2QVSusbpXgc81zwD3ctdc6DOIbG6cBw+FM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eCYqeZTCvE1Q0EbxWROaL/bba/gEIf6Co8LDJDc5EqP2mofh6btqH7wE+3fYSobrb
	 PF0TdMc7IGH1Jzf+uWadwSfFrKdVm1YhEFk7i4H2N5sr12R87Y86000CRLa+2nM5xD
	 +M855jyiUqZ3879azOw5Sayw1O4F3UpmWrSBHF7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F3AF89733;
	Wed,  8 May 2019 00:01:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17780F8972A; Wed,  8 May 2019 00:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA2E2F89725
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 00:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA2E2F89725
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Gy/JK2ho"
Received: by mail-it1-x143.google.com with SMTP id o190so743549itc.1
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 15:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGuDJR+4xPbyKsu/ODbUE97ci/DB/Fe9Iq0akCcSZNc=;
 b=Gy/JK2hoUldlBLG5FfqWprZgc844D6WxSXGn5abZEHWoE5taMPqKBzs1NrlZk/+Zp0
 u+gU+XEOw0nGOAZ+aG5ujm/DnzRpRLx1cnAxaYQ23k8wdb3nW2D04GFksRYpYkvRT2tA
 qT07M2NzLFP5PBxly9r6p6RQRA0wtT2VNuF5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGuDJR+4xPbyKsu/ODbUE97ci/DB/Fe9Iq0akCcSZNc=;
 b=nmGVidYegXB5WtyY4wb5aA+gQ6AUJ2EWE4Ejx9tJz1hBOH0pwIIWdxW7Vw1uS3EFGX
 B8H9lxO5NOtWRYgmUTXYSJ6apoY/q5BfTgnX8MaPZ2fN4S15iDv2GSfK1oIVHFjQl67B
 J/zWl2h7rYsKD5RzWD4nPIHqkp4mCP+fH/Hdaqgwq+Ifp7NO0spzikcJ7K/pnddyoyW2
 I6hITXarEIHKLc0yNqaE1xAKODFvb9FmZoR1lEKw86bNnLb0vn5NdgNk/Q7pTHE8FGmu
 DNYafejg2EKOUzyGDsLj8M6L0QO8npkFyIO8xeliwzj8+NenGmrPGWVhmOjRjQ2XiIf2
 ppjw==
X-Gm-Message-State: APjAAAUWVepdXqW/+uh3PqakIbHheERto0I8GK804OukuQhCNU929RJh
 LbijUJwInpPYSjX8v14MYzLO5Q==
X-Google-Smtp-Source: APXvYqzjYRsAnAcTjkYq8saEVQ3kxOgMYSUHCVuaTbmHNAUJwuXyd+wNpRFraBnYY/yUaY24BvN9rg==
X-Received: by 2002:a05:660c:443:: with SMTP id
 d3mr601501itl.147.1557266502667; 
 Tue, 07 May 2019 15:01:42 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id 140sm171151itv.44.2019.05.07.15.01.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 15:01:41 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 May 2019 16:01:15 -0600
Message-Id: <20190507220115.90395-4-fletcherw@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190507220115.90395-1-fletcherw@chromium.org>
References: <20190507220115.90395-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v5 3/3] ASoC: rt5677: fall back to DT prop
	names on error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The rt5677 driver uses ACPI-style property names to read from the
device API. However, these do not match the property names in _DSD
used on the Chromebook Pixel 2015, which are closer to the Device Tree
style.  Unify the two functions for reading from the device API so that
they try ACPI-style names first and fall back to the DT names on error.

With this patch, plugging and unplugging the headphone jack switches
between headphones and speakers automatically.

Signed-off-by: Fletcher Woodruff <fletcherw@chromium.org>
---
 sound/soc/codecs/rt5677.c | 74 +++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 091ef3e78fe3d2..3a4796cabd18ea 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4998,48 +4998,50 @@ static const struct acpi_device_id rt5677_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, rt5677_acpi_match);
 
-static void rt5677_read_acpi_properties(struct rt5677_priv *rt5677,
+static void rt5677_read_device_properties(struct rt5677_priv *rt5677,
 		struct device *dev)
 {
 	u32 val;
 
-	if (!device_property_read_u32(dev, "DCLK", &val))
-		rt5677->pdata.dmic2_clk_pin = val;
+	rt5677->pdata.in1_diff =
+		device_property_read_bool(dev, "IN1") ||
+		device_property_read_bool(dev, "realtek,in1-differential");
 
-	rt5677->pdata.in1_diff = device_property_read_bool(dev, "IN1");
-	rt5677->pdata.in2_diff = device_property_read_bool(dev, "IN2");
-	rt5677->pdata.lout1_diff = device_property_read_bool(dev, "OUT1");
-	rt5677->pdata.lout2_diff = device_property_read_bool(dev, "OUT2");
-	rt5677->pdata.lout3_diff = device_property_read_bool(dev, "OUT3");
+	rt5677->pdata.in2_diff =
+		device_property_read_bool(dev, "IN2") ||
+		device_property_read_bool(dev, "realtek,in2-differential");
 
-	device_property_read_u32(dev, "JD1", &rt5677->pdata.jd1_gpio);
-	device_property_read_u32(dev, "JD2", &rt5677->pdata.jd2_gpio);
-	device_property_read_u32(dev, "JD3", &rt5677->pdata.jd3_gpio);
-}
+	rt5677->pdata.lout1_diff =
+		device_property_read_bool(dev, "OUT1") ||
+		device_property_read_bool(dev, "realtek,lout1-differential");
 
-static void rt5677_read_device_properties(struct rt5677_priv *rt5677,
-		struct device *dev)
-{
-	rt5677->pdata.in1_diff = device_property_read_bool(dev,
-			"realtek,in1-differential");
-	rt5677->pdata.in2_diff = device_property_read_bool(dev,
-			"realtek,in2-differential");
-	rt5677->pdata.lout1_diff = device_property_read_bool(dev,
-			"realtek,lout1-differential");
-	rt5677->pdata.lout2_diff = device_property_read_bool(dev,
-			"realtek,lout2-differential");
-	rt5677->pdata.lout3_diff = device_property_read_bool(dev,
-			"realtek,lout3-differential");
+	rt5677->pdata.lout2_diff =
+		device_property_read_bool(dev, "OUT2") ||
+		device_property_read_bool(dev, "realtek,lout2-differential");
+
+	rt5677->pdata.lout3_diff =
+		device_property_read_bool(dev, "OUT3") ||
+		device_property_read_bool(dev, "realtek,lout3-differential");
 
 	device_property_read_u8_array(dev, "realtek,gpio-config",
-			rt5677->pdata.gpio_config, RT5677_GPIO_NUM);
-
-	device_property_read_u32(dev, "realtek,jd1-gpio",
-			&rt5677->pdata.jd1_gpio);
-	device_property_read_u32(dev, "realtek,jd2-gpio",
-			&rt5677->pdata.jd2_gpio);
-	device_property_read_u32(dev, "realtek,jd3-gpio",
-			&rt5677->pdata.jd3_gpio);
+				      rt5677->pdata.gpio_config,
+				      RT5677_GPIO_NUM);
+
+	if (!device_property_read_u32(dev, "DCLK", &val) ||
+	    !device_property_read_u32(dev, "realtek,dmic2_clk_pin", &val))
+		rt5677->pdata.dmic2_clk_pin = val;
+
+	if (!device_property_read_u32(dev, "JD1", &val) ||
+	    !device_property_read_u32(dev, "realtek,jd1-gpio", &val))
+		rt5677->pdata.jd1_gpio = val;
+
+	if (!device_property_read_u32(dev, "JD2", &val) ||
+	    !device_property_read_u32(dev, "realtek,jd2-gpio", &val))
+		rt5677->pdata.jd2_gpio = val;
+
+	if (!device_property_read_u32(dev, "JD3", &val) ||
+	    !device_property_read_u32(dev, "realtek,jd3-gpio", &val))
+		rt5677->pdata.jd3_gpio = val;
 }
 
 struct rt5677_irq_desc {
@@ -5283,20 +5285,18 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 		match_id = of_match_device(rt5677_of_match, &i2c->dev);
 		if (match_id)
 			rt5677->type = (enum rt5677_type)match_id->data;
-
-		rt5677_read_device_properties(rt5677, &i2c->dev);
 	} else if (ACPI_HANDLE(&i2c->dev)) {
 		const struct acpi_device_id *acpi_id;
 
 		acpi_id = acpi_match_device(rt5677_acpi_match, &i2c->dev);
 		if (acpi_id)
 			rt5677->type = (enum rt5677_type)acpi_id->driver_data;
-
-		rt5677_read_acpi_properties(rt5677, &i2c->dev);
 	} else {
 		return -EINVAL;
 	}
 
+	rt5677_read_device_properties(rt5677, &i2c->dev);
+
 	/* pow-ldo2 and reset are optional. The codec pins may be statically
 	 * connected on the board without gpios. If the gpio device property
 	 * isn't specified, devm_gpiod_get_optional returns NULL.
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
