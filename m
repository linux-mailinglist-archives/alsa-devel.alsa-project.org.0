Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D27508050
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 06:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FAE01936;
	Wed, 20 Apr 2022 06:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FAE01936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650430254;
	bh=iZjhAdUGxgzrQgSAjpa9nlRTRCWTFI/rAdKhQdUdecY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m5nPMsaJTDyg9v7YLNFN0q5c+XS3DaNmR3xWDT2orGo20HK3PPpuml/Ff/BopwAp5
	 G7W8rLf7BsRZlN7VFvdG9xCBRELEgq/R4TeeAWmeP14FTIEeEM3sTZYnJGkXFKc8u1
	 aJB8RNKv1u79FOIU8s7T3bXb6W7bLYLwjVz43IFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29567F8010B;
	Wed, 20 Apr 2022 06:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 153F5F804FD; Wed, 20 Apr 2022 06:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 342ADF8010B
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 06:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 342ADF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dkaik8Ui"
Received: by mail-pf1-x42d.google.com with SMTP id y14so79567pfe.10
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 21:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=785BQAgQ/fmXmnK7LN9iPs9KhRHeXeAbtde080rNxiU=;
 b=dkaik8UizHe3S9fhvxry7osL6TYV8tA93uoKj+sy5Zw8YYLEBUDS3mnJ8lj6qovuq/
 pDIOumiZgkLEnpdI59TVi3rWAc9fNIhFbflyVS1rMYFZwQU1aT4dsHM2Sif8qpgzPnmy
 e+iNx8ptfhTtEaNXOKXDyQxgKpCYzadm8Zd6Lr/O/kSCgcK09x4+wvUnsm1W+pYb09Yj
 pSRV7LJGy2sq5qrsO+h6PhiyHb55YzGi3A9X1wGHwjvHq48d1pjmycCTEM99pT5Rog0o
 qKj8zs9TmRShaSPpzkby4N8qWpelIdI4QLItNoPoN+NenV2Q+DgWIF0LpWwi1DYneskJ
 T0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=785BQAgQ/fmXmnK7LN9iPs9KhRHeXeAbtde080rNxiU=;
 b=wKVHGYfzed6j4GcOt6VUut3B2twHhOOs8h/w05FgsFX/EMx7b+TCLt3dul7/TawFf9
 SnoYB97M9hxBCB27jDD1f+tKq12Q828mipMxkc5K8YpB67PxFQql+WT6vd986OmU3YDB
 u2tx6mKwqQ2UHitpIWYZTlhkvn8qr6xG0dMVslNWzhcOL60lfnd2QrTbUqQlpayzapDC
 9Uo0qwO8Zf2keYX4b52pbl4Ns9ea1deAfhW+KkCrublRd8WPN4R2K0NIvVuyWE01awa0
 lzux/Sxo00mubaj/nimPAU23336rHA3HdcOpPoR+IkqEYEwQvsmmPYWYMFUrsqwFTj4X
 anDw==
X-Gm-Message-State: AOAM531iPt8eok7IR5FPG7xob1w02BrzDrAqZ2jGifrM8/bbuJnsFFcc
 BXquARVfT3uCsnZoh2fFSUA=
X-Google-Smtp-Source: ABdhPJxbzkBDUxr3dcGMJn74akRdabzXE1dMP8yCFLgxFEz3tAZGP4CYW+bD/OwbTdegAOFK9yyJWQ==
X-Received: by 2002:a63:fc05:0:b0:3a9:f17d:3f4f with SMTP id
 j5-20020a63fc05000000b003a9f17d3f4fmr12360427pgi.590.1650430166574; 
 Tue, 19 Apr 2022 21:49:26 -0700 (PDT)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056a001bc300b0050a7b7257b2sm7957225pfw.25.2022.04.19.21.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 21:49:26 -0700 (PDT)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [V4 2/2] ASoC: dt-bindings: max98390: add reset gpio bindings
Date: Wed, 20 Apr 2022 13:49:00 +0900
Message-Id: <20220420044900.2989-2-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220420044900.2989-1-steve.lee.analog@gmail.com>
References: <20220420044900.2989-1-steve.lee.analog@gmail.com>
Cc: Steve Lee <steve.lee.analog@gmail.com>, ryans.lee@analog.com,
 krzk@kernel.org, nuno.sa@analog.com
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

This adds support for the reset gpio binding.

Signed-off-by: Steve Lee <steve.lee.analog@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/maxim,max98390.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
index fea9a1b6619a..deaa6886c42f 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -29,6 +29,9 @@ properties:
     minimum: 1
     maximum: 8388607
 
+  reset-gpios:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -37,6 +40,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -45,5 +49,6 @@ examples:
         reg = <0x38>;
         maxim,temperature_calib = <1024>;
         maxim,r0_calib = <100232>;
+        reset-gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
       };
     };
-- 
2.17.1

