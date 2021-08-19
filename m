Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706EE3F1724
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 12:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A1E1696;
	Thu, 19 Aug 2021 12:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A1E1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629368019;
	bh=uD+/inyyHiVzNTByAz3Xh+TOcMS7l/yjhyScWx9Y4kI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kZJjVankzH8L3OI0G4syFrn0h4VWt394n/fAYf9dxIn5Oxih8LNsAM+OqiK8SlM9t
	 en9RVSye5+fTqWijIj7sz0emp2I/e9qlJahrdysU3hszcnVj6gb1YabI2adous3BYq
	 bHPTD9I1wj4w7Gb0spbEAFYASmioguTl9Tnx4jtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63596F802C4;
	Thu, 19 Aug 2021 12:12:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D899CF80272; Thu, 19 Aug 2021 12:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8E8BF800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 12:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E8BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="pu1QqXgr"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 0F9703F336
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629367925;
 bh=uQVhpvDvpjI0P3FxejG6bkElaqc3lP0DEFRi/YWQ1og=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=pu1QqXgr593FV6knckHIyzylDcUJBA9dYbev9jnRKZ2z89EKex6/rKlwsSwCOsOaN
 QLYWL3rpL5L5Ce8wI1Yl0YzwVZFQtfRqsQ258Yw0aDp+BPhN8lCvabO/4dXQKIdgBX
 oGdS/7GDZB0IEkxiMsyVdqTVHaTi57yNOMczcFSTH4P0caHtUNL/zm58nTjRxlHUVe
 MPsKZCof6R5dBr5W5JgyjJJUFbY+V5xmUUdjslSMwMtzyWrCVafREABC8HzHQ318IC
 JxCEt125W6DbefrPuqriS4VrFot4usY+cKsDfYxtUF/dOKA8WW3fT+lqsAKoTdLbGC
 nCcMLWTJ91c+A==
Received: by mail-ed1-f72.google.com with SMTP id
 o17-20020aa7d3d1000000b003beaf992d17so2570182edr.13
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 03:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uQVhpvDvpjI0P3FxejG6bkElaqc3lP0DEFRi/YWQ1og=;
 b=rofbIcas7H12jZ8ix/sZsaZPQ6ujPw1xDTboCg4/JLQRa6UZBwKLmaVMFT4sf0mxPX
 OnGtm1xxcFb01/Byo6vgY73GOsyHjpwO6pCUkdII8QwPGWdoiShOfyEDO5xdxxFfb/zG
 9Vds7PnPadBECkGNfhURQjxMF37I4uMD5Oy0YTf7i1fLT+Ble11XAWyQYeD/0jZ4kYwC
 0G0cHjQ8iuF6H7J2JaB0Km707MKlBE2MOxba4IkdGtZAMeS7iSXqn6LSW1ROuoxIE9Kw
 WBmCloPBCaZKVasM56oB6C3U41bnn+zbTu4BQU/RO7MzOG88mtpLED+Q103omgx23d/F
 SXaw==
X-Gm-Message-State: AOAM5331wVOly2/SaFfsHagi8mHFZfMZsolSD9dFHM+0+DL0LWyLjXPN
 eP1xQ2ixbfVuDLczOsRtl+FW5b8Md7GnPO0g9216nvku90kZq6QQtby3+kER3WOr+3c0N/sDxpv
 PpOOEbyadLP9+XA1QyShCBDoR8qoE1nKDL25pI8aA
X-Received: by 2002:aa7:de05:: with SMTP id h5mr15692581edv.174.1629367924809; 
 Thu, 19 Aug 2021 03:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbx+5karGwHCd0154GL4o1bMhwTey/MCqUQCq8AL/d5JkQfHYSeV0sYRenyhjeIm/i7JNcfw==
X-Received: by 2002:aa7:de05:: with SMTP id h5mr15692564edv.174.1629367924684; 
 Thu, 19 Aug 2021 03:12:04 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id bs13sm1031774ejb.98.2021.08.19.03.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 03:12:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 1/2] dt-bindings: panel: ili9341: correct indentation
Date: Thu, 19 Aug 2021 12:10:19 +0200
Message-Id: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

Correct indentation warning:
  ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 2ed010f91e2d..20ce88ab4b3a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -22,7 +22,7 @@ properties:
     items:
       - enum:
           # ili9341 240*320 Color on stm32f429-disco board
-        - st,sf-tc240t-9370-t
+          - st,sf-tc240t-9370-t
       - const: ilitek,ili9341
 
   reg: true
-- 
2.30.2

