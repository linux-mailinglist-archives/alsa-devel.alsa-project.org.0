Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 518182D0544
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Dec 2020 14:36:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F40A176C;
	Sun,  6 Dec 2020 14:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F40A176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607261803;
	bh=K30UlZzgxGw8jvfkQIxdM5HKtJCDAANhehaB3fKBWMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzHxOguLqfwAiAG/Tpf/0x7JENjR5rEEZZ+XlyNbktiFCzJQGiCifVn4gw787kqRe
	 g0tNcS/8hmyn21sE1xdJ7wBw2G4bhUusE6BnmKjuT/sojJ8trn6v13nMXZnFkSpGCY
	 9VwoLpmhLPqBX0fed+wQ5fotfkwnE9XKPA7pogCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB067F804D2;
	Sun,  6 Dec 2020 14:34:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEF9EF80264; Sun,  6 Dec 2020 14:34:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1782F800E1
 for <alsa-devel@alsa-project.org>; Sun,  6 Dec 2020 14:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1782F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rTYlIsnB"
Received: by mail-ed1-x543.google.com with SMTP id d18so10792924edt.7
 for <alsa-devel@alsa-project.org>; Sun, 06 Dec 2020 05:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=rTYlIsnBZhZ1gkeFipGqwBYR2ZwA9h+V8hdArOoD/aqyF5pkPdp8UG2LN6I69z6Z8o
 v/qbG4Tg4fZZwxqHLkJYXWphkFevKqRhcDiftdm7cW4FMW5B019iie6IKUAuqmmYoUAC
 0iceP/n6IV1kELlWzcM85oQXUlG0r5De0IpNKYpyCZHCEDp/DLhjlp1GZVhocDQQDnMl
 u2Oz4gy+73Xl0m0TmM47nRaMMFdcR46by+7wcEOQ/GWQwlNrIEZiODOYsEyHFCbh4lB6
 5SQr9x1xqbwElGItP8zmvF7oCyhW0zak8lRn7Iwsp+b+GoTEOWX/A2ymxinWVs5hZywF
 rk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cfXI1Q85bb28+McjuHeu3xbkODr0lp86DQ42QSmzooY=;
 b=S9t+TScMVbtl8C/sMy/bftrf2WEp10/vxDhd3qXZYDG/chdg/7oLHX8ZN1zV1NEXtQ
 DxPUCyyu3qGBsssmbPmyfM1GttPEGyHEdHLkkvhWnMtONxBNl8kHZpNPfAjCULkcTOJH
 LKSfZckRNahF0EEzBjjTrAU/H+kQmSzrmDmmSVlab3WueBQ7hzoJfNUagG/rYN/PpnMD
 RPxTymKhGbpWKEs563mli0UJTCWdrJeTgOb/qDZeexCfr4d3lfDXu9Xnrx7+fhE+AHKb
 Cqi4MuN8oJX6UaeoNAGLjGqcZP65L2Mynq2+RlOtcEPdtNqtoteVSW+nM23wi9yO0hBv
 8GUA==
X-Gm-Message-State: AOAM531JGUBLbQzcH0F/UyujY2nBUb5JeytAEkQ6Hi2MXhMgmZahwL2p
 0hywHMNfpmcGGuTlG+tgxqs=
X-Google-Smtp-Source: ABdhPJz+2tgBllNF3mr0DriE1oUWiJyqUX1uRzwk3HN0LdYKtYRiu18qL/KrCGFwmIWGbACXPv7meQ==
X-Received: by 2002:aa7:d99a:: with SMTP id u26mr16355837eds.32.1607261646808; 
 Sun, 06 Dec 2020 05:34:06 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id qh23sm7770129ejb.71.2020.12.06.05.34.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 06 Dec 2020 05:34:06 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v6 1/5] dt-bindings: display: add #sound-dai-cells property to
 rockchip rk3066 hdmi
Date: Sun,  6 Dec 2020 14:33:51 +0100
Message-Id: <20201206133355.16007-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201206133355.16007-1-jbx6244@gmail.com>
References: <20201206133355.16007-1-jbx6244@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, broonie@kernel.org, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
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

