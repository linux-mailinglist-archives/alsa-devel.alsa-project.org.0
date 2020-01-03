Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A535812F2A7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 02:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4695F16F3;
	Fri,  3 Jan 2020 02:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4695F16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578014387;
	bh=jtgASU7eM8D7Y3h9C6tZ7PK/bMnWUvHlKjeRQ052rhQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GwIvNl6rTWeYabmpPMUgTqCWWAXSCbGw4TZEnwqgUmMG5+ngBNHJ710LjZgMwij+j
	 7P0pyIUQXfYKrchE9713a3G7SGZmQWcW3FsPMcCYS6UXQduTDPxcGiEWjX9I2tDZXU
	 1rWpoE6KjVEmObp9SUXqaSTL/NY/S58RNiECyUN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01392F8014F;
	Fri,  3 Jan 2020 02:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64AA4F80157; Fri,  3 Jan 2020 02:18:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 180F4F8013E
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 02:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180F4F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RbBEYaw0"
Received: by mail-pl1-x642.google.com with SMTP id s21so15729746plr.7
 for <alsa-devel@alsa-project.org>; Thu, 02 Jan 2020 17:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=DC9VSwlhL0N/YPRwix5EBAHxHcNpcMljkAxlNuK95w0=;
 b=RbBEYaw0P5wuMiO0yKp2g3L1uXIy0bSk1wxT40I52Lb1+HeGjZeZO/hC6/dBcPtMX1
 sYZxlAJ0oA/z18XSDj2VMfoPCv6p2Z9Fguz67e74kP4vV6mYRpum2ySLiH6qpbIiMiDB
 kHsjDKsM88yYM68O6cMYqVjDcpk5Etn1Dk/SHhJqmhayQEDNLl+2xTg/DsuQGZQLk3Cs
 EMIelmhY4CUtpnJLVHXbHqFoIieIRfJwkoos1ovFeP1c8e6MSi1HUKSr9SP/I3MSUTWf
 +xTJ9lA4dt4NeWEU4+u2UWs7qjXp9lohWHnqyDBCbtf4zC0Z/ZvsNHmrfSRN+Fii9rmO
 /Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=DC9VSwlhL0N/YPRwix5EBAHxHcNpcMljkAxlNuK95w0=;
 b=NKTfc5NoRNzplFMdHrkipnibhBMhXAu2ZF9rVpqfY33kSJC3EbV70mF8VdiIqBUh+W
 8ei9CJYU32qFEB4HZ/Jn93O33+g4HuGP3j1pBAQLjZL2jfBhrZ0i6xNSqzUWQuX8KZ3e
 A8tx0nbij+NY1CjaBYSekHGhOqTDDA0SFHtxEA/Xs53Y2GL+b3sbS+XJm5iw0jomLZ9o
 /K1A2JEdIZui6z7lDDZp+5lVPEzf5MwvZzmAgn5LGvZOXBkxCe0lscFq2HyDQ16TvZt6
 v67JX5Sd+8jSzSwusy1rNfzubeKylCW6al6iGBpsRaMlEz6aVntMyOE2zvqdJnHGyEoI
 rNPg==
X-Gm-Message-State: APjAAAVDtf5DH5U/zh8tmutIgsPGRNnfBB/lIEoRC3Mo2eXx3r/5WVyI
 /RoDeFUCeyfsi87YDRzBkkY=
X-Google-Smtp-Source: APXvYqwi3rFKCLRbMO3l47X9oVeJsrXzYJ+GNdaDQrJ9shPUWFSTFKPZFXu/wy639wGXv2JgFy5iQQ==
X-Received: by 2002:a17:902:fe98:: with SMTP id
 x24mr88927208plm.155.1578014276672; 
 Thu, 02 Jan 2020 17:17:56 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id l2sm12234208pjt.31.2020.01.02.17.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 17:17:56 -0800 (PST)
Date: Thu, 2 Jan 2020 17:17:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200103011754.GA260926@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: Intel: bytcr_rt5651: switch to using
 devm_fwnode_gpiod_get()
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

devm_fwnode_get_index_gpiod_from_child() is going away as the name is
too unwieldy, let's switch to using the new devm_fwnode_gpiod_get().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index c0d322a859f71..4495834e37653 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -998,10 +998,11 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 
 	if (byt_rt5651_gpios) {
 		devm_acpi_dev_add_driver_gpios(codec_dev, byt_rt5651_gpios);
-		priv->ext_amp_gpio = devm_fwnode_get_index_gpiod_from_child(
-						&pdev->dev, "ext-amp-enable", 0,
-						codec_dev->fwnode,
-						GPIOD_OUT_LOW, "speaker-amp");
+		priv->ext_amp_gpio = devm_fwnode_gpiod_get(&pdev->dev,
+							   codec_dev->fwnode,
+							   "ext-amp-enable",
+							   GPIOD_OUT_LOW,
+							   "speaker-amp");
 		if (IS_ERR(priv->ext_amp_gpio)) {
 			ret_val = PTR_ERR(priv->ext_amp_gpio);
 			switch (ret_val) {
@@ -1017,10 +1018,11 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 				return ret_val;
 			}
 		}
-		priv->hp_detect = devm_fwnode_get_index_gpiod_from_child(
-						&pdev->dev, "hp-detect", 0,
-						codec_dev->fwnode,
-						GPIOD_IN, "hp-detect");
+		priv->hp_detect = devm_fwnode_gpiod_get(&pdev->dev,
+							codec_dev->fwnode,
+							"hp-detect",
+							GPIOD_IN,
+							"hp-detect");
 		if (IS_ERR(priv->hp_detect)) {
 			ret_val = PTR_ERR(priv->hp_detect);
 			switch (ret_val) {
-- 
2.24.1.735.g03f4e72817-goog


-- 
Dmitry
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
