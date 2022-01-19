Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0DD4932A4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 02:57:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFE8340B;
	Wed, 19 Jan 2022 02:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFE8340B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642557450;
	bh=xrDp9ophY+TpwqU6+cUFLOFhvoqmEo15vd4/Zrfo6xA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qIkNFJLtPlFa3/5mruc4xO9VqffF+tFjstr5wNZfzR4EFaBEdkjKyDtseiw312xD+
	 vDbyHqThvSLVDbNU3a497J39DpG21XnUALsKljRBuBiM5Pz6Z6zguu1vU5CojV1fVH
	 4zHTGIJTbul3E5cmXODZEKheYJBnJbTt+Px/VO2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5622BF800CE;
	Wed, 19 Jan 2022 02:56:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7938F8023B; Wed, 19 Jan 2022 02:56:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B3C4F800CE
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 02:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B3C4F800CE
Received: by mail-oi1-f174.google.com with SMTP id s22so1759094oie.10
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 17:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xl4YF7yMBh19aRnWIpeFHcZPT/DRkG3ZpsT4F+vO3Fo=;
 b=7vxuZObvcScFOe/dCftJarvSRLbqm1IJ7LzJQ+FCPLH53AE1gnRV4VWSVfSPEhZ/e0
 ZAFV6Z/8NXzigWRiJLh6XqxNSaK5qn4LEw/wSD/blFwWVCqAA7PQacqsBE/3qKnLFvXC
 vD07HHhFT/tDaUC3Q7YIHlKWgAuVt3wM8h/a40aaQ9KZVbL7YUMYfZb+G69OtdpgmZSB
 AyXv0CUcgAJ5OYOsTrS+oU7/3AeQAAmHvOiSxtnuZF7oW56VZTxaQ5W7uC5MSDchHd4r
 gW7S9Vt4Q4JMI/AtVo20n/g0jRjcz6/M3wcVNtlHYXwLNrwqyyTgZ1MQwTUzD6WNH1Ny
 K6Dg==
X-Gm-Message-State: AOAM530F10/COB4bjzocCx5mdshg2u8JdIWJn7R0VVCX+80yFVOUw3Aq
 kbRJmULsG/N6+Fh0yp6j7w==
X-Google-Smtp-Source: ABdhPJzmXj447zYYE0lAjRVE977hZD66BZMTkLTujaaDyR1hxj2Lg9/s5ZEp8Ie75aHaV6GnG7lSVw==
X-Received: by 2002:a54:469a:: with SMTP id k26mr1117153oic.147.1642557377523; 
 Tue, 18 Jan 2022 17:56:17 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g11sm5403640otq.13.2022.01.18.17.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 17:56:15 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>, - <patches@opensource.cirrus.com>
Subject: [PATCH] dt-bindings: mfd: cirrus,madera: Fix 'interrupts' in example
Date: Tue, 18 Jan 2022 19:56:11 -0600
Message-Id: <20220119015611.2442819-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The 'interrupts' properties takes an irq number, not a phandle, and
'interrupt-parent' isn't needed in examples.
---
 Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
index 5dce62a7eff2..68c75a517c92 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
@@ -245,8 +245,7 @@ examples:
 
             interrupt-controller;
             #interrupt-cells = <2>;
-            interrupts = <&host_irq1>;
-            interrupt-parent = <&gic>;
+            interrupts = <4 1 0>;
 
             gpio-controller;
             #gpio-cells = <2>;
-- 
2.32.0

