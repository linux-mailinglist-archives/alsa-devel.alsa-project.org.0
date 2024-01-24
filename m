Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0F83B1B7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 20:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1718274C;
	Wed, 24 Jan 2024 20:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1718274C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706122948;
	bh=dMObXyq0MBRE/uycOHgjqOdNUcF7nQX2Ho+KMxlPsXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6TKjCVTLBbXcgIk1G6rZVw+hMDVFg9fKycWYbo1+vysDCmK3pmV75rVPdyXxJo8K
	 2hOdhqmLERbRLw90bB3GbUt/xiFDlm7khoTQTgJGU3j1qic9jaKoWhr4tR75mE0WQY
	 thTufFxdOBdT7vS9OqHljZ3cWb/s+Z3Mb7NSRWUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3032CF805C9; Wed, 24 Jan 2024 20:01:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FC2F804F1;
	Wed, 24 Jan 2024 20:01:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C80C5F8028D; Wed, 24 Jan 2024 20:01:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22FB4F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 20:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22FB4F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gtrOHq/s
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F93F61E9C;
	Wed, 24 Jan 2024 19:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86972C43390;
	Wed, 24 Jan 2024 19:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706122882;
	bh=dMObXyq0MBRE/uycOHgjqOdNUcF7nQX2Ho+KMxlPsXk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gtrOHq/se1guXLT7U4yisWLOI4M8hEOOfNKHh6jYGnWmGY8x/Fk+BwXOKJOtEwBwe
	 6jtsYOsQsCycofWpVO/AfO40OVu60FhKCU++W0/qT06ZKIDiGytIGa8+6p3/gWLiSO
	 FSFd2ZRL4yfowDYlU91IF/s6U1kBpGhaQFKNtIYYHK4UavbDaYgw+mw+wWgbwdNqAs
	 p1Kn3v2PnWPdd4ZwpJYoAPRClwSkgyYuo7XtIeCCVHqP2AI5og2fa7oJph4dVhZ9Sq
	 PzC9zOeQ5tCx90r78j32XpujfuHx6LoXxY2UFccrEC+mdWZOqAgyFzYfm4IzYCCBJW
	 j73dEwZG43dhQ==
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	patches@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 2/2] dt-bindings: pinctrl: nuvoton,npcm845: Drop redundant
 type for "slew-rate"
Date: Wed, 24 Jan 2024 13:01:05 -0600
Message-ID: <20240124190106.1540585-2-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
References: <20240124190106.1540585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B34GYYDVGNZCNJ65PFPIUNBQZBPDSU6Y
X-Message-ID-Hash: B34GYYDVGNZCNJ65PFPIUNBQZBPDSU6Y
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B34GYYDVGNZCNJ65PFPIUNBQZBPDSU6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

pincfg-node.yaml already defines the type for "slew-rate", so drop the
type from the nuvoton,npcm845-pinctrl binding.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml     | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index 20cf0102aa63..b55d9c316659 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -159,7 +159,6 @@ patternProperties:
         description: |
           0: Low rate
           1: High rate
-        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [0, 1]
 
       drive-strength:
-- 
2.43.0

