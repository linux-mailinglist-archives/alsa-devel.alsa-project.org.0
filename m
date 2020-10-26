Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D846F29963F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:58:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A08516BC;
	Mon, 26 Oct 2020 19:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A08516BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738684;
	bh=Ue8qZnMFUZeo20dwZRs7/u0dyXcxW17dx1xrato0Uuw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8R/RDBGAQG9ojgrhnlI8TQd/KlSzBj3lqHZPVMzzTwJNniL+OBU7KbLgzEV1zGRC
	 Q3zeOSxayBQf1j4eFWaLEt7IwlEE15L6kPyiV65zRsR42PL3aGdmsyz7A6OBjBWQVl
	 RHTXt4r272K1u5lVf05Xj+3nPQ4iUasNrDZmVRdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A4BF8050F;
	Mon, 26 Oct 2020 19:53:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7270F804E6; Mon, 26 Oct 2020 19:53:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90F7FF8027C
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90F7FF8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mY8aroLS"
Received: by mail-wr1-x441.google.com with SMTP id t9so13879345wrq.11
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lryb+OP/I/Ms7egySRuAjr25d3wKcdnJ3fbOd1ZGv1M=;
 b=mY8aroLSz1nGeSrxTnx4Sme9Ni+bW451qsuOiXSkc24mpKnaIx7sbNAOq8L+/XsdGC
 avDTaXB96y8l3eO8DMVKu/o1Ey5ry7zZ/bdt3gr+06tix6M9L8kMJ5ySpnw2buWKbNYd
 YGmne1cE5QISH5mQcRwV+0Z19VJ6fDomD3HiTB0kXd0fl+IHlmHXRsXWo0aBj/ueVzfn
 lum3gxVPEzy746i5yfrsbJCc1AJUOTRuet4tj8CzekBS31XeGQ7GlzqYqzVp/15xgh4X
 bxDZ5KWf6K+WddQqEa2EzeV8pVvwqY343L+UFFcv9ow3Yag6SBAh7FVLkE76ObcyjWRg
 H80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lryb+OP/I/Ms7egySRuAjr25d3wKcdnJ3fbOd1ZGv1M=;
 b=gDdvLjSrenB6kjziWtjfpUKM2Z028YGTnYR+G9I1RZrN5u4UQIZ+aV/NqlOUgebJ4g
 3VdoC92DjuD7wu8yVOdpE4NK/ky54L0jU9WMlLcvBZ4jB1xNfoxjMTL7K6kidZP++Kg1
 GRULLPe8Vqz5PXBjk7csDFudhzpK9xrW1/T2otf+bm6m+lpw/njvnxNnLEW57jorP5Qk
 bbK5r7bcDAVVCHbyhGBumZQtnrNT5YSTkUdWaEdLBJfFvskLLLw5NoGffaxSk2MCo24R
 2bdmQoqPJBhpJ+KZoIOFG1bnUwxdeDJq3R4JY8dhCGsIUb/Po8teX+dLS07fhxpQmuF+
 CN5A==
X-Gm-Message-State: AOAM532Isn3hEeH1ldRWgwHa/WUDOT/7OGqu0yUoVJuiUR8drHfBpy2J
 3m07LSoaOAHfoe/NPfRI+J8=
X-Google-Smtp-Source: ABdhPJwEG7gDFVW6v4Is0z5snwiPucvy5DMtgCJWZospVdAskQyaVJFTeCV2jan1tgP2/IFBf9IBWA==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr20391118wro.326.1603738377924; 
 Mon, 26 Oct 2020 11:52:57 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:57 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 13/14] dt-bindings: sound: sun4i-i2s: Document H3 with
 missing RX channel possibility
Date: Mon, 26 Oct 2020 19:52:38 +0100
Message-Id: <20201026185239.379417-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
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

Like A83T the Allwinner H3 doesn't have the DMA reception available for
some audio interfaces.

As it's already documented for A83T convert this to an enum and add the H3
interface.

Acked-by: Rob Herring <robh@kernel.org>
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

