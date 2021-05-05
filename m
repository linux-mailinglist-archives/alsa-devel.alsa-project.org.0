Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978CC374108
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:42:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D89016C0;
	Wed,  5 May 2021 18:42:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D89016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232974;
	bh=crQZifefxFB5zTrNmQ8E/W5S9724KgP2XqK90+Y+VD0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SF1okKX3+FCpSPWa8Y7fTu0R+mvtxefX63g5slzpI2wqngkL42JXjJ2hRxBP1EdS7
	 m48etOfdGSFzhX8xJKV4faIeKk5oDWpjUcklsibYNZ4sKsGHYA8fszLnC+yocIr4hZ
	 2uMa9UuiTl77yvTSl3c5lrNbrt3PhgCpqyN4o4wI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53E04F804DA;
	Wed,  5 May 2021 18:35:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04F68F804D9; Wed,  5 May 2021 18:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73919F8026A
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73919F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OAaeyl34"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B20B861929;
 Wed,  5 May 2021 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232547;
 bh=crQZifefxFB5zTrNmQ8E/W5S9724KgP2XqK90+Y+VD0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OAaeyl34eP6zai7zcSrCLwniL/12xmE4ESM8obgp34zPSJt9uREq0s0+Ihi6eYB1P
 rZMalovwSb5RxMtMN4vZqeHNm1eQfswPYHOFiCP0hhPFTluc1qLMw8S53Ah0MZGFi5
 Cy68ZyfQMYUXK36M0M+vt2daMXK65w3jB746bMaihwNr75XK0bDkTmgMU6j8gP4WV2
 9D1JkjZ9GAs/K1w5lJwpr1mbH1JTI5kEH6M2VkM6LmhlZH1S5xkwWkwItT7eJNZ5XL
 27HO8jVF0EUPTb/B39LcNuVZYYvkLLMySAPx2ukQmWAqSQdoElSt4ySakmzo8wQDz8
 bG1IUZOrrxHPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 065/104] ASoC: rsnd: call
 rsnd_ssi_master_clk_start() from rsnd_ssi_init()
Date: Wed,  5 May 2021 12:33:34 -0400
Message-Id: <20210505163413.3461611-65-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 "Linh Phung T . Y ." <linh.phung.jy@renesas.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit a122a116fc6d8fcf2f202dcd185173a54268f239 ]

Current rsnd needs to call .prepare (P) for clock settings,
.trigger for playback start (S) and stop (E).
It should be called as below from SSI point of view.

	P -> S -> E -> P -> S -> E -> ...

But, if you used MIXer, below case might happen

	              (2)
	1: P -> S ---> E -> ...
	2:         P ----> S -> ...
	          (1)     (3)

P(1) setups clock, but E(2) resets it. and starts playback (3).
In such case, it will reports "SSI parent/child should use same rate".

rsnd_ssi_master_clk_start() which is the main function at (P)
was called from rsnd_ssi_init() (= S) before,
but was moved by below patch to rsnd_soc_dai_prepare() (= P) to avoid
using clk_get_rate() which shouldn't be used under atomic context.

	commit 4d230d1271064 ("ASoC: rsnd: fixup not to call clk_get/set
				under non-atomic")

Because of above patch, rsnd_ssi_master_clk_start() is now called at (P)
which is for non atomic context. But (P) is assuming that spin lock is
*not* used.
One issue now is rsnd_ssi_master_clk_start() is checking ssi->xxx
which should be protected by spin lock.

After above patch, adg.c had below patch for other reasons.

	commit 06e8f5c842f2d ("ASoC: rsnd: don't call clk_get_rate()
				under atomic context")

clk_get_rate() is used at probe() timing by this patch.
In other words, rsnd_ssi_master_clk_start() is no longer using
clk_get_rate() any more.

This means we can call it from rsnd_ssi_init() (= S) again which is
protected by spin lock.
This patch re-move it to under spin lock, and solves
1. checking ssi->xxx without spin lock issue.
2. clk setting / device start / device stop race condition.

Reported-by: Linh Phung T. Y. <linh.phung.jy@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875z0x1jt5.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sh/rcar/ssi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index d0ded427a836..a2f8138d40c7 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -507,10 +507,15 @@ static int rsnd_ssi_init(struct rsnd_mod *mod,
 			 struct rsnd_priv *priv)
 {
 	struct rsnd_ssi *ssi = rsnd_mod_to_ssi(mod);
+	int ret;
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
 
+	ret = rsnd_ssi_master_clk_start(mod, io);
+	if (ret < 0)
+		return ret;
+
 	ssi->usrcnt++;
 
 	rsnd_mod_power_on(mod);
@@ -1060,13 +1065,6 @@ static int rsnd_ssi_pio_pointer(struct rsnd_mod *mod,
 	return 0;
 }
 
-static int rsnd_ssi_prepare(struct rsnd_mod *mod,
-			    struct rsnd_dai_stream *io,
-			    struct rsnd_priv *priv)
-{
-	return rsnd_ssi_master_clk_start(mod, io);
-}
-
 static struct rsnd_mod_ops rsnd_ssi_pio_ops = {
 	.name		= SSI_NAME,
 	.probe		= rsnd_ssi_common_probe,
@@ -1079,7 +1077,6 @@ static struct rsnd_mod_ops rsnd_ssi_pio_ops = {
 	.pointer	= rsnd_ssi_pio_pointer,
 	.pcm_new	= rsnd_ssi_pcm_new,
 	.hw_params	= rsnd_ssi_hw_params,
-	.prepare	= rsnd_ssi_prepare,
 	.get_status	= rsnd_ssi_get_status,
 };
 
@@ -1166,7 +1163,6 @@ static struct rsnd_mod_ops rsnd_ssi_dma_ops = {
 	.pcm_new	= rsnd_ssi_pcm_new,
 	.fallback	= rsnd_ssi_fallback,
 	.hw_params	= rsnd_ssi_hw_params,
-	.prepare	= rsnd_ssi_prepare,
 	.get_status	= rsnd_ssi_get_status,
 };
 
-- 
2.30.2

