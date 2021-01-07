Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC082ECC53
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 10:09:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D09168B;
	Thu,  7 Jan 2021 10:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D09168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610010557;
	bh=PMlTmQ3nXoOH1bJjVar6F8K6/GhjQ9sYb4lkPX4mFVI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jkzo3tJpkpznyY34o+uEDTN88xCdg4y0TOoECgS96MpYpCbD1dydJLmEDCsCS/8wr
	 QmRH/J82B5ybuS3gADBO3N4D0kQx6WNh+teXPmmCDZzrBn2Ki8dFfBslAv4hTWMpdl
	 F/LTm9RmIA3Pxm1QAo1VmaVJa/9K2wj3pftrYy0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A68F804BD;
	Thu,  7 Jan 2021 10:07:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F0EF804C3; Thu,  7 Jan 2021 10:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 021BFF80271
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 10:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 021BFF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="fDGKemIp"
Received: by mail-pj1-x102d.google.com with SMTP id j13so3332236pjz.3
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 01:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ViO6PydNgMGhzgsctVMRzuTtGGnQjswu8DFXv1qC3B8=;
 b=fDGKemIpa0IVex6SVvtLMLeLpbX8hwf1aTMh3SKYdzc6vf0I0zWjc36xoPzzbiEGKJ
 a17xHx8PgAgh+BZuBF4h/rwOeKWmeD9VBJ9CgkyAQqRfA5vVD11ddiMzVXu1BG3QfGrZ
 FL6etZ/dJKCXgqiBJNZOZcLa4Ha5c115UdvKOfbxJaD+Ta1i/0ZGeaJ6PR+Al2hQ78Q5
 UccaW2ZY7ujhy5a3lrhvWl8pfRZInjbCrXuZAB+2nNsqsG5HezlnXuaESVqW8Nqv8NGt
 FOStHIjeWu+onuqBmwi3grlhCu/LG35jjKZCndyA22vdym5Yuy439ulEBRmw0wnKneX8
 f7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ViO6PydNgMGhzgsctVMRzuTtGGnQjswu8DFXv1qC3B8=;
 b=fryle2muTW9MHV6u0gV7wymrao5MfaVnPTm2SHse6bCAatLLRnL7Erkvl7gei/cJbo
 GgN466GbUoAc2dXSqDlnC7xhMUcvz3LRjE93A24fInTH2n+aQfN/y/1lM26fqCgub9W2
 JfzGFPnjAgPXHB5oVB9uiLKmQXT7bAkMkh7/MS63eQe/AMRsU00zQF2XoIwKLl53Z6fv
 7Z3/0szPzdiJoVhQOGNMBEv5d5Ydv7TdTlp0broDofF5ldAsS3/uvLmXGZ9WWQBIWprE
 wnscu2FXdlQ/Yd0IENgTjQ13Y7uUQDbLkdRfB00VAUbRQA3RfLG8RZzU5furo//pdLIy
 uZUQ==
X-Gm-Message-State: AOAM5304Ta262+m5w8p5hcw4JMT+IM2nUBLpwRxA8ewPuPWWkrW6mOBE
 +0DCZr3V2/cXl5xLhgTcA2z+Iw==
X-Google-Smtp-Source: ABdhPJyQ1BWvEYxS4zI9slZsnUqXT+CnmasvCM1QErDNZiba0rcM9PTPxUq5ZQnbX6d1WRr2XQmfRg==
X-Received: by 2002:a17:90a:1a10:: with SMTP id
 16mr8177738pjk.42.1610010404772; 
 Thu, 07 Jan 2021 01:06:44 -0800 (PST)
Received: from endless.endlessm-sf.com
 (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
 by smtp.googlemail.com with ESMTPSA id b2sm5006394pfo.164.2021.01.07.01.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:06:44 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 2/4] ASoC: rt5645: Add ACPI-defined GPIO for ECS EF20 series
Date: Thu,  7 Jan 2021 17:06:23 +0800
Message-Id: <20210107090625.107078-3-chiu@endlessos.org>
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
 sound/soc/codecs/rt5645.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 78f0ab0a008e..24a6acb3c12f 100644
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
 };
 
 static bool rt5645_check_dp(struct device *dev)
-- 
2.20.1

