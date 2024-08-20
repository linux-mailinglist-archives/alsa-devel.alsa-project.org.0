Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7ED958744
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 14:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173E26C1;
	Tue, 20 Aug 2024 14:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173E26C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724157899;
	bh=Utqhe9F+s1GkUm4HQXCjsQbRa+5htye5qIA5FvCgpoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bzl61FB6soswMbW2dKokeugc3pEUapPUnnTvuR7v4BmQbyZrIrFpjijliPIV8UVc9
	 mBDYikuBEqX4vu1TDF+y0N0Cpi5s5mJHKe+zP60Ef9XExPPfdGmsOVOQEV2tBsUZwk
	 j1dHtAhX3lLKYnp1Wzrzx/hmSBEJVkTIeb4dJ1gQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EF97F80579; Tue, 20 Aug 2024 14:44:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D58E9F805B0;
	Tue, 20 Aug 2024 14:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B612F80496; Tue, 20 Aug 2024 14:44:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC25DF8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 14:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC25DF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cnIzFU61
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0936BCE065F;
	Tue, 20 Aug 2024 12:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7349C4AF0F;
	Tue, 20 Aug 2024 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724157850;
	bh=Utqhe9F+s1GkUm4HQXCjsQbRa+5htye5qIA5FvCgpoU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cnIzFU61EpTOYdmopdAX8B54WTonFDSbnr7iPjujpAxzWdIoq7y6b/3t8iGz+tW1J
	 yNQKwyOLncp7N5l3gevjXvFNKBeO5jud7J6K8o6TCxf6Bt4Ldwt/V7b3OG0gQa9wDq
	 eLmpVNsRUQQ5nJssC0YDIpwKFVXR7oZVAtZP9zIKPWZutpHKtoFfAvrsbyui0giUv1
	 gox95VzpiKxWeoBBKQhXhn/kntNWOFpaUyshUc8P8f+Fn5KtIzkAfflouqtOzw4hw+
	 Ys1w7zaz5t0KhL8nn8+afTwWNj7RF0uSxwznwMGIuDVD46TuOnxbnxsiMHkFQvcUYX
	 zMn6syMo7Vrgw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org,
 lmajczak@google.com
In-Reply-To: <20240812094328.842661-1-cezary.rojewski@intel.com>
References: <20240812094328.842661-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: Remove skylake driver
Message-Id: <172415784765.39606.3511487608777999106.b4-ty@kernel.org>
Date: Tue, 20 Aug 2024 13:44:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: 33BIY7M4G45Z2MHRT7CX23SYYLC7YEFE
X-Message-ID-Hash: 33BIY7M4G45Z2MHRT7CX23SYYLC7YEFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33BIY7M4G45Z2MHRT7CX23SYYLC7YEFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 12 Aug 2024 11:43:16 +0200, Cezary Rojewski wrote:
> A spiritual successor to haswell/baytrail removal series [1].
> 
> The avs-driver found in sound/soc/intel/avs is a direct replacement to
> the existing skylake-driver. It covers all features supported by it and
> more and aligns with the recommended flows and requirements based on
> Windows driver equivalent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: Intel: Remove bxt_rt298 board driver
        commit: 4d61ed7609d8b8fef71f78db6a8ac3221a46ea17
[02/12] ASoC: Intel: Remove bxt_da7219_max98357a board driver
        commit: fa07502e01569b39265008bac783a1202a7560e5
[03/12] ASoC: Intel: Remove kbl_rt5663_rt5514_max98927 board driver
        commit: a08b5fde945ef8b427d2d29515a806fe571d7639
[04/12] ASoC: Intel: Remove kbl_rt5663_max98927 board driver
        commit: 1af24289751253e58850ba572c584f7e6b1caa87
[05/12] ASoC: Intel: Remove kbl_rt5660 board driver
        commit: 1a40ef882fee37006243ebf0b4848c7811672fe2
[06/12] ASoC: Intel: Remove kbl_da7219_max98927 board driver
        commit: 1daa8dce04619f39d4d8ee43ae2a0cec9ab31897
[07/12] ASoC: Intel: Remove kbl_da7219_max98357a board driver
        commit: 15d6966580f3e40fe2f4ecfcde2edd69cc5508e9
[08/12] ASoC: Intel: Remove skl_rt286 board driver
        commit: 51d8e9b20db840e78e0d1ff585cf4c8eb4e091b0
[09/12] ASoC: Intel: Remove skl_nau88l25_ssm4567 board driver
        commit: 4dbf2f9a725d1370d67f9a3bce2f33e913b57e52
[10/12] ASoC: Intel: Remove skl_nau88l25_max98357a board driver
        commit: 6de8dddc56b0577df996212b634f82f6f1fb013c
[11/12] ASoC: Intel: Remove skylake driver
        commit: 46e211411113932be1fd31580a03502466648f91
[12/12] ASoC: Intel: avs: Enable by default for all SST configurations
        commit: 526139aff1d14c5a2cc0a769c063f439444c61c2

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

