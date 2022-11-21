Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286BE633883
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4791699;
	Tue, 22 Nov 2022 10:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4791699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109511;
	bh=Ui2XIBIrZG8sKh16G1HCTlyzLUWtWsDS3ou2D6qG4uk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ngsd9NRNbCyuH2hItnUHSDqS+LeSVqZzi94CZ8WH8YaqDiAOBxmKrdW+ndnM/lcZE
	 J9dWwSgoI7IHGl/8C1jp8qq9ntWu0YLtCX8HT1s1bSpLSplG2o2Hq6GyPIFSeM3YV9
	 jXuHC0j+WCbc/XAUT15Bzu4j/aq2C3UNfCwIM0+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9346F805BD;
	Tue, 22 Nov 2022 10:27:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E15C9F804B1; Mon, 21 Nov 2022 12:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 634B7F8028D
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 12:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 634B7F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="k1zR2LZG"
Received: by mail-lj1-x22a.google.com with SMTP id k19so14121839lji.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 03:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyWwGeNhRFmvWfv+vCOYlIM/UFkEFOWpWKA/JfKWszY=;
 b=k1zR2LZGJzgjCfmMp4p4sU+lt9Y/jVgcaRyvmTurxH242gX8IQXQ/MjQg7EUV7qPIt
 Uocx5kN58tws2Qih7DmeyVqq2zI1PiY7WtbxX0Vqnp47COj5UTsxlGsTBd5Wl+uEIrIM
 znlDN9X06BKuJ8t3bWEeuK4hDuMdNeiwc7hmSsyJuwHor8VOB+IozAqcJtzsXFTFSqnp
 BAvpVY23qpQTdFU+5YR6MFtjqOF7YDE9y2+1WIPKLJz8k1FKV7oBPXJ1iT5SNYu8EFn4
 aIlRvpPlykkiIQhw6Gzo5jqzl0qGOlMgAgnCb/uRZuFaGL67r5tTmVBcXdviOBviPPgy
 Le7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyWwGeNhRFmvWfv+vCOYlIM/UFkEFOWpWKA/JfKWszY=;
 b=6QnsfaE7TMXWZC5vJ63Wie4R1QcXwoYH0v2eZZi7qsAQKk16GyNMhufxbJ0Zee14oG
 oXZDx9wuX0Skgh1MA4GD7nO7dBRSKvWM05X52GOpo3JhaIkc2xgs94uC6g6DBRO8S+gS
 CGer2W9NgJv7a2hfD5G/dCy5P7kwtvGuFcHsAGD6DuL1ZKvbQb7vMzlxSp5qLmPPUz30
 2HGVufL+9uMgha5HZbElLShp5v+w8bAfrqDmdUsHh2C3YHxjMg44D8Dcnu0KgPXCtp7V
 AMLn+xy10VSrwbDkWtOlrWkFMUD9QR46HO6uPctR7HPGqLiLMajvnNf2XvUz5p5j4YKe
 qqpg==
X-Gm-Message-State: ANoB5pndENLuha8PzX5IXa5/REV3iAIjWOFhYtMiTqDlHPcakupuRqxd
 k5Yv9q7ZKubZq+oWHdwowETNTQ==
X-Google-Smtp-Source: AA0mqf6U7Ox5Cg3AOmfzFZsyMueM2uMreFj1RmdNjod5QJ6XQGeJ0gdoX1HOEA4iywF9yX/nrfBnTw==
X-Received: by 2002:a2e:9786:0:b0:277:2e8a:bc59 with SMTP id
 y6-20020a2e9786000000b002772e8abc59mr5136640lji.344.1669028784202; 
 Mon, 21 Nov 2022 03:06:24 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a05651203e100b0049313f77755sm1991521lfq.213.2022.11.21.03.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 03:06:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Viresh Kumar <vireshk@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/9] dt-bindings: memory-controllers: ti,
 gpmc-child: drop redundant part of title
Date: Mon, 21 Nov 2022 12:06:08 +0100
Message-Id: <20221121110615.97962-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
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

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/ti,gpmc-child.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 4a257fac577e..383d19e0ba26 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc-child.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: device tree bindings for children of the Texas Instruments GPMC
+title: Texas Instruments GPMC Bus Child Nodes
 
 maintainers:
   - Tony Lindgren <tony@atomide.com>
-- 
2.34.1

