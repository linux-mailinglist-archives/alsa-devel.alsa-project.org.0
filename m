Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B312A0882
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA5B01673;
	Fri, 30 Oct 2020 15:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA5B01673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069642;
	bh=Ue8qZnMFUZeo20dwZRs7/u0dyXcxW17dx1xrato0Uuw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0phxmy+h9M4j5yMiCDGugldloIQ3DybSdBkk7uHmfSmj6GgEnn2Ru8HfoaZZyf0E
	 CO07ihm4NUIi72WCqVfLHUekFkKMJVYH60Rrs6zi6sOPoap98CtOHJaZMr+Wr7edya
	 DnCc9C0tvjwMDUIuLNroFHDRq6COkgla0GWjEc3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14499F8053C;
	Fri, 30 Oct 2020 15:47:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 078DBF80533; Fri, 30 Oct 2020 15:47:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4F2AF80508
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4F2AF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TyBDGJ3w"
Received: by mail-ot1-x343.google.com with SMTP id k3so5770689otp.1
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lryb+OP/I/Ms7egySRuAjr25d3wKcdnJ3fbOd1ZGv1M=;
 b=TyBDGJ3wIylb4gjlBDCtDtpfP+nJ9PmgmGbLZ3Dm2jAdxrwElvjrd+tFDAnXq4oqde
 huO6S08fJ6TysELD2fXV5zwyVIWZIxCPY2ouO0Qn3YXaWWXJr9Wc8l/ADvFNnKouDhue
 ivafVtR0gqzjl9DwS8zd2fB0J/z4Ne52OsYn6taeFk7KlrJcDZLkZO6fuO5+XiBRRsjJ
 1XddmUpBqrzgRwjiaBGI06A11Wa57MrTimVbOvsZmm8D1MNPuhcynjxI/GD5T33vuy2z
 iwuRn35R4S8dxT3gCuZQTbant7/D40rAuv+/ve60CuV6zrmvuYsoOkfqp7QzwDjIV3dX
 6J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lryb+OP/I/Ms7egySRuAjr25d3wKcdnJ3fbOd1ZGv1M=;
 b=oLofLY72/BD7DG20ROS53iyi2KNNbQleuDGHnIL7lflOi2q2TQjtb/+44pE9ugo5RT
 q5mFRTZGkDzu3ulBoGSuzI+w6VpDwgSJq1TdF3taDhn0VsyFEH2OXOz2wT7UWFa3UgTT
 GLWvRRKWWUuLX0FOWqVV1gCujNHfwg/gzUnNNNsP/XPrXGdUBfUENij5FJ2YnpGOw143
 6HIkTRPGgIQq35shheiqSASFE9y7zTO7SsbFHiB4xkK8nunK2AJ5TF1XSsgblWfAOcPl
 BL3tcKQjQO2lnpfvOEV+FmgnG3Z5Dszg0z1znTPMC/LN6gAemNIagKaSm+FtAa4l6Kbf
 70Uw==
X-Gm-Message-State: AOAM531aA9H5UWfDkh4dOjZjpI65oI151ssNf0wHh2fMvFZc7Xw4o1DN
 uguJ7ScYUNh2/bQ5piDKc4g=
X-Google-Smtp-Source: ABdhPJx/zMztCtP29RQZq2MUgF2cChnQA8L4sJ0hBJ9oMvypsiYMDKoZgstrh1rIdiCERnuM0cnt0g==
X-Received: by 2002:a05:6830:154d:: with SMTP id
 l13mr2074653otp.61.1604069257953; 
 Fri, 30 Oct 2020 07:47:37 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 14/15] dt-bindings: sound: sun4i-i2s: Document H3 with
 missing RX channel possibility
Date: Fri, 30 Oct 2020 15:46:47 +0100
Message-Id: <20201030144648.397824-15-peron.clem@gmail.com>
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

