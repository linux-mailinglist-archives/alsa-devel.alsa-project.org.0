Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C3F248C36
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:58:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E008B179B;
	Tue, 18 Aug 2020 18:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E008B179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597769926;
	bh=3vbm55O2sXgcIvXGhZRQabLgIImj+oFTn5mSUu/7Agw=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiOanJVgQtnueQizwI2W1ATsgRPbzYQSDNMb/Ql0u1V3E/4v7qN5OaNjNVANYGItS
	 pCn6fOkVwpq1Cckx4XX8dXL7AW/h27XKTN28ZNk9CX/v2Lz59aVVpb4zo2x7p94FmB
	 0M85cYuL9yul85Uh7k7AZXN3Mfw5V1KXQPOc9B/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02037F802E2;
	Tue, 18 Aug 2020 18:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 220C5F802EC; Tue, 18 Aug 2020 18:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFF72F802E2
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFF72F802E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hd8yj2Z4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6523207D3;
 Tue, 18 Aug 2020 16:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769675;
 bh=3vbm55O2sXgcIvXGhZRQabLgIImj+oFTn5mSUu/7Agw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Hd8yj2Z4AZnjkkZfNcW76gJD1StQ0Hd498Lrh2p0s3HytUpyS9vBhtC0Hkx1oj+KM
 IOhlAnOWEf0qRJZ5I5H9B/xQOTLqe7baPNC2DDKpqx0Cxc5f3lEm/D63e6/yzYs8Vx
 wnW+amRKnMUbil8RaF824efxXqqyaLSdP05mlc2o=
Date: Tue, 18 Aug 2020 17:54:04 +0100
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <1597047103-6863-1-git-send-email-shengjiu.wang@nxp.com>
References: <1597047103-6863-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Get "extal" clock rate by
 clk_get_rate
Message-Id: <159776961931.56094.3057738370364224756.b4-ty@kernel.org>
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

On Mon, 10 Aug 2020 16:11:43 +0800, Shengjiu Wang wrote:
> On some platform(.e.g. i.MX8QM MEK), the "extal" clock is different
> with the mclk of codec, then the clock rate is also different.
> So it is better to get clock rate of "extal" rate by clk_get_rate,
> don't reuse the clock rate of mclk.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Get "extal" clock rate by clk_get_rate
      commit: a8fd5ca8016948a611bff62b0990ade9e1f8e83c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
