Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1F7283A1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 17:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D85583B;
	Thu,  8 Jun 2023 17:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D85583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686237660;
	bh=/A54Gy0vU98edPnbqK2o8zydJ92zi9Oi8moAunyOrJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jTyburoVOoYnzLOlbgS3Sa8LsEKoFYvNm2L5/BFLWpuzJZqa/0hOmKsIWjuOYFdiZ
	 PQV4oGZSSRcb5Rv1dwEUvj9GjJOYYqks67d63+vr5QtmxJ6LXAkYIQOStPkFvv/xJI
	 WVZnHSLGrS1IO8TYo8oaa/bC5jkZYBl+oI5gHQkA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A169F80571; Thu,  8 Jun 2023 17:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5704F8055C;
	Thu,  8 Jun 2023 17:19:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF52CF80199; Thu,  8 Jun 2023 17:19:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C08AF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 17:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C08AF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Rdrtpfvp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6D9F6414A;
	Thu,  8 Jun 2023 15:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D19EC433D2;
	Thu,  8 Jun 2023 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686237530;
	bh=/A54Gy0vU98edPnbqK2o8zydJ92zi9Oi8moAunyOrJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RdrtpfvpzdGY8WkZ0yvWsGoaLstSARmD7jyc/8yluqGlgzTEUiib2fkv88fsFTwzt
	 VI0ugZcV7T46reJCxWdJP49kC98i6KrF1VDSRTrx0a8YXLvXBwYBpHShvV2XcfjwuC
	 PBtIASy0kct7WqQaV3CBy9zDKSY1CVdiUuNP7ht1SvF597BP95UxTyx71Rht2IrZ1i
	 xvrSIVjcj191w/VV5jb43kVBKMoj3fBHHc/RRaivw8TN7XrcYhSGWYA32hSIoqSFuM
	 Qtulm4/YMMgaxMJ61jE5WU8vConoEvRAd4bnIwBPUxbOZizfKzBfwCWVlbTFSTIqcG
	 TyTU0X4THN/vw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
In-Reply-To: 
 <53f928290f08f50ff43031e17fe1d88443c2c441.1686202022.git.christophe.jaillet@wanadoo.fr>
References: 
 <53f928290f08f50ff43031e17fe1d88443c2c441.1686202022.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: tegra: Simplify code around clk_get_rate()
 handling
Message-Id: <168623752796.1002486.3534848547952230494.b4-ty@kernel.org>
Date: Thu, 08 Jun 2023 16:18:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: S3ASLKEO6MRBPUUILMQP3N3SW53SBX63
X-Message-ID-Hash: S3ASLKEO6MRBPUUILMQP3N3SW53SBX63
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3ASLKEO6MRBPUUILMQP3N3SW53SBX63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Jun 2023 07:27:22 +0200, Christophe JAILLET wrote:
> clk_get_rate() returns an unsigned long, so there is no point in storing it
> in a long, and test for negative values.
> 
> So, turn 'parent_rate' into an unsigned long, simplify the sanity check,
> the error message and the return value, in case of error (i.e. 0).
> 
> Doing so also turns 'i' and 'valid_rates' into unsigned long, but it is
> fine and harmless.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Simplify code around clk_get_rate() handling
      commit: 41a343cd6b7f8d0f70dd90c236086ccf8a84a7de

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

