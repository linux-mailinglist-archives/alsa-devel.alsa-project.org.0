Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7260E2FCC68
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:11:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B350D1809;
	Wed, 20 Jan 2021 09:10:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B350D1809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611130309;
	bh=OzC7CsePra3CrHhlsLsyRRkWFKOMYd3kPeZahderIv4=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrgH5GrkpfNlQHNGEbXpBLP+y3IrGXk5xqUPmSvcaAc+dsxJKhQJUMnqs6yw/AUAL
	 37CunjVIq0l+B/QLUGA6zR64pwBHYqaKHO6Ihflp6LhyPluUswtJ4TKqFDD08jB9Cx
	 0OoopFwKHRCvgDK5I5htNGHUP5njpUUKPv+emM+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AFBAF804CA;
	Wed, 20 Jan 2021 09:09:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC293F804BD; Wed, 20 Jan 2021 09:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 621E4F80227
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 621E4F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="vxgOFOds"
Received: by mail-yb1-xb49.google.com with SMTP id c9so29379255ybs.8
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 00:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Y+Fx4Q3xTRwBEn5hZJB1lpjzFFSmiRd0H1yYDfLlDsM=;
 b=vxgOFOdsDQzr5aEd2YVIbLvshnoCoC/VERiplfYPU24l+TSlB98fGzz2Obmxp+OUKm
 cu4aBejiuqpcX2Lr2v2PrD0Y/Mo2cofT8fHOxIWKNEHkIpCHviRli0zXK7TPUqmL8dAS
 7ofKtcHbvMbcvZGIR4xh0jwTqDuaCVvQnpa7g2ZY828MIeTlXa9rzwE5HY8TBuQ24EbH
 F22E2Kfua9yrRPawIekUNYvseOiatHx/U31JkBNQsHUwozXQHKraFxhjuSmKzxyN+gwJ
 Xr49ZK74JsNUX3+kAcVd/1urKJdvVtkWU8Q+BBHHkIV6lWQYc4pQ7CHcAWwxhVYqIn8Z
 AU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Y+Fx4Q3xTRwBEn5hZJB1lpjzFFSmiRd0H1yYDfLlDsM=;
 b=cNispcUdC96m6CCWqXaeoFlZ3lZPK3GmQ8fYPHVZzRA3Nl9Jwin1ooXDVfjbojcgGm
 hl0nfqSDgPC8JihdyD0OgePVtqAaZiALxY6FEYAOM0M6Q6mQuTluSpm+gkXfdszkISDZ
 cENr+H8zar9LiTbYHkihflrAyuieZNrLbo7sNHnpI/s7aIbdIswmgpCYewbu41R2H2oZ
 F3RaZvt8zme8KL+OmyabUXeTzCUSnY/DWlXMja1ESmNQ6dwIOEfnqkS5y71rodPCfCUr
 cp6FDCtL7Ek11Z55s1PlLwWMxkNqhviXv6K3IvUPc40vGRLW+SfZcReA88W4mE9usVdT
 yaPA==
X-Gm-Message-State: AOAM5320IAm/5n1VMFWNQJ8lSOwzq2SzPrKJWRsJgEQfDgODGJRged7M
 vUWAtmo4oWFHBS3WKa4fPeeBBGh8KsC/
X-Google-Smtp-Source: ABdhPJxqem2Ny4Ah8ScsPr/Hgjfex9iupmb+ZO1O4sdHmta+oHMFwOypJuwrF8TGgOpJyI/ofGdmGNQUpdMy
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:1164:8893:969a:b338])
 (user=tzungbi job=sendgmr) by 2002:a25:f02:: with SMTP id
 2mr11570686ybp.190.1611130158185; 
 Wed, 20 Jan 2021 00:09:18 -0800 (PST)
Date: Wed, 20 Jan 2021 16:08:49 +0800
In-Reply-To: <20210120080850.699354-1-tzungbi@google.com>
Message-Id: <20210120080850.699354-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20210120080850.699354-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 4/5] ASoC: dt-bindings: mt8192-mt6359: add hdmi-codec property
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
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

Adds optional property "hdmi-codec".

If specified, the machine driver should:
- Exposes a device that can write audio data to the DP bridge.
- Detects jack plug events.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index 54650823b29a..5a5b765b859a 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -23,6 +23,10 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle"
     description: The phandle of MT8192 ASoC platform.
 
+  mediatek,hdmi-codec:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of HDMI codec.
+
 additionalProperties: false
 
 required:
@@ -35,6 +39,7 @@ examples:
     sound: mt8192-sound {
         compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
         mediatek,platform = <&afe>;
+        mediatek,hdmi-codec = <&anx_bridge_dp>;
         pinctrl-names = "aud_clk_mosi_off",
                         "aud_clk_mosi_on";
         pinctrl-0 = <&aud_clk_mosi_off>;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

