Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2C61293B
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Oct 2022 09:55:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92BAAE0F;
	Sun, 30 Oct 2022 09:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92BAAE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667120133;
	bh=/XDFwllDx6L45a20vTLzsbo6Ji0HvXHkRFHaKE/ww1w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wmef1bM0w903eDgpYWWdR4cRwmwVxKy53K7/oqvYo4aHj8AjbYgg/OymuAPvSBDve
	 dHN5/H3iEu9It0BOdeod5OHpaKpnsqhX4CWKcgGVI83YAnRw8LXPpbaHVrQ9CGL+WE
	 KMj1jAEgRXfkZEZMB/Kw7lKcmKGigIgo4bXKHISA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4954F800A7;
	Sun, 30 Oct 2022 09:54:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44C63F804FB; Sun, 30 Oct 2022 09:54:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82483F80217
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 09:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82483F80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="TMAYw7yi"
Received: by mail-pl1-x62b.google.com with SMTP id y4so8379904plb.2
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mv+BLBNqBpWOA3vNeD4kjDL2MA9szaMxuhuDzPkq1ks=;
 b=TMAYw7yigmzOnPFudyA0NvbqzI6+opZd+SUpXDi5eDzotTQJ0WK2rDpLf5ccdeVE8g
 3PqS7MQpWLfHuwgGbYKmJZ2ysQsAW1YmjPIcozhsoG9zMMJZpaOr+M9Pul9ru6h0VY4S
 BGS9GSTc7OXtM8PWGJJW6xY4PeB5KTn5r/+Qw5zirqfqnBqIQO+x4EZD1RBvKsebU5Yp
 ZbBBx/6D3kgyYQQnbdOIvxb90fDUTc28u/3Nn7yVrKmk1TRLw5gOQqggutvvSCKoRof1
 s9C69TJ6maRenZJG0/QV+XYqrl4hWPrdxOdA1gSC3UVBdl5NGNTTpSEoaE0IvmFl03h9
 uBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mv+BLBNqBpWOA3vNeD4kjDL2MA9szaMxuhuDzPkq1ks=;
 b=6o8si6AGENA9aY1km2fazoBqH0cCy7Py5MvP5jbrB6aPdVvj4Lgsfwp9WLlvzrVhx9
 vpsaxeaK36HDD4SscNjEVHKuxHmGBvI0MzlIiIKZh+ksvRSN8dHigybzM5XtdmX3nnXV
 7TJUM+NZftukH8vjMJvNz8VAl3gF2vTXkwJI9BHKdV/7Cz2oxA7U7tWCuT+P0OedoLk9
 N+wpXIdWt2wh8RdevjFSIkkL+fX28/Gv0nwirBpqbD+5/qQSEdYp4XJ3RuvJyozAucdV
 QNcBIyvhKe8dQh53rF2HXUyQPCn7DnPFpDJbDc3SvIJ0CbZmuHjQF2s0cRTLJPUuh5TU
 SVow==
X-Gm-Message-State: ACrzQf3gNs0hsXeaG4ZBZ8pcqqAaW6+rVu/6dmhoca/sErwrLLiimlQR
 m7IW3kfMq9CrcNRe8VuBS1NhmA==
X-Google-Smtp-Source: AMsMyM74Wq7d2lV8Ds8HII8GqBYH4mUQ5vxzN4bfvVHLfopJFxA14Df2ZPsSepJWrLU8Zi+ASuBHUg==
X-Received: by 2002:a17:902:7897:b0:178:9292:57b9 with SMTP id
 q23-20020a170902789700b00178929257b9mr8369620pll.102.1667120051195; 
 Sun, 30 Oct 2022 01:54:11 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net.
 [118.167.185.125]) by smtp.gmail.com with ESMTPSA id
 n9-20020a63f809000000b0041ae78c3493sm2054627pgh.52.2022.10.30.01.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 01:54:10 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for two MICs case
Date: Sun, 30 Oct 2022 16:53:57 +0800
Message-Id: <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
References: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..46ad2cf4365e 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,13 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description:
+      dmic-gpios optional prop for switching between two DMICs.
+      Ex, the GPIO can control a MUX HW component to select
+      dmic clk and data form a Front or Rear dmic.
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -68,9 +75,13 @@ examples:
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on" ,
+                        "aud_gpio_dmic_sec";
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
+        pinctrl-2 = <&aud_gpio_dmic_sec>;
+
+        dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;
 
         headset-codec {
             sound-dai = <&rt5682s>;
-- 
2.25.1

