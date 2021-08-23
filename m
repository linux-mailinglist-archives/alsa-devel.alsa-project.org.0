Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4E3F4929
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 12:58:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85BA85D;
	Mon, 23 Aug 2021 12:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85BA85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629716289;
	bh=a0IAx3MhqXimYVYa+3Cwh2yg++mF6GYuwuJ7HVmNil0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSchNvhRFZ5qoRW14l0v2tGAIsUY5GBYja79VgR44vmym9WOP1KmhUY7bjR/qbuYU
	 od8jNDdmhXchIMHdqHFRpKzs1SbLqSrWpJCYB/wy1FhCdeFRnbEGzYiLER6QtX0ZdH
	 HFeFAM59kV/ZSXBMKziERIUPbRW69iFuAcILrfBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5FBEF804EB;
	Mon, 23 Aug 2021 12:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0F5BF804E5; Mon, 23 Aug 2021 12:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 778BAF80430
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 12:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778BAF80430
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id DCD88B3093;
 Mon, 23 Aug 2021 18:55:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P704T139881101649664S1629716134945191_; 
 Mon, 23 Aug 2021 18:55:36 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <bc868ea177add38df43f5a8a82a6c213>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH 15/15] ASoC: dt-bindings: rockchip: i2s: Document property
 'clk-trcm'
Date: Mon, 23 Aug 2021 18:55:32 +0800
Message-Id: <1629716132-21544-1-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629715710-21137-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629715710-21137-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

This patch documents property 'rockchip,clk-trcm' which is used
to specify the lrck.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Change-Id: I648142c57c568bbed209f2b9188b1f539a3285b2
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 11e911a..8d9dfed 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -72,6 +72,15 @@ properties:
   resets:
     maxItems: 2
 
+  rockchip,clk-trcm:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description:
+      tx and rx lrck/bclk common use.
+      0: both tx_lrck/bclk and rx_lrck/bclk are used
+      1: only tx_lrck/bclk is used
+      2: only rx_lrck/bclk is used
+
   rockchip,capture-channels:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 2
-- 
2.7.4



