Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A29F28AA67
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0078316A1;
	Sun, 11 Oct 2020 22:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0078316A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448216;
	bh=Ue8qZnMFUZeo20dwZRs7/u0dyXcxW17dx1xrato0Uuw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QwOQALDdxS/H+HJMdKN2cDXkDRYdHUHOw9Kj3ka1fLR6qzw5MsUTO+8nOITlSYWfA
	 3JpHeUbp06yaNrk8cuDtQdUZHFe8sqObiQC/g1scv9UXa8AKyrD3jzWHM2NBCAZ9lA
	 Cpa5mMuNPx0jDQr0xPI0LaJMr6Xul/FJVyR3LlTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C20A0F8031A;
	Sun, 11 Oct 2020 22:23:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30430F80304; Sun, 11 Oct 2020 22:23:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E84BEF802F9
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E84BEF802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rAX9LyBh"
Received: by mail-qt1-x841.google.com with SMTP id c5so12244985qtw.3
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lryb+OP/I/Ms7egySRuAjr25d3wKcdnJ3fbOd1ZGv1M=;
 b=rAX9LyBhQRjGuVquLmVQLXPeCqbM+PKvTpqudvQ8odySOCoDSzcLV3hKt+GDznepfJ
 bmA4KDaC4rF1pzAjhPCwKfH6J5pZC4fgHvitjewrVIXZuBY1q5Qe46HcWsWNMv7U0LeA
 oq3Don423DuBS7WMcNwRD1JFfHYnYPS9zNIdElxDMD/9ioFeG5NA9K+/usHSLSKluTc+
 jgT1HqRK5BqqoC+bt622kZRwMJGnxpstA1NbRaJKnQYdQWD78QsHrXBJyecAkq8pVx5O
 IuQ9L3x9/Dks2/kUJSkmWH0ucrpvqpQjy9+SyPBgtlQz9Ugqz3cFIXIteSABTuwS78Bn
 BZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lryb+OP/I/Ms7egySRuAjr25d3wKcdnJ3fbOd1ZGv1M=;
 b=W65C4XjcZNndKcg8OMYswUD6CaXPU1VTka9vlGvG6JX/DsRiiOH+PTD01JEbxa4XqF
 p64hviYy83P9qP1RGJkySOULeHcY221XFU9n9JHGACYNWBdlZQRwwQg/YKlw2Vl/+yCe
 qGdi45DnFSBRAUWs63ywURSNObTvZ2YAgcwcvsn/SCXekH770MTgN382/zpRtYXQcizp
 5H0If1mCUO3xg0k6uyubcHDUPb0B5c5GsmOx8mDDAIDxEg46fhfpw6GRJTroFV31miYF
 KhEvCyQZvFKJobbI1N/5TEpFB/p4VvYsEdp/3c1kSqE+upuOgdQIu1Tbu6Km2LUq6X+R
 QLdA==
X-Gm-Message-State: AOAM533KYi47+/b1YZUK1gqXBB/xPkkYwECC2czYlgTXSjeD0uZQXukz
 XUFlvsE7pHPLgJ5/XXpB8jVlEuAOnZ+Oog==
X-Google-Smtp-Source: ABdhPJxWrxt2WnMT3nzMt+0sTbhfP+3jSHNUCya8daPb6HIY1AaWF6DkniHZhmrpgU6CmjRHq0GB1Q==
X-Received: by 2002:ac8:6945:: with SMTP id n5mr7111000qtr.202.1602447789800; 
 Sun, 11 Oct 2020 13:23:09 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:23:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 13/14] dt-bindings: sound: sun4i-i2s: Document H3 with
 missing RX channel possibility
Date: Sun, 11 Oct 2020 22:22:23 +0200
Message-Id: <20201011202224.47544-14-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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

