Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E2159B580
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Aug 2022 18:44:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15FD41632;
	Sun, 21 Aug 2022 18:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15FD41632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661100296;
	bh=WtlqS8ekb/Mvx6VAbI+TwumMMQt1oc7YbdmyEkIiH44=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i4Z8hpi1wuQwyDKrLq74uuozE+7V/UmYsWer9BBX8Vmkk2FJj/eB0ZCl7UUWbQPmT
	 YhwGisRINBCzmA0apZ9SvYWOxO/ZJNegKDUcrMRsUFJbBXG+n1SjsaCWIE2pCybNR5
	 7k14VvKP5gXMpJm4ZVzIncfYrhfy39iWsTMxSE5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC4FDF80154;
	Sun, 21 Aug 2022 18:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74592F80128; Sun, 21 Aug 2022 18:43:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD1C3F80128
 for <alsa-devel@alsa-project.org>; Sun, 21 Aug 2022 18:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD1C3F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pJaxtuLE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1932B80A08;
 Sun, 21 Aug 2022 16:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DD0C433D6;
 Sun, 21 Aug 2022 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661100229;
 bh=WtlqS8ekb/Mvx6VAbI+TwumMMQt1oc7YbdmyEkIiH44=;
 h=From:To:Cc:Subject:Date:From;
 b=pJaxtuLEWhjv1PRUdfqLKqY7gv2cIWW+6VkwvFXHd+7ToCyzR/435P330iWvE3H+4
 jKdCt9m4sGY2kWpQTzqKD5RAND/6ifnvt7H4NynFECs3nLx8xB78GosbkAYSz+yBLW
 uDUXPPSxHM9eoy4TDkQooYu71JYmbxwBKURJfcEO8SCSOdALW24vmIkmsUNjTjtjN5
 q53bxeyYxDgHqAXGZsfvM0RauAb8ZQAJUTH+diMt+R45AVHWdnXxkpBBQt5CePiSWF
 WiY/kmGpMRFeLMPmG5LYms4/FvZ3uEulBKnC6AkAtNplhHx8u7WoSXEQOAcnHsZvA2
 tJTx0lDpKXgTQ==
From: Jonathan Cameron <jic23@kernel.org>
To: alsa-devel@alsa-project.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ASoC: samsung: Use iio_get_channel_type() accessor.
Date: Sun, 21 Aug 2022 17:09:14 +0100
Message-Id: <20220821160914.2207116-1-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

struct iio_chan_spec is meant to be opaque to IIO consumer drivers
which should only use the interfaces in linux/iio/consumer.h.
Use the provided accessor function to find get the type of the
channel instead of directly reading it form the structure.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/aries_wm8994.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index e7d52d27132e..0fbbf3b02c09 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 #include <linux/extcon.h>
 #include <linux/iio/consumer.h>
-#include <linux/iio/iio.h>
 #include <linux/input-event-codes.h>
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
@@ -543,6 +542,7 @@ static int aries_audio_probe(struct platform_device *pdev)
 	struct aries_wm8994_data *priv;
 	struct snd_soc_dai_link *dai_link;
 	const struct of_device_id *match;
+	enum iio_chan_type channel_type;
 	int ret, i;
 
 	if (!np)
@@ -594,7 +594,11 @@ static int aries_audio_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->adc),
 				     "Failed to get ADC channel");
 
-	if (priv->adc->channel->type != IIO_VOLTAGE)
+	ret = iio_get_channel_type(priv->adc, &channel_type);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get ADC channel type");
+	if (channel_type != IIO_VOLTAGE)
 		return -EINVAL;
 
 	priv->gpio_headset_key = devm_gpiod_get(dev, "headset-key",
-- 
2.37.2

