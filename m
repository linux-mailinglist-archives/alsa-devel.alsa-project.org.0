Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4DA5E386
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1E6168A;
	Wed,  3 Jul 2019 14:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1E6168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562155830;
	bh=Rk/ZPDzHlQaxdpLApNGeI49IoYoSdau01c441DuDSx8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRgmJakY2EYiRxsvM371ino0XzIMeW1tVqst3g90sAhQ+ADpya/ImVFpY2yIfzU+W
	 BG6TMB3MAF3gWakcagZo4dwZoldOCpaFWrgGENgvVVT4FXkxMn/nzQK+ljQSKmAK+Y
	 +oxDAN8YxxTzvQHoCMdYHvWwCdxJdoJ/yHu4Qz2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BDAF8011C;
	Wed,  3 Jul 2019 14:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95E35F800E8; Wed,  3 Jul 2019 14:07:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25D50F800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D50F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="JrcDlvvT"
Received: by mail-wr1-x442.google.com with SMTP id n4so2528832wrs.3
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6jmfxNF0bKXTHuQ9MiaMGLVqO2khGBwkEkz0kXerFA=;
 b=JrcDlvvTu/UsNIG0vNxgNTXhOeeuaxZSo57yFAMP/xUZSJ0e+TmYtRFDzHNVWp3/2W
 WL7VXbaVLmT0arVzNS3T6C6CTredekNz7iHmVMUKkzUOkMQqzjJgSJxtZrK9xi60Omzm
 7rMGge4rmwUX+m0a7K72LzFQxvk6I1a5msWlscLQi9xL2pFct8QbyQ9pN5btRBkmlak4
 28L6JNF30BSyhM5y8HR5cccDJt1pSGxI8NxN6gvkrSyFIdW+wiIPTsdYhjcCXIkwcTjH
 f63rXZf/IzhUP5KlgoPcMSvkpDEqS7ubdYS70hqaG4LPhLfTSntiquOLtUwmlLIgqgrb
 ATUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6jmfxNF0bKXTHuQ9MiaMGLVqO2khGBwkEkz0kXerFA=;
 b=peyGq31gENP6MVlDvjCipHvxnnzkL8u0kuXWxuNx1QgIf0J2By98g5tAW0ZM3XKdu5
 DFC+iSy/9QqkAyFAmgUOV++d1HciuQ86sW3EFgfyVGF1duE7K/wWbp/c76ajPytM3BUl
 ghEiDW4KpL7D3A6MMQoGF98M0om6uhmN3alNy/tekb0WSF/VH43J/B7cWV/4kymWnSFf
 xhMQhhMvoOfLQ3xImr5GpVTzA57Icoiucao/CrsGeCqaGSrf78qxsVTqXMhstLLJ3C17
 R5oRL8r3O9+S5uAUexmF1edqT8urBNSYMRVw+4WHxppbM95OwYdtTrqHYgaCSqMVVIbC
 vzZg==
X-Gm-Message-State: APjAAAXuvnnI2rRbntugv4DoJKyRv7ftBzgOwtIwnql03K93SrGKhMqJ
 KoPIhx0fCYVCVaWRdLkhu25X+g==
X-Google-Smtp-Source: APXvYqw931AA2gewVKXUYTgyeeVPRjW4aXRpl7vYMadJOlnoIda8+dbNBrBJbhCSF/FyzoCyWHZOZw==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr3594718wrx.226.1562155675701; 
 Wed, 03 Jul 2019 05:07:55 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z126sm2767638wmb.32.2019.07.03.05.07.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:07:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed,  3 Jul 2019 14:07:49 +0200
Message-Id: <20190703120749.32341-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703120749.32341-1-jbrunet@baylibre.com>
References: <20190703120749.32341-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: meson: axg-tdm-formatter: add reset
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

Add the optional reset line handling which is present on the new SoC
families, such as the g12a. Triggering this reset is not critical but
it helps solve a channel shift issue on the g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 0c6cce5c5773..2e498201139f 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <sound/soc.h>
 
 #include "axg-tdm-formatter.h"
@@ -20,6 +21,7 @@ struct axg_tdm_formatter {
 	struct clk *lrclk;
 	struct clk *sclk_sel;
 	struct clk *lrclk_sel;
+	struct reset_control *reset;
 	bool enabled;
 	struct regmap *map;
 };
@@ -75,6 +77,24 @@ static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 	if (formatter->enabled)
 		return 0;
 
+	/*
+	 * On the g12a (and possibly other SoCs), when a stream using
+	 * multiple lanes is restarted, it will sometimes not start
+	 * from the first lane, but randomly from another used one.
+	 * The result is an unexpected and random channel shift.
+	 *
+	 * The hypothesis is that an HW counter is not properly reset
+	 * and the formatter simply starts on the lane it stopped
+	 * before. Unfortunately, there does not seems to be a way to
+	 * reset this through the registers of the block.
+	 *
+	 * However, the g12a has indenpendent reset lines for each audio
+	 * devices. Using this reset before each start solves the issue.
+	 */
+	ret = reset_control_reset(formatter->reset);
+	if (ret)
+		return ret;
+
 	/*
 	 * If sclk is inverted, invert it back and provide the inversion
 	 * required by the formatter
@@ -306,6 +326,15 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Formatter dedicated reset line */
+	formatter->reset = reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(formatter->reset)) {
+		ret = PTR_ERR(formatter->reset);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get reset: %d\n", ret);
+		return ret;
+	}
+
 	return devm_snd_soc_register_component(dev, drv->component_drv,
 					       NULL, 0);
 }
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
