Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65778CC33
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 20:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED92CF12;
	Tue, 29 Aug 2023 20:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED92CF12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693334114;
	bh=RIC8P31K7QFakjlb2bSHCx0WbUWLm6FmuOdBAqo+tss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gmFimyzpigvTgomhN5Vxxi+zDFvRqdiGPcEpzxPFvOzKlqLsNn3i3nkYFyZn9xemz
	 X0IfgkeybsAPVjYd5zcoSLnbxhhf79pv7DzQ4hdX/nIbr4NzwaUJ2xRnB3Qcd6nMBp
	 mQyl5ZXZOsFvJY2EXCJP87m0kOa5YAsoAIeRokZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9CE1F80694; Tue, 29 Aug 2023 20:29:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED6FF805E1;
	Tue, 29 Aug 2023 20:29:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80704F800F5; Tue, 29 Aug 2023 19:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DA03F8025F
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA03F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hrdMJrO/
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso600330366b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693329452; x=1693934252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7lMdZMlveV8HTxjWTg5ACxFNvsNK9ctXT4heEXGiSw=;
        b=hrdMJrO/Dt42S8+b/O8WqnLLurQK3hxu2Q1jwKGo1VfFE0roRD/lVI/J7Z/LQLf5eh
         n7dC5HGzxWzJqFMZLyF7cFn4zV/VcYGJxErheoB2ChSfFBMxN/yUs6XWLJ0S2ZuIla8Y
         0u3onf8sUsexOZiODwZrGZNOKPTvRhqo96lCDv1LuWCSdGzzOlVNx9mw2rAO8jIfaGHk
         /br4zlr2VLW91r8D68MHfzoqZ1y4M5uMeQpG16Ckcy3jV1tr/ANnKpFhrzfhoFvRTugi
         cyhdY6L3rqkO+xDkuvPkSYw/2knnGV9WABuJXId0m2dX4/9BgQtp5zbJnAgvTXVaKV+Q
         0knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329452; x=1693934252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7lMdZMlveV8HTxjWTg5ACxFNvsNK9ctXT4heEXGiSw=;
        b=JWjiafksJaSnNdy5CRXRef5QPdkb75uLj1ncc/7fyJyr8NORewf8dYQi3p4IstImoj
         NCjIzmAyx1B0EgFYUDfPSvSsTfFNiflqdIM42Hy1q+mPb3lBQASIcY8a+jH/9GUFQXG8
         e2R/vjt4Zi8QaM18LkJsd8cd1FC9ut37uARZU3vZAOjtKNAfDJVGP9sSQuUMI6hcDbim
         EdVPXMO3zINFLvrblSmDxmEGxrS4AE58GkTShgxicn40QUfhYRjdowF5DOlbajuTuGXD
         l+8+PJWEHNiMYbY3vYNwr9CoVm09AQr1yQ8tDzs/GPUxA0QbR5IVikhUspKvAj3DNYjl
         yJ1A==
X-Gm-Message-State: AOJu0YxMdCo1IGjyJ9cDxSC0gibNT5g9kJlrkCSdWST3Y9PY4+ta8Fqt
	HQ3bSXeJ636RfvwrKd7uzQ==
X-Google-Smtp-Source: 
 AGHT+IE6J/8Uhsz2BfGzGhWBYZ5T9q00RqsVnVJPgvgQjSVnSU0lPHnvdnxG/R+1BUlkQ8618ashfw==
X-Received: by 2002:a17:907:6e2a:b0:9a5:8269:2c94 with SMTP id
 sd42-20020a1709076e2a00b009a582692c94mr9897657ejc.57.1693329452148;
        Tue, 29 Aug 2023 10:17:32 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 10:17:31 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	alsa-devel@alsa-project.org,
	linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 08/31] phy: rockchip-inno-usb2: Split ID interrupt phy
 registers
