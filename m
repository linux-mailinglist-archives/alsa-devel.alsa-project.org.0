Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5E4D7B1B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 08:01:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C121720;
	Mon, 14 Mar 2022 08:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C121720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647241277;
	bh=IwrbPOnYHegYrlL3R5PKig4VgQ5uzolQSfYCsgJWA44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lh7Wo/KHObre/QNPPC78aG3HtRzv75Xhp3/5dE3rw9xN1lHaVCAdR4LNTDIs/Nf7d
	 OgryxGsy230sx80MhNjkKONVQMUcNOnBA/j56kWpcnmJjT7OzuWPgcXn/xZALhpWZL
	 +lu69Ey8ajDhO8/9Ydndbor6eQFcfgleKeu4OZ1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB04F8051F;
	Mon, 14 Mar 2022 07:58:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E176F80227; Fri, 11 Mar 2022 14:30:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14B9BF8012C
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 14:30:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14B9BF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ENCIBn0u"
Received: by mail-pl1-x642.google.com with SMTP id h5so6314645plf.7
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 05:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pRT2vtnm29iAprJsPjMBatssABOILDZBrV5iTTWq+Hs=;
 b=ENCIBn0uvk28e2LVz0Ss+m/AlTRy25LCdlrkevth+f6DGfg84UfkB/qPbfa5XAdqU9
 Jr2i29r+iRceu/u+x6agCFnMQby4kfA/RREZ9VdHtT4e67+5Ymd1VtllJUt1A5rGzXT5
 ubWx95UshffRDE5v8ad5wAec3RWPrbfPat4Dp3w3PaQLrMMrx75X1DatdkpU0kVacwmZ
 rF2hZUW6LNN9kIEYYKsz62DpGkLo5uRsQOLvoegTDCdlJBN51RuYfTsGMRQUmunB9yXX
 PFwFI+g24Ci6U6l3WwCF0mLSq6+gOHpzwpCZAJhjTnwW57nqx1acOqor+XrZqzkn//4d
 Qi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pRT2vtnm29iAprJsPjMBatssABOILDZBrV5iTTWq+Hs=;
 b=pyHgeutswhWdRK5xTi/cBVySxmZ9aI5ksuWwwnn9zGhzVBSbtPJqT64vD+ngGT5UGJ
 DT3KjLuOJ1k9qR7l4cO7zYKBhLNVkCTgdEXZ9dpBAIOHW3iJ+2MBfjU5VdYpolb/qM24
 ATZkZYwhdTZCJi4kuHij6TidyNwv941ng1F/wA/Ojkqir5p91jNuX1qBwte36u4oN0zH
 qZvSbF7VSVabQjekMehKG1klCW9wyPBasrV24wlRdRlEJkdC9/YS/UeI//8TUMt8gIQm
 jnX8OXE/fNhrHl6ZTdObZXcYItkVDm7weJIQvqQ2sW4YuDd0siJpM56uiHVfFcbmrj6Z
 jfRA==
X-Gm-Message-State: AOAM530Uf/lWJimR8YTG+JCZ7c+GBAFm+jWQlPUOVPEV2etV0uQib+64
 oueeDpZQdmEMde+VVk1QtNcSWgJP6AA6HdyppXI=
X-Google-Smtp-Source: ABdhPJxenPwgGlrnVQpIyB8C+0aKGdPE9C9FUEKB1MIc+t8cBUDL/v/ipBnvuJsc5jE2ta88bwakEQ==
X-Received: by 2002:a17:90b:240e:b0:1b9:2963:d5a1 with SMTP id
 nr14-20020a17090b240e00b001b92963d5a1mr21747022pjb.227.1647005405874; 
 Fri, 11 Mar 2022 05:30:05 -0800 (PST)
Received: from localhost.localdomain ([211.212.143.131])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056a0016d100b004c34686e322sm11319934pfc.182.2022.03.11.05.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 05:30:05 -0800 (PST)
From: Steve Lee <steve.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [V2 2/2] ASoC: dt-bindings: max98390: add reset gpio bindings
Date: Fri, 11 Mar 2022 22:29:06 +0900
Message-Id: <20220311132906.32292-2-steve.lee.analog@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311132906.32292-1-steve.lee.analog@gmail.com>
References: <20220311132906.32292-1-steve.lee.analog@gmail.com>
X-Mailman-Approved-At: Mon, 14 Mar 2022 07:58:50 +0100
Cc: Steve Lee <steve.lee.analog@gmail.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ryans.lee@maximintegrated.com
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
---
 Documentation/devicetree/bindings/sound/maxim,max98390.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
index e5ac35280da3..4bf61fb6056a 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max98390.yaml
@@ -31,6 +31,9 @@ properties:
     minimum: 1
     maximum: 8388607
 
+  reset-gpios:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -39,6 +42,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
@@ -47,5 +51,6 @@ examples:
         reg = <0x38>;
         maxim,temperature_calib = <1024>;
         maxim,r0_calib = <100232>;
+        reset-gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
       };
     };
-- 
2.17.1

