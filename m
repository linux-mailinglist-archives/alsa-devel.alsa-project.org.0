Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9923F597A
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 09:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A64284B;
	Tue, 24 Aug 2021 09:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A64284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629791705;
	bh=zrJRHNV7H0GyVoGDlHC3S6E/LFlGfKW/zHtvqxYRC5A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K052KjRAY84lDqyXygu7Uh6CGBDuh0R7XW2+tA4/nIr6M02IO3Q/0SqUyCHftLu0I
	 9Fcut8vnrzzx1B3B1VxYa+zDH/oEwHNQ+uuirl/pmF+DbIWGqo5JfhLqfEx6hs0uyn
	 bYmfnqSb5JNa2XWm/Ezm+VfIll6fiw3V+c8oSfFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 696FEF804EB;
	Tue, 24 Aug 2021 09:53:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45555F804E5; Tue, 24 Aug 2021 09:53:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6CB8F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6CB8F801D5
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 1E089D7A32;
 Tue, 24 Aug 2021 15:52:56 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P704T139881101649664S1629791566598648_; 
 Tue, 24 Aug 2021 15:52:56 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <03af10224b6b3a469a84689d6001d895>
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
Subject: [PATCH v1 3/7] ASoC: rockchip: pdm: Add support for rk3568 pdm
Date: Tue, 24 Aug 2021 15:52:33 +0800
Message-Id: <1629791557-13614-3-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
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

This patch adds compatible for rk3568 which is the same
with rv1126.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

 sound/soc/rockchip/rockchip_pdm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 67634d1..f2bf023 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -531,6 +531,8 @@ static const struct of_device_id rockchip_pdm_match[] __maybe_unused = {
 	  .data = (void *)RK_PDM_RK3308 },
 	{ .compatible = "rockchip,rk3308-pdm",
 	  .data = (void *)RK_PDM_RK3308 },
+	{ .compatible = "rockchip,rk3568-pdm",
+	  .data = (void *)RK_PDM_RV1126 },
 	{ .compatible = "rockchip,rv1126-pdm",
 	  .data = (void *)RK_PDM_RV1126 },
 	{},
-- 
2.7.4



