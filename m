Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA77537E27
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F59C1F7A;
	Mon, 30 May 2022 15:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F59C1F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918702;
	bh=zZ8Ny6isuJgovwiWB2jimRYvq29LtKT6NbIjjiWAd9U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pdKeC334cjJx1v6H5H6XBDE8fhT6+oaoLRJdM8kdVApzAFZdFFzpJAswOt7ORQS+r
	 +H5ut/xULr+eprPJJW1kEeheuArK4t+fF5p0jXDs8d/c3gO1aR8FUR8ZRhypJxsEIY
	 Xo4CrzS58pOHmXEFWy0T+rNqCxu0kCwcMZbxp4LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3839BF80240;
	Mon, 30 May 2022 15:50:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6DDF8051F; Mon, 30 May 2022 15:50:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8507F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8507F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aVUemRt3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49530B80DE5;
 Mon, 30 May 2022 13:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7306C3411E;
 Mon, 30 May 2022 13:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918641;
 bh=zZ8Ny6isuJgovwiWB2jimRYvq29LtKT6NbIjjiWAd9U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aVUemRt3czYNmOBoWFZr2w7dDCx4dVGVwukHyR8D2ccPdzCfa1nAm58IuFmlfX9BW
 n1T2qlIGYAEOMW92QOd4ZQ8xVh8nc5sodgT4V1/vy4G8eshgvXh3JjTcx1A9PKcAqy
 g+waqt4J6bLRjCL7CA5mypCIv2jCDKTERC9NxBp/pk/XvdJky9PwjeLXNDnItTCfP0
 /O7FzYZsaV2YAawyqdRTMljfFIpwuHJ4zP3T5ho75eM8UzzmyhGE8VsnJTWFCG9Lgv
 kR60/gPjGyavGrc8ImjsRCX/MONLAEiQTDr641pp+lRP91MxRJ7cGWgtlLMJv88nL+
 VN+oya6kBSM/w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 32/38] ASoC: rt5645: Fix errorenous cleanup order
Date: Mon, 30 May 2022 09:49:18 -0400
Message-Id: <20220530134924.1936816-32-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134924.1936816-1-sashal@kernel.org>
References: <20220530134924.1936816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Lin Ma <linma@zju.edu.cn>
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

From: Lin Ma <linma@zju.edu.cn>

[ Upstream commit 2def44d3aec59e38d2701c568d65540783f90f2f ]

There is a logic error when removing rt5645 device as the function
rt5645_i2c_remove() first cancel the &rt5645->jack_detect_work and
delete the &rt5645->btn_check_timer latter. However, since the timer
handler rt5645_btn_check_callback() will re-queue the jack_detect_work,
this cleanup order is buggy.

That is, once the del_timer_sync in rt5645_i2c_remove is concurrently
run with the rt5645_btn_check_callback, the canceled jack_detect_work
will be rescheduled again, leading to possible use-after-free.

This patch fix the issue by placing the del_timer_sync function before
the cancel_delayed_work_sync.

Signed-off-by: Lin Ma <linma@zju.edu.cn>
Link: https://lore.kernel.org/r/20220516092035.28283-1-linma@zju.edu.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5645.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 9185bd7c5a6d..d34000182f67 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4105,9 +4105,14 @@ static int rt5645_i2c_remove(struct i2c_client *i2c)
 	if (i2c->irq)
 		free_irq(i2c->irq, rt5645);
 
+	/*
+	 * Since the rt5645_btn_check_callback() can queue jack_detect_work,
+	 * the timer need to be delted first
+	 */
+	del_timer_sync(&rt5645->btn_check_timer);
+
 	cancel_delayed_work_sync(&rt5645->jack_detect_work);
 	cancel_delayed_work_sync(&rt5645->rcclock_work);
-	del_timer_sync(&rt5645->btn_check_timer);
 
 	regulator_bulk_disable(ARRAY_SIZE(rt5645->supplies), rt5645->supplies);
 
-- 
2.35.1

