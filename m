Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A726C5418
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 19:50:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AB5EB2;
	Wed, 22 Mar 2023 19:49:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AB5EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679511015;
	bh=0MKVtGl8bw1gko7gFoRNgHaoCQ3xOdagFVezvAYbH/0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ki40sf0l5jcupP6i0AEY/X7qj5LXOufUMUiVdc3LsBIjJDzcrKL5alFDIHBPWv/rq
	 vE2XgaI9HNm6l3JvYlSeL/DjFwQdn3p59JVTwlFZoppMP+yyZ/PVpK+le9rBunfkkV
	 xvv52ztY6FSg3OqWmeDp4zO7X+4lc0UZ13wSQct8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21AD3F80542;
	Wed, 22 Mar 2023 19:47:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E84B3F8052D; Wed, 22 Mar 2023 19:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 589EAF8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 19:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 589EAF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D1hyEHPL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4681862273;
	Wed, 22 Mar 2023 18:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08632C433D2;
	Wed, 22 Mar 2023 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679510859;
	bh=0MKVtGl8bw1gko7gFoRNgHaoCQ3xOdagFVezvAYbH/0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D1hyEHPLTkVXDm9L77ArSjAnVY5nLZmZe26Y7x+qEz1JuxzAeeBE7XssH2EqNaRVm
	 d1vHQaLp7g9hWB0PadCYqN/ysu285rrjGQkOO5cv14V+tWtYrKazj+rqwmyQwu+8Eu
	 H/2mOErLDiI8aWmLMUcHtJySSVQ/HZSP+lwfB0mu4qS4Tx8XEcLHXNcpdLj372Gm57
	 JlEWu1h4GdjIHZZJFhv7OplrQkv8E47YnWPhZuVctUMwTAll0tf2JyLVxkPFPk2nb2
	 nb8Ey6wC7ZYqwxImPtqBxdSl3sPMwwxuSOgWKsDwBmNvyilGRd8PuRaiXumtvicsfL
	 ZwByoXoqcfPxA==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875yattwqv.wl-kuninori.morimoto.gx@renesas.com>
References: <875yattwqv.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: simple-card: add comment to indicate don't
 remove platforms
Message-Id: <167951085838.1092488.3241114576781694006.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 18:47:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: MIE2XH22ZIPWAFVY7QRB5UBR76ELDG7C
X-Message-ID-Hash: MIE2XH22ZIPWAFVY7QRB5UBR76ELDG7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIE2XH22ZIPWAFVY7QRB5UBR76ELDG7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 01:12:24 +0000, Kuninori Morimoto wrote:
> Basically CPU and Platform are different Component, but if CPU is using
> soc-generic-dmaengine-pcm, same dev will be shared between CPU and
> Platform, and Simple Card had been supporting it.
> 
> When we focus to clean up Simple Card driver, we tend to remove platforms
> if no Platform was selected, but it is wrong because of above reasons.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card: add comment to indicate don't remove platforms
      commit: dcf084247e376b35c139c922d30917f4ff716a4c

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

