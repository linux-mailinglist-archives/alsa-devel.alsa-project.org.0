Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1811C616340
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 14:01:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB71B163D;
	Wed,  2 Nov 2022 14:00:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB71B163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667394072;
	bh=mOxm9MtA72rX7NucoCnTb2hIyewTZaxyXEIMl9cRDwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDvT8fU5aJWa+dELvq1MZo5gFEYI3PK/m1RbRUDx7HCTI2HVfBQEPqeUd0tWv6gYy
	 GHwQBmgWDBsexMPj3WCyFtVYoXXrl2AstkStVxrHZ5jf23eKo2ZcRnWeID1VpUwfDN
	 eCkoQ+o0vyH0Dch3pa5yOqxIwCwqECXZTxyRpSVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA8AF80423;
	Wed,  2 Nov 2022 13:59:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A13F804A9; Wed,  2 Nov 2022 13:59:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD75F8047B
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 13:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD75F8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="AQ8kPTbb"
Received: by mail-pj1-x102b.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso2079407pjc.0
 for <alsa-devel@alsa-project.org>; Wed, 02 Nov 2022 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
 b=AQ8kPTbbljZVxfnEfi0hbxKI6s+gMzT3qxWIe3ilfWN97UlKHjGVYW5BTYtNTaj/GR
 r5YSNGanhu5FZjRo6qzDGNK92FQVb90OmXFyhITipQcw0DQ8X7WRdldd1lVriuxJs3u8
 bclVsAx4PenGpbY2lU2i+m/kNgF3EyA0eELvzK2Hl8UfgFWodpYU4RQkOAPz4GnnjyY8
 dnHZoYjqs0AKUBo9KRCmhkHdy37BtxaoMfhq869YnSsr0DhuorCXvBpPW2KJrh0lZcj8
 m585Yw0icnATeNTAPidouJ8I/Ysoh3Crl1R2swI0tmLmCckEkpkplYx9g9uainWRrYOW
 8r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8MOAU43uzzEUBwcN8jl9h6i5tY3MCh/3gF6pphcM5rw=;
 b=aOD6orOXIDzkzLh26tvt9q/d7TUhUtsVEFvg8FXPyiNo6T6j+yE8JnQsO8S2RB0X33
 GYuYVU0ULEEhIZDfaE7HRdCFDjS+t6GLmb7py+BGJ68fGJwtXhJAsws7EHk7RDpZeGmr
 l05yuHu2CjsFxZMmimgUW7m1//EgTRmNbHeL2Wybuyr6sDK1aJpFXZaJ2l3I0hxSyy8f
 NkvZvCQ2tJqvAVBJbj4NH23X6Et0iirFZlKuhTUYNobZLn/y4KFH6aRGI14E7aaM7G1t
 0G77K8FsMF533Hdp1qyhUaTNJCe9lQ5XsjZWpTaohMCWNwnSB9znE4NOZY5jTbo47FD8
 fTvg==
X-Gm-Message-State: ACrzQf1Sr7I9WLqlgjo5Y2Smyz9mZHISv8kr534sFSWot0SU94Pd+AAz
 j47iCsATzkvkFmtvMVN4va1WuA==
X-Google-Smtp-Source: AMsMyM52YMs6itJcER5nB0dN3QV1+Sc4QPdClAE5epUFWcxb/aLsW2ay/8oaQDOlk0eVDD79VsWRUw==
X-Received: by 2002:a17:902:e88e:b0:187:27a7:c8a9 with SMTP id
 w14-20020a170902e88e00b0018727a7c8a9mr13695292plg.169.1667393988129; 
 Wed, 02 Nov 2022 05:59:48 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-180.dynamic-ip.hinet.net.
 [118.167.210.180]) by smtp.gmail.com with ESMTPSA id
 k14-20020a170902d58e00b0017f59ebafe7sm8259345plh.212.2022.11.02.05.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 05:59:47 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for two MICs case
Date: Wed,  2 Nov 2022 20:59:35 +0800
Message-Id: <20221102125936.2176748-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
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

