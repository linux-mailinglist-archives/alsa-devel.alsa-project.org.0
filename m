Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F3619C7E
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 17:04:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 944071681;
	Fri,  4 Nov 2022 17:04:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 944071681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667577895;
	bh=AbcYLh7YM4Q3nsFtE/FYP3xHAZ/rU9PZNBeC6ncDzHY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZmuNlNDDSKQdiHGbSM5oLHlrL9oZBSUIx144E9Qg7ZKXv8pNk9IegE2yz3xJ1oTrG
	 PzT6Pen8+eIQG6aqqMqEV6MTjKxM0XXyR5KlFIEtzJAmuW5MrhQ5yT3ZSnSexmhW38
	 HLL7EvvF/zME3J+zeG5i4aMu2F+0uiguUFoh99ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A6D2F80558;
	Fri,  4 Nov 2022 17:03:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 742C8F804E7; Fri,  4 Nov 2022 17:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37A3FF8047D
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 17:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37A3FF8047D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="vmrfmJNY"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 578A78523F;
 Fri,  4 Nov 2022 17:03:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667577808;
 bh=wbhn+skkupJVu+1v7hIeX5XvWmqgUIxMAmPAUVDuk78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vmrfmJNYlCunX96RsaPRE6dyyQcrKPG5YGbAYljzqw4nRPY+mQUhX1Cy96Xi3OpPv
 kwRkqXWr7QclEwQJgbMCzbXZCj5FKdLG1KMPuJ+VoVdpzLg6gUy1RGqc63hVngD84p
 1Sk8atYPIw6aD/z2i7lD9giX8kdB5hvgwqj3vNiB9sja1xLoZivQlv8cDDOGhPGg+/
 2VBGlkRs0nt9k7RJP9onEqt03rBx7IJlEyYV5IEfmmqRub8mwminsWvBh4VZK7jELx
 M5+KKMCIYFC1fC0JqM6gOadbMpqn1ViTHGm8jwRB1+VQi0K4nnV6P4DcedlLGjjvZr
 DhfwLE4YZTW3w==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/3] ASoC: dt-bindings: fsl-sai: Use minItems 5 for i.MX8MN
 clock and similar
Date: Fri,  4 Nov 2022 17:03:14 +0100
Message-Id: <20221104160315.213836-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104160315.213836-1-marex@denx.de>
References: <20221104160315.213836-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

The i.MX8MN currently uses "bus", "mclk0", "mclk1", "mclk2", "mclk3"
clock, which adds up to 5 clock total. Use minItems 5 for this setup.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org
To: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 05bad828cc353..59a13cd0887e9 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -74,7 +74,7 @@ properties:
           - const: mclk3
           - const: pll8k
           - const: pll11k
-        minItems: 4
+        minItems: 5
       - items:
           - const: bus
           - const: mclk1
-- 
2.35.1

