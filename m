Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7E758C6D4
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 12:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF25836;
	Mon,  8 Aug 2022 12:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF25836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659955732;
	bh=yw3+TnX754YqfE7uw0eSR9suJ1wCMB2xOWbhuE2HbfE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Nm782tT0BACoVIBk8PQ3VPAl62PXmHBpJJSr6UzZXhHUgNNk25b3kjihF9GHgIApR
	 z11ULvzxVgB3+dcVNQkxJ050+Kn45LDeIsMAkpZprrnitiUdGxpnMANpuuHp0n2SXx
	 tXzXRWfHrGBhydIU2oz7x96PBi4M/TS5x8L7WXZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 783B5F80507;
	Mon,  8 Aug 2022 12:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E206F804E5; Mon,  8 Aug 2022 12:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 940C6F8012B
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 12:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 940C6F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QZmV3X54"
Received: by mail-lf1-x134.google.com with SMTP id u1so12078853lfq.4
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/fyxO5UUrefZ9S+J35611sMDpHuXmlRV0zDBtFzDOI=;
 b=QZmV3X54GBsXEmxf8s+h7eZi2Rxvs/eX19h95wNMagcOZG2BWqNyf/8uWSfXcXSi0H
 D2J52UwtV2GSgQFWuxXsNus9vThvcOJ+x4rWJngGAMleFBFuIYAI5rvU+Il7yr8ctY4T
 ZKaoTqZViE3AKz+HCKv1fFJIimhWLQHvetuyDAKU27eMoeyiFFrnREgMssyyOd/w2GQ+
 8ro3IxWKXCe5zjT5FVpqNvP8n6eT0XZXVZDl3kWSWyluVjCgUzT86z2/dNAwYityi6wq
 tmOAUw4lGusovZmiIyvBkv7UxmoTpR8kxI7MUaHqUlqx+lROUxJxkV2OFiZmJoQ7EpYE
 HtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/fyxO5UUrefZ9S+J35611sMDpHuXmlRV0zDBtFzDOI=;
 b=DwQl5MuqZbvog8dgXLTyif4UiUYUzkwpx6jP/Z04Bl8xnZQERU5ONqodGGU7jEyyGk
 BuDgXMkKLMKFP/CKxZcbvbl7thLtC7ste23hoEPHPFpHr8mq2VV1XlVVqtT6Pv1deLid
 846BX6dlwC8lXk63Im/UQo/8wgyn/mmp1AEy2xUX90Z1Hnw5gR7mQyxE1j9RAHK/MMKl
 sM5BtXkRrZaYfXniicFt98jn+RskI6iWRKh666COdefRInzFvDoEjFarlabAe7SuACi5
 GwYhrdeN5M1vSUKomDPGvC2Ib7bkMiu0E07ZtHs70Vr9pCydRlkebOyucW/nhHqDjQar
 MYYA==
X-Gm-Message-State: ACgBeo06m3CrbRkijHGFy79yMnTLYmTsSkyaMo/7QawTtURh2BIp5HT0
 +BlI2OqFj/NHJA9hG8mJAvptwA==
X-Google-Smtp-Source: AA6agR5O0DrK81VJ8xxEeNLWmXoFfFeD2gJu+76VOqk+ccUPS09sI/bRAbVrJYxn5te/7qBFWz6vcA==
X-Received: by 2002:ac2:4d29:0:b0:48a:eea7:4b92 with SMTP id
 h9-20020ac24d29000000b0048aeea74b92mr5781095lfk.400.1659955664258; 
 Mon, 08 Aug 2022 03:47:44 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2ea312000000b0025e040510e7sm1314321lje.74.2022.08.08.03.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:47:43 -0700 (PDT)
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
Subject: [PATCH 0/5] iio/hwmon/mfd/leds/net/power/ASoC: dt-bindings: few stale
 maintainers cleanup
Date: Mon,  8 Aug 2022 13:47:07 +0300
Message-Id: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
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

A question:

Several of the bindings here had only one
maintainer and history does not always point to a new one (although I did not
perform extensive digging). I added subsystem maintainer, because dtschema
requires such entry. This is not the best choice as simply subsystem maintainer
might not have the actual device (or its datasheets or any interest in it).

However dtschema requires a maintainer. Maybe we could add some
"orphaned" entry in such case?

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: iio: Drop Joachim Eastwood
  dt-bindings: iio: Drop Bogdan Pricop
  dt-bindings: Drop Beniamin Bia and Stefan Popa
  dt-bindings: Drop Robert Jones
  dt-bindings: Drop Dan Murphy

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
 Documentation/devicetree/bindings/power/supply/bq2515x.yaml    | 1 -
 Documentation/devicetree/bindings/power/supply/bq25980.yaml    | 1 -
 Documentation/devicetree/bindings/sound/tas2562.yaml           | 2 +-
 Documentation/devicetree/bindings/sound/tlv320adcx140.yaml     | 2 +-
 19 files changed, 13 insertions(+), 20 deletions(-)

-- 
2.34.1