Date: Tue, 29 Aug 2023 19:16:24 +0200
Message-ID: <20230829171647.187787-9-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: knaerzche@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7QB3NSXSSTL3742YUASAMW3ORU7TXL5G
X-Message-ID-Hash: 7QB3NSXSSTL3742YUASAMW3ORU7TXL5G
X-Mailman-Approved-At: Tue, 29 Aug 2023 18:28:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QB3NSXSSTL3742YUASAMW3ORU7TXL5G/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 51a9b2c03dd3 ("phy: rockchip-inno-usb2: Handle ID IRQ") added ID
detection interrupt registers. However the current implementation assumes
that falling and rising edge interrupt are always enabled in registers
spaning over subsequent bits.
That is not the case for RK312x's version of the phy and this
implementation can't be used as-is, since there are bits with different
purpose in between.

This splits up the register definitions for id_det_en, id_det_en and
id_det_clr registers in rising and falling edge variants.
It's required as preparation to support RK312x's Innosilicon usb2 phy as
well in this driver and matches pretty much to what the vendor does, so I'm
not expecting issues for other SoCs with that change.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 99 +++++++++++++------
 1 file changed, 70 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index a0bc10aa7961..a4a1716e67bd 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -116,9 +116,12 @@ struct rockchip_chg_det_reg {
  * @bvalid_det_en: vbus valid rise detection enable register.
  * @bvalid_det_st: vbus valid rise detection status register.
  * @bvalid_det_clr: vbus valid rise detection clear register.
- * @id_det_en: id detection enable register.
- * @id_det_st: id detection state register.
- * @id_det_clr: id detection clear register.
+ * @idfall_det_en: id detection enable register, falling edge
+ * @idfall_det_st: id detection state register, falling edge
+ * @idfall_det_clr: id detection clear register, falling edge
+ * @idrise_det_en: id detection enable register, rising edge
+ * @idrise_det_st: id detection state register, rising edge
+ * @idrise_det_clr: id detection clear register, rising edge
  * @ls_det_en: linestate detection enable register.
  * @ls_det_st: linestate detection state register.
  * @ls_det_clr: linestate detection clear register.
@@ -133,9 +136,12 @@ struct rockchip_usb2phy_port_cfg {
 	struct usb2phy_reg	bvalid_det_en;
 	struct usb2phy_reg	bvalid_det_st;
 	struct usb2phy_reg	bvalid_det_clr;
-	struct usb2phy_reg	id_det_en;
-	struct usb2phy_reg	id_det_st;
-	struct usb2phy_reg	id_det_clr;
+	struct usb2phy_reg	idfall_det_en;
+	struct usb2phy_reg	idfall_det_st;
+	struct usb2phy_reg	idfall_det_clr;
+	struct usb2phy_reg	idrise_det_en;
+	struct usb2phy_reg	idrise_det_st;
+	struct usb2phy_reg	idrise_det_clr;
 	struct usb2phy_reg	ls_det_en;
 	struct usb2phy_reg	ls_det_st;
 	struct usb2phy_reg	ls_det_clr;
@@ -429,15 +435,27 @@ static int rockchip_usb2phy_init(struct phy *phy)
 			if (ret)
 				goto out;
 
-			/* clear id status and enable id detect irq */
+			/* clear id status and enable id detect irqs */
 			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->id_det_clr,
+					      &rport->port_cfg->idfall_det_clr,
 					      true);
 			if (ret)
 				goto out;
 
 			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->id_det_en,
+					      &rport->port_cfg->idrise_det_clr,
+					      true);
+			if (ret)
+				goto out;
+
+			ret = property_enable(rphy->grf,
+					      &rport->port_cfg->idfall_det_en,
+					      true);
+			if (ret)
+				goto out;
+
+			ret = property_enable(rphy->grf,
+					      &rport->port_cfg->idrise_det_en,
 					      true);
 			if (ret)
 				goto out;
@@ -944,11 +962,16 @@ static irqreturn_t rockchip_usb2phy_id_irq(int irq, void *data)
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(rport->phy->dev.parent);
 	bool id;
 
-	if (!property_enabled(rphy->grf, &rport->port_cfg->id_det_st))
+	if (!property_enabled(rphy->grf, &rport->port_cfg->idfall_det_st) &&
+	    !property_enabled(rphy->grf, &rport->port_cfg->idrise_det_st))
 		return IRQ_NONE;
 
 	/* clear id detect irq pending status */
