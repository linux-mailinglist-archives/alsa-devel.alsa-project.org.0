Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A665258DC11
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 18:29:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D31D8839;
	Tue,  9 Aug 2022 18:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D31D8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660062543;
	bh=94EN2fWak2Vn+rIy8dnl3hC2a1mGFJhjPRUw2q/StGA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OSNIfFrrrZ6QWfnAKR9nqI+NZPR4f0g/HSy3nsbwQq1dSaMyviek1R9Fwi8jL/S6G
	 wWVynH3cwqRZOClsJbNLfqyD+o6XGqMSqg1S/AhIfoEkBAIFGVc9TaPlibNdbVHBrv
	 1QINTsFQuGgpkK3HT0rWlhzqIbIjeSD9LdFDrINI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49251F8049C;
	Tue,  9 Aug 2022 18:28:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75299F8016C; Tue,  9 Aug 2022 18:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1084F80132
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 18:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1084F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="scwhCRJP"
Received: by mail-lf1-x131.google.com with SMTP id o2so10389422lfb.1
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 09:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AR+nnS9UZD6P2Hs8ZDImw5TD7p9NQC+KnqHa3zocRvk=;
 b=scwhCRJP2cX92hQGoRkNYm1CP1o41FrEej53GLl6u8y5tLL91RoPRZ7d6703rgd6z4
 y4xGg04FcmAIUHsFZQoz3WCYKNxzaLl/PR8KdfKG3pssC1Ay0wa0QlWGw/CoiJHSId30
 hd2EyCkjzIer0sV5O8xkfFRvGUJS2udkZLP+LgpUOsffdh6Ohnu9uFOfrWIMHTe8lNIt
 DcZEoqWOYX3F4kMr76HXbsT2Moht6G1fCn39Xyon/Lq04771JDKk12dmYO1wKfeq7bEo
 IAX75aMK5gnpn0hTmsCJekxKFQfTF8tAtJGgWwg6FDMsH6NiNiY5SGBvidLvPPdbFP1v
 gydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AR+nnS9UZD6P2Hs8ZDImw5TD7p9NQC+KnqHa3zocRvk=;
 b=GSUH1i3kUMLJIGSaAgV4F6ouPRpiIVaPQlDUJ2ptfg1Pg0VKi7XLdW795KF//Q7HXc
 hY2qqeXZZuVp6bHE/EPxVEi+E1XTCKIb2NfA/BgDhISgOkM9CjTbXd8HYsRjtVIrGWFi
 Da8/kZxniWuDsFaEbi4V/aPqnMmapGAeBieheogUd7XUEuUSZxHDJW0WyR42CcMpL3Xk
 /JZtu0UBoXWzXN753GKSPedXy6UmFxJuvIWxj3UtQ51uOBK3tfT7vlPpoDCwyTDJl3os
 0bAwrJ5AUxWGINqSAIVyQyWgNF8wEZkaEwYV8q26Drybgc9WANCyOMEGRn4cr3fXZp2E
 l+tA==
X-Gm-Message-State: ACgBeo3rgta/dBWij4BXYsMjfJBBiOGEFTKZYgRW4BvERqd41V45ldKK
 Uzvx97PUgZxs+xn79syn5obsKA==
X-Google-Smtp-Source: AA6agR5TRVjeZwahd7WkFhqyuhqfwiPBYep94z8LyDAT7HAxO3MZrTjHFZMuFjki+w1nYUDsee4f8A==
X-Received: by 2002:a05:6512:2a8d:b0:48b:7f1:fe46 with SMTP id
 dt13-20020a0565122a8d00b0048b07f1fe46mr7624887lfb.261.1660062476861; 
 Tue, 09 Aug 2022 09:27:56 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 h7-20020ac24d27000000b0048a8c907fe9sm20999lfk.167.2022.08.09.09.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:27:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Andrew Davis <afd@ti.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few
 stale maintainers cleanup
Date: Tue,  9 Aug 2022 19:27:47 +0300
Message-Id: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Changes since v1
================
1. Patch #5: Drop also Ricardo Rivera-Matos and assign TI bindings to Andrew Davis
2. Add acks.

A question
==========

Several of the bindings here had only one maintainer and history does not
always point to a new one (although I did not perform extensive digging). I
added subsystem maintainer, because dtschema requires an entry with valid email address.

This is not the best choice as simply subsystem maintainer might not have the
actual device (or its datasheets or any interest in it).

Maybe we could add some "orphaned" entry in such case?

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: iio: Drop Joachim Eastwood
  dt-bindings: iio: Drop Bogdan Pricop
  dt-bindings: Drop Beniamin Bia and Stefan Popa
  dt-bindings: Drop Robert Jones
  dt-bindings: Drop Dan Murphy and Ricardo Rivera-Matos

 Documentation/devicetree/bindings/hwmon/adi,adm1177.yaml       | 1 -
 Documentation/devicetree/bindings/iio/accel/fsl,mma7455.yaml   | 1 -
 Documentation/devicetree/bindings/iio/adc/adi,ad7091r5.yaml    | 2 +-
 Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml      | 3 +--
 Documentation/devicetree/bindings/iio/adc/nxp,lpc1850-adc.yaml | 2 +-
 Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml   | 2 +-
 Documentation/devicetree/bindings/iio/adc/ti,ads124s08.yaml    | 2 +-
 .../devicetree/bindings/iio/amplifiers/adi,hmc425a.yaml        | 1 -
 Documentation/devicetree/bindings/iio/imu/nxp,fxos8700.yaml    | 2 +-
 .../devicetree/bindings/leds/leds-class-multicolor.yaml        | 2 +-
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml        | 2 +-
 Documentation/devicetree/bindings/mfd/gateworks-gsc.yaml       | 1 -
 Documentation/devicetree/bindings/net/ti,dp83822.yaml          | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83867.yaml          | 2 +-
 Documentation/devicetree/bindings/net/ti,dp83869.yaml          | 2 +-
 Documentation/devicetree/bindings/power/supply/bq2515x.yaml    | 3 +--
 Documentation/devicetree/bindings/power/supply/bq256xx.yaml    | 2 +-
 Documentation/devicetree/bindings/power/supply/bq25980.yaml    | 3 +--
 Documentation/devicetree/bindings/sound/tas2562.yaml           | 2 +-
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml     | 2 +-
 20 files changed, 16 insertions(+), 23 deletions(-)

-- 
2.34.1

