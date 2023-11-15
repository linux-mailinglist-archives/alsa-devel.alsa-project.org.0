Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E2E7ED621
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 22:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A0D82A;
	Wed, 15 Nov 2023 22:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A0D82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700084116;
	bh=MAwkOg28SeypLZ4qAx06kB6SJqzZ9azpw/OeOtf5ssM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UH65tRJ/JZLSqIfW1YpaxT0CCfLqvjFERFJLg37lwXQ8JjfI8aL6HfEI/T1c83JtD
	 XB8uutCFV21sz9K7YcUcHqU9o60zxb3pK1W1eknAsTE4igMpMgJSJJiPtKERJoTlJw
	 NWvjE3VV0HAhKH/c0aMvMC9ihK4Hvv8aprAL2Fis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8F71F80166; Wed, 15 Nov 2023 22:34:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B648F8016E;
	Wed, 15 Nov 2023 22:34:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 923C4F801D5; Wed, 15 Nov 2023 22:34:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1A91F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 22:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A91F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a/z06ALK
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso682605e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Nov 2023 13:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700084047; x=1700688847;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TJq9RwRehs4D7WXODBH5ujBwSEz9WoRdCdezm7e5LdI=;
        b=a/z06ALKRHKYmKyfVW2L9je/3ZEMsQKjcIrpm2WRr8Ml+gq9vxGecSpMckTC8JYvr2
         hfnQAWESqglW6TL9GC8808Okk4DkpDcmsYfgevqRZMkkBGBz5Hjy6eLTBedK3vRBxRuG
         TO1UkEzDAeWiI/C1U+AhnMJ3fILlu5jFSgOjPQMYEr8DuUl4aT0ouMnFfY3rC4Ku4c8r
         jNTCllfDeexVmEYebNEChVnkMRlQHiX7ToQT26IPZ/j72mtwrXKXgZFV3IUqi/qqJVXC
         3I9S0CMj9wQAA5QNyrpDlONPW9/K3n07Hw5SXqiGdEn/E0rOBm+y+ueEF1VJ6Jgw52Hv
         6hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700084047; x=1700688847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJq9RwRehs4D7WXODBH5ujBwSEz9WoRdCdezm7e5LdI=;
        b=VCC5l8/3lbwHkeGiwj1mPI4mqgynTg1uGsyg2n5bA5axTBwB4qhHHsOMaB6OJZWfCh
         2nqKM7YNNMGC/WVfoeJ9vnOKx4n7EtOL0YfFBLs3GrAC61N3risocxB/CNqJ9hScHw61
         vytQ8OjaljJ+4TCujhffW4wtHVYEwyCtRCjLWH7FNkL7loYR0kWeUuYhiAFux+6S46tv
         VJJ7AGfph0y3dqkQZr9GR2KaiJJuymGBobd76C/Euh3bIHsQtk5RQaj9f+c9h76DUdxG
         kcm4RJWKqUY5T4Pgom+UMnRPNXEur75fFoTZwGbmBuUvbBG8tSZ/MoP5oPRCQTK16GIc
         C/Uw==
X-Gm-Message-State: AOJu0YwppfiUH9CL32b1vmpwvN+wUkyiDIrrW1F0v7pisMa4joLsLu03
	PHdoPpe8bs3XIssUh9egjNM=
X-Google-Smtp-Source: 
 AGHT+IHb3SyTdwLXt/HE/cynHBAK02Y53Amu6UoXjOtymiJSVwp87yE+gVeFZi19CMpgtwP80m5dNg==
X-Received: by 2002:a05:600c:4f8d:b0:40a:6235:e82d with SMTP id
 n13-20020a05600c4f8d00b0040a6235e82dmr2265604wmq.15.1700084047522;
        Wed, 15 Nov 2023 13:34:07 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:e8e:4851:e049:93fd])
        by smtp.gmail.com with ESMTPSA id
 x16-20020a05600c2a5000b00405391f485fsm914104wme.41.2023.11.15.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 13:34:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/Five SoC
Date: Wed, 15 Nov 2023 21:33:58 +0000
Message-Id: <20231115213358.33400-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OKCWQDTDMXP2FYMJWLSZ3MRABVORTWDJ
X-Message-ID-Hash: OKCWQDTDMXP2FYMJWLSZ3MRABVORTWDJ
X-MailFrom: prabhakar.csengg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OKCWQDTDMXP2FYMJWLSZ3MRABVORTWDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SSI block on the RZ/Five SoC is identical to one found on the RZ/G2UL
SoC. "renesas,r9a07g043-ssi" compatible string will be used on the RZ/Five
SoC so to make this clear and to keep this file consistent, update the
comment to include RZ/Five SoC.

No driver changes are required as generic compatible string
"renesas,rz-ssi" will be used as a fallback on RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 3b5ae45eee4a..8b9695f5decc 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -16,7 +16,7 @@ properties:
   compatible:
     items:
       - enum:
-          - renesas,r9a07g043-ssi  # RZ/G2UL
+          - renesas,r9a07g043-ssi  # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ssi  # RZ/G2{L,LC}
           - renesas,r9a07g054-ssi  # RZ/V2L
       - const: renesas,rz-ssi
-- 
2.34.1

