Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C249658C6E7
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 12:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4F5846;
	Mon,  8 Aug 2022 12:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4F5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659955761;
	bh=5htDu9piGe6iEkIJnxiopzBOVmZXNZ7jhZ2Cl0QOfPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYIowswTWo3Alb3t2+CbdAIQQjXb87+vDikXezsUVsAA9Y99kPiDj03CeML9CcO3s
	 dfk0sOLnyFbl8bGq1d/cotzVF9R08/58zHLEzttaOlNP8k+Tsej81o3SIZZRqN5ZaX
	 JkPDXuGrlmYlOaaipKIo7cIk2TwtG0f0EJco9rko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C438F80510;
	Mon,  8 Aug 2022 12:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4274BF80519; Mon,  8 Aug 2022 12:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD0AF8013D
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 12:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD0AF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pZ5n4LsU"
Received: by mail-lf1-x131.google.com with SMTP id c17so12083297lfb.3
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAcb2UIHnzQWc+7wJXO7+t1zm0MYd48VFY89RfjXd90=;
 b=pZ5n4LsUBuRfPUkslmcaCk2lyPkUqZyTC3GWr4dCq4OQhzI2yFphVsu0x+mjWy8fZw
 UIsmWZYgMFr9Yo+y/H67qdsq9admU3xUHWPwbiGxpLJTqpj7syYu3bHYvDKQBqxv1lQ/
 zwGG8xpqoab03LUU6cXmLLzRjm5EJl/y/z4KAHXoVfA68w6a+AySxuiMRh0q9utI2nfY
 h7sZyPEQwg+KnK+U7ITd4kryslnHn1NAXGj3Ib6yOHzncgujAx+CICo/SBYUeqRAfpEq
 igdQhXtZc7CNdOE9/5MzuJe6z4xR4AvvhTeCIDUczl3v3IUhqL7T2aSQFXnAIlKPk2az
 hSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAcb2UIHnzQWc+7wJXO7+t1zm0MYd48VFY89RfjXd90=;
 b=37TYMaFEyiDlCOu7ZwSUEM8m+y1Yxpt0S3xUDpLw5wvw+Ylyeq1Pwoydxp+2MV/WVI
 FqGvVZKuPerJXgaOOsU4QTvUI0VzZUYoTljWT7+ypC1ErG4pe0G4+TSsOOiN4a2j1N8a
 DDk5IS0L4SShz/wXGaq/Dc5jaCNKRc7bkoDyBx1P7qvGHvKs4s2g3w8CsZzjdvLuQX2U
 sxrrrbtKU9QThPOH2dSmbTIUZxGdYde1UX1U3hDTZK9aOs5Q62tnMhcFFKG0Buk6Iulg
 FPwQtGI9a+jJGkWbn+fG1wHhBm5JdHZez8xg5cIg5+BD4ZO6c/MVsc4vleeRg5LJpZcz
 VICw==
X-Gm-Message-State: ACgBeo2q714f2ICsmbVURD5fnOVUt0lb/VxfV+teCARX27NCwAX57V2n
 LYKU3e+CqtNIjPvtFZv1AvWl1A==
X-Google-Smtp-Source: AA6agR5EYE1Bofb0M8EdhYNvz7LnouDO56jHt/oH1KxMlhgzj77yT9NZM45q6dvtAj/sMKDOm7VOew==
X-Received: by 2002:ac2:50d2:0:b0:48a:f4fe:3553 with SMTP id
 h18-20020ac250d2000000b0048af4fe3553mr5797397lfm.248.1659955666064; 
 Mon, 08 Aug 2022 03:47:46 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:47:45 -0700 (PDT)
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
Subject: [PATCH 1/5] dt-bindings: iio: Drop Joachim Eastwood
Date: Mon,  8 Aug 2022 13:47:08 +0300
Message-Id: <20220808104712.54315-2-krzysztof.kozlowski@linaro.org>
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

Emails to Joachim Eastwood bounce ("552 5.2.2 The email account that you
tried to reach is over quota and inactive.").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
index 7c8f8bdc2333..9c7c66feeffc 100644
--- a/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Freescale MMA7455 and MMA7456 three axis accelerometers
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
   - Jonathan Cameron <jic23@kernel.org>
 
 description:
diff --git a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
index 6404fb73f8ed..43abb300fa3d 100644
--- a/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: NXP LPC1850 ADC bindings
 
 maintainers:
-  - Joachim Eastwood <manabian@gmail.com>
+  - Jonathan Cameron <jic23@kernel.org>
 
 description:
   Supports the ADC found on the LPC1850 SoC.
-- 
2.34.1

