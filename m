Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 149AA87704E
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Mar 2024 11:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8167B20C5;
	Sat,  9 Mar 2024 11:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8167B20C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709979518;
	bh=+Ls2GaZ7tW9/6t4tjWCZZFeROOO7dXrvnOWF30JJuM0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WOXTcA36a/AvFvOCUbVyITgPEwHJF/Fg7doA6bQVjvAAu4iDzm2iZHBUEe+9ImfCt
	 Nnp5+6Hsk45NJ+pLnNKvWLbYrywzzDyhaWu6iOVvQJdVTTYxGGGnwvS9Luyxs7XoYi
	 K/kY3UFVuXI5vAyCRfBwN384xl7wIV6dY7myMhek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17BADF89629; Sat,  9 Mar 2024 11:13:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E486BF805BF;
	Sat,  9 Mar 2024 11:13:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3F0CF80494; Thu,  7 Mar 2024 06:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail78-66.sinamail.sina.com.cn (mail78-66.sinamail.sina.com.cn
 [219.142.78.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACA24F8024E
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 06:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA24F8024E
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.239) with ESMTP
	id 65E94CB900013490; Thu, 7 Mar 2024 13:12:30 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 99FA4E22C18D478DA74CC1A355ADB65C
X-SMAIL-UIID: 99FA4E22C18D478DA74CC1A355ADB65C-20240307-131230
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v2 2/2] ASoC: codecs: ES8326: change support for ES8326
Date: Thu,  7 Mar 2024 13:12:22 +0800
Message-Id: <20240307051222.24010-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240307051222.24010-1-zhangyi@everest-semi.com>
References: <20240307051222.24010-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BOY7I3OD2UPFRF5VYFCHZQYIBOXWHSI2
X-Message-ID-Hash: BOY7I3OD2UPFRF5VYFCHZQYIBOXWHSI2
X-Mailman-Approved-At: Sat, 09 Mar 2024 10:11:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOY7I3OD2UPFRF5VYFCHZQYIBOXWHSI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Removed mic1-src and mic2-src. and changed default value
of interrupt-clk

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 .../devicetree/bindings/sound/everest,es8326.yaml         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8326.yaml b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
index 07781408e788..8c82d47375ec 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8326.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8326.yaml
@@ -38,6 +38,7 @@ properties:
     default: 0x0f
 
   everest,mic1-src:
+    deprecated: true
     $ref: /schemas/types.yaml#/definitions/uint8
     description:
       the value of reg 2A when headset plugged.
@@ -46,6 +47,7 @@ properties:
     default: 0x22
 
   everest,mic2-src:
+    deprecated: true
     $ref: /schemas/types.yaml#/definitions/uint8
     description:
       the value of reg 2A when headset unplugged.
@@ -87,7 +89,7 @@ properties:
        0 means the chip detect jack type again after button released.
     minimum: 0
     maximum: 0x7f
-    default: 0x45
+    default: 0x00
 
 required:
   - compatible
@@ -107,10 +109,8 @@ examples:
         clocks = <&clks 10>;
         clock-names = "mclk";
         #sound-dai-cells = <0>;
-        everest,mic1-src = [22];
-        everest,mic2-src = [44];
         everest,jack-pol = [0e];
         everest,interrupt-src = [08];
-        everest,interrupt-clk = [45];
+        everest,interrupt-clk = [00];
       };
     };
-- 
2.17.1

