Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E4F2ECE49
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 11:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DF01674;
	Thu,  7 Jan 2021 11:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DF01674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610016989;
	bh=Zc5zLnW0zCbyh7U5LYFUoQYTj4XRMVhlWJFZ6GCb6PQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L6bgADY1bktvgx9vLPj3CeNIxcobm+YF1wGCoMEewZhHXWojpqmo5WRgCMJf/pwfH
	 OpFTmBwzMC9g1EzPYFsDGNeAaVxtiEMzAr45C37qJq1f85XB5YqM2iP/zH/15Mmb0S
	 786c2TnMeopfjKk4vIMMxZAMIbNRGOOVDfouZ8/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE33F804CA;
	Thu,  7 Jan 2021 11:54:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9B01F8049C; Thu,  7 Jan 2021 11:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA43FF80271
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 11:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA43FF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="HwxIRamI"
Received: by mail-pj1-x102f.google.com with SMTP id z12so1228250pjn.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 02:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXRukigj1iHMoS+zrcnuLFVozC6TWaz57QCscXGkcCw=;
 b=HwxIRamI6tKzP/RTL3p6ielXV0TT8QwY+6wdetq7ByGFKnicsZfEQQMkN9TSjZTtBz
 ADN8/bXZFlglNZIYZ8BrZ2w7jzfkG1wrphN0a8reVaB6CcL4qEoip8nHtvidtcLCtHpF
 /WInHPbvoAe8oANfyH75yBts3IkIaxhQorzOQt11J4hOw3D03aqn5UWzViy/AExcu90t
 rnkSPUSdF0L86JaIs22jDznUkFlR+Us8l3yjsjv/XwEBOBCT7rnNTDXj0WmF5UkvB0LS
 5m7QoJuBOv4pfaGZWe3xOZl6M8IJFtv/RJDdMGFUUuLMarRwOHg2HkP/HTs5kVkLA0/p
 u85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXRukigj1iHMoS+zrcnuLFVozC6TWaz57QCscXGkcCw=;
 b=m+sDdXJwQFEq9gQMUDdXLSbqQSinPeZedHqKhSEUxJUr3KZUwZ1Hr1a2uhIJSVmwwY
 EMojbot+JUYFOPoOQYqNQG0gCJqNwZkVoj7MV7kzttoJgL3hYegNj67gZRyHO+59p6sk
 F09+pZ7NQEYDhPhDxzogSKSRzC0lmtoVVoFimOeREhRDVYrfGTlz/67ccsMrrDx9T2nN
 5AZePWCYhguDQcaVdSq+jZe23vWRerYCMhXiUBklXPRcX1e/9VYEv86XXRORAoKwDLMp
 4UxrWiU9yBIc8nVvejfu96yvAaclddErfZw4zJCOVFBqaHXJROgR4+NyhgGTxr0ImvYh
 YGBw==
X-Gm-Message-State: AOAM533jvRMciatcAXwj61SpRPMSAGSggYVwJyT2wQEGMNmoI67Mb5Sr
 j/pKGUmDs0IEN1M4U2KoMwTDUA==
X-Google-Smtp-Source: ABdhPJwuTBYeXammjoxaNx9IYUL56AthITKesmqaEc+ZGvadw7MKmud5l7/Fa7Um7AmHXxHZMlw7Uw==
X-Received: by 2002:a17:90a:4817:: with SMTP id
 a23mr8633976pjh.16.1610016840812; 
 Thu, 07 Jan 2021 02:54:00 -0800 (PST)
Received: from localhost.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id p187sm5426042pfp.60.2021.01.07.02.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:54:00 -0800 (PST)
From: Chris Chiu <chiu@endlessos.org>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 2/4] ASoC: rt5645: Add ACPI-defined GPIO for ECS EF20 series
Date: Thu,  7 Jan 2021 18:53:27 +0800
Message-Id: <20210107105329.146988-3-chiu@endlessos.org>
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
  v1 -> v2:
	- Invoke callback() of the DMI quirk if it exists.

 sound/soc/codecs/rt5645.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 78f0ab0a008e..94faa0a9561f 100644
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
@@ -3831,6 +3858,8 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 	if (dmi_data) {
 		dev_info(&i2c->dev, "Detected %s platform\n", dmi_data->ident);
 		pdata = dmi_data->driver_data;
+		if (dmi_data->callback)
+			dmi_data->callback(dmi_data);
 	}
 
 	if (pdata)
-- 
2.20.1

