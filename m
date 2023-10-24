Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A57D5364
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 15:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC0B1850;
	Tue, 24 Oct 2023 15:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC0B1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698155828;
	bh=AHpxByLGl3li07TI+Dtas7HsEV5VlBynUrNCqNQb+/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLLjWAE76S1lboC6Tudbpi5zn9UOuViouTE/IZMFczzch0EpEF66QbB6hBgZOf4yB
	 kf1mKTPOLwTrvWZS+UXBsPWIRMR5NxXVGGNkXWArxtFhT+Yugeezd0Z6JprN+s0k6p
	 fZcEJN8671AkZqCYRv4ZVlyPPM94VRvPMdZMXei8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D32F3F80567; Tue, 24 Oct 2023 15:55:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3585EF8055C;
	Tue, 24 Oct 2023 15:55:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E405F8019B; Tue, 24 Oct 2023 15:55:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43C91F80157
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 15:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C91F80157
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rrlLVjS7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 999AF6145E;
	Tue, 24 Oct 2023 13:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A83C433CA;
	Tue, 24 Oct 2023 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698155715;
	bh=AHpxByLGl3li07TI+Dtas7HsEV5VlBynUrNCqNQb+/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rrlLVjS7xpN+RZQY27zkSRj6n31atsPnmMkcwe/Q3L4hBD83hOqbtS9/weQSeh/oT
	 onwcvUxUZQnw/lCqd/BFIeVXU2xDUHOMslMhbd+Sxpqh5ycYUezWGDQSqa8rjwW9mw
	 1JSkJh3VjexEHnEFVX+RSb46hjt3J4n5BEQPdnzr1sOLWI3OzTpIKhwlG67oyFAlcq
	 wUpbExP1eyfzPsAM8MHBvxNBkE7eqVMq74f7KwCwNBuQhfBxAQZ4bqoDL8k7+7UOnq
	 cdv0uTar5BfKcfUsDnmHNGF4SgRbAxBgBFsCIGNXDiOt7PvcPAdgV65lQYzXRn+bjg
	 4S98dWLtCGbog==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Chris Morgan <macroalpha82@gmail.com>
Cc: tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20231020171539.65513-1-macroalpha82@gmail.com>
References: <20231020171539.65513-1-macroalpha82@gmail.com>
Subject: Re: [PATCH] ASoC: es8328: Use rounded rate for es8328_set_sysclk()
Message-Id: <169815571307.69390.13890270991415169654.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 14:55:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: UO7OSDUVX3MTF2BXECOYOORS43TALQ6Q
X-Message-ID-Hash: UO7OSDUVX3MTF2BXECOYOORS43TALQ6Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UO7OSDUVX3MTF2BXECOYOORS43TALQ6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Oct 2023 12:15:39 -0500, Chris Morgan wrote:
> I have a board (RK3588 based) that sets the sysclk to 12287999. The
> es8328 driver fails to match this to the 12288000 rate and fails to
> load. Allow the rate comparison to work if the frequency is within
> 100hz by dividing it by 100 and rounding it, then multiplying it back
> by 100.
> 
> Note the 100hz value was chosen arbitrarily by me, but it has only
> been tested with a 1hz difference.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8328: Use rounded rate for es8328_set_sysclk()
      commit: 18562fc36c21d572582049e6259c43bf1a01f3e0

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

