Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FA2B7EBE
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:00:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD9216B9;
	Wed, 18 Nov 2020 14:59:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD9216B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605708033;
	bh=K30UlZzgxGw8jvfkQIxdM5HKtJCDAANhehaB3fKBWMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muxB7m8ZXZQgPG43iYLhsG6+nFQtojTvBZziRTnza768aQDD/XgVYhAfmxccn4sQk
	 UmneswytuQtBwbdSPZASp992Ti7whEkXWepepTI7dlEhU38V+xbjZyHhor4w5O8eyI
	 +QemupqxAWJZFZBJ5FDUnm2M3Be6QxHho5TjCxVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0CDEF804D2;
	Wed, 18 Nov 2020 14:58:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EF97F80276; Wed, 18 Nov 2020 14:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7605F800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7605F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fdF8xUVo"
Received: by mail-ej1-x643.google.com with SMTP id s25so2879168ejy.6
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=fdF8xUVo3uIdHc6YyB775KnYhOIlFrGskqvtuYUq0+H0LEDxRf2FSjmE3MejSgdHTb
 8WJWYId6ImRG9GGecYu1B32uSQt7oWDTxH2x+PqtWNUitn9YCxWI0EEes+tXEV1MP+XU
 8D+YacIFqFcQzMWGR+LX6Mc6ITalnds5Ff3PCpT9y487iyq4fM4+FYc0vNpudn6aT1nA
 f/tKSRmWc1iauHA8/2II7cKUJ/ro4adTzpQmNEnWYqgZZVVWV6vKzi91xqrWu/9Z/Wbk
 IjGH8CQrSMvry7JmgYbGqaLBDpacNYpdVh4K8kq5qc3bN/DiIm8VHGvt37d6TGSFQwVl
 vKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=EbsXscadiuLjzoZ0tBhE2/ljlTLYrhu3/N0W6joOAPAIKBPCW+B6HSAI7JKkKoKn1G
 PnMKBx57p11nGz30yo4sZCO/NK3X9Ogelb3Osy7W2LcQAsOuvL/YG04t9uYGqTXBJjnY
 yeyJjBiPL8wOAyLcbvwu4K5/zPlsbIeSjrDkTTLsTYBRRif/8XVT4EhJHeyhpx32JHlz
 8joB5eolgi1scMIdUGf5TN08rdrzr1se1rF3Up79Bg8uss/P+KL9xlsNhyxXOQzq4nrC
 FPjP5wyNpjpHUuDqvPKgCH9HJQzjLsDBP7UhIo74d6uGRoNeawbmYqEzZkX2VxWO4u/0
 2Xow==
X-Gm-Message-State: AOAM531Z4t9+ACAEDuqlmMPxkjFVa+jsSCcGdPWxH3n1wJfo1vYFDCS9
 CKIVTeCWjMktCRJfeWd3BA0=
X-Google-Smtp-Source: ABdhPJwPUth9fHvvDX++NfqTDXzoOCsJv1H/KeHB1Jjd8310pAuysjnHkPHT+Mln9kBpRXazl3YUgg==
X-Received: by 2002:a17:906:c08f:: with SMTP id
 f15mr23483362ejz.97.1605707913682; 
 Wed, 18 Nov 2020 05:58:33 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:33 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 3/7] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
Date: Wed, 18 Nov 2020 14:58:18 +0100
Message-Id: <20201118135822.9582-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org, daniel@ffwll.ch,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property.
Add it to rockchip,rk3066-hdmi.yaml to document that the
rk3066 HDMI TX also can be used to transmit some audio.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 4110d003c..585a8d3b9 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -42,6 +42,9 @@ properties:
     description:
       This soc uses GRF regs to switch the HDMI TX input between vop0 and vop1.
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     type: object
 
@@ -101,6 +104,7 @@ examples:
       pinctrl-names = "default";
       power-domains = <&power RK3066_PD_VIO>;
       rockchip,grf = <&grf>;
+      #sound-dai-cells = <0>;
 
       ports {
         #address-cells = <1>;
-- 
2.11.0

