Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9103179A977
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 17:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56415A4B;
	Mon, 11 Sep 2023 17:09:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56415A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694445006;
	bh=6qVJgXOyGrRy3MsXv00ledjxzgW4K3II5wnwOCy951o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mMj+nLhhLquzEf/mQZMx0aPuIPUoh3IvOOzqdZpg4lErVqiitWymsXognaf0hMVyQ
	 Iz8VBhlaHlJgWbCtdxExkTSkHVhWTvG5Gx9iFTm/ULtnVZLkFhIx4xCRAfZbMgDP/V
	 TakOW2lpvNiq6dPINyYScnagqsxiS8pX7FVpRDN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF421F805A1; Mon, 11 Sep 2023 17:08:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E810F80587;
	Mon, 11 Sep 2023 17:08:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0912FF8056F; Mon, 11 Sep 2023 17:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1BD2F80246
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 17:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1BD2F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GbJIh77c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8520BCE167C;
	Mon, 11 Sep 2023 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F88DC433C7;
	Mon, 11 Sep 2023 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444870;
	bh=6qVJgXOyGrRy3MsXv00ledjxzgW4K3II5wnwOCy951o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GbJIh77cjpriu2wTdMDc3Xss54QbSEvxn48e6G8mddD7/ztnLImVbspXJX7rinsPO
	 DKDj6Zb08Dl9gbkNZ8lqLSCJpC4HI23qt0+hDZzP/+91RGtBUeXal/+bswsKswLv3d
	 Cw4Gs4AV16GHA0MZk6YFKa0FREh2REFPNRyWD+HHRVpAbUvZ46vvzYt5f9kAM6Zj7O
	 KlwU3ufTKnKGomGI2I8/5qO+m6qwFracY69AWM/XTQg9w/QnLJN0YnicVWtaljmsMN
	 09d2GCtMnQYInTjc/kbIzrTHH8OaRL7qbYs2SOaHIOvBDAAr04mnyyejzNoBrqm/gc
	 TBiC0mXbH+Pbg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230908101716.2658582-1-rf@opensource.cirrus.com>
References: <20230908101716.2658582-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Call pm_runtime_dont_use_autosuspend()
Message-Id: <169444486689.1851820.7894318882943305777.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:07:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: WNOJGZXF6WK5ISDI6KGXHVR5653PVA4N
X-Message-ID-Hash: WNOJGZXF6WK5ISDI6KGXHVR5653PVA4N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNOJGZXF6WK5ISDI6KGXHVR5653PVA4N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Sep 2023 11:17:16 +0100, Richard Fitzgerald wrote:
> Driver remove() must call pm_runtime_dont_use_autosuspend().
> 
> Drivers that call pm_runtime_use_autosuspend() must disable
> it in driver remove(). Unfortunately until recently this was
> only mentioned in 1 line in a 900+ line document so most
> people hadn't noticed this. It has only recently been added
> to the kerneldoc of pm_runtime_use_autosuspend().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Call pm_runtime_dont_use_autosuspend()
      commit: ec03804552e9a723569e14d2512f36a8e70dc640

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

