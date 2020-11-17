Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7C2B6F3A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 20:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A949017BF;
	Tue, 17 Nov 2020 20:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A949017BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605642517;
	bh=s8FuYgKJ78wSn3OGugmA8kez5JuseWvs+rnANyhbNJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=owCpOXzkUZ2E4d1j5DGgdP/k8ILKRydAChHgtwcfOfrTAvpyrWqD75vXlJSDVRC1U
	 pEVTvl2GFmmwPNe+RXq2HidertC57gm/zcfCo2Vs86E7JBjLhePsr6WPvPIIuPuucD
	 Xh1dn3Js9aXV03djz1J76b1MW45ijT0YA0HYGGw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E6AF804EB;
	Tue, 17 Nov 2020 20:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 481CCF804CB; Tue, 17 Nov 2020 20:45:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 251FBF802A9
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 20:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 251FBF802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="inLULAMd"
Received: by mail-ej1-x644.google.com with SMTP id o21so31122518ejb.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 11:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=inLULAMdL/crFcKk/opBy24CIVw5O1FrAWbNTOXuWYPxS7W1sK/ue9rhC+EUcZvv8x
 5oK71otzs3JGFWd3SPpaJyZzCe+g2Af+lbI1sgA9iD90rw8hHV/K54bYfrCnNTLCHdpB
 uR7n38MCdhSdQIQyEdezQ6fVHTEyA15pMbbgwIJ/S55HlI49y0V/45KRI3roAtO84qu+
 4yiFI6gV9z4ZSTXBQNTQIyc4lj3nk32hDXocZyw9tUger/J7P14i6H3/zEJJdxtMARTg
 5aKaPeXDmT41dmOZAWuB37/c18WCDKfK8pdANfnvoFLNwg8X8+If65Uh6awTlUyFgDKF
 nXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=TVpxn9s9boThrGueisYv17IWRxl+n4kOz8CmYz8oI8s0ht4ClyZEkUbz21u47Lk2TD
 B55VzF1PWaNCPgEjHUxec/lIQ/jpzZxiADXFE6V9LF11xPA/VWwyzeTzTvZHBE/WXvNA
 7O06iEmsAK7u400wWDRUuR/GinBwI2MvS37SlicnGziMD4IbA/RZmwyknl6ykcCUy61+
 z5T4ZB/llFAjxHhs9YpLTROM/W4WpRFXBAGrHk3VbmKo1eYCD0ZzcDUkMsQbLPQBx06D
 Df/Oi3uFjrvcJ4FssHUXPyxuUk9zokkpp7ymOm2duREBMougE0KQeYXAvhRHf4Predec
 uv4A==
X-Gm-Message-State: AOAM5317GtrVa/Ok1ua2EA/iuUXSN1StDnm+qoSR3cVkkN4njeDboKgZ
 Hz+KUjMPNzfVXA06awBX2mA=
X-Google-Smtp-Source: ABdhPJwr+w87CiPQMS+gZT4E2SCcWJAhpf3wLEmXdGSKKFZjrhCgeFmYqXwu6gLajtyK923OBX5Law==
X-Received: by 2002:a17:906:3a1a:: with SMTP id
 z26mr20294782eje.519.1605642322124; 
 Tue, 17 Nov 2020 11:45:22 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:21 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 5/7] ARM: dts: rockchip: rk3066a: add #sound-dai-cells to
 hdmi node
Date: Tue, 17 Nov 2020 20:45:05 +0100
Message-Id: <20201117194507.14843-6-jbx6244@gmail.com>
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
the list of DAI specified in the 'sound-dai' property,
so add them to the 'hdmi' node for 'rk3066a.dtsi'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 252750c97..67fcb0dc9 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -124,6 +124,7 @@
 		pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
 		power-domains = <&power RK3066_PD_VIO>;
 		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.11.0

