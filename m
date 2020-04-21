Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AB1B2F0D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9134616CC;
	Tue, 21 Apr 2020 20:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9134616CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587493552;
	bh=MbmkAclQh2Fvfqf9zloJdgK/nQLdeFcONuiTD4DeGhg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1QLTiIUag3YbiPqvF0A1f+v5X/xJAaDSNm1Aa8MWKAaLybFvYkokFzPIwz/7NGIa
	 /4+0X6GwwTv/mNTohnchv4Y/m5nVwlxtKkmGQov+eorr1CejuM5vNu2tfDTGx6iS8T
	 oalyIlG6aVKvBo3Xt6SDypGGMPFw4CKxH3kxIwFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2BB9F802A1;
	Tue, 21 Apr 2020 20:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E0FF80290; Tue, 21 Apr 2020 20:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CF5BF80252
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF5BF80252
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zljOWQjI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61A062072D;
 Tue, 21 Apr 2020 18:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587493357;
 bh=MbmkAclQh2Fvfqf9zloJdgK/nQLdeFcONuiTD4DeGhg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=zljOWQjIeH5pk0EdHlerrz+wpdNBORs4053c9f5gxC6wpaJ+d3aH0nyH8z9ra+vky
 Kh/Lv1jncV/IZXCUBemYOLSYibDGC+Ai+3Au68t/sTW4JAl8KF2ZVCTTJ8tp2PAvNp
 ycNphkcNdhoE8BZAoTGF19VAa6Ip4mA9My6IoTIk=
Date: Tue, 21 Apr 2020 19:22:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wo6avdq1.wl-kuninori.morimoto.gx@renesas.com>
References: <87wo6avdq1.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/8] ASoC: add snd_compress_ops and replace
Message-Id: <158749333763.13706.276874589638427328.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 20 Apr 2020 16:05:42 +0900, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> Current snd_soc_component_driver has compr_ops,
> but it is created for ALSA, not for ALSA SoC.
> This means it doesn't know the callback is for which component,
> thus, each callback needs to get component via lookup function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/8] ASoC: soc-compress: add snd_compress_ops
      commit: c6cb522c1461eee41f086839bd3c9cb622cd26ca
[2/8] ASoC: codec: wm_adsp: use snd_compress_ops
      commit: 3a5ccf25ee184510980a2c48606f7a004a2c844b
[3/8] ASoC: uniphier: use snd_compress_ops
      commit: 171d1785c703e2f3713a877881412145f6ce98ca
[4/8] ASoC: qcom: q6sp6: use snd_compress_ops
      commit: 849db80ef0ba272dbffe2ca5de6f3ffa09b5a76c
[5/8] ASoC: intel: atom: use snd_compress_ops
      commit: c60e4459c42de356b5cc49830fc08e5fd372a8cd
[6/8] ASoC: sof: use snd_compress_ops
      commit: 39118ce50b85496c0d78614474009fb8cbebb857
[7/8] ASoC: sprd: use snd_compress_ops
      commit: 27ecad217c1437761cb4a9e1409d08bd287c18ed
[8/8] ASoC: soc-compress: remove snd_compr_ops
      commit: e7cbe528391ab6660f747095efb6ee1542e4f205

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
