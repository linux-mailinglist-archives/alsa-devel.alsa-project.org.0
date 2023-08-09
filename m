Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98254776676
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 19:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C488F82A;
	Wed,  9 Aug 2023 19:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C488F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691602126;
	bh=pin7dWV6QZtDI+Mp4381FV0AgmP6/3Ic735dOKi7sDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Llpi8mZ0toI4XQ0MAAH4B73in36+1poT+khfFUfk4QhZq0WnadQrqmN4GefKFS9qt
	 4Vh+rfOnOQS7N3/4fCarR4k9LgtN2kC20B/gwhrh+uvU1Jm6XUSm+F7ZiDw+QP8A9e
	 QerAyXyjOrdlSMyAAv0Z1z1d9O9jdHsRRHoLXnv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7027F800FB; Wed,  9 Aug 2023 19:27:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFED6F80553;
	Wed,  9 Aug 2023 19:27:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 751B5F8016E; Wed,  9 Aug 2023 19:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF68DF800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 19:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF68DF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BglJ9Gy3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 021D8632A5;
	Wed,  9 Aug 2023 17:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFE7C433C8;
	Wed,  9 Aug 2023 17:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691602018;
	bh=pin7dWV6QZtDI+Mp4381FV0AgmP6/3Ic735dOKi7sDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BglJ9Gy3F2gLTqevy7EEJ52aIQTyfWSE+oyv32Lse+nMHQ9UHtwtwVQvU9URmdxbr
	 ieuqNpWikz4rGnbDxQ+I+8iKtyHCgeR9L1SdT2Y9rdEBiBsY+CFxibMOaWkOWSZZDw
	 FwbmYhQO6x+VA8NMSSdRuy00KYJhQtj2LGAXs70FTllcZPvPPN8eMhp+s1nyO3HaOW
	 5JfPuNxErQ7Hm2yzU7ju/+66DdHa9iDbzXv4D2lcn70vN0MvRN2ExcXrLGLjk9LIqO
	 dmSWwsBVMnf3Ynh4LV0Kr3q1IQ9i5bUL1KxxrdWMkYMgKqTXahEYHwHTqkbpEOprGU
	 YMtG5Y6fEN3eQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <20230809100446.2105825-1-m.szyprowski@samsung.com>
References: 
 <CGME20230809100453eucas1p26811129b083949247b32369f9c38b89a@eucas1p2.samsung.com>
 <20230809100446.2105825-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: midas_wm1811: Fix 'Headphone Switch'
 control creation
Message-Id: <169160201668.157618.7680518711810024806.b4-ty@kernel.org>
Date: Wed, 09 Aug 2023 18:26:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: DFMCXLXDZBINBYHXYKYPLC73IRNGDM33
X-Message-ID-Hash: DFMCXLXDZBINBYHXYKYPLC73IRNGDM33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFMCXLXDZBINBYHXYKYPLC73IRNGDM33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 12:04:46 +0200, Marek Szyprowski wrote:
> 'Headphone Switch' control is already registered from
> sound/soc/codecs/wm_hubs.c:479, so duplicating it in midas_wm1811
> causes following probe failure:
> 
> midas-audio sound: control 2:0:0:Headphone Switch:0 is already present
> midas-audio sound: ASoC: Failed to add Headphone Switch: -16
> midas-audio sound: Failed to register card: -16
> midas-audio: probe of sound failed with error -16
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: samsung: midas_wm1811: Fix 'Headphone Switch' control creation
      commit: 48c6253fefa38556e0c5c2942edd9181529407e4

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

