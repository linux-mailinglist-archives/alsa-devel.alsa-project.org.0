Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9C537DE1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B8861EF2;
	Mon, 30 May 2022 15:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B8861EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918243;
	bh=0qLbL55MF/P0+Qou/QahJDBlhd7ow5V6cdXeBWPYJEE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGCORK6v4Q0BaEIhXrA4ioWwaLXy7wmuD4gAWiCird0QQDIu7SP8WSk5B5YV3KJ5c
	 15wMbLjqwvoRtA/KtNSDhFmANBTNd0V+0gYYp16rD3t1E5SgQJHJhMU8V3zJAKbO3w
	 vyE/dq1bcUYEjhJNgTGWP/nYxNKeoIN7gnew6cis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26C74F800DE;
	Mon, 30 May 2022 15:43:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C8CDF8012F; Mon, 30 May 2022 15:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7798CF800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:42:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7798CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aOPOW8kW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBE2260F14;
 Mon, 30 May 2022 13:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3EBC3411C;
 Mon, 30 May 2022 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918176;
 bh=0qLbL55MF/P0+Qou/QahJDBlhd7ow5V6cdXeBWPYJEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aOPOW8kW7GypBG7cHOIO3/Tj/1bd7nTL5IqoYcOPMsOZGxpXnsTNie6lniI9Sv7PW
 4Q1eVoQ5FyP+KpTUdrkzlpK0h9vWmcpDnJKUk/dpRbrtpGi4uFULlPxVHknYjmndov
 Wr5A1Ls6pZvtIjgWboDDkJASciRQck5veMa2lXroJwb8DS60k/DAq6vfeue+eliIIw
 PymS6neyaiVi4bCjkfidaw2NqTfFw7S536L4eWZxg9TI2lSVnfVJoXKutM7AP8/80s
 hF2wS98VaQrfg8L0zpz3EiG4KI0i17PVmudL18OlgXaT2QkzViK+8d/wQWHqgycqzU
 zRH7+AeXa8frg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 086/109] ASoC: rt5645: Fix errorenous cleanup
 order
Date: Mon, 30 May 2022 09:38:02 -0400
Message-Id: <20220530133825.1933431-86-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133825.1933431-1-sashal@kernel.org>
References: <20220530133825.1933431-1-sashal@kernel.org>
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
index 9408ee63cb26..8ea6d4333562 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -4154,9 +4154,14 @@ static int rt5645_i2c_remove(struct i2c_client *i2c)
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

