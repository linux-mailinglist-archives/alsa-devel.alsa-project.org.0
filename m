Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EB13F816B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 06:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C228167A;
	Thu, 26 Aug 2021 06:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C228167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629950596;
	bh=T+cGsKPiCJ4Rw9ntlT15U9pYM8d/rN03qcDQnfbR+R4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rHK5tii1je4q+5bYLadHGxlX0D4PuWEmTzImveZ/T/9dprK4/1+uH5ZuznVbCtOFo
	 FXHE8KYCoTlBUtCFAITikhsk/UJu1Dp61GP8YAcqHCmoj7QNMnAQg6DP+swi0oT6w0
	 vk0JpHCcXgVFpxVXW/mCDp5o5iY7MhS+kmDNL3xY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDE5F8032D;
	Thu, 26 Aug 2021 06:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20F57F8025C; Thu, 26 Aug 2021 06:02:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 513F5F801D5
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 06:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 513F5F801D5
Received: from localhost (unknown [192.168.167.105])
 by lucky1.263xmail.com (Postfix) with ESMTP id 1FD71D623F;
 Thu, 26 Aug 2021 12:02:09 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P21354T140059187595008S1629950526140784_; 
 Thu, 26 Aug 2021 12:02:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <45a58f8c817b59afc0ecb8c7a6f67f7f>
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
Subject: [PATCH v3 02/14] ASoC: rockchip: i2s: Fixup clk div error
Date: Thu, 26 Aug 2021 12:01:48 +0800
Message-Id: <1629950520-14190-2-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
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

MCLK maybe not precise as required because of PLL,
but which still can be used and no side effect. so,
using DIV_ROUND_CLOSEST instead div.

e.g.

set mclk to 11289600 Hz, but get 11289598 Hz.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v3: None
Changes in v2: None

 sound/soc/rockchip/rockchip_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index c9d5c52..05fce2c 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -280,10 +280,10 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 	if (i2s->is_master_mode) {
 		mclk_rate = clk_get_rate(i2s->mclk);
 		bclk_rate = i2s->bclk_ratio * params_rate(params);
-		if (bclk_rate == 0 || mclk_rate % bclk_rate)
+		if (!bclk_rate)
 			return -EINVAL;
 
-		div_bclk = mclk_rate / bclk_rate;
+		div_bclk = DIV_ROUND_CLOSEST(mclk_rate, bclk_rate);
 		div_lrck = bclk_rate / params_rate(params);
 		regmap_update_bits(i2s->regmap, I2S_CKR,
 				   I2S_CKR_MDIV_MASK,
-- 
2.7.4



