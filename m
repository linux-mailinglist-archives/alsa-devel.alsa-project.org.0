Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638DB3F4924
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 12:57:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D83E084D;
	Mon, 23 Aug 2021 12:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D83E084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629716247;
	bh=hFFJFye5Q0MdgLl7LPD9IpqQWOtILyF14BdDLmTihL4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqbIhyor0S9frOBwFlvi7hx5ExFLimac652EsnDxGF3ZUYbHkWDGo8PFZ9G5UE3tO
	 euQYnzhafAopMJVvMlto9/nhNsvVvXu9zk0gVBot6HhmlAuOrkbVOLnjS6bKfhFxB1
	 gfuI585RYa8zVotHvz+iIal523VXTmN1QwHMyQ5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0733F80515;
	Mon, 23 Aug 2021 12:54:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D101F8050F; Mon, 23 Aug 2021 12:54:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AFDFF800B6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 12:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AFDFF800B6
Received: from localhost (unknown [192.168.167.225])
 by lucky1.263xmail.com (Postfix) with ESMTP id B2D74C2960;
 Mon, 23 Aug 2021 18:54:39 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P10596T140297356953344S1629716077595046_; 
 Mon, 23 Aug 2021 18:54:39 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4dc6fe9b0e9db139991f7079a2cfe765>
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
Subject: [PATCH 12/15] ASoC: dt-bindings: rockchip: Add compatible strings for
 more SoCs
Date: Mon, 23 Aug 2021 18:54:33 +0800
Message-Id: <1629716076-21465-3-git-send-email-sugar.zhang@rock-chips.com>
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

This patch adds compatible strings for more SoCs.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Change-Id: Id1f32a4518c01e0d50c5702a557912e165904995
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 005b6e6..11e911a 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -20,7 +20,9 @@ properties:
       - items:
           - enum:
               - rockchip,px30-i2s
+              - rockchip,rk1808-i2s
               - rockchip,rk3036-i2s
+              - rockchip,rk3128-i2s
               - rockchip,rk3188-i2s
               - rockchip,rk3228-i2s
               - rockchip,rk3288-i2s
@@ -29,6 +31,7 @@ properties:
               - rockchip,rk3366-i2s
               - rockchip,rk3368-i2s
               - rockchip,rk3399-i2s
+              - rockchip,rv1126-i2s
           - const: rockchip,rk3066-i2s
 
   reg:
-- 
2.7.4



