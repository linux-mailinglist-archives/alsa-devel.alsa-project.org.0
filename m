Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E792A0877
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:52:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFACF1616;
	Fri, 30 Oct 2020 15:51:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFACF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069558;
	bh=BewnauDF/pdfaMjQKVYly+KokETkb3wOlXv4OXrcmmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHQzTm79dwHGRccP/DBpZELg8S2qRrj/S6FFdmrrMELVK0khpxP9GfqDnzulpOcT2
	 DqU4CBUALx1lDft7DF3+G5IRB+Yd/Zm8odSlmWVtHm57hX0mT7RVpT/XaI+IQR4q+2
	 cnSRJ7r2M3z9ZRqM196g1lGQSnigTWIas4goofbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8A0F8051E;
	Fri, 30 Oct 2020 15:47:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D658F80519; Fri, 30 Oct 2020 15:47:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7707CF804D2
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7707CF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fo41DSUE"
Received: by mail-ot1-x341.google.com with SMTP id 32so5774593otm.3
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVJ/FVhCtH2Sw1ZFhzCNscPSk9Fte7d6nvWFGpvDBLs=;
 b=Fo41DSUEVbzQPAdEL5Qtyz4z2iSNc4Le4KQFuUlEHBRFha5WMVd0X8S5hSRZDgTwiR
 UzYmACLYwUxNWcoVuRbLboW7VF1Yd0xkIENJsQ4PxQ3+xp/JpROX4OW1WHkRf4xsK+2b
 boERIt9wtvMSVMk8Y+SHluG9mtVHKNB2rVMS+z5XafLynCEKlRCSgbPgreloqUdnTC1m
 MwScAHNBy5sCmE2UwlugVIcfEagWL9tWiEKW9GZP70CL7JGXDOgRvuRD+BL1AcXA+VhB
 /X0FdXz6k6TEqIAlQOOYzSgwATtzMMj7ubIqtsrmrL/GuJliUGY+gCn205xtvnAc/zWp
 PGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVJ/FVhCtH2Sw1ZFhzCNscPSk9Fte7d6nvWFGpvDBLs=;
 b=qGG5fzqee7kVa1Frki0l1MPo7KzOrOOh/A1V19MJvJotjmEb09abUHmYzfMXSl39ph
 1FLbiziVHNZbGbjmnoKrgq92719lL6Set2FN7Euv03oiuD5mQdnNjfN5CXK0f9aVcPCD
 N35G4H5z/ERFlEce7cMDBk/VUNqZw/62StdtQ40mjn4psY6zKlQPX0o2VgHiGOADsU7B
 OEUdoNw/PTg6hnm5hrdmRYSNyq2vAPCIr/6OXcnN7PJx9UIUpB9Od2qW9YyoB8Ns36E8
 cff7j5qhAjvIN5V0AhpaOlonX5uH5ETHFbGCABaYviR4674jLKPVpevySnt2HUf+uadN
 tRRg==
X-Gm-Message-State: AOAM533S27rpWsx3OZJm/C6m2ydYWFAPI5LYsTR92iA3NbFU++LcCOhi
 4Pt4Z9//rosmugwiuXR1Itk=
X-Google-Smtp-Source: ABdhPJyKZ6t6HzCgn0v344wc7X+L4p2mhZJAK+1PwynZRyu/yG4kuGiR1Ckhd/jwemoqXYLH1kUSyA==
X-Received: by 2002:a9d:649:: with SMTP id 67mr1989186otn.233.1604069246097;
 Fri, 30 Oct 2020 07:47:26 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 10/15] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Date: Fri, 30 Oct 2020 15:46:43 +0100
Message-Id: <20201030144648.397824-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to H3, except that it supports up to 16 channels
and thus few registers have fields on different position.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 112ae00d63c1..606ad2d884a8 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-i2s
           - const: allwinner,sun8i-h3-i2s
+      - const: allwinner,sun50i-h6-i2s
 
   reg:
     maxItems: 1
@@ -59,6 +60,7 @@ allOf:
               - allwinner,sun8i-a83t-i2s
               - allwinner,sun8i-h3-i2s
               - allwinner,sun50i-a64-codec-i2s
+              - allwinner,sun50i-h6-i2s
 
     then:
       required:
-- 
2.25.1

