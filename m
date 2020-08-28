Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36111255D1A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 16:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C56781895;
	Fri, 28 Aug 2020 16:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C56781895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598626388;
	bh=j6bFZa3sYx8FeoIgUW4+Ghb2CyofB47K1YKyDxyL+ZI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwYTbmmCq4n5BUnXZsHQ7B+dZYfDJz+j5qTfeQwoHZmRdlPYmQQW2+6HbqQgRfTa5
	 2RUcoA6VWJGTsPuuq1mEFSDQGZOdR2cJLX6HGK+/3KMnpX3htZRN4W/jl07X1B74NH
	 VGgEdw2tXwSam3LimtxuIaIJVx/3HMnAE9oIJjzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF0ACF80105;
	Fri, 28 Aug 2020 16:51:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28DEEF801D9; Fri, 28 Aug 2020 16:51:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8CE8F800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 16:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8CE8F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mcI3ksbP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03B37207DF;
 Fri, 28 Aug 2020 14:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598626270;
 bh=j6bFZa3sYx8FeoIgUW4+Ghb2CyofB47K1YKyDxyL+ZI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mcI3ksbPD+x6uhQQAlgEePzaRbtO4hpDELP23TXhJJxSn1JQ33eD+b2BfwTDBH0UK
 pDRk1kP2sAMGb1JW7O4bvcKNaZwk9x6R+Q/jt+SUpVeIfFHVzFHUszq5TlSHPS3Wcm
 cF6DKIuGuPKNjlwsG62bMy0SKhBt6H6PqlkEzkME=
Date: Fri, 28 Aug 2020 15:50:32 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20200827205100.1479331-1-dmitry.baryshkov@linaro.org>
References: <20200827205100.1479331-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ASoC: core: remove artificial component and DAI name
 constraint
Message-Id: <159862623264.40815.280070082636132973.b4-ty@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
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

On Thu, 27 Aug 2020 23:51:00 +0300, Dmitry Baryshkov wrote:
> Current fmt_single_name code limits maximum name of a DAI or component
> to 32 bytes. On some systems corresponding device names might be longer
> than that (e.g.
> 17300000.remoteproc:glink-edge:apr:apr-service@8:routing). This will
> result in duplicate DAI/component names. Rewrite fmt_single_name() to
> remove such length limitations.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: remove artificial component and DAI name constraint
      commit: 45dd9943fce08f1b38352ff9453682253bdf19b7

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
