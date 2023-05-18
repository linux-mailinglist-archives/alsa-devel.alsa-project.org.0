Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB5707AE5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 09:31:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E7A1FC;
	Thu, 18 May 2023 09:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E7A1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684395067;
	bh=Mm3BcrtKO/D6sJIuNKdAO6zr/1mpu+if2RbWQh1ZnvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QojkNwme7iZzIFJkrwqMd4Uf/vRS8jMy/UzY9wE4R0jn8TL8YW3NhgxHD4/xUc+nV
	 bdACibhDiKrwk0X/xCWEMN9P1Bc+gepcE1RgpMyyDiob74/LysU9Qm/ACZvZ3Iikff
	 AHOTBaZwOw+/QhBDcOCFW0UXsV7up+OM/ss3k/YU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8762AF805C3; Thu, 18 May 2023 09:28:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F14F805C0;
	Thu, 18 May 2023 09:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2CD2F80542; Thu, 18 May 2023 09:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA1F7F80431
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 09:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1F7F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zNNOgZ+A
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9659e9bbff5so300217766b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684394881; x=1686986881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7CXEP7TWtcrBNlAfURzS7ZFy4jvErEzkp1RHuGj8Jo=;
        b=zNNOgZ+A7E64Nl/R3Y706ivhMQUe0MZ6cSd3utBHP+wuuEm+nHd0T7bOehTUAg4M6Z
         1s/Wd/s+mlBNQv+MZwjIwsSdULFtvLqfHzEbPZ84qOA4mQmjwr0vEJSBLjLgoBtxRXUw
         QZ0JpYoizjZeN3450GpOd+ZtxLEaQRM1aUPFDIkw49zFz9c16FMD9TB+SJO5lepqBbUF
         BI7rFyrPYi7BudVocZzJuDletVdEKHlxPrY2qj4XCsbPTLeDrUe9gfEFCtpvtNZikuJh
         DJd+0Iuj4CSQwRnUgnzKJ5I2K2zu46WEt6Eq0/3x+EagoXEp/DUZlnsvpKWzPUk9ATn9
         Ll3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684394881; x=1686986881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7CXEP7TWtcrBNlAfURzS7ZFy4jvErEzkp1RHuGj8Jo=;
        b=PNHBlgdTeBHaDIs8789q2E55a9vwc3wmmjD1TmMXWXpUMi9M6ShY5N1mHuCasnGrqQ
         cNcR1Sw+2cQQ4n9JfXrrkwgRFd21Yf1buQFudEcy6rNxAEArAsfFsA8sMrv2stuQYgni
         RMDGEObi7o/XtwB3CA4eQjE97Uf1wutmmgC8G2jWMiyS3JsIBPnbnwXCFuWpydRqWxsY
         iVEivRbWATMuIL+SYGNu/Bp7GIkIrHVhBV+oo1qdSlxIJ1M9QxdQdwkI3BJNg2c+pKla
         s/ffydI5Evk+bRVOv3GK+D7rDAuup1DSByDWgbRr2LjVtIxeux4renj0typWpV1g9ThQ
         MEFg==
X-Gm-Message-State: AC+VfDyYcVXHY6tb+pfslC/EkESGL+HR3rs1Ov7g2r2jee+OCZ0Gnp2V
	GpTEDJNx4aYv+bFILP+z/IWqZw==
X-Google-Smtp-Source: 
 ACHHUZ4/BXuDRatOd8zzB4wDFspbxkWZb05FKBdp4JpW2IYHJUYzkUo/o1NSv6Ji2yDgaD+9+uPkIg==
X-Received: by 2002:a17:906:6a1f:b0:968:a237:f955 with SMTP id
 qw31-20020a1709066a1f00b00968a237f955mr33784630ejc.64.1684394881605;
        Thu, 18 May 2023 00:28:01 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a17090669d100b00965aee5be9asm594241ejs.170.2023.05.18.00.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:28:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RESEND PATCH 04/12] ASoC: codecs: rt5682: do not store status in
 state container
Date: Thu, 18 May 2023 09:27:45 +0200
Message-Id: <20230518072753.7361-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EM5LZMG2JAENUEZA6G2RLRN3S4XN6JAO
X-Message-ID-Hash: EM5LZMG2JAENUEZA6G2RLRN3S4XN6JAO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EM5LZMG2JAENUEZA6G2RLRN3S4XN6JAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver in its update status callback stores Soundwire device status in
state container but it never uses it later.  Simplify the code a bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 5 +----
 sound/soc/codecs/rt5682.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 6e3b5c5eced1..67404f45389f 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -500,9 +500,6 @@ static int rt5682_update_status(struct sdw_slave *slave,
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
 
-	/* Update the status */
-	rt5682->status = status;
-
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt5682->hw_init = false;
 
@@ -510,7 +507,7 @@ static int rt5682_update_status(struct sdw_slave *slave,
 	 * Perform initialization only if slave status is present and
 	 * hw_init flag is false
 	 */
-	if (rt5682->hw_init || rt5682->status != SDW_SLAVE_ATTACHED)
+	if (rt5682->hw_init || status != SDW_SLAVE_ATTACHED)
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index d568c6993c33..301d1817f8f1 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1440,7 +1440,6 @@ struct rt5682_priv {
 	bool disable_irq;
 	struct mutex calibrate_mutex;
 	struct sdw_slave *slave;
-	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
 	bool first_hw_init;
-- 
2.34.1

