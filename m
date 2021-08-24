Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A53F5BE0
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 12:18:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EDA9167F;
	Tue, 24 Aug 2021 12:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EDA9167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629800309;
	bh=3odmDhDLe78f9m+nZgK4lL+xtZ3ZpnEWfhDxrd95yn0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5FHp6b6W0V0A/ko/89lw7pewVjdpUbFc65LEkCYF6DueBbykx8HG5D1+uWXVM3pq
	 dM3YyrcswrF3X66W4mDwiiTZ0moDeTmBpl1Pg7bFTBtHHqVGckl7DLsp6OGM1wxO0Q
	 B+p83kDkd0PMIZt3owVJb0CemayBSX2jDmxS5Psk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 412ADF8032D;
	Tue, 24 Aug 2021 12:16:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54268F804E6; Tue, 24 Aug 2021 12:16:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.135])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C351CF8032D
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 12:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C351CF8032D
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 4DA19B3110;
 Tue, 24 Aug 2021 18:16:17 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P32763T139760989173504S1629800174340042_; 
 Tue, 24 Aug 2021 18:16:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <df41ce893a7ede958890638194f6bd1b>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 10
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v1 3/4] ASoC: rockchip: spdif: Add support for rk3568 spdif
Date: Tue, 24 Aug 2021 18:16:01 +0800
Message-Id: <1629800162-12824-4-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629800162-12824-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629800162-12824-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

This patch adds support for rk3568 spdif which is the same
with rk3366.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

 sound/soc/rockchip/rockchip_spdif.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 92b27b6..d027ca4 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -58,6 +58,8 @@ static const struct of_device_id rk_spdif_match[] __maybe_unused = {
 	  .data = (void *)RK_SPDIF_RK3366 },
 	{ .compatible = "rockchip,rk3399-spdif",
 	  .data = (void *)RK_SPDIF_RK3366 },
+	{ .compatible = "rockchip,rk3568-spdif",
+	  .data = (void *)RK_SPDIF_RK3366 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rk_spdif_match);
-- 
2.7.4



