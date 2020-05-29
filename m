Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 415FC1E841F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 18:54:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF87117C2;
	Fri, 29 May 2020 18:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF87117C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590771272;
	bh=509pJFb+h4EzxXQ9huxUCMGnV93J5bxttZJZDwp+jKo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qtTkDNtzYi2B86o//RuXcKP7DIyWydXpJ/YAOA5jGhTOqkVeRJSZV29Kq4dzdeWl6
	 O8N0izzLfXpEDM40yUmHvWeJBT8opBoxbmZieMlfUTdB4FcWjU6UjYwtv/7k9OLwIb
	 pWH7xAE5c0YYOODeq2akiccL4BNx1XFSktHg3TSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C765CF8029A;
	Fri, 29 May 2020 18:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5BEDF80292; Fri, 29 May 2020 18:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F7A7F8028F
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 18:51:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7A7F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JvBnWf2+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CB66207BC;
 Fri, 29 May 2020 16:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771076;
 bh=509pJFb+h4EzxXQ9huxUCMGnV93J5bxttZJZDwp+jKo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JvBnWf2+Uk8diKibDr9y6lSOSG/X/cJ4gdmVD5Gx7MIDMJiPoaIACDxzeYRtJQJ+9
 nzq6oe000/AbHB7p/WalQfrAl7J2e47miz7jqatUBA3xUWb2D6Iywzo596DjMp5vSW
 mSw5gTMIug/XgSsduNUIB0VNNah3z8JhFH3W7FGw=
Date: Fri, 29 May 2020 17:51:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
In-Reply-To: <1590415966-52416-1-git-send-email-xiyuyang19@fudan.edu.cn>
References: <1590415966-52416-1-git-send-email-xiyuyang19@fudan.edu.cn>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA
 channel failed
Message-Id: <159077105220.28617.9185476806800586420.b4-ty@kernel.org>
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

On Mon, 25 May 2020 22:12:46 +0800, Xiyu Yang wrote:
> fsl_asrc_dma_hw_params() invokes dma_request_channel() or
> fsl_asrc_get_dma_channel(), which returns a reference of the specified
> dma_chan object to "pair->dma_chan[dir]" with increased refcnt.
> 
> The reference counting issue happens in one exception handling path of
> fsl_asrc_dma_hw_params(). When config DMA channel failed for Back-End,
> the function forgets to decrease the refcnt increased by
> dma_request_channel() or fsl_asrc_get_dma_channel(), causing a refcnt
> leak.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel failed
      commit: 36124fb19f1ae68a500cd76a76d40c6e81bee346

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