-	property_enable(rphy->grf, &rport->port_cfg->id_det_clr, true);
+	if (property_enabled(rphy->grf, &rport->port_cfg->idfall_det_st))
+		property_enable(rphy->grf, &rport->port_cfg->idfall_det_clr, true);
+
+	if (property_enabled(rphy->grf, &rport->port_cfg->idrise_det_st))
+		property_enable(rphy->grf, &rport->port_cfg->idrise_det_clr, true);
 
 	id = property_enabled(rphy->grf, &rport->port_cfg->utmi_id);
 	extcon_set_state_sync(rphy->edev, EXTCON_USB_HOST, !id);
@@ -1362,9 +1385,12 @@ static const struct rockchip_usb2phy_cfg rk3228_phy_cfgs[] = {
 				.bvalid_det_en	= { 0x0680, 3, 3, 0, 1 },
 				.bvalid_det_st	= { 0x0690, 3, 3, 0, 1 },
 				.bvalid_det_clr	= { 0x06a0, 3, 3, 0, 1 },
-				.id_det_en	= { 0x0680, 6, 5, 0, 3 },
-				.id_det_st	= { 0x0690, 6, 5, 0, 3 },
-				.id_det_clr	= { 0x06a0, 6, 5, 0, 3 },
+				.idfall_det_en	= { 0x0680, 6, 6, 0, 1 },
+				.idfall_det_st	= { 0x0690, 6, 6, 0, 1 },
+				.idfall_det_clr	= { 0x06a0, 6, 6, 0, 1 },
+				.idrise_det_en	= { 0x0680, 5, 5, 0, 1 },
+				.idrise_det_st	= { 0x0690, 5, 5, 0, 1 },
+				.idrise_det_clr	= { 0x06a0, 5, 5, 0, 1 },
 				.ls_det_en	= { 0x0680, 2, 2, 0, 1 },
 				.ls_det_st	= { 0x0690, 2, 2, 0, 1 },
 				.ls_det_clr	= { 0x06a0, 2, 2, 0, 1 },
@@ -1425,9 +1451,12 @@ static const struct rockchip_usb2phy_cfg rk3308_phy_cfgs[] = {
 				.bvalid_det_en	= { 0x3020, 3, 2, 0, 3 },
 				.bvalid_det_st	= { 0x3024, 3, 2, 0, 3 },
 				.bvalid_det_clr = { 0x3028, 3, 2, 0, 3 },
-				.id_det_en	= { 0x3020, 5, 4, 0, 3 },
-				.id_det_st	= { 0x3024, 5, 4, 0, 3 },
-				.id_det_clr	= { 0x3028, 5, 4, 0, 3 },
+				.idfall_det_en	= { 0x3020, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x3024, 5, 5, 0, 1 },
+				.idfall_det_clr = { 0x3028, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x3020, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x3024, 4, 4, 0, 1 },
+				.idrise_det_clr = { 0x3028, 4, 4, 0, 1 },
 				.ls_det_en	= { 0x3020, 0, 0, 0, 1 },
 				.ls_det_st	= { 0x3024, 0, 0, 0, 1 },
 				.ls_det_clr	= { 0x3028, 0, 0, 0, 1 },
@@ -1472,9 +1501,12 @@ static const struct rockchip_usb2phy_cfg rk3328_phy_cfgs[] = {
 				.bvalid_det_en	= { 0x0110, 3, 2, 0, 3 },
 				.bvalid_det_st	= { 0x0114, 3, 2, 0, 3 },
 				.bvalid_det_clr = { 0x0118, 3, 2, 0, 3 },
-				.id_det_en	= { 0x0110, 5, 4, 0, 3 },
-				.id_det_st	= { 0x0114, 5, 4, 0, 3 },
-				.id_det_clr	= { 0x0118, 5, 4, 0, 3 },
+				.idfall_det_en	= { 0x0110, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0114, 5, 5, 0, 1 },
+				.idfall_det_clr = { 0x0118, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0110, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0114, 4, 4, 0, 1 },
+				.idrise_det_clr = { 0x0118, 4, 4, 0, 1 },
 				.ls_det_en	= { 0x0110, 0, 0, 0, 1 },
 				.ls_det_st	= { 0x0114, 0, 0, 0, 1 },
 				.ls_det_clr	= { 0x0118, 0, 0, 0, 1 },
@@ -1538,9 +1570,12 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 				.bvalid_det_en	= { 0xe3c0, 3, 3, 0, 1 },
 				.bvalid_det_st	= { 0xe3e0, 3, 3, 0, 1 },
 				.bvalid_det_clr	= { 0xe3d0, 3, 3, 0, 1 },
-				.id_det_en	= { 0xe3c0, 5, 4, 0, 3 },
-				.id_det_st	= { 0xe3e0, 5, 4, 0, 3 },
-				.id_det_clr	= { 0xe3d0, 5, 4, 0, 3 },
+				.idfall_det_en	= { 0xe3c0, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0xe3e0, 5, 5, 0, 1 },
+				.idfall_det_clr	= { 0xe3d0, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0xe3c0, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0xe3e0, 4, 4, 0, 1 },
+				.idrise_det_clr	= { 0xe3d0, 4, 4, 0, 1 },
 				.utmi_avalid	= { 0xe2ac, 7, 7, 0, 1 },
 				.utmi_bvalid	= { 0xe2ac, 12, 12, 0, 1 },
 				.utmi_id	= { 0xe2ac, 8, 8, 0, 1 },
@@ -1577,9 +1612,12 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 				.bvalid_det_en  = { 0xe3c0, 8, 8, 0, 1 },
 				.bvalid_det_st  = { 0xe3e0, 8, 8, 0, 1 },
 				.bvalid_det_clr = { 0xe3d0, 8, 8, 0, 1 },
-				.id_det_en	= { 0xe3c0, 10, 9, 0, 3 },
-				.id_det_st	= { 0xe3e0, 10, 9, 0, 3 },
-				.id_det_clr	= { 0xe3d0, 10, 9, 0, 3 },
+				.idfall_det_en	= { 0xe3c0, 10, 10, 0, 1 },
+				.idfall_det_st	= { 0xe3e0, 10, 10, 0, 1 },
+				.idfall_det_clr	= { 0xe3d0, 10, 10, 0, 1 },
+				.idrise_det_en	= { 0xe3c0, 9, 9, 0, 1 },
+				.idrise_det_st	= { 0xe3e0, 9, 9, 0, 1 },
+				.idrise_det_clr	= { 0xe3d0, 9, 9, 0, 1 },
 				.utmi_avalid	= { 0xe2ac, 10, 10, 0, 1 },
 				.utmi_bvalid    = { 0xe2ac, 16, 16, 0, 1 },
 				.utmi_id	= { 0xe2ac, 11, 11, 0, 1 },
@@ -1608,9 +1646,12 @@ static const struct rockchip_usb2phy_cfg rk3568_phy_cfgs[] = {
 				.bvalid_det_en	= { 0x0080, 3, 2, 0, 3 },
 				.bvalid_det_st	= { 0x0084, 3, 2, 0, 3 },
 				.bvalid_det_clr = { 0x0088, 3, 2, 0, 3 },
-				.id_det_en	= { 0x0080, 5, 4, 0, 3 },
-				.id_det_st	= { 0x0084, 5, 4, 0, 3 },
-				.id_det_clr	= { 0x0088, 5, 4, 0, 3 },
+				.idfall_det_en	= { 0x0080, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0084, 5, 5, 0, 1 },
+				.idfall_det_clr	= { 0x0088, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0080, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0084, 4, 4, 0, 1 },
+				.idrise_det_clr	= { 0x0088, 4, 4, 0, 1 },
 				.utmi_avalid	= { 0x00c0, 10, 10, 0, 1 },
 				.utmi_bvalid	= { 0x00c0, 9, 9, 0, 1 },
 				.utmi_id	= { 0x00c0, 6, 6, 0, 1 },
-- 
2.42.0

