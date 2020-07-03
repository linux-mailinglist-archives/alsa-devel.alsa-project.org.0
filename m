Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD761213E26
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 19:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C0116CC;
	Fri,  3 Jul 2020 19:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C0116CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593795971;
	bh=KsrS7I9qqR/6iPnIWnW3dOayryKjYOf6ZmkkltC24D8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p27s1ClUkbTMYsrC0IEUpAZ02LtbCe3kNzk0M67KD4eVdG/ldT5HyM4VMHhJ+icH2
	 gs86qk6Ymza7E8bFzKxNtemZXT/SHPZviatFvBHMANhAza6wRjJP9zFc05ozvy7AbN
	 kQX4SXuiy7dQ3xhorb2ssccqzvLIOQEfydl0xo4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74FFCF800E2;
	Fri,  3 Jul 2020 19:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA53F8025F; Fri,  3 Jul 2020 19:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9653FF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 19:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9653FF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rgwVAHhj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ADB8208E4;
 Fri,  3 Jul 2020 17:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593795826;
 bh=KsrS7I9qqR/6iPnIWnW3dOayryKjYOf6ZmkkltC24D8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rgwVAHhjCRXbq+7n0OzhHWK+4uc5zj7+YlVT55AjXs2sdV7yoqqdUdLOHIxOxsehm
 006Tf70B4NGnZO7dqN92/JLF8oLFDJM/SdiUAGBS6afpjiCbFuV9lyfRfPN51+GgXm
 vsfNMGBQNL7bCi+4rxkHwAgIwDVJ96roSiej3V3o=
Date: Fri, 03 Jul 2020 18:03:43 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, timur@kernel.org, perex@perex.cz,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
Message-Id: <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 30 Jun 2020 16:47:56 +0800, Shengjiu Wang wrote:
> The ASRC not only supports ideal ratio mode, but also supports
> internal ratio mode.
> 
> For internal rato mode, the rate of clock source should be divided
> with no remainder by sample rate, otherwise there is sound
> distortion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
      commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0

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
