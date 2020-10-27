Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C929C74C
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:35:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C270116C7;
	Tue, 27 Oct 2020 19:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C270116C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823756;
	bh=BewnauDF/pdfaMjQKVYly+KokETkb3wOlXv4OXrcmmA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9HG61LezxWxtIwNtlewAt3ZdD4y8A32cgzLvmhWvzOZFg4LIcOkiVOOSTofWsdug
	 Vm74GqlwWWy0DTdwfmqvTqivBopxv+3HFeqSzgCxfRaBLYMCG5ckE+wwFWJUcz1HAl
	 TG2NRZMm2x+fNwpPOKDZTnaQbO/54plLFgEk9SYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ECCAF804C1;
	Tue, 27 Oct 2020 19:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7706DF804E5; Tue, 27 Oct 2020 19:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF495F80274
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF495F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JFgeG23Q"
Received: by mail-wm1-x344.google.com with SMTP id k18so2465348wmj.5
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oVJ/FVhCtH2Sw1ZFhzCNscPSk9Fte7d6nvWFGpvDBLs=;
 b=JFgeG23QtomWzS6Bha5qw611bEGje19zVx46h+fkAYzTIEQEBDZbDytqruHW1MHBYh
 hbc8NB4nOr8thDTFGHqduRXOXoFBlnKpnO0wrSfxEobmMiLKB6sgx0DSlrrbd/e8XGcc
 v3Q1np6j6sYXNpfOwkyo7ckuOUPScb55Qpob9lT1bzzh7g6w2Z52RaquJtpBmeFg59A+
 VlcLTMlpwf3+F4jjd3BnuiuWlxkJKnD+y7H5nW9kv+8EbPPjJmmRUyT/j9vhqbN/xt+4
 Cl7lri2vSikNhdmr83MYTg/n9cNYPlgX0Dv3lDkirzJ92qxxVXAF/Qm+GbCv5d9qy0AH
 EyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oVJ/FVhCtH2Sw1ZFhzCNscPSk9Fte7d6nvWFGpvDBLs=;
 b=jM0EPS2+C43S7UVGNG55c1ho15BQ+1NG1Y1I5No48QKZWHayPf8mWE22PTn/+lHDor
 v+MKomamwA3wqmcwBUfG6Dj9TZo8wyVg5qSYFm3pUvproZSofRoh6f4I7CbllP8TusmV
 s1NL70PMY3lmRSooZy7RTxX45uEkkzChXaTQ+89RjSWoNwf1PKYdlqbUSr+hsJ8uVQAB
 QInfaZQtsPv6ynOg4cugwro/c2sZAV2cw74OOZffm0p84JIqPcOpHvHLdEDxLEGMkNKg
 BXvBUBwx3LfxSIjmI8hzqFm2cRP5nGz2btdUaAzrR3/f3bdm/R9Pk6Gp07Qe9rOt3mAR
 xINw==
X-Gm-Message-State: AOAM5322XwBNyen7BHTbCWfO9UifDpwscADbdhZuPDSsJJsVtTnjQ6wd
 BsY4f5w5YU7rNBMAGv5Vnuk=
X-Google-Smtp-Source: ABdhPJwFXy7NDinDWuVTnQgP1h3IJuPLQhmkRksX/wb66eKevjZt2XttkN7abcq/vklzoDAAuVhS7Q==
X-Received: by 2002:a7b:cc85:: with SMTP id p5mr3993245wma.24.1603823522148;
 Tue, 27 Oct 2020 11:32:02 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:32:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 09/14] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Date: Tue, 27 Oct 2020 19:31:44 +0100
Message-Id: <20201027183149.145165-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
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

