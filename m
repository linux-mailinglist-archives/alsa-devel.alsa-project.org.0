Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4744A1FDBF7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5BB85D;
	Thu, 18 Jun 2020 03:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5BB85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592442960;
	bh=/Nc+hSAuWuRAEuQ7FuotPfq5gihrarSON0Sq73x3r+w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/eJydPjO7KZ2tPYqdqz9JWEe5pqXbQphWNJ+4W6N/lR5mEyoJ+3jOrpa+jsMMSog
	 yZMHmUdBADCd3ft68ICqOtG0o6Jbt5kRtPEZr43CF3Fme/WDrMb23oXip1s1N9Z79W
	 3Ac+mvRIDSKTPMv3Ef0VPR+ce6mNY/0TjYBL270o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D580FF80308;
	Thu, 18 Jun 2020 03:10:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B894F80307; Thu, 18 Jun 2020 03:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEE07F802BD
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE07F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="my/YNyd3"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78A7221924;
 Thu, 18 Jun 2020 01:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442624;
 bh=/Nc+hSAuWuRAEuQ7FuotPfq5gihrarSON0Sq73x3r+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=my/YNyd3PdKE0DQZq7YAS2rvy6WducYQrp/HW4x1G83FApVrgoJIQ6yKWyy4AaTIT
 gfk/LJKZTNEbvPI2djUcgdBE2iyEZdSCcPNZBrayw7Pndt8HMLkm4XOdqpyX5cb1Nq
 wBJi6woj1CS+IsDRtTtIC1bRhyW/UP1dM2vu5ieg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 103/388] ASoC: meson: add missing free_irq() in
 error path
Date: Wed, 17 Jun 2020 21:03:20 -0400
Message-Id: <20200618010805.600873-103-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 "Pavel Machek \(CIP\)" <pavel@denx.de>, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

From: "Pavel Machek (CIP)" <pavel@denx.de>

[ Upstream commit 3b8a299a58b2afce464ae11324b59dcf0f1d10a7 ]

free_irq() is missing in case of error, fix that.

Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Link: https://lore.kernel.org/r/20200606153103.GA17905@amd
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/meson/axg-fifo.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 2e9b56b29d31..b2e867113226 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -249,7 +249,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	/* Enable pclk to access registers and clock the fifo ip */
 	ret = clk_prepare_enable(fifo->pclk);
 	if (ret)
-		return ret;
+		goto free_irq;
 
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
@@ -269,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	/* Take memory arbitror out of reset */
 	ret = reset_control_deassert(fifo->arb);
 	if (ret)
-		clk_disable_unprepare(fifo->pclk);
+		goto free_clk;
+
+	return 0;
 
+free_clk:
+	clk_disable_unprepare(fifo->pclk);
+free_irq:
+	free_irq(fifo->irq, ss);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);
-- 
2.25.1

