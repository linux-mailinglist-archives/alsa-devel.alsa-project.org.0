Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF3B1C3E71
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 17:26:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CED1728;
	Mon,  4 May 2020 17:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CED1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588605977;
	bh=nYWov+IruDojufa6tepP9RWYXQOu0mwZ7m2c2jlmhqk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K9ZlXYeSGEl/2VaboNSkTCoblwUerO7zEYs7bmWA11SUQxkkEzRFyKxhuabjJG9UQ
	 fCRmPTG3zEBI0J2P9lWEyCILNIjb2LElNo8zZk8lrOUd2sovIv7eBLsZjeqxaAFJve
	 Nb1qklFi7h8iCgu11mxZ9ipnj9u3SHNy+d5LgDFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2383F80278;
	Mon,  4 May 2020 17:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB86F80249; Mon,  4 May 2020 17:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 372DFF80234
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 17:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 372DFF80234
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mVm2X4nP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0AAC2054F;
 Mon,  4 May 2020 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588605815;
 bh=nYWov+IruDojufa6tepP9RWYXQOu0mwZ7m2c2jlmhqk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mVm2X4nP9bnzrjt8It4H4M3nur4Pe4jBaWmJsUvL/iahO0mfIqGnTk3OOwft2oNFN
 0YEX/dlvPP4zo/TB64gtcIYKKfZiAjvmiB2Cd2zjACsrSkTthGESVO52s6Bv/ADyh3
 e4xSW8MBIP3aR816suk1N6H7i22XQzk4bCxRYsSs=
Date: Mon, 04 May 2020 16:23:32 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Tang Bin <tangbin@cmss.chinamobile.com>,
 tiwai@suse.com, bgoswami@codeaurora.org, perex@perex.cz, plai@codeaurora.org
In-Reply-To: <20200504065947.12172-1-tangbin@cmss.chinamobile.com>
References: <20200504065947.12172-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: Use the defined variable to simplify code
Message-Id: <158860581280.26857.17210066344105283436.b4-ty@kernel.org>
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

On Mon, 4 May 2020 14:59:47 +0800, Tang Bin wrote:
> Use the defined variable "dev" to make the code cleaner.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/qcom/lpass-apq8016.c |  9 ++++----
>  sound/soc/qcom/lpass-cpu.c     | 39 ++++++++++++++++------------------
>  2 files changed, 22 insertions(+), 26 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: qcom: Use the defined variable to simplify code
      commit: 952c0e260f8dd44ddb6ff0e260130f1906f7bcf3

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
