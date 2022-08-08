Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7D58C6EC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 12:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CED5868;
	Mon,  8 Aug 2022 12:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CED5868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659955775;
	bh=2AJ9+Ey3m5+dIfFjC7G3fzIMYvUMPXHKf8wDGZywMU0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXGrE531su9WqxymoecnLEZgMfxm+SWOSW5c+xXeLs+CzD1+f70XDcUR5kPshJRu4
	 vNdJoq0aZ98GpcOoPaDwRk4E88CDBVSX6vOzKtjS/H4D5KuRHo+KhXj7nnVM8OKxcZ
	 5T6GnfU7s9JQf3wO4TyUCelhwGRDrjt6ntqrNuX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E07F80544;
	Mon,  8 Aug 2022 12:47:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B78DF80430; Mon,  8 Aug 2022 12:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EEB0F80430
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 12:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EEB0F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jv07OtZt"
Received: by mail-lj1-x234.google.com with SMTP id v7so9388102ljj.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 03:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wtlxEtiRF9lqCy5R1k9yAeU8U13bw6nu384fYfSEqBw=;
 b=jv07OtZt2pyX0cJM44iITqxyodBbbHPDRiX71FoCVjTJ9XCj3HKpzDLaprbvsELIsH
 8GL8/jtjYb35pkZPiQn9Lrw8gkvIPe6INQik7whWlNe3P5KQeRDPb4WaK57tNa3zLaCA
 ncJc/TMltNRL+gsmrkJzoK5WLoL6MMGMjq05iKT5IFN8IPyzgHo+sJ9MUEu/A59RWVAm
 Ws2EiUwUDHptJP9HHb5q1V/fpZXAm6yqLaT3F4zsviTvFNol6Q5gHyV9mt4RpzFMB0AX
 NdBK/lBDAvz5fQnS2Yac3mIUt+j1+m3t3jp1W5c1zky+9sdQlLU2sKwrN2W4I76YbhVn
 l+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wtlxEtiRF9lqCy5R1k9yAeU8U13bw6nu384fYfSEqBw=;
 b=w1o7JVqyLy2PpEzoKFbMqKpbbQXF1274wi26m1e6uNr1T3atXurUQNP50HYx/fT7Ol
 KbTeYunW1mam90stmFMcTp1LY4jxBFHP4mnVxbVgjfJAZ9TqhCxIW8+VArpJsxE+XMX0
 UDeOZI17VxeAfZpOl4+gWmyNCXlmIhu+J2/0K6b+tiGzi3bx+ZUIBuq25X7NwRg9unpE
 NQDiNQ1ba1b92WqtAdzMrcS1JDFKccFrevYIqngJAG2luueOqj6UTeFbBxaKK/2un5PA
 C2iTU2vty/NiWA5/dIM0hZt6fQt2EgvDKh15WSJq46xCovAJDMghSwHlB+UqFolVx7nO
 ccqw==
X-Gm-Message-State: ACgBeo0Msqksi7HnLrtzfa8/efMxaQYXEYq1bUDtcLusyTzgos18LCLo
 kTJ1M88OOOd2fZvvJ4Y8GWUFMA==
X-Google-Smtp-Source: AA6agR6t9xJZKEAAv4TIEwAFqoquIJFksglsomLyRD3HG8nsDWNUsnErUldbfkSXaP31ifRT7EPZcQ==
X-Received: by 2002:a2e:9b42:0:b0:25e:59a7:6734 with SMTP id
 o2-20020a2e9b42000000b0025e59a76734mr5299134ljj.346.1659955667663; 
 Mon, 08 Aug 2022 03:47:47 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:47:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Robert Jones <rjones@gateworks.com>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ricardo Rivera-Matos <r-rivera-matos@ti.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/5] dt-bindings: iio: Drop Bogdan Pricop
Date: Mon,  8 Aug 2022 13:47:09 +0300
Message-Id: <20220808104712.54315-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Emails to Bogdan Pricop bounce ("550 5.4.1 Recipient address rejected:
Access denied. AS(201806281)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
index 54955f03df93..ae5ce60987fe 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Texas Instruments ADC108S102 and ADC128S102
 
 maintainers:
-  - Bogdan Pricop <bogdan.pricop@emutex.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description: |
   Family of 8 channel, 10/12 bit, SPI, single ended ADCs.
-- 
2.34.1

