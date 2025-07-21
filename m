Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AD1B0C737
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jul 2025 17:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CFC3601D9;
	Mon, 21 Jul 2025 17:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CFC3601D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753110320;
	bh=D92QQ2V8WIctVtXz1PyamXc9LFaEhqZq46t2dRwRLH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DW1xRkMnq/knIxIodiGESMjHuW29Ti/xw1Li7Fnll76LhcI9dFDKj6pAcfVRXidvI
	 XyQTfKc+jAvKV1g6YBA7byxAWhzZQ5cMGOuKMCqGQFaTrq+rnipBqgNUZU/8h96QdR
	 mpBQ+yyvWl9WTIGogi2vddrxbF/yOtA5tApijkHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 209F4F805C0; Mon, 21 Jul 2025 17:04:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4BF7F800E4;
	Mon, 21 Jul 2025 17:04:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F88AF8025F; Mon, 21 Jul 2025 17:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8BACF80086
	for <alsa-devel@alsa-project.org>; Mon, 21 Jul 2025 17:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8BACF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D7KhsbxP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 531F35C5DB9;
	Mon, 21 Jul 2025 15:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ACEC4CEED;
	Mon, 21 Jul 2025 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753110272;
	bh=D92QQ2V8WIctVtXz1PyamXc9LFaEhqZq46t2dRwRLH4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D7KhsbxPVpcqyPX/2fBrfUcQwrYrfsUvBKQuA4ijQNKjPoNC++6hUFGQ8idwwuff2
	 LuQKA6wKCWh0WPJUNzQGE83XG/yWcqybRbqIn5MhoSjJ1LKUGcANGluWyk5AJhAB1/
	 2snnxOHGGSa+IFKE680yWvUeFDO0hWZhHliQuDwxkCXaDDlNRe8zbTFM+VtsQx4Cud
	 iezgd3nw9+3LnlVLnfeF9mXisOkLa4ctqTIGg1GYQY3v4Dym16va4rFxR+65p4XCiz
	 BAFLs0iePZeLHrYuBgFPkOcmHdmrNEKO628Uh4bpwK09+swLAQtQT88rqXq1+ruygf
	 wphdJUsvXFQHg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, derek.fang@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com
In-Reply-To: <20250721034728.1396238-1-derek.fang@realtek.com>
References: <20250721034728.1396238-1-derek.fang@realtek.com>
Subject: Re: [PATCH RESEND] ASoC: rt5650: Eliminate the high frequency
 glitch
Message-Id: <175311027023.206895.11348480447323095812.b4-ty@kernel.org>
Date: Mon, 21 Jul 2025 16:04:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: N7AG4AMJUZ7RHG4IJKIE6XTGZZIBRD67
X-Message-ID-Hash: N7AG4AMJUZ7RHG4IJKIE6XTGZZIBRD67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7AG4AMJUZ7RHG4IJKIE6XTGZZIBRD67/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 21 Jul 2025 11:47:28 +0800, derek.fang@realtek.com wrote:
> The glitch was detected in the high frequency of the HP playback.
> This patch adjusts the DAC dither setting to avoid this situation
> for almost all cases.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5650: Eliminate the high frequency glitch
      commit: d312962188dd1f682b0351ccf9933334738ac462

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

