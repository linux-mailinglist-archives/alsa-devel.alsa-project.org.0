Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1DAC10B
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC0641668;
	Fri,  6 Sep 2019 21:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC0641668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799776;
	bh=rJxuYm0zRxN/+gtxl6INPle7kDd8d3D5oTlR0m3RPPE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTxjZXHwzPR5peCRhXYGAoeOAQhxc5CDPBj/UVYmJuniaTohuILzAqza1cUKgX/N7
	 IhRDVnR+9jElqC60BKgoXTPIuh7A/BvY3m662GSiDDdQ0BqYEtzQlRhkK/KRaM39+q
	 ciEgpOXY5z0JxhOf8P3Fd4ctZO+fmJUwQATUo+lQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 378BEF8070D;
	Fri,  6 Sep 2019 21:48:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7261F806EF; Fri,  6 Sep 2019 21:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ADF6F80679
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ADF6F80679
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="A4RGbTtv"
Received: by mail-pl1-x644.google.com with SMTP id gn20so3644275plb.2
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rySU15ygIQhT7lY0CFfGk5dF4YSEgWQKt7fn4j4JCJc=;
 b=A4RGbTtvjbWDDD7parKemBXc0Uv5AgEBE+nzCgSvTrPFHzsILUV5OkT0YIFtz9zB+l
 rC/LheG8uVtDYwByNy0ZJWk3MVyzzNmDZMRD8B7hHH2h45WMO8BTDEsK60az8RWHVeZ1
 hNvhNVM31dp9lVOmPH8tsBD0teb8HieT/5DgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rySU15ygIQhT7lY0CFfGk5dF4YSEgWQKt7fn4j4JCJc=;
 b=Z4og/tMPZnlE9SZsLHKSgPgDKj4S3Xao3oaxIn5+JYdpeCq13OOt/kUMEMkQTJfuK7
 XBTGk6yJR2rClJlarvQFVKk7O3QF7hsiNYBuq/GFCErYI8S8MPCzb8waxIkhN5IR4ZzU
 b+n+6ZiRwmdWSuTdE+KOjrpTtcRKcAv20w1damTOdCv0aYlVpu63o552zUsvGAGZO2YP
 99g1EfOb5qu6ZPdocyTY6ugHSaZdJDydUealzgWCVwOkIL/isKTbLvSMtN2Sd65xN/BU
 duESxwAJojkzx6u9Xa2mj/Zjmo7bwAPTCvphuRnSnG8o0ylT4CvHapKhCNYN0pGJ4GGF
 iGLA==
X-Gm-Message-State: APjAAAXfLyZOqcGl8V2XABTg95LIe7AJobqdG56ek/apGcmWScjW91dQ
 jo/D0Zu4dcT0SMHNnfy8x+fR0y5B4w==
X-Google-Smtp-Source: APXvYqwtcHOa+RW4W4V/fhw1RQTGLKsbbmlee/RjoygHgSzoGHtQJlwgDwzW0VI0v6RadYC7Is+p9A==
X-Received: by 2002:a17:902:b115:: with SMTP id
 q21mr11249559plr.241.1567799293795; 
 Fri, 06 Sep 2019 12:48:13 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id f14sm12251609pfq.187.2019.09.06.12.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:13 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:32 -0700
Message-Id: <20190906194636.217881-11-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 10/15] ASoC: rt5677: Mark reg RT5677_PWR_ANLG2 as
	volatile
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

From: Ben Zhang <benzh@chromium.org>

The codec dies when RT5677_PWR_ANLG2(MX-64h) is set to 0xACE1
while it's streaming audio over SPI. The DSP firmware turns
on PLL2 (MX-64 bit 8) when SPI streaming starts.  However regmap
does not believe that register can change by itself. When
BST1 (bit 15) is turned on with regmap_update_bits(), it doesn't
read the register first before write, so PLL2 power bit is
cleared by accident.

Marking MX-64h as volatile in regmap solved the issue.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3db26cb242d2..f07d10a8b045 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -302,6 +302,7 @@ static bool rt5677_volatile_register(struct device *dev, unsigned int reg)
 	case RT5677_I2C_MASTER_CTRL7:
 	case RT5677_I2C_MASTER_CTRL8:
 	case RT5677_HAP_GENE_CTRL2:
+	case RT5677_PWR_ANLG2: /* Modified by DSP firmware */
 	case RT5677_PWR_DSP_ST:
 	case RT5677_PRIV_DATA:
 	case RT5677_ASRC_22:
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
