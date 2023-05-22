Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6FE70C1E0
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 854E8847;
	Mon, 22 May 2023 17:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 854E8847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767816;
	bh=qg01C3nZbKa097m6OuKXmVNIyMDy2jv56++B3U1PsZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CVq+d+yFctCS5hmPAm8NcgqKfmrupSDLDGtW7+zR18N+yJiVMadDd3oY2esNnVoGG
	 JFXb9TAFSZ4fu+Tv51REoMdCH7FZM46qUcyPebOKxHeF2PnqcNOnhgKl3gE37Jcqqf
	 y3yMBfwM9yrQDAP9aCFgIpyPTYnan8CIec1x5fSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 658D5F8056F; Mon, 22 May 2023 17:01:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C29B7F80551;
	Mon, 22 May 2023 17:01:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0FF4F8024E; Mon, 22 May 2023 17:01:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78636F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78636F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JQxmxXue
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 675D7623BB;
	Mon, 22 May 2023 15:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132C8C433D2;
	Mon, 22 May 2023 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767702;
	bh=qg01C3nZbKa097m6OuKXmVNIyMDy2jv56++B3U1PsZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JQxmxXueCwdzpVkYRQqzluHGJ9yFKS2lK2v2REPyOkeBkAl6gy01Gl6ToKpjL8mi8
	 NZTTn278QkXqLg0b1/lpkM9pBgYOmes6bD37WKNi658sU2d0xfj6mTUveDZV/rP8N1
	 F5HjmPztGy+cAfyHB/QovZx/r3iGp0wUn0xx7FzOC9NJBF97RGJ7pmty1/0h/xctbR
	 F4AT8WD2OQryZt9mJbGwcpDU8NNwIxiAlqOPRTWeZtjh7xEuCiq8jD6cOsd68nQTvV
	 7VHrF1A57CEoG7/ntD/R3k0abpZ221tpaYgaFYX+Kprdf2qDP7fqfFJAXmTvhxm0uI
	 L9uC3N2+kds4w==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: 
 <ab0fe7e7ecf965df84b9516ba65428af9b3805c1.1684594081.git.christophe.jaillet@wanadoo.fr>
References: 
 <ab0fe7e7ecf965df84b9516ba65428af9b3805c1.1684594081.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: adau1761: Use the devm_clk_get_optional() helper
Message-Id: <168476770080.849172.9653594558542908799.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: LOFHVTOFVYQTCZVJ3ZNVXVO4BGPEJZU4
X-Message-ID-Hash: LOFHVTOFVYQTCZVJ3ZNVXVO4BGPEJZU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOFHVTOFVYQTCZVJ3ZNVXVO4BGPEJZU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 16:48:19 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau1761: Use the devm_clk_get_optional() helper
      commit: ef44ba21995e80e19e7056593067cb4bfaad0bde

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

