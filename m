Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813ED611717
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 18:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E551E7D;
	Fri, 28 Oct 2022 18:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E551E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666973349;
	bh=3nk8XTEqAcP94v3rPhP1wLutr28T5Ed6U+1ki7mH8Fk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gr7+SOba4XehdKcabwAqzu3vPRq00RioXPsSENAEv8ThpPHJ9xWDF+wyo/WJdul7S
	 RL6DqtYOVJV89EhqQnas/8qqahYMPeKJhvJEEPigQ+wi/TtstgojNfCCPE11A8e4CZ
	 jeNiCfoZqQK7fk3QuNeCFjInv3Y7HS8saAySY1eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C92E0F8024C;
	Fri, 28 Oct 2022 18:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E45D8F804C1; Fri, 28 Oct 2022 18:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424C4F8024C
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 18:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424C4F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="zZC+U/aH"
Received: by mail-pg1-x531.google.com with SMTP id g129so5212978pgc.7
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 09:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
 b=zZC+U/aHqGW7IFAZAT+3MMfxAOCLrwRbrJkGx9aRZlZrEK91b5LV1yRvLpqRDKms3n
 HHh3MTsvqFGJ/6gBEXzoUu4QNQm4x+M5zMZoHQSh1XrxC7dP0sP7PaqvUHScU9mHRVZj
 Pm1N6esyC8jfpG2CkBLI+W0+OkuIIGw2WISEC4Bl8RmLPYpj+fWY7axdG/qxuLgSUpqN
 tk1FQm/M6TntPVogLH8KS2suatkgPh4NfmWHdJUZvlsHMqlNK0wBiWnzB+ays6G84Dyz
 akSHt18VG5GweZWQkvuufNNZ4ndduvth9ndhCjRTuaof2qnOxK5OI5l4exDYBn3s1wbV
 ETyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
 b=bW5lk6qahZ27Zhexv6qHW4FJAH/T5du6vJC+jiTnASR9PiW5wmNnKznbODrG/zIwdf
 51jT3ZPmhtkihyr9C3dkaUqcPTTjjU+EVfjDCUgv4BftckHXAEFcxujViG4p05w547ZH
 xGp4Jpl8bdIYNvv6OCpUjGu3N0cgp31XIy2Yng6VL4/VIrV9r9yyD6tBWCE2vBIWi8z9
 pezEetWig0dOnQB0IC5vcYa39KR557KLrKcqhaxipMMnrlZeq/irJ9v+MT2Qzfelpyk5
 YmYOu7J4Jgb0bMY/yUZya7KaXIEbnfB65ZgBeQreke8W8aHJXrdGFoLOljm3dS0MYGQo
 gjcA==
X-Gm-Message-State: ACrzQf0xqJXddaef1s0FougR1kjGamBWtekwaRa+TaWLG+KmnOkXBlet
 O4Gdc8bO2ynWxJRJxbD53pjSXg==
X-Google-Smtp-Source: AMsMyM7yJoeG8ckb4rHiQkGpwA6IxAzvmzG5yzqEtCKG0mybBC/dVnuYOEDRHXiy3eVt9wfYq8Dirg==
X-Received: by 2002:a65:5b0b:0:b0:462:da7a:1ded with SMTP id
 y11-20020a655b0b000000b00462da7a1dedmr179239pgq.605.1666973282863; 
 Fri, 28 Oct 2022 09:08:02 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 b70-20020a621b49000000b0056abfa74eddsm3112071pfb.147.2022.10.28.09.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:08:02 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for two MICs case
Date: Sat, 29 Oct 2022 00:07:32 +0800
Message-Id: <20221028160733.1390230-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
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
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 4fc5b045d3cf..212d2982590a 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -21,6 +21,10 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8186 ASoC platform.
 
+  dmic-gpios:
+    maxItems: 1
+    description: GPIO for switching between DMICs
+
   headset-codec:
     type: object
     additionalProperties: false
@@ -72,6 +76,8 @@ examples:
         pinctrl-0 = <&aud_clk_mosi_off>;
         pinctrl-1 = <&aud_clk_mosi_on>;
 
+        dmic-gpios = <&pio 23 0>;
+
         headset-codec {
             sound-dai = <&rt5682s>;
         };
-- 
2.25.1

