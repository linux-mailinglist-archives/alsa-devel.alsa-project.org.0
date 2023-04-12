Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A246DFE42
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 21:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D59841047;
	Wed, 12 Apr 2023 21:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D59841047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681326072;
	bh=a04AmJjKGcxoyVDJd74YDQ+REyxz8IYcBkZ14KBATpY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pfBm7/XZM0ys+I6zbH/K9uo4pbHB9QrzxP0obA52p1m0i8vVz/kCEZ8SfpAPW8ujE
	 5I696Il6TZ2HDP41rE7UqxQnnakJoaNCHg3LotIMXyN3QqrOoMBfqPdVjpZNMBG8Ht
	 XfMv6MDh8lBqTvyYvfouD0eJFckaG7k+/NlwnSh4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43EE1F8025E;
	Wed, 12 Apr 2023 21:00:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBE47F8032B; Wed, 12 Apr 2023 21:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BFEBF80100
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 21:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFEBF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qW4ctxIw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BBC86125D;
	Wed, 12 Apr 2023 19:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6691DC433D2;
	Wed, 12 Apr 2023 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681326007;
	bh=a04AmJjKGcxoyVDJd74YDQ+REyxz8IYcBkZ14KBATpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qW4ctxIw4LXiFrqcqLO1DNio5eUB2j9DYUKwnZ6WDR7yvOCFzRYiBV/ieTb/r5key
	 CDmflt5kNd/i9XrUzzJjy+NBIS+93iYk2fVx5cdD+UiOVjDNV2+DmimorolTeCfcFZ
	 p72k6Sckpi8O7OoHfG0E5v/EeWRvR4e8bhXlggqZ7U4aIQrhq2Er3cIjFLMummZRSr
	 BIsHiiq97l0bUzED97k1W841505HtACcw8ySMkoJBhFxijYNnAtNO+bWwLT0XATjiY
	 fAO0rqHuqYS7F09RfuW3UKcUK0Mv1ZCQA8TIiTgSFbKWNSoYCltaPbJdN+i0oOSaoh
	 dV1gtJ6yHS7tw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/6] ASoC: cs35l56: Add system suspend handling
Message-Id: <168132600593.137613.12135823880163549738.b4-ty@kernel.org>
Date: Wed, 12 Apr 2023 20:00:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: TTFD6VHLLNEQ3PNYMLN3O5BFXSJT26ZQ
X-Message-ID-Hash: TTFD6VHLLNEQ3PNYMLN3O5BFXSJT26ZQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTFD6VHLLNEQ3PNYMLN3O5BFXSJT26ZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Apr 2023 16:25:22 +0100, Richard Fitzgerald wrote:
> This set of patches adds handling for system suspend.
> Patches 1..4 make some code changes that simplify the
> suspend implementation, mainly to avoid race conditions.
> 
> There are two seperate aspects to suspend, and these have
> been done as two patches:
> - the main suspend-resume handling,
> - re-loading the firmware if necessary after resume.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: cs35l56: Remove quick-cancelling of dsp_work()
      commit: 39a594dc0b4ac949edf221db33c7061c45e2c90b
[2/6] ASoC: cs35l56: Use DAPM widget for firmware PLAY/PAUSE
      commit: 7b98a1efbabfd729441f46823b24432f2c32deeb
[3/6] ASoC: cs35l56: Skip first init_completion wait in dsp_work if init_done
      commit: 7816e3407110d887726687740aa18c9ce8eeb0d2
[4/6] ASoC: cs35l56: Always wait for firmware boot in runtime-resume
      commit: f00abaddf0300bd9ca87918148a26bdb748129db
[5/6] ASoC: cs35l56: Add basic system suspend handling
      commit: f9dc6b875ec0a6a6d4091cd9603d193ec98c75a2
[6/6] ASoC: cs35l56: Re-patch firmware after system suspend
      commit: 59322d35179987e85b593e504fd334de8683c835

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

