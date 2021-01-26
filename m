Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C02253053A7
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 07:56:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF7D176D;
	Wed, 27 Jan 2021 07:55:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF7D176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611730575;
	bh=St8uz6BovlC3f3uwxGBc5gCM4yeQwsZtqT6D6x1SAqI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KfHLX2SGou3WXEGew9MPHQ7gc75HvNi3oYx20IJ8RpasWE+cqs+Mye6ArzVkPuh6h
	 Rc3K9RxSKz3TzANsVEXYkJZIKSHXOYfD1lm3cylnIOKyA4/U4WrgwLtYCESAFWER+7
	 t1NWRczrFyQFF3/nX34sbphKacX02f4X3Jjc7XSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311A0F804FB;
	Wed, 27 Jan 2021 07:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 236B3F801D8; Tue, 26 Jan 2021 14:26:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62344F80158
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 14:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62344F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hlqR1UTI"
Received: by mail-ed1-x52d.google.com with SMTP id b21so19712000edy.6
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 05:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1bWSW2j2AzUWAFhSJZFlC66uupPeLjnhszVJrACnuw=;
 b=hlqR1UTITl2IrZgG52KTylgq694xBqCbP2uOK7UZErWX5UjUpEj26bNjp5I2ASQBcy
 NrcqZa4u3g3cCNc8N7TLmoBGqiGH1+bGVporc+AfMztQJ2p1PPcDWUiv4yVhdV71ynt9
 zhO8mtfBn0jWkMcGdvAqEUX+KRg6J9KBy1ZSV3aMTJP5RVUM6LWrbv2CAqkDK7igHTDp
 idIAgBkeXHS44OaKJttLbc8GPjeNt/E5oIbJIOcphXtf9MVQIccRPRnvfI+7Y2FzJtkg
 jpkaaIpJ+ImQuaKCAhoaxVAO8rv1G/1pXNAo8p5YkzVm1v5vv6lH49uXzdSUhLIgMh8Q
 G9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1bWSW2j2AzUWAFhSJZFlC66uupPeLjnhszVJrACnuw=;
 b=OVu7nMEmutHUeqN04bkZYqnjjjFSXDV0J1RZNHnu7la1AeuBH5y1yDqB8nJtEWNOia
 CrK5MlJ6ajL1qKpRFboo61JDM0yNecFVYaCl/M8Sjk7zZM3C8NKOPgdRrdSUwWvjDGqU
 JPvfPzm6YgBqY6lkud0IObVWIOH9SIatOC4UtfP2pt1sYS3xqLzWyRvbybve0LxgHYGn
 CWKeVAIlGDy1wPZwkb2u5sMqJ399NfL3NHxYIVQgYhi7QOm1ZyBw8I55XgF8S3LL3AHk
 gNtqFOrivrOdOCB2pls0biAjF9tUFxw6kw+bh4Zr1T/Y3+jKiV/YtYQDm6/4DxhmWlVo
 PN1w==
X-Gm-Message-State: AOAM533zvfG0qwFc1v1Jk78LwxWsM9ItZED/UJ20yfIcQStwSB1KNJ8M
 HeVRQZH3Hq2Y21Z5yFjFKo152A==
X-Google-Smtp-Source: ABdhPJxYoOhqu0uVmrPjAm/2q9G4E+XPc6EQ2qooE1FG/uuK4u7WYvLoeIqvmMnqRM5oH2BRxbWCfg==
X-Received: by 2002:aa7:c981:: with SMTP id c1mr4786033edt.90.1611667576505;
 Tue, 26 Jan 2021 05:26:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:65c9:91eb:731f:f2c8])
 by smtp.gmail.com with ESMTPSA id dh14sm12236010edb.11.2021.01.26.05.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 05:26:15 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: linus.walleij@linaro.org, robh+dt@kernel.org, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, UNGLinuxDriver@microchip.com,
 lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio: Fix
 dt_binding_check warning
Date: Tue, 26 Jan 2021 14:25:30 +0100
Message-Id: <20210126132531.2084711-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Jan 2021 07:52:19 +0100
Cc: Robert Foss <robert.foss@linaro.org>
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

Silence indentation level warning reported by dt_binding_check in
order to reduce noise during routine checks.

$ make dt_binding_check
mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation:
expected 2 but found 3 (indentation)

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
index df0c83cb1c6e..4fe35e650909 100644
--- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -99,8 +99,8 @@ patternProperties:
 
       '#interrupt-cells':
         description:
-         Specifies the pin (port and bit) and flags, as defined in
-         defined in include/dt-bindings/interrupt-controller/irq.h
+          Specifies the pin (port and bit) and flags, as defined in
+          defined in include/dt-bindings/interrupt-controller/irq.h
         const: 3
 
       ngpios:
-- 
2.27.0

