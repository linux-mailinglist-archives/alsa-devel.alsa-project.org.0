Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AF21A003
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 14:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348DE15E2;
	Thu,  9 Jul 2020 14:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348DE15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594297713;
	bh=MLmVpOT3NmAYjwPxCzTZI0VnkhBSuNRF3QfYs5MTW/Y=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mng0qgv3iUIZRqkqsINoTaKJzKDbcG9Z5y6G0BojDvcqrcIeOYzKBLTL00BSBkKF9
	 YFeOHyzQ4Ohpvk05Hu13ROGY967kokrR3hWqmOpNqbN/0+bh/l4brYEK3ygQoQXeY3
	 /CPssdasU5fIdT+NJp6LbgkmP8Sk3MnNmJ6dWkeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4720AF802E0;
	Thu,  9 Jul 2020 14:25:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6436FF802DF; Thu,  9 Jul 2020 14:25:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5AEBF802BE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 14:25:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5AEBF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CLw2CpHL"
Received: by mail-qk1-x74a.google.com with SMTP id 13so1601142qks.11
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 05:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=aRLqd94FjwTnJjMFb6sQjFqDeuwXUgkuPrQ9FAsWwfc=;
 b=CLw2CpHLjsT25R5w5WjTZJCEufjaYYe7vTI+p1qg2qOcznzdNf9660UUs94EZQV899
 +nzXPofL4EK9Iz5FeNGiL54HJ7/9mVCrpp3cafPzt0W0Z1FOqw2LyWp0b/Qv4dKaATf6
 9/M5tIS4W2qMr7O17TOcx5KeJDFjtJXJJrJJshPp45rq5bB6luweiBuQxOKOTJZA+ROK
 O9UoHTwJ4qpk84LPl06LnuMPtyv6H+T8o47LnGr7DJ5Fdl2lbcfygAKCXZP7w+JBxahB
 svS/macbagKWHbEAOS/GWKSp8xBe3Qzar3/etw9ZEUzvgwuNN/ehbWdMup2YBPzu6UN4
 Txlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=aRLqd94FjwTnJjMFb6sQjFqDeuwXUgkuPrQ9FAsWwfc=;
 b=BX8ZW4IfWvZQR2GDui5PpjgMT4vaYqx+BzIahc8oXgiw8L7A8XGfJAMMjMBAHdzhli
 w+p18vPBI3srDmSJx9nOyND1Xi2D4zqyKDrmJ8Zg0KL7q3Pi5S3gtXcdMZEMC8mlWohE
 7Knlm5dpsRRbGoojkFXuP+1Q4HDnwafY+9knEmUbT+r8aeCPE8yp1o/6tkutTncWrZJk
 VvETs8qw2IFhOjpOKWfBz398DXLSLSSE0PM2O7maJoVoShx7agjHLtL28qcK8A44cKLE
 q+QGqTbfo5jlvZZBHS9jGHMDkA7wUeaUk0SPf+gQqjBFBEMMPzUno5knZVsyS5SGjUyV
 Im4A==
X-Gm-Message-State: AOAM530uz9AadzOVNQzPI9vf9gUImUnWbcuuuqQleTskirFTm8xZ/dBE
 mn4gjcuuTkp+7TPAbK9ORLR/UHttSADg
X-Google-Smtp-Source: ABdhPJz8cckKXdB/d6dj9QL687QGZxSlWNpAyt5bbCVzqVKD4zh3djQNdd0VodzlUlIeI4ItguSG3NCX3ey6
X-Received: by 2002:a05:6214:612:: with SMTP id
 z18mr61686337qvw.46.1594297507702; 
 Thu, 09 Jul 2020 05:25:07 -0700 (PDT)
Date: Thu,  9 Jul 2020 20:24:44 +0800
In-Reply-To: <20200709122445.1584497-1-tzungbi@google.com>
Message-Id: <20200709122445.1584497-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20200709122445.1584497-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 4/5] ASoC: mediatek: mt8183-da7219: add compatible string for
 using rt1015
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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
"mt8183-da7219-rt1015".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8183-da7219-max98357.txt     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
index 92ac86f83822..f7f3b83da630 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
@@ -1,7 +1,8 @@
-MT8183 with MT6358, DA7219 and MAX98357 CODECS
+MT8183 with MT6358, DA7219, MAX98357, and RT1015 CODECS
 
 Required properties:
-- compatible : "mediatek,mt8183_da7219_max98357"
+- compatible : "mediatek,mt8183_da7219_max98357" for MAX98357A codec
+               "mediatek,mt8183_da7219_rt1015" for RT1015 codec
 - mediatek,headset-codec: the phandles of da7219 codecs
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
-- 
2.27.0.383.g050319c2ae-goog

