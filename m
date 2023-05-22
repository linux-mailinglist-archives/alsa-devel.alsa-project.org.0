Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B270C1CF
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ACAB208;
	Mon, 22 May 2023 17:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ACAB208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767760;
	bh=W3n2ie8or4SXmcPJHZPuOuwWjPHJV1IIy+mOUFUZYig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZLIhU0Wo4cO85LHekEE/6gMlqEXHIdTfPniW+Esy7WfiCgR2FDNZZp6w7sWqW1QLn
	 8JC2miBMvkcXzqEO+2wYQX4eGQ0KRotxubabxgbT25pbCLQsnTqezUR9B27s3jy8XF
	 Q01LW2LT2fm2m4HTWFicsM/54DAWs22/xfI5agpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C84CFF8026A; Mon, 22 May 2023 17:01:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F89BF80053;
	Mon, 22 May 2023 17:01:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61670F8026A; Mon, 22 May 2023 17:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3895EF80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3895EF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j9W/bJXK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E812623AC;
	Mon, 22 May 2023 15:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9284C4339B;
	Mon, 22 May 2023 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767697;
	bh=W3n2ie8or4SXmcPJHZPuOuwWjPHJV1IIy+mOUFUZYig=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j9W/bJXKDHaGLDXKUai3eSVayipQBNbxokfixxBsy2tafF4h26QuKL5Su0rhrJw1o
	 lmmelHfaZaDVrzZDy3cDF86Ky4rrKI2pfH2AL/p/58OBcWBbTBoTY4Cxie605PKgIn
	 lgDshJzlGwHtbqTodbiJ/hZJvTJPbFnG9IkGY0xUxMi3ByMa5oAsQjsusoxII4FWUC
	 uyRopqOmKjg33GktJJdTsLi6+4W300coba0KkuF9dBsE70aEW0gOTbWc5gpLVotcs+
	 NDVuWXZYcblX38QOaNkXLE5x1H6RPIMTEN3PAXiUMl75zvWj7aWEwXtf/b9eeeCsN8
	 4yY0SLYviA0EQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: Fixes
Message-Id: <168476769660.849172.17749840801705543203.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: H5JW77Z5X7ZVZYXRRJGHH64BHKGMIZP7
X-Message-ID-Hash: H5JW77Z5X7ZVZYXRRJGHH64BHKGMIZP7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5JW77Z5X7ZVZYXRRJGHH64BHKGMIZP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 22:17:04 +0200, Amadeusz Sławiński wrote:
> Series of fixes for issues found during development and testing,
> primarly for avs driver.
> 
> Amadeusz Sławiński (4):
>   ASoC: Intel: avs: Fix module lookup
>   ASoC: Intel: avs: Access path components under lock
>   ASoC: Intel: avs: Fix avs_path_module::instance_id size
>   ASoC: Intel: avs: Add missing checks on FE startup
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Intel: avs: Fix module lookup
      commit: ff04437f6dcd138b50483afc7b313f016020ce8f
[2/7] ASoC: Intel: avs: Access path components under lock
      commit: d849996f7458042af803b7d15a181922834c5249
[3/7] ASoC: Intel: Skylake: Fix declaration of enum skl_ch_cfg
      commit: 95109657471311601b98e71f03d0244f48dc61bb
[4/7] ASoC: Intel: avs: Fix declaration of enum avs_channel_config
      commit: 1cf036deebcdec46d6348842bd2f8931202fd4cd
[5/7] ASoC: Intel: avs: Account for UID of ACPI device
      commit: 836855100b87b4dd7a82546131779dc255c18b67
[6/7] ASoC: Intel: avs: Fix avs_path_module::instance_id size
      commit: 320f4d868b83a804e3a4bd61a5b7d0f1db66380e
[7/7] ASoC: Intel: avs: Add missing checks on FE startup
      commit: 25148f57a2a6d157779bae494852e172952ba980

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

