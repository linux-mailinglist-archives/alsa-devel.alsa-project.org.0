Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD732824CB
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 16:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDF251AEF;
	Sat,  3 Oct 2020 16:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDF251AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601735310;
	bh=++xMMoMCHox5JpJQK4Tyek8C4PULs3HeDN+VEYpRFgQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iy2SR2Osugyq+EPMeupKRF/mPE1pxxzSQedDxBXbkKUm3YnS2mg5FQPVO4gaMPS8k
	 U1KYqft9H85wj/6560+o46NO3FxRTcWtUDbWg+PkGCoePyysX/XmQuXYFpkm3EqJHt
	 iW7sT79bX5sVFRMflZQPEv/Wax+tK9n/qpXMIDqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDA8F80344;
	Sat,  3 Oct 2020 16:20:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFAD8F80337; Sat,  3 Oct 2020 16:20:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD62BF8032A
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 16:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD62BF8032A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jzcP/LY1"
Received: by mail-wr1-x444.google.com with SMTP id g4so4859241wrs.5
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Vn8gNOh/wKA2WvgMpjGgWUJ9E+Y38DnT8eZowhn/64=;
 b=jzcP/LY1R4mKytFaahWdEO6Vk5jcLb0n2gUt9PHon2fNj+pnpnm74kL/WiSwQsSrba
 XyTs7Ehty/ez/LZibzv1ie3AYf2SiJKRmlZC2Crj7wkX+IZiEPYntYrk9zhql4N4ogWJ
 kxtDpjD1iP2Do0P7C0xVjWq2kchkCNgagaVmsmFG4VPOI2N589R3HCPOSy3BO8QNj13/
 GfK4+o2Q5eX5z+AfuUGXppBCnU+pk15TzqOIAU5tCnmhYpCP9xnCzyjroSTsoiZlzTiS
 s70Ck4xa5/EPODDcfA1sHsVSkk6TYrCGJKsRxTWhjQK0nLzAU+tGyblybAAhq5E8n1wC
 1mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Vn8gNOh/wKA2WvgMpjGgWUJ9E+Y38DnT8eZowhn/64=;
 b=qgU0poIKGaqD8XDk/MkdhVOSppFp42oBXcg5QHvW+kcy4Pl5cWFXgHnSCQ4qqWu0K/
 Kjs97fpGewRYOgs8YO2Vnsd5kjujE2qXzw+2b6lwc5lk/x3vIgkZPRjzVhNV5PlRVxG/
 x4M7cF7SVjf22ONq1aaz1bf+9ugylUSFrTCp19hcqchgyxwdWS3DsmHUjoeniysfia0q
 HaDWvnqjUkIZtup/L21yg8ubfIPlcYdxU93MlOFEXePrYyN4SGxkRKbG+Tyk7hAr8Xn/
 sFzDrK5DSXuPLUPRbBACwbUvk0Ufs+F+4WpGbK6ZLzHYaaN+O5KxVbgD9FCbQp+/a/4F
 VwnA==
X-Gm-Message-State: AOAM531BvGuJmuOMIUWjc7jtnpO/zEyVpnrAAeVs5QzvNtKp3a059Yr3
 rvQdYAPEPCVbnKCizJxAzhg=
X-Google-Smtp-Source: ABdhPJwJa1+mT6bz1Ov2s+1Epz4l4uZlYboSwoCWZZWSW6DUoHBJkmfjtIlC79fVHVIPgJfbrgvYOA==
X-Received: by 2002:adf:ba4f:: with SMTP id t15mr8103039wrg.335.1601734822080; 
 Sat, 03 Oct 2020 07:20:22 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id d18sm5417473wrm.10.2020.10.03.07.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:20:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 13/14] dt-bindings: sound: sun4i-i2s: Document H3 with
 missing RX channel possibility
Date: Sat,  3 Oct 2020 16:19:49 +0200
Message-Id: <20201003141950.455829-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003141950.455829-1-peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
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

Like A83T the Allwinner H3 doesn't have the DMA reception available for
some audio interfaces.

As it's already documented for A83T convert this to an enum and add the H3
interface.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 606ad2d884a8..a16e37b01e1d 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -70,7 +70,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun8i-a83t-i2s
+            enum:
+              - allwinner,sun8i-a83t-i2s
+              - allwinner,sun8i-h3-i2s
 
     then:
       properties:
-- 
2.25.1

