Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0743943177
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 15:57:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E159F2CC5;
	Wed, 31 Jul 2024 15:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E159F2CC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722434208;
	bh=ln6Q+aYkwTRjyD3KHMZFLtZDwase6FG+Ro94HJwcCc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fD3heLKGJdaDjTxwHrQFgfCxcUVp8hYrfNkvKdmmOBIp9sw8PfG1943uejF1y0x5R
	 Di9j3rNCCUHegCo0v7HYX9qVnAVMg865YfAc/AU9y7dYxBBd27I+/eG38tUDPCsTrd
	 HKubLdKl+Bc1miER24Ou+hI2dp4lX2gU1gNyKQuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8AEEF805AA; Wed, 31 Jul 2024 15:56:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B36B8F805B0;
	Wed, 31 Jul 2024 15:56:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA81F80579; Wed, 31 Jul 2024 15:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88EEEF8026A
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 15:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88EEEF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FOMPeX1a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 94B31CE16B9;
	Wed, 31 Jul 2024 13:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60430C32786;
	Wed, 31 Jul 2024 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434007;
	bh=ln6Q+aYkwTRjyD3KHMZFLtZDwase6FG+Ro94HJwcCc4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FOMPeX1amn3gIQ1+Pk1NnzxSogkay/hj5SvRcmYwFiHTd6TKQ204nrepLmTaH0Ba5
	 J/2lWm7q5gBmBEGEdq5rUYicNXXcS3x3EQOkmuH6+0cVoXO0HZT3rtdJQ8s1FCefo5
	 fygrgWc4DVRln2qy9YoSsSO+ToVRVTaY5EkijRzWI0VocM0DV7wJ9m1pcGW+3pl5VG
	 FYYPraWSTvxEumlAXDe4jxUHlSbkquYpKAzjqIk3lkLPNQs+hL7kAQtkClptX0mfR8
	 tJzgr8H1izeFEtpZ05MJWmlwSHVRr6Ek2opa3UqMqTX4cVhG1ybgu5uEEEBTa9nk4L
	 zs9g3GQERzw+w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87ed7bk4qt.wl-kuninori.morimoto.gx@renesas.com>
References: <87ed7bk4qt.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: rsnd: remove rsnd_mod_confirm_ssi() under DEBUG
Message-Id: <172243400712.75630.16807614406428007489.b4-ty@kernel.org>
Date: Wed, 31 Jul 2024 14:53:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: BQG5ZDNS5GVXLCSLWFADBU7IQRRMYOZB
X-Message-ID-Hash: BQG5ZDNS5GVXLCSLWFADBU7IQRRMYOZB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQG5ZDNS5GVXLCSLWFADBU7IQRRMYOZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 02:12:10 +0000, Kuninori Morimoto wrote:
> rsnd_mod_confirm_ssi() confirms mod sanity, it should always be
> confirmed, not only when DEBUG. This patch tidyup it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: remove rsnd_mod_confirm_ssi() under DEBUG
      commit: 80565764c7f53b47be266c90d635285e295684dc

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

