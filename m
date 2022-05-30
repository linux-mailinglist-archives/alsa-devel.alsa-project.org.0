Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7A537E3B
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 15:54:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23D31FA9;
	Mon, 30 May 2022 15:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23D31FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653918842;
	bh=FUexYxaRsvee6a4Kuwpw9ly8fry/guwfgp+ZPHLQiCg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eW6EdDIeRVYqr49m7cUibFGj4M+dkvLWoaCrM55+wW7pgulvfnZ84pMiuacY595ga
	 D7RvdHYCjmDy25nf6mxbdgG1epVRUcMfCytLVGau+Pdypzu8vJPpqGCZVys1jLsvIo
	 16w2jm3PA+KCbFnve9emIOc8myfPANJCZiwsOENM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B331CF800DE;
	Mon, 30 May 2022 15:53:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 002B9F804EC; Mon, 30 May 2022 15:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B77E7F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 15:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B77E7F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OQvM+maz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7003960EC3;
 Mon, 30 May 2022 13:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AB7C3411F;
 Mon, 30 May 2022 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653918782;
 bh=FUexYxaRsvee6a4Kuwpw9ly8fry/guwfgp+ZPHLQiCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OQvM+mazQQMInayt9PCUkuRFPwlLHV8tJAxWd6UgLnA5NVbiZzroijUarxZITNYXu
 pzUWkTghG0DrXWrUEUESV8KiNLlQQSmveEov7cTW7h4/yMnOMgTbTiBI47xMPkSwpb
 A3vLvXMgUFpPjfYS/mIDAkMzUCCFUQ34MBM+TIzbajyNvkSXYDH99OyQTMCkDLD5kC
 sTI40m9ThAnxTeBWdG+SyKaF9QyOJhJHnmTWk24fWSKbqZr0c3FRLJf7MUjcWDmPKG
 CoEllIhd5zlYYkuJmP0b8K/YcLKK7+/AEnruFIse2pI6ZdsVtEsca+url7G6Z/fFh7
 jWA+jY9kHwfMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 20/24] ASoC: rt5645: Fix errorenous cleanup order
Date: Mon, 30 May 2022 09:52:07 -0400
Message-Id: <20220530135211.1937674-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530135211.1937674-1-sashal@kernel.org>
References: <20220530135211.1937674-1-sashal@kernel.org>
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
 sound/soc/codecs/rt5645.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 1ac96ef9ee20..703b26ec4e15 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3878,6 +3878,12 @@ static int rt5645_i2c_remove(struct i2c_client *i2c)
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
 
-- 
2.35.1

