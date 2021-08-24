Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E7D3F5AE7
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97426166E;
	Tue, 24 Aug 2021 11:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97426166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629796850;
	bh=Rds4EGDMqBcN8U7jQMNoJGne5mv1lH+7YjmhDuMHaCk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gXUmb6aCGvLh1csy+xn8kKZjafqqa+naff74I/7SN9txJ5+ah7We4TgQWCfnGi5A6
	 EhzBzUtIe2VvIIE9b3YFKuqWve0LXMKWCHtGaHuZbCSsGzJLiFUB3iC62u3fDhmFzw
	 7HhZVb8n3Zw8qU+lDnzAdfMVdTe8AkbmkmldXzTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF93F80511;
	Tue, 24 Aug 2021 11:18:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAFC1F80511; Tue, 24 Aug 2021 11:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A8EBF8050F
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A8EBF8050F
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 02BECD789D;
 Tue, 24 Aug 2021 17:18:19 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32763T139760842565376S1629796684553502_; 
 Tue, 24 Aug 2021 17:18:19 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <56ef41c46411f9c2e8d17b347da2027f>
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
Subject: [PATCH v2 10/15] ASoC: dt-bindings: rockchip: i2s: Document property
 for playback/capture
Date: Tue, 24 Aug 2021 17:17:57 +0800
Message-Id: <1629796682-4170-5-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629796561-4025-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629796561-4025-1-git-send-email-sugar.zhang@rock-chips.com>
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

This patch documents property for playback-only and capture-only.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 9f9cc48..005b6e6 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -81,6 +81,16 @@ properties:
     description:
       Max playback channels, if not set, 8 channels default.
 
+  rockchip,capture-only:
+    type: boolean
+    description:
+      Specify that the controller has capture only capability.
+
+  rockchip,playback-only:
+    type: boolean
+    description:
+      Specify that the controller has playback only capability.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
2.7.4



