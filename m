Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A90BF4FE7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 16:37:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054C8166B;
	Fri,  8 Nov 2019 16:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054C8166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573227454;
	bh=8XXyZ7Z4DqLHOnFvydz21YZF18Ue0erBCdCtG+TezCw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SaOitpVR0G5uhBRssrOQtrOlpyRkEPnVccDqlUJpEgf/HhR4wXTHmxYvguLqCiAXP
	 gsJOZb+t9hqzGnAG62zpmchs4losM3H5W0Thupz2MutGyUhkP6TlUiZcHQ0YjcUGuu
	 wDVQmu7+kfdXxRK964y6+F+KOpi7Lw2c2QNToY1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48764F803D0;
	Fri,  8 Nov 2019 16:35:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F970F803D0; Fri,  8 Nov 2019 16:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB44F800D3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 16:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB44F800D3
Received: by mail-oi1-f171.google.com with SMTP id e9so5566140oif.8
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 07:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NfUR7AY48iGFIM63M9JPwQgnYKrGoOgxnaqbx8BPJk8=;
 b=QT13xDUMay/SiGdryuTXGez6ASCkdnwXHdz8W/2cqzzfsxI9u1AY4fJziHyYqQ3TIq
 44+nDa99BlNYu3QrDTsgVTEN/4v6wU8ppDWLXoUE7b3SaUwQmCcS1hkpDcz5r6rCJ+tx
 7jdcCD7aUT9FoOr3UPBXzxJEav3PeGVKILR38ea5fTBkbqEgRCtihjiTkTF5UNTfYI+V
 +Q3419OPbw1QQ/y/vaIl9c0AT2kjoOngraLP3pVqRScoEV1Fa1IjaxLt1/YtxYd07nGv
 J+Ej2OZrvbpW0nRl3ZYg50zvTIhrH0u3o0m9G5DkZ5p6KXHgVKPU3+M927ZMhK4M/6EI
 1iqw==
X-Gm-Message-State: APjAAAXh+oyWEnzF3Df3eN45sOBT+NwCJclyWLrPI7thUZ0qCYelGaZM
 jVGOhmP/LQh+uRysYabWyg==
X-Google-Smtp-Source: APXvYqx68DVoAj2vGw2SptgDRf5u6t42E0asrMtHMURk1fJLAHVzUY4jKd1c0hgskKtnqGcWkLyxMQ==
X-Received: by 2002:a05:6808:6c5:: with SMTP id
 m5mr10126783oih.16.1573227341487; 
 Fri, 08 Nov 2019 07:35:41 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id d205sm1861423oig.28.2019.11.08.07.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 07:35:39 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Date: Fri,  8 Nov 2019 09:35:38 -0600
Message-Id: <20191108153538.11970-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [alsa-devel] [PATCH] dt-bindings: vendor-prefixes: Add 'fsi[ab]' to
	the list of non-vendor prefixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

'fsia' and 'fsib' property prefixes were added as schema in commit
2f52475bac7e ("ASoC: fsi: switch to yaml base Documentation").
Unfortunately to do checks on actual vendor prefixes, we have to track
the handful of prefixes which are not vendors like 'fsia' and 'fsib'.

Fixes: 2f52475bac7e ASoC: fsi: switch to yaml base Documentation
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Seems to be an old binding, but there aren't any upstream dts files 
using these properties. If there's not backwards compatibility concerns, 
another option would be to rename these properties.

Mark, probably should go via your tree as that is where the error is 
introduced.

Rob

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..67b89db54aa2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -16,7 +16,7 @@ properties: {}
 patternProperties:
   # Prefixes which are not vendors, but followed the pattern
   # DO NOT ADD NEW PROPERTIES TO THIS LIST
-  "^(at25|devbus|dmacap|dsa|exynos|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*": true
+  "^(at25|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-fan|gpio|gpmc|hdmi|i2c-gpio),.*": true
   "^(keypad|m25p|max8952|max8997|max8998|mpmc),.*": true
   "^(pinctrl-single|#pinctrl-single|PowerPC),.*": true
   "^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*": true
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
