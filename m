Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4B8430243
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Oct 2021 12:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19E1A181A;
	Sat, 16 Oct 2021 12:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19E1A181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634381790;
	bh=tLqvrMst1ZmWPZpMi+TOBSpK4yqLEk8ZzqXAe+YnSdE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sdNIrsRohWcAyJt73Op8EGjTiCBlUd4RskJUssGKRqr8V6ODUtGDz9wDvk57ikKKh
	 7tUFMRcB27lMZd8RMWMz5oVzF+A1IouXRITbKtMFUkhNk3kXht9NJzI9c/iqnxBJ6w
	 nQXEjK83faOjOWkGzChHyJnbpTYN3xJRSvL70OEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9184F804E5;
	Sat, 16 Oct 2021 12:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C421F804B4; Sat, 16 Oct 2021 12:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0F0DF804B4
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 12:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0F0DF804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y8DwMJem"
Received: by mail-lf1-x133.google.com with SMTP id n8so52944562lfk.6
 for <alsa-devel@alsa-project.org>; Sat, 16 Oct 2021 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y+9bOnIXUtzWVh6jBYBC6CeR5DMs4Q+9HtnUCVf3acw=;
 b=Y8DwMJemYcnlx6P+YftUdk8rxOVY+oN0oN+w9IT2y0dmmjr6h8QRNCn2Pn49r5v/l4
 2DKzpzPjJ4Xwbv5tAkAo/CMmPoR51LIjT7XZH2HyogOWz8ilfprw/WcGZ4FdSg/jBgG4
 gxFA2LFwpBrqVRXsil0OWJkhCX+tevmoV96xJIa8sPJ2paw4J/HPrXfbuL2osgtrBAYo
 WgC1SPx8lFk3/5BEnFv2AaJuU/TSuExT5K9YaNPFbNgGSN03YgpG0CjRFe42wCwXhcsL
 np23VuYCvILThoi7s0RGJzfNsPgu1z8C+UBR/RTr+1rXEOoSU3B9hsi/LlKU73y4AMRK
 H1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y+9bOnIXUtzWVh6jBYBC6CeR5DMs4Q+9HtnUCVf3acw=;
 b=VGfYB5qaBKrCUsN6IqIImmgKIWVstUBRVRsvFNXVF4VhsC3WUnRwkdRpJFiOx33Amc
 +7ABlVSdICAlWsKClZt4B7IeoXTmTZtLN5ZnWu+aTAEjfaS6Kw9/2LPpht3fgmnd0HSZ
 zSMGsY9pN50GhQxn8kTBWxMiqWQnbH/bsqKsxOrZQcFKGZOM76TbjdKcbf1K5JoW51CY
 Wd/2kkk2watwZjszotL6tizp/LtsZhQ+loutwySq30onVzxWnCxKDpFOP0B0xZdl6MaA
 Tkm7DW9BNBQR00hw2i64m/KjkqqmRxvbcx+UCfHJznnjhYkb7GO/XiZ/wmmq+HINsY2W
 sxDA==
X-Gm-Message-State: AOAM531eHgPP/f5ZOp4rUDRFUwvMUGoZqYlcyjgbZhnZsweuN1ErQTr+
 1mKv8v79diRuXDpA5WDDrbI=
X-Google-Smtp-Source: ABdhPJylXH+nWmjZF01140Heh3m/n1DiYce+4V6jSo5B/7WqbKmJi/0cw7jiUYbX6TptgPDy3DEgsA==
X-Received: by 2002:a05:6512:118b:: with SMTP id
 g11mr16986499lfr.353.1634381671808; 
 Sat, 16 Oct 2021 03:54:31 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id r3sm814224lfc.131.2021.10.16.03.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 03:54:31 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/4] ASoC: dt-bindings: rockchip: i2s-tdm: Drop rockchip,
 cru property
Date: Sat, 16 Oct 2021 12:53:51 +0200
Message-Id: <20211016105354.116513-3-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211016105354.116513-1-frattaroli.nicolas@gmail.com>
References: <20211016105354.116513-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

This property was only needed for a driver hack, which we can
remove. Since the bindings were not in any kernel release yet, we
are able to just drop the property instead of silently accepting
and ignoring it.

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 .../bindings/sound/rockchip,i2s-tdm.yaml         | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
index ce3e18b50230..6a7c004bef17 100644
--- a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -82,12 +82,6 @@ properties:
         - tx-m
         - rx-m
 
-  rockchip,cru:
-    $ref: /schemas/types.yaml#/definitions/phandle
-    description:
-      The phandle of the cru.
-      Required if neither trcm-sync-tx-only nor trcm-sync-rx-only are specified.
-
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -144,15 +138,6 @@ required:
   - rockchip,grf
   - "#sound-dai-cells"
 
-allOf:
-  - if:
-      properties:
-        rockchip,trcm-sync-tx-only: false
-        rockchip,trcm-sync-rx-only: false
-    then:
-      required:
-        - rockchip,cru
-
 additionalProperties: false
 
 examples:
@@ -177,7 +162,6 @@ examples:
             resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
             reset-names = "tx-m", "rx-m";
             rockchip,trcm-sync-tx-only;
-            rockchip,cru = <&cru>;
             rockchip,grf = <&grf>;
             #sound-dai-cells = <0>;
             pinctrl-names = "default";
-- 
2.33.1

