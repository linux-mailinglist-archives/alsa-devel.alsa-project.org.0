Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071C2B6F2B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 20:46:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB831784;
	Tue, 17 Nov 2020 20:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB831784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605642382;
	bh=K30UlZzgxGw8jvfkQIxdM5HKtJCDAANhehaB3fKBWMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lE7USyazPS/9e1t0OxyR3mzhrzbG1ijHponHEVFWBS3+OvbZIalpP8coaPx4fbU/+
	 hly1Y37p4XuG4746Hvs9t/0Qi5ITAmsOS+bkD205df4602cEnIx9YnjySAWxQkoQR3
	 KWOFhBcs/9dy2oOzwaOEfQpHhul/3UT3Tj6WJnxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC072F801ED;
	Tue, 17 Nov 2020 20:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A46D9F80247; Tue, 17 Nov 2020 20:45:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB015F801ED
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 20:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB015F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UIOGOw6h"
Received: by mail-ed1-x544.google.com with SMTP id d18so10850656edt.7
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=UIOGOw6hK+SW6PZnTFb6Ge3JqTDe/NwtTmNJTO4P+2RtdCxVwpi7Rq/Aqdy7x6Adcp
 wRP88fBy5dFJaM2aQnbeAQ86OaDGwNfxN12gzmJ3dkqFpVnOiTua1TOmWPi7J28YErO5
 +vT7F/x1TgHqtmEhUwh1PGspoG99p7+7gC8IC1SqDzWM6y+6IByo7u7LnARJsyzVo3vk
 EGBbLldPVSZ2FfdplHh31JJWObz6Q/AbWGttToOaFGaxQ4Bnap+uRazajLZG+ZNqt8mO
 LDNPLKADpPwuoYQpU5npEVkcgsD8/4BWY1DBz+1+56qMZZS+niS+ovqyTi/ggQR6pvM/
 lMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=RBfURWQd3UYUMhpKJuyHHvet8g/rWfwaXEjTLLDs5qH4Pbec1v8zNSiwQLeD/c4DTp
 V3skCL3PWYo4QdX1JuhaFaIm5TP/YXwce894b4E0XdTb0YRR9R2cbGsr1VKS4GSOch3v
 qdxx0FCUHtPuH3OpyBQd+oCqFXhmbU60mNE+cWR9erBvYDznTKbvBOFMX0UxfyOPWmuV
 1MYuH9q57t2Yprmn+eLUIkZx9inz1RgxiHYfuBRjvbAdKTuz+oDb2tKDQ4fpMIeD3ARH
 BYigtbw+CJ1mn/QzdMX/drdTrmu6EWUGFcZJw/RY5u4ABMBCZ3CGTtEQuu+mXtUW4Bgi
 maNQ==
X-Gm-Message-State: AOAM531bxhpw0+iXloQXBzay1gmPJlmsfHkS+02rn1I5cf8zosj/yhF0
 0SlT7sK1+gRGsuYknS5Gr4o=
X-Google-Smtp-Source: ABdhPJzm63HVDveFpEYpiHWpLCJrGBMkWK296r8Fu/+E5TNgbXn9uz3U4HX7amby2EJhlwkYrbPUvQ==
X-Received: by 2002:a05:6402:1389:: with SMTP id
 b9mr12408755edv.178.1605642319735; 
 Tue, 17 Nov 2020 11:45:19 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:19 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 3/7] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
Date: Tue, 17 Nov 2020 20:45:03 +0100
Message-Id: <20201117194507.14843-4-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201117194507.14843-1-jbx6244@gmail.com>
References: <20201117194507.14843-1-jbx6244@gmail.com>
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

