Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CBE61193B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 19:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E1C1B0B;
	Fri, 28 Oct 2022 19:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E1C1B0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666977831;
	bh=3nk8XTEqAcP94v3rPhP1wLutr28T5Ed6U+1ki7mH8Fk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vSi8n3DGmHNCnTM9FWpykkf3DR578HTlmqBVgvMcUlebCc/fLa8FGG1498klczRTL
	 BeAurwQFIe6joI1BZgu9RWDWXnoR1rk/Uk1XNMPcYdlHLtE/AWzVGRxkDkEWs3+IOp
	 bFR5V9eODS4qC/wy0q189xb0IAnGq2Fv14jRgrd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA20F804DF;
	Fri, 28 Oct 2022 19:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBAFF804D0; Fri, 28 Oct 2022 19:22:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09620F800E1
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 19:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09620F800E1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=compal-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@compal-corp-partner-google-com.20210112.gappssmtp.com
 header.b="8U/f+2hJ"
Received: by mail-pl1-x629.google.com with SMTP id 4so5439833pli.0
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
 b=8U/f+2hJhjF5TA6s84eiTLKl/O3fHVNMKbmkkAJ5FX/aRcszHn6fJBjnhGYYHQFhG2
 fTBTsLcL84cBOXGg2Q2mgiqcOwDnk0opQiYBNiOu+hlqD6C3F0E27LwvFgrg+Gg2KVws
 IY4kwfWNNnR2taX0KaH5Xdz+RlGQDTjTI2U7QhXlmr6JX79RWzIM7O4kL64obG6g93Ap
 mWD4qOOieD+oZ44d4vdRDuRIkCdVolcJZunUq0em5vrp7EzLh/2OkrNn4jIuIg3M2bYE
 cuTIJeKO+N8Hd8kHyOTSeNXd5vXuSV/aBQl2AyhpHg9klUbUKNp4gciAvT5jrIToqZuN
 lHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFMOsXdTB5Df8ggzsilthr4+D/qAdNxZr6+urTN5nT0=;
 b=jLvrn/UC69wEGryli/Jx2RxcSHM8llRn57H6z/CsU+11QU9Ffa8LSsbRXIxCCx4z7K
 hng9ekhZNFRl7QhBzybxYRFigNHWYbk5C0EZvIsYPqbRO4fcHqqywzAlwgq1J/nMDZx7
 jzZvOmoF2RaoVldCLrV92IdLm/2Oj+puBSsS8SBuHkKhHm76LgftIAA545YvKSsIzoLI
 PcQQm4LGVKGz7zE8z89lJ8+KSLrbk3HOKM52MWz7dOzObB2edjTl96727cQffeCA0qLk
 7VLIyzcVETfLfSKArG14sM6vN/ovkWHwL3b0woADip1RjlwfOQJoXAiDPnTeKji6X8Yx
 rwyg==
X-Gm-Message-State: ACrzQf3DGVdLGwkZuu0eYatgRsWIM2o8jGKE9+PyXWab+HngJXg1r+aW
 X+vxUDFmVLkzk68rRpmSW/GAQg==
X-Google-Smtp-Source: AMsMyM7tCLeMSIkzuM8wzGQXwgjziB10x1ohi/U73N7eYMIHY7EgkGmX+ArJKDN2eNOxLRCaa23Crw==
X-Received: by 2002:a17:902:968f:b0:180:a7ff:78ba with SMTP id
 n15-20020a170902968f00b00180a7ff78bamr10947plp.87.1666977747715; 
 Fri, 28 Oct 2022 10:22:27 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net.
 [118.167.210.30]) by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b0021282014066sm4604945pjb.9.2022.10.28.10.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:22:27 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine bindings
 for two MICs case
Date: Sat, 29 Oct 2022 01:22:14 +0800
Message-Id: <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
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

