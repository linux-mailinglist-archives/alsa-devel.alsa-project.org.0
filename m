Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0257B6923A7
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 17:51:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECEE5843;
	Fri, 10 Feb 2023 17:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECEE5843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676047894;
	bh=1lZTDWrTdMa1RPSGyt9fd7Ze/t6znija+AOb8IAn6Ao=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NSaQS2zAhxM+Iw3/ZcJCgLBqkaPMtsymDAeYUI85fpy2QTf5UrbbAeQ4T7bPchJnp
	 8yO8Mv7Z46kVeixVc3VDfl55svOehl1u9u1UTnh61zf/BYxcfDVRf5rQPGOla2sXgY
	 Fvsm0IevmTngVebQksuvK+AfVLEte0kmXXgMSidk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEFEAF800B8;
	Fri, 10 Feb 2023 17:50:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C669CF8018A; Fri, 10 Feb 2023 17:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75949F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 17:50:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75949F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eLYWWuOC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57A9461E30;
	Fri, 10 Feb 2023 16:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43497C4339B;
	Fri, 10 Feb 2023 16:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676047832;
	bh=1lZTDWrTdMa1RPSGyt9fd7Ze/t6znija+AOb8IAn6Ao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eLYWWuOCbb6CLaO9CLDToYplAK1ZSRKLxcRS2y8maIla7L5MEDW9syq71k0q2Osug
	 nVQyLjCewAec831Szs/zCrLMn7fSGEJ+QXUvlBNJodbPE1iNwr2PGGottWui2nvouA
	 pMCS01fFt0o8TSSEsgZVBLlybsWGWBr8GeYASgeqp7F5+ZJi43xHsHgPhbwNjC08XA
	 6mvohimZPqF3WHxEQ+SKYxDp44tTa5X3OB7ONSQ2+qnbdSk7pPNew3TFm1gioDpVMQ
	 zHgmQJYifFv6zb9HsqdU/1+yDZ70+rb/y241xjgG38icrs9uFBrvBwJLl1edlkS9bc
	 Ze2fa+LJ7/5vQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lel6ksqn.wl-kuninori.morimoto.gx@renesas.com>
References: <87lel6ksqn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: core.c: indicate warning if strange TDM
 width was set
Message-Id: <167604783198.559421.5607874769111302244.b4-ty@kernel.org>
Date: Fri, 10 Feb 2023 16:50:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: SAZBXAQZWFI4QFXWOW6ESQKXDDXO6LSJ
X-Message-ID-Hash: SAZBXAQZWFI4QFXWOW6ESQKXDDXO6LSJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAZBXAQZWFI4QFXWOW6ESQKXDDXO6LSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 05:13:43 +0000, Kuninori Morimoto wrote:
> Current rsnd silently uses default TDM width if it was strange
> settings. It is difficult to notice about it.
> This patch indicates warning for it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: core.c: indicate warning if strange TDM width was set
      commit: 1ad059a15707cfb066ae3d7342d59770f04aac5a

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

