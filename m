Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C49C2F0C97
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 06:45:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0188116BD;
	Mon, 11 Jan 2021 06:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0188116BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610343914;
	bh=ZGeg1DKO9DrevWyKHE1un4rJxcXH+LYmxbXeo+38bGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YY6IlGnwGRbh3r7Jx+jYZVDweJ/4IvvHCUWKMzjHDEp7NHOz1injg7dWo+yIIeXJV
	 cDS6OM4T40H+gRzPt7cBC0Jvalr9b9Q9yUAMAHFaOs2QM8+be5H/KBhhJ7mvVNppuw
	 CzccQ2hvwqbqazFyBZLQybQkMw7d2qJG3tx0aaUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D77F804C2;
	Mon, 11 Jan 2021 06:43:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3695DF8026B; Mon, 11 Jan 2021 06:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D624EF8016C
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 06:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D624EF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="L3RdQOOF"
Received: by mail-pj1-x102d.google.com with SMTP id n3so7728015pjm.1
 for <alsa-devel@alsa-project.org>; Sun, 10 Jan 2021 21:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yOQr05X+xX/KVtl6ApOJMHz2x0Vp5f60Ndun7HKg7HU=;
 b=L3RdQOOFDqLy+Q2epvPbmWxfDdRAZEIDt/5MrRzq9uZlTDyDlHAd/IW6PqM9BDa9m0
 xu/HGX3lw5FxV89PaNXMd/ZQ+nehmfgl79++uj65aKFA5fBxgYK12sSCmEiG/iOgKC7M
 J4Ku96aXby/ig0iLiiS9cy+EJag+V+MU0fQNF8bGa8rTz7qMbN26oIFPr5wXAwsPHFS8
 l4dKkTzUop0Sju7/iw26KVWg+xd938tz+rsVRdmYXO3sC83CU4jaGMLod4FULsQXp1ek
 EejB3oLBcAvY3q2mS18mLymZytyieNro4puOVVsYdKAIzkopXApEBd7RXONI3sJ+DsxK
 PIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOQr05X+xX/KVtl6ApOJMHz2x0Vp5f60Ndun7HKg7HU=;
 b=eYSKjsCsF4A1v4+GFrDZUqnoXH3NRZCWiMSYdDOt0l317u0MHfQZNOgXq/eysXtIkO
 RYuliZ4stw2eBrUj0oKwKNc1Py7ZwPjqVS+Kyh+g2FNoMWn6oBe/gBreo27txtGA1Id9
 2hGpHpL2vCSV0Q5Uv7TP6xxWiHzUChHx0Ci3kTUk2O9uAN/fTTQjrcOZn8CFsIn5pV8G
 a/6b5Lc8rGWW/iYTbivPgMRWTmzE1sQTkaCWfbvzkk85y0EkTvw/Yr9DGkCUuqjg/V7z
 uM7vSjssQr/yE6bUwCRTsAgfpkn6QXEKPl/HExgfU1xLLD256QOM4ci7ZTNbWQWoMVqu
 LC3g==
X-Gm-Message-State: AOAM532/MZEBk7LvxH8rP9apF2LCeG8cYJWir+LkfyiriDJVkQMXzNlX
 7gKuuMwuhq4ZImTnFtf3GCP7Pg==
X-Google-Smtp-Source: ABdhPJw2ONFbNDwJMu27VEV4P16I/0rFc3iebLBY5JaKpGsgPjcU3McVOX/JWuuKs9nxla1GZwIrrA==
X-Received: by 2002:a17:90a:6d62:: with SMTP id
 z89mr16567631pjj.71.1610343799816; 
 Sun, 10 Jan 2021 21:43:19 -0800 (PST)
Received: from localhost.localdomain (61-231-198-38.dynamic-ip.hinet.net.
 [61.231.198.38]) by smtp.googlemail.com with ESMTPSA id
 x15sm16726267pfn.118.2021.01.10.21.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:43:19 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 2/4] ASoC: rt5645: Add ACPI-defined GPIO for ECS EF20 series
Date: Mon, 11 Jan 2021 13:41:39 +0800
Message-Id: <20210111054141.4668-3-chiu@endlessos.org>
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

Add the hp-detect gpio for ECS EF20 series laptops based on the
_CRS defined in DSDT table.

Method (_CRS, 0, NotSerialized)
{
  Name (SBUF, ResourceTemplate ()
  {
    I2cSerialBusV2 (0x001A, ControllerInitiated, 0x00061A80,
        AddressingMode7Bit, "\\_SB.PCI0.I2C2",
        0x00, ResourceConsumer, , Exclusive,
        )
    GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x0000,
        "\\_SB.GPO3", 0x00, ResourceConsumer, ,
        )
        {   // Pin list
            0x004F
        }
    GpioIo (Shared, PullDefault, 0x0000, 0x0000, IoRestrictionInputOnly,
        "\\_SB.GPO3", 0x00, ResourceConsumer, ,
        )
        {   // Pin list
            0x004F
        }
  })
  Return (SBUF) /* \_SB_.PCI0.I2C2.RTK2._CRS.SBUF */
}

Signed-off-by: Chris Chiu <chiu@endlessos.org>
---
  v2 -> v3:
        - restore the terminator {} of the dmi_platform_data[]
  v1 -> v2:
        - Invoke callback() of the DMI quirk if it exists.

 sound/soc/codecs/rt5645.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index af8f95644f11..770801de42a6 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3653,6 +3653,19 @@ static const struct rt5645_platform_data kahlee_platform_data = {
 	.jd_mode = 3,
 };
 
+static const struct acpi_gpio_params ef20_hp_detect = { 1, 0, false };
+
+static const struct acpi_gpio_mapping cht_rt5645_ef20_gpios[] = {
+	{ "hp-detect-gpios", &ef20_hp_detect, 1 },
+	{ },
+};
+
+static int cht_rt5645_ef20_quirk_cb(const struct dmi_system_id *id)
+{
+	cht_rt5645_gpios = cht_rt5645_ef20_gpios;
+	return 1;
+}
+
 static const struct dmi_system_id dmi_platform_data[] = {
 	{
 		.ident = "Chrome Buddy",
@@ -3782,6 +3795,20 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&intel_braswell_platform_data,
 	},
+	{
+		.ident = "EF20",
+		.callback = cht_rt5645_ef20_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "EF20"),
+		},
+	},
+	{
+		.ident = "EF20EA",
+		.callback = cht_rt5645_ef20_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "EF20EA"),
+		},
+	},
 	{ }
 };
 
-- 
2.20.1

