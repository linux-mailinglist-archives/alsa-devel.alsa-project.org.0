Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB61BC3F2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 17:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D9D1682;
	Tue, 28 Apr 2020 17:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D9D1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588088610;
	bh=m3hQm8gosMVcEzwy0eRzhmbhb9xpXvL9MpTX2D3IkBg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N0EgoYPr7kNOox4dv0tMb3izGIEAKSMiRsxZvFAiQoIH4myp7CXnjLKHFvTE48kOz
	 MTVyzfLdr9X2cT+MiNjJ4LmhFwFtSJ21L4IF1MDzOghjyMrenQgHu1LZx4tDHP6Hz5
	 zWFuG1Zm8+qBWYd0C2R611SVpJuFvtoYezSGRPWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1EEF8024A;
	Tue, 28 Apr 2020 17:41:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1B79F801F7; Tue, 28 Apr 2020 17:41:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C6D1F801EB
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 17:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6D1F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lxqkJh4c"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21E21206D7;
 Tue, 28 Apr 2020 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588088461;
 bh=m3hQm8gosMVcEzwy0eRzhmbhb9xpXvL9MpTX2D3IkBg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lxqkJh4chgjEtNIOCO5x/UqvWUOjcx7z/KGvdDrwKEPx5xYj89TjLuQtxgx9vSnf3
 JQpSUSWGQCA4GNDypq6TfgEbaSst2iifF5p6g6iGna7Hc6dNofOzy33E5pUF6cGRau
 OoOM72nLdxg0zm7JV5OwUMd4A9CE+CduxQtzEB4c=
Date: Tue, 28 Apr 2020 16:40:59 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <1587818916-38730-1-git-send-email-xiyuyang19@fudan.edu.cn>
References: <1587818916-38730-1-git-send-email-xiyuyang19@fudan.edu.cn>
Subject: Re: [PATCH] ASoC: davinci-mcasp: Fix dma_chan refcnt leak when
 getting dma type
Message-Id: <158808845301.38316.4295335202430928614.b4-ty@kernel.org>
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu
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

On Sat, 25 Apr 2020 20:48:35 +0800, Xiyu Yang wrote:
> davinci_mcasp_get_dma_type() invokes dma_request_chan(), which returns a
> reference of the specified dma_chan object to "chan" with increased
> refcnt.
> 
> When davinci_mcasp_get_dma_type() returns, local variable "chan" becomes
> invalid, so the refcount should be decreased to keep refcount balanced.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: davinci-mcasp: Fix dma_chan refcnt leak when getting dma type
      commit: a697ae6ea56e23397341b027098c1b11d9ab13da

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
