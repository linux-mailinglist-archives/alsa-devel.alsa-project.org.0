Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B89ECB46
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2024 12:33:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F492BD3;
	Wed, 11 Dec 2024 12:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F492BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733916782;
	bh=NtVph11BLd+x3z/1Zok/7JAFGIkvZxSriGpx0rha4FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n+0t5/JQiVFfs7PSEYepZmyPPQ9IktHrCvEyS8fZ9T+Zoo+v5FQaVRARtBXMmXrM8
	 WSf9h5io+Sr+uVqTlGa5tRJmTs6UFdi5pb1WYsY6CAhNUbuPBIHfgcFeM3+X3xlUe6
	 WjCY/0MdI21ildH0kZo6CrXBuk4CDXW6kaEuKRmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5284BF896EB; Wed, 11 Dec 2024 12:28:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DDB5F896F2;
	Wed, 11 Dec 2024 12:28:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17849F80482; Tue, 10 Dec 2024 18:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FA07F800E9
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 18:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FA07F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=p0NQ+QbG
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so4671212a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 10 Dec 2024 09:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850646; x=1734455446;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzloo09Dgg4guioxkvLZOvAnsn9Efhp0SVwyR1byrx8=;
        b=p0NQ+QbGnrhdqzeS48qNUAyKzytLVxiZF2kDAnGHEXDsI76lFlpZcntSV8iWEWYHO5
         CH3sbyLZPhOdjU/kqv4F1m1ZvRnnRIZA9w79hzMQzhxmhANNOuou6rqrl5QA4t85g9Bt
         6yknFAwYy76vYsLj+1T8bnBvphRlB8ddgPqsvlvqv64OzHzDrIcKJdw/3bVoUYhWoQn6
         O0UhjPOgx2EtciBk4T66EkRZQyNygjaDMoZ5vOkP4dYiONJai17TjZ560saPbCYmlJVH
         RTDQGq/8Heawzpdet3kxxtqKFtiElJRAwxZr3tutbYawsK6E5QhMIEg/Ya8tWwdiI+iV
         Gcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850646; x=1734455446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pzloo09Dgg4guioxkvLZOvAnsn9Efhp0SVwyR1byrx8=;
        b=cX2DUSCcSHRWqdHwDTkjUPUG0wJyEtFAMObI5Ta80No2XOwEKI+fHDSrSwOSc+x6ZM
         NXAbC87rpr+BCPmBzc2bHpD22dySKgdj1r1RymVL9A4I1HqzGKfHwgpIkqBUNfgBhVqS
         Dc+Sgm6SO91bW/Vj6SxCQ6F+fnI7GieY3jsckcqYCcz22UiRd4xDkPZS5LZl1oaEi4fe
         ckArFi8BTcASrrJmXwzwihIGJ70xXw492KXXmlm0Ei8G7OEaRJNcef9TaVZlrPpWREsT
         KhThQj6ywdlbfSmATaV8h5XVrsFoFQxIVGwjQURpg/1xSg/ZGW3wJMjXtb6FHTUDd19P
         XGPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJJ8aASP5HJ9K8ll9OcGHfa6NYGn7Pjr4Masmk+xkrbulVY6dZ+/EYb95ejBnIQ1QWyRsv5FUGNfss@alsa-project.org
X-Gm-Message-State: AOJu0YwXvIuo3LXKxVimHAwlqrJQxq3s+9p5HaTDc1czCeZv1Bogo3BE
	H14hhyQz2uY2FDMRim/3ocj25JTtwKSP5ndSl1GViOaLDmdKzALC0nyOIBvnmMo=
X-Gm-Gg: ASbGnct5F9RZnVIgLtgfo46vecCysZ2tgd1Y7Zb919kEVMFifvMHEqm+YgTQ23TI6Dd
	bWGoxgA+oZx14zfWTyid+GYgs9TkN8c9ad/gGtwVzg/zEKLCZp9f8i9gvLvETBv3t91cE08pSlB
	sP7qAnj4+9NUHKgNgrZbPKGWBaJQ7Xvv5Nrqjk63h0V2LCg0mbAeGXTh3NOwWPX6w9pWaqewDLx
	HEzTu9/NI6Nf1OXdVHCChhsu1wGiHO2Z4ZZxynOvRutfDTKIegR4/SOGNycyq0Km4id8dWgzMEF
	bkce2gPJLLE=
X-Google-Smtp-Source: 
 AGHT+IHu+/x+M8u5QIMjQ6egtfsihnsclgAo9NZ4IQV+C7GzhzYxCnvnX8xs1AndpKM2ie6VGxgEag==
X-Received: by 2002:a05:6402:3591:b0:5d3:e45d:ba91 with SMTP id
 4fb4d7f45d1cf-5d3e45dbbfbmr13230055a12.32.1733850646516;
        Tue, 10 Dec 2024 09:10:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 18/24] ASoC: dt-bindings: renesas,rz-ssi: Remove DMA
 description
Date: Tue, 10 Dec 2024 19:09:47 +0200
Message-Id: <20241210170953.2936724-19-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5PXUUGUNMLOVAY6KM7CSTFDPJP6XWH74
X-Message-ID-Hash: 5PXUUGUNMLOVAY6KM7CSTFDPJP6XWH74
X-Mailman-Approved-At: Wed, 11 Dec 2024 11:27:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PXUUGUNMLOVAY6KM7CSTFDPJP6XWH74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the DMA description, as it duplicates content from
../dma/renesas,rz-dma.yaml. Additionally, remove the MID/RID examples
mentioned in the dropped description (this information is already
documented in the hardware manual).

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none; this patch is new

 .../bindings/sound/renesas,rz-ssi.yaml         | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index f4610eaed1e1..5b42eec864f8 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -57,24 +57,6 @@ properties:
   dmas:
     minItems: 1
     maxItems: 2
-    description:
-      The first cell represents a phandle to dmac.
-      The second cell specifies the encoded MID/RID values of the SSI port
-      connected to the DMA client and the slave channel configuration
-      parameters.
-      bits[0:9]   - Specifies MID/RID value of a SSI channel as below
-                    MID/RID value of SSI rx0 = 0x256
-                    MID/RID value of SSI tx0 = 0x255
-                    MID/RID value of SSI rx1 = 0x25a
-                    MID/RID value of SSI tx1 = 0x259
-                    MID/RID value of SSI rt2 = 0x25f
-                    MID/RID value of SSI rx3 = 0x262
-                    MID/RID value of SSI tx3 = 0x261
-      bit[10]     - HIEN = 1, Detects a request in response to the rising edge
-                    of the signal
-      bit[11]     - LVL = 0, Detects based on the edge
-      bits[12:14] - AM = 2, Bus cycle mode
-      bit[15]     - TM = 0, Single transfer mode
 
   dma-names:
     oneOf:
-- 
2.39.2

