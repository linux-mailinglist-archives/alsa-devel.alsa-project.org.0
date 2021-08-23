Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF253F491A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 12:55:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8721654;
	Mon, 23 Aug 2021 12:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8721654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629716116;
	bh=djH4chU8MtySjlTcVXRmGQKZ8BYfqqRqG9TEZ+6w1ao=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inQibHIiKDFOAhFMDRCBBR/naovwEbQTWrVdYdUg9QKV9h9FAU2AoAIlH4fqk9vXZ
	 x64B7nDAQyr0JqsC/LMtgVdHGz9Y+8xKlGu+w88MpqbL1WsEP9ekzTa9n1ITEtAU7y
	 uR1kcINp1QDyJ/uYH20RgMOOUw8pMc4WGgECX860=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D47F80217;
	Mon, 23 Aug 2021 12:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 048C3F804E7; Mon, 23 Aug 2021 12:53:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B5EBF80430
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 12:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B5EBF80430
Received: from localhost (unknown [192.168.167.224])
 by lucky1.263xmail.com (Postfix) with ESMTP id 89B59FB6AB;
 Mon, 23 Aug 2021 18:53:21 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P22031T140205908551424S1629715992162978_; 
 Mon, 23 Aug 2021 18:53:15 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <a83add3348000e17268c56254b1406d0>
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
Subject: [PATCH 09/15] ASoC: rockchip: i2s: Add property to specify play/cap
 capability
Date: Mon, 23 Aug 2021 18:53:04 +0800
Message-Id: <1629715990-21372-5-git-send-email-sugar.zhang@rock-chips.com>
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

- 'rockchip,playback-only': support playback only.
- 'rockchip,capture-only': support capture only.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
Change-Id: Ie022214de4e42bba5ba898ea39a4e39807e8d4ab
---
 sound/soc/rockchip/rockchip_i2s.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 8a432ae..cedfe47 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -721,6 +721,11 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 			soc_dai->capture.channels_max = val;
 	}
 
+	if (of_property_read_bool(node, "rockchip,playback-only"))
+		soc_dai->capture.channels_min = 0;
+	else if (of_property_read_bool(node, "rockchip,capture-only"))
+		soc_dai->playback.channels_min = 0;
+
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_component,
 					      soc_dai, 1);
-- 
2.7.4



