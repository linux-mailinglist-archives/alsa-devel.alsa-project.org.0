Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE91BA45A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC4116A8;
	Mon, 27 Apr 2020 15:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC4116A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587993278;
	bh=oLAkO5I8sHm5bFau0W6wglLolrcnVrPC69eOGnt+QRI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QoE/0rCkxN5D2+XJiCPFfOgKst0mr+nqYxpnkkFBDb8gwLaXAnTQ3zIocaEdvXRSp
	 bC5Hv+Byu+cy5OKH7wSdI/RXIj8c3SNeDPTI8bgq9/8qMSkbIm//gwhCkRYsL9RxRq
	 fYfsLAFOIUJbLX5g5RcVN0AJsiIO2l8K/6PenopU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92770F802A0;
	Mon, 27 Apr 2020 15:10:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4595DF8022B; Mon, 27 Apr 2020 15:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22753F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22753F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q8QVKDZ2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C8B92076A;
 Mon, 27 Apr 2020 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587992971;
 bh=oLAkO5I8sHm5bFau0W6wglLolrcnVrPC69eOGnt+QRI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=q8QVKDZ2XFWhQVe8XrBElgPdWbNSB/mPsB/EtEAY/fsNZUWHkGoSwNxNgCpFdzXuX
 A77egwRNVRGTk6YcumRlqeC/pd0sFhQsh72VkAG47P+3Tccru9bvrEX+5FvtUSl4iu
 lFCjr8QtrWI+DQzbGYlTHol8cWJjr0ckRxoiVTJI=
Date: Mon, 27 Apr 2020 14:09:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <20200427091145.4268-1-tangbin@cmss.chinamobile.com>
References: <20200427091145.4268-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: hisilicon: Use IS_ERR() instead of IS_ERR_OR_NULL()
Message-Id: <158799293954.30174.15623611340968433375.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org
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

On Mon, 27 Apr 2020 17:11:45 +0800, Tang Bin wrote:
> In the function hi6210_i2s_probe(), devm_clk_get() doesn't return NULL.
> Thus use IS_ERR() to validate the return value instead of IS_ERR_OR_NULL().
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/hisilicon/hi6210-i2s.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: hisilicon: Use IS_ERR() instead of IS_ERR_OR_NULL()
      commit: e782ddbb0873d4d96bda890b295130696e0739fc

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
