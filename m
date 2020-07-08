Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115921863C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 13:35:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20132168E;
	Wed,  8 Jul 2020 13:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20132168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594208129;
	bh=L8AzCt9oTbyUoAdqfnhpUSH2PilRSuVFyQLKGDMAVBQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YUXrU21uXIgj987Yevo1W6H3SNPgnwH7FDHrpaoxwbJCENCSy4xxV5ffynmhPeXWF
	 l7Aj0r/GYhkIT2lkcuTK1dM3/jEq0xcZeVcUvsyziGHdEvjwYuZjYPAIBN/xLNX3Cj
	 Kqo9Npl1GFbWOgqiLUag/qs+P52ivZXnMZqVJbVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A512F800AE;
	Wed,  8 Jul 2020 13:33:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CAC1F80269; Wed,  8 Jul 2020 13:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9428F8015A
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 13:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9428F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ajIHCSrd"
Received: by mail-yb1-xb49.google.com with SMTP id z7so51125012ybz.1
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 04:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=SXjS5MYE+OES8bqE7NYkGTk+6V5mx4sL9yP7xTJC9ec=;
 b=ajIHCSrd25kOA3bVHzUUWwIvUdeudcLWsMeItBZJAoqgHigZ4drMNILWBp0KTpetku
 hjBOSR3pwYzlc1mayhM1uBm79xFixi6c/PXMPJ8mqjEYDh77TE5HFnaSTTA7xZKgkrwx
 i6Xkxwl2ZMj/PUwCqVX23NxgB5F9P7qh/RalAC2oupjM/jyw3btHGfFRUKPa5TAAPkBx
 NJBXmgF6B7XBb0SFmOhFHUXROV5wCvoqn7IvZMUJ5cuJ4hTnUx4BYmJPlU4FjKgtQxw2
 WVtxGxWXRhr7HOoOtsdEsWPprlIFKfD2aQ2+gSQDikctb45GkAQPF4eE865Sh/ENM5Bo
 reBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SXjS5MYE+OES8bqE7NYkGTk+6V5mx4sL9yP7xTJC9ec=;
 b=KOcR832QpQC8z2cxKg29PMIUaXSLAU0gU3lzFpgf5+WVTBQkUutLcUaefF8CX9MjI1
 LrvecHsJ0qtjGjp9ZV0Z4zlfnZOUroX+RkHhDi3mHwNoG2QrIZlL/xUTdE6t55HWmbjO
 81aKrfdMBnvVAOeTZglBjLDQgVk68KPWfHN4j/xiWwocfYXoyUu1hLxC+52q622OIbuM
 gNtev0EA9Z65X7DWD7SBh5q3Hc6ifKUYyeHMAjEVlQr7GYQOi5KVY/i3re81nSycGXfV
 t6066VkiEEAldrx/Xg7+VzeF6B4t7qC/cN23W7OTb7a4pnld9HgG9AmkgKGqEAyQiW8k
 4SFw==
X-Gm-Message-State: AOAM531gM50KxftIlzdIiKjLizu6pbKK39RzLlpbVLZuudgNHTk4PgUW
 qsJOhz3jYfXGsWdfoPLFFuYnbJ28592C
X-Google-Smtp-Source: ABdhPJzfEQPqdsUH+w7M5HxIbKMttNmVUXAlFyBkxTQRJfzPeKnudu2L2Gi8mEZZz1+QbxrrAnwD9N6F/+HS
X-Received: by 2002:a25:f509:: with SMTP id a9mr100220280ybe.227.1594207972178; 
 Wed, 08 Jul 2020 04:32:52 -0700 (PDT)
Date: Wed,  8 Jul 2020 19:32:32 +0800
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
Message-Id: <20200708113233.3994206-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200708113233.3994206-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 2/3] dt-bindings: mt8183: add compatible string for using
 rt1015
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Machines with rt1015 should use the compatible string
"mt8183-mt6358-ts3a227-rt1015".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt        | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index decaa013a07e..5afd3d8dab84 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -1,7 +1,8 @@
-MT8183 with MT6358, TS3A227 and MAX98357 CODECS
+MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
 
 Required properties:
-- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357"
+- compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
+               "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
 Optional properties:
-- 
2.27.0.383.g050319c2ae-goog

