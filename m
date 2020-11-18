Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B42B7EC1
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA551717;
	Wed, 18 Nov 2020 15:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA551717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605708114;
	bh=s8FuYgKJ78wSn3OGugmA8kez5JuseWvs+rnANyhbNJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GNJnJHDkhp6b6xTyXhsu7JDuGS/bGK+QAVysfTO8vRjH/i2KE9nI+Whe8O/NjjHaX
	 GIEiw3NIBf+H2lnhWuB2L9UnTieR5DMqI9wnV6wSyKFe9ZSuWcPgB66z6ZzbWPebxR
	 wr1I9S6QJ0VlUK2jnKnCtykI8Hd6QPqr0xqW6hlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80157F804E2;
	Wed, 18 Nov 2020 14:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 336B0F804E0; Wed, 18 Nov 2020 14:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B5FF800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B5FF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ItuNwInc"
Received: by mail-ej1-x641.google.com with SMTP id gj5so2868975ejb.8
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=ItuNwInc2MBwj4FPc/vi8+RT3PaxeSvrL0xAoc2Um/9NAI/K/r5esaAf8vYLZvfi2N
 Gn5FdFm8AcWSkuEj0mecew0gSpzUcKx2bY5Ys2T/SRcbCzEslZloWfRO9hpVGkfPdAUN
 e4812uni4BzgCCh4xGpbNRXbyq9JcguzIWoNBt+64GLcVPlTtcMixYIZyjl4x64n2LhW
 t5ygd/OxZWeGUFR8o+rwptKuSqP+1/EAkhuhHNw0Jz3yVtNr1I78EelRvf4MTthuMFaU
 Susaq2zd7AYwogwUmtCBT0TwDkRMqBHNpGjG58LoW+PDY4Nf9gt7ECy3xXxAXeb4KMEw
 DRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=ug+39a6oQr0L0a4wWt58J9PAg66EjXOo7KTGyjlvumEciopuGHOCxdp9JNsTWHOiBB
 TV3nqld0y8rweoTeo67R6zx/RmAAw+/qq4qoFzn2Ex9UTKSzZz+neyIkXACW8aMo1N6W
 axehOawIqsyX/2uo6Nr/xgTuqbAhMTGJ6AoHAOBzzD6b/8rmN1ltF8PuCsq1m/82AY4H
 Q8znqsTXJBpBe0HJMEyYAfBN4KwbUZYXk1KgLDXPUhXYiqdl4wrgcGCzTeEgvTq3Rhxd
 6KUJounghhrBCODGTzAIU7MtfAmx+95xex/QbPVDKjkk/1C1uRzhN3lcr2SbHhzSaTHb
 Bp4g==
X-Gm-Message-State: AOAM533vCl1zeIy5pblR/khzZ5oIatvGTVeEHkJaoU6CbEYmZOBMbfVl
 iAqLTaiWh5MCbWcy/ZLnQi65/RLNt4TNCw==
X-Google-Smtp-Source: ABdhPJy6FxHe0EbiFMLb69ag6/AE/2uHZ1fKsTWtsbK6CS3f8YZgjTZfbNAGLYo8ILiVxlTQhXgfRQ==
X-Received: by 2002:a17:906:6b86:: with SMTP id
 l6mr24155838ejr.524.1605707915976; 
 Wed, 18 Nov 2020 05:58:35 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:35 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 5/7] ARM: dts: rockchip: rk3066a: add #sound-dai-cells to
 hdmi node
Date: Wed, 18 Nov 2020 14:58:20 +0100
Message-Id: <20201118135822.9582-6-jbx6244@gmail.com>
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

