Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5673F5AEF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9128166D;
	Tue, 24 Aug 2021 11:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9128166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629796913;
	bh=YOyS3kSlWUDGv75BdSxg2gvgm44ekEAJaZI8VoXJ7Gc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=prmgWORM+sVwrlhSN053NC/ZX1nl6YlvGE6a07i4WtFmZYCaK3oWGx3rnAo+V9zgD
	 VK1Pwzc5LCjxzPSof/THOZ1GgyETq7oJcIgGMmhk8uFRM3JIlxf9LjyXhqzKHNn5Yc
	 7uLeWGpVSBEaROSpvr+KSzKw3QX0+m5h5ROAgYqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37A86F804E7;
	Tue, 24 Aug 2021 11:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D981F80431; Tue, 24 Aug 2021 11:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4AD3F801D8
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4AD3F801D8
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 85918FB499;
 Tue, 24 Aug 2021 17:18:57 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P704T139881214887680S1629796736938922_; 
 Tue, 24 Aug 2021 17:18:58 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <004b5ec1c10a4f49468917d115dad3fb>
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
Subject: [PATCH v2 11/15] ASoC: rockchip: i2s: Add compatible for more SoCs
Date: Tue, 24 Aug 2021 17:18:50 +0800
Message-Id: <1629796734-4243-1-git-send-email-sugar.zhang@rock-chips.com>
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

This patch adds more compatible strings for SoCs.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 90580dc..8898ba4 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -613,10 +613,20 @@ static const struct rk_i2s_pins rk3399_i2s_pins = {
 };
 
 static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
+	{ .compatible = "rockchip,px30-i2s", },
+	{ .compatible = "rockchip,rk1808-i2s", },
+	{ .compatible = "rockchip,rk3036-i2s", },
 	{ .compatible = "rockchip,rk3066-i2s", },
+	{ .compatible = "rockchip,rk3128-i2s", },
 	{ .compatible = "rockchip,rk3188-i2s", },
+	{ .compatible = "rockchip,rk3228-i2s", },
 	{ .compatible = "rockchip,rk3288-i2s", },
+	{ .compatible = "rockchip,rk3308-i2s", },
+	{ .compatible = "rockchip,rk3328-i2s", },
+	{ .compatible = "rockchip,rk3366-i2s", },
+	{ .compatible = "rockchip,rk3368-i2s", },
 	{ .compatible = "rockchip,rk3399-i2s", .data = &rk3399_i2s_pins },
+	{ .compatible = "rockchip,rv1126-i2s", },
 	{},
 };
 
-- 
2.7.4



