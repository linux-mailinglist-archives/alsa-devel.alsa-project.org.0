Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F4776F4E8
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 23:57:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89B833E7;
	Thu,  3 Aug 2023 23:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89B833E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691099821;
	bh=2a5LrPvh06lZHnswdQzaZ4xmQdjzGQ7FCeGJr9aY3Tk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cUjzkD03i52b/aBwMMNDlepblnI8y5IdZJDsZCyr5rmOWtftWx//ETze91IqakHxx
	 VGZD9CXPmoNMasmWZNa+CUgxEjakRYuyCl+3KN0CrhrA+yciGaZmVHcpDOTorks7Uw
	 HxKUCA/rUOyi5BoI35hHg8H8XtycUVlQcjnF6sZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8827F80535; Thu,  3 Aug 2023 23:56:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3780EF801D5;
	Thu,  3 Aug 2023 23:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2179F80087; Thu,  3 Aug 2023 23:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1595AF80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 23:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1595AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=eHBslHzu
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-56c9237e0ffso227746eaf.0
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 14:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691099754; x=1691704554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwJBy26yCQ/MHezd9s4R5qRHYs3iJG1/4Ao8pMVQ4Ow=;
        b=eHBslHzuArU+U8tPXhi5LtJhNVsrjM+cC5Zepdo8Hw+YE4fmqGaEbQgdIYaycpPkmS
         wInlrsiCWpn7gp1LkOaaWkdIQ8qLnC6S+pQGM4UtVZkwVORK/qRior3hEi7qLTGF777E
         UJEw+fll81r0lzgSBL1tkmoT9YqQTaV54U2pft1z050D3DqcwLAPWZqnHi88HcopiYKI
         N5bSVpS3AkUeTcpgQWUhP/CDxzgseEY1RKEx5RmHTymXeoTiZBT2ojEAcMlPgqXtKzaZ
         1wpDjJzttdANWVwKqPpEK7lgonSlRjWMzfeYibpDejADxdmLT5rT6R/Nq2SYG+PiXHEZ
         jA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691099754; x=1691704554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwJBy26yCQ/MHezd9s4R5qRHYs3iJG1/4Ao8pMVQ4Ow=;
        b=kbksqfS4NADWrwy8y6pb0ZEM/XRTyem6utT2PzbohpBJaLWU3dPoU0pwVNH9tAahcT
         W/3Xwdv1bfmpFed9URdQpwJmoMxR23vwKxyntqnqOSvaLbQJq9n4DqbmZQn2N23oR5ll
         QZlE+Z0e9OmCGxASUFVAgx2JnIw5fGKHjDPzdghixZn3sPEtSVTUjhAW8n4PYz9NeFg1
         qSrWqI+6j53bkHgxoEb5LeP1ljxMEjt6nUAUgSJeBKOwLvo5OIe+8tUtjERnfi10/u6F
         su8YHVgqb9lLxuo1mACYl6cJG0LInchFXNcN8U5hVF0nhv7TRSEUTGofpbuT/xI7VFIS
         FFfw==
X-Gm-Message-State: ABy/qLY2Plx70JErlPZ+9w0CLYPLFBx1aK2T3enP4I/QQ2mwAfDluHfa
	A11A6H1A4ZxuGcUv8sx1obQ=
X-Google-Smtp-Source: 
 APBJJlGMfMXcoawpm2ZKMRznLBMsULAqVn+LBFDlz565oYuOa85h5VDgPCjOLLgjylbhtxVL9sT4wA==
X-Received: by 2002:a05:6820:2108:b0:56c:5e21:c72d with SMTP id
 cd8-20020a056820210800b0056c5e21c72dmr14882139oob.1.1691099754239;
        Thu, 03 Aug 2023 14:55:54 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:48ea:73bf:1876:eaf3])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a4aa98f000000b005660ed0becesm321978oom.39.2023.08.03.14.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 14:55:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] ASoC: dt-bindings: wlf,wm8960: Describe the power
 supplies
Date: Thu,  3 Aug 2023 18:55:05 -0300
Message-Id: <20230803215506.142922-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V2S7CD6HSG45LKWIN34CD3LJF2HKDX2M
X-Message-ID-Hash: V2S7CD6HSG45LKWIN34CD3LJF2HKDX2M
X-MailFrom: festevam@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2S7CD6HSG45LKWIN34CD3LJF2HKDX2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

WM8960 has the following power supplies:

- AVDD
- DBVDD
- DCVDD
- SPKVDD1
- SPKVDD1

Add them to bindings to improve the hardware description.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/sound/wlf,wm8960.yaml | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
index ee8eba7f0104..82519f6720ef 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
@@ -26,6 +26,21 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  AVDD-supply:
+    description: Analogue supply.
+
+  DBVDD-supply:
+    description: Digital Buffer Supply.
+
+  DCVDD-supply:
+    description: Digital Core Supply.
+
+  SPKVDD1-supply:
+    description: Supply for speaker drivers 1.
+
+  SPKVDD2-supply:
+    description: Supply for speaker drivers 2.
+
   wlf,capless:
     type: boolean
     description:
@@ -84,5 +99,10 @@ examples:
             wlf,hp-cfg = <3 2 3>;
             wlf,gpio-cfg = <1 3>;
             wlf,shared-lrclk;
+            DCVDD-supply = <&reg_audio>;
+            DBVDD-supply = <&reg_audio>;
+            AVDD-supply = <&reg_audio>;
+            SPKVDD1-supply = <&reg_audio>;
+            SPKVDD2-supply = <&reg_audio>;
         };
     };
-- 
2.34.1

