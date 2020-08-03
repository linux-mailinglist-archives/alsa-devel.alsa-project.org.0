Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4923A9FD
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 17:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BAE1657;
	Mon,  3 Aug 2020 17:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BAE1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596470264;
	bh=XeYM1rRZOkWuIGWs2dZo48AiU58GKKjioVDTipaaTp4=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AQ1wwxmQ3iL44cPTiAa1+UTE9vHTsZJnbDgETSK7u6IULu0PoHrKUC1j1msQrf3fL
	 89d9DR70rqacaWZlkTvxUBJ/ObBtka8vKpFjF71rTDkjPoT49WGyiN2ZRxDe1T1h2b
	 SHSxjMbeH6qMVOpbky9HALHmNmr9y+Sa87vbR0ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46458F802E7;
	Mon,  3 Aug 2020 17:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8AD6F802EC; Mon,  3 Aug 2020 17:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D414F802E7
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 17:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D414F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GJfBCVCE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 595502072A;
 Mon,  3 Aug 2020 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596469986;
 bh=XeYM1rRZOkWuIGWs2dZo48AiU58GKKjioVDTipaaTp4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GJfBCVCERYczWrzRwIKu61UKHM57s5ntL+rWpDdYN0ZhK3ZstcH3QIQisS6vNUikc
 ke7JZAqeDR34Cqspn0Xa61dQHl+uRVNKPoGzimarFLVS7FQS6p1vKkqLfwVRpoD7NR
 2NdyngBPn5egBEmzDsuwocTAeFvLY8HaNOvRk+p0=
Date: Mon, 03 Aug 2020 16:52:46 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
References: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-Id: <159646994087.2524.15435181634413034183.b4-ty@kernel.org>
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

On Mon, 3 Aug 2020 10:13:31 +0800, Shengjiu Wang wrote:
> With this case:
> aplay -Dhw:x 16khz.wav 24khz.wav
> There is sound distortion for 24khz.wav. The reason is that setting
> PLL of WM8962 with set_bias_level function, the bias level is not
> changed when 24khz.wav is played, then the PLL won't be reset, the
> clock is not correct, so distortion happens.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Remove fsl_asoc_card_set_bias_level function
      commit: f36e8edb95734c03134db628afa25ee23b8e0d95

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
