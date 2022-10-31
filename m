Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA8613615
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 13:23:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F1BA166A;
	Mon, 31 Oct 2022 13:23:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F1BA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667219038;
	bh=mOxm9MtA72rX7NucoCnTb2hIyewTZaxyXEIMl9cRDwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDF2ItDrCU8g4z1wUAdswdNixGLEZNcHTTJyQfI1Jd+owzviNdAe1hh90IbW3eDec
	 p/c7NUR0IqnwA4lOHTgpD09QlEoHWz4VCV0YrzKn+eTWPdpZj4Epxdb+aN5OQRMw8K
	 FhVVmvscUfdJG3KIf2XA9739k0YgVK2i/EV7rDqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F08F8032B;
	Mon, 31 Oct 2022 13:22:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23550F802E8; Mon, 31 Oct 2022 13:22:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59FBFF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 13:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59FBFF800F3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="xN7tZuq2"
Received: by mail-pl1-x62f.google.com with SMTP id io19so10573176plb.8
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
 b=xN7tZuq2qouAUfQeHfc1L09Per4c9T2dfiX3qbfhPmIHtEpLihIg5PUhpTLg4cy6Yz
 y4qRiWhmHwBlpXJ29ln1E28k7ZzojpUiQKRbv9wZLFEhOr0Z942UjtTXEfeimin3jDqa
 neD3zqkPD662BsriBkWqUIVqFs4EfQqZDqFkWyoOP3nau+pvtuuuTCrxPtIHI/GnqzQm
 0sVgDmgPPSNmx9cwmnDeaAkfefXEJfd75ywNTMS2PqMgugfqehY62FXP4MSugTcp/RG8
 fJqsXymPgQMRD3XCT/djPuBES7ykfUoXAsTLjqKrJz9DfqFUAAcaG1dKG+mMr356jFzl
 bmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
 b=GNB5d7BqtJwbIKy0lrpxxJGmh1//q2AfdBtZa+ETUTImTsxKD54218Hj8aYki0jtil
 1qv75u0fSa0EzNHYYWCF907FT+jk/FfqMbjEcFiC8tcNEu5mY+J3OApzcga50ZR5KNlo
 5OmJfkXrITTsuz5xX8NpIHOr2Uqt0fP/UwvCD2iMcjCkjPTG2u1YMB6+h6V2gxzkltLf
 DuCmzddrlyFvqQlp1qvXe0rkJtQa6RCSq9X5kWW5p6xcOv3Y2MLeDyvluw982aqOZN6S
 sN7wkYohjMz5n2J1KFyhKElblNEg92o4I2dDMAYXnrEDsbj550Ql7PhcAMxua3/IvWrA
 PT0Q==
X-Gm-Message-State: ACrzQf1vgFRevjNQKl8LlHQOv3yiyOnM4FoIcg1zt8uByclfq4J2CmF1
 Q3WtXGkBcF8wtUD7ssdW2RZR8A==
X-Google-Smtp-Source: AMsMyM6YF1Ot+9V5drlAzDff3KujPHKAXkBxz0hQIsb2pJJFxWRH1341O2ZxT8TggMSOEsuLif+hKA==
X-Received: by 2002:a17:90a:b00d:b0:212:f91d:88c7 with SMTP id
 x13-20020a17090ab00d00b00212f91d88c7mr14690544pjq.112.1667218956067; 
 Mon, 31 Oct 2022 05:22:36 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net.
 [118.167.185.125]) by smtp.gmail.com with ESMTPSA id
 y123-20020a623281000000b0056bf24f0837sm4445483pfy.166.2022.10.31.05.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:22:35 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for two MICs case
Date: Mon, 31 Oct 2022 20:22:23 +0800
Message-Id: <20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
References: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
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
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..9d3139990237 100644
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
@@ -63,14 +70,19 @@ required:
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
 
     sound: mt8186-sound {
         compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound";
         mediatek,platform = <&afe>;
         pinctrl-names = "aud_clk_mosi_off",
-                        "aud_clk_mosi_on";
+                        "aud_clk_mosi_on",
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

