Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F78270C27D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542B0206;
	Mon, 22 May 2023 17:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542B0206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684769677;
	bh=D0qMhLuIwrlzy4Pp2//LYxWlkgB6Ghic4PezdLVK8Og=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D/rd29xOfmAJpXQEW1vJwZibVX1AebdJ5M3WacULgtXmFoN5QjgbornxFe72cvRa2
	 ze+gs/8D3u4agt4ilkzsjazIoN2JKTX+lOYDOJEfek6nZVkgwLB3dmCF0vAx/fphHn
	 wDqjv1Ms4jg3utzkoQ9Vq9yBkowEiGYuEAxjL15k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C8BF80551; Mon, 22 May 2023 17:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 557A0F80086;
	Mon, 22 May 2023 17:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6395CF8024E; Mon, 22 May 2023 17:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 410D5F80053
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410D5F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sYMhqVV7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08950618C5;
	Mon, 22 May 2023 15:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C17C433D2;
	Mon, 22 May 2023 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684769599;
	bh=D0qMhLuIwrlzy4Pp2//LYxWlkgB6Ghic4PezdLVK8Og=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sYMhqVV7n7USlPG9KTwCLQBLkd6Yb2Fb8H5F3do20B2w3FDvrFX0c6JK0muWblXL6
	 P/25Jz3QGvJOegivegOfrt0dl4j99Gt/iunspquN0owjPpXuJGv8OqpKiP/gnVIcaB
	 7r7HEQ8Kgp+59vRQeQ06ekV29jyfAlhLo5+z60LvUhUNx8gSqTC+JyKVuDDjBgELIE
	 CqUG8aIc2sWtlFWmP7sfUNfCMVk3N0vAiuLkzloUsSkA5yJQ26L4Nkbh8r3Ra5rkRl
	 MUz3QYOIegYEuwJdP95cY7pMJGlTj3zLnJP9JS9Qqe+HNq9eHbGYO8E7ZUJXT+4Qxa
	 H6WR+o57j6l3Q==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: topology: Clean up error messages handling
Message-Id: <168476959772.1079790.16235712951100548510.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:33:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: NVK254AIPB4KOYYLH4XI5F2YC4RCEQYE
X-Message-ID-Hash: NVK254AIPB4KOYYLH4XI5F2YC4RCEQYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVK254AIPB4KOYYLH4XI5F2YC4RCEQYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 19 May 2023 21:56:06 +0200, Amadeusz Sławiński wrote:
> Series of patches cleaning up error messages when loading topology. In
> few places instead of logging in place of failure message is logged in
> caller. Additionally there are places where both caller and failing
> function log error, leading to unnecessary logs. Clean all of the above
> up.
> 
> Amadeusz Sławiński (5):
>   ASoC: topology: Log control load errors in soc_tplg_control_load()
>   ASoC: topology: Remove redundant logs
>   ASoC: topology: Do not split message string on multiple lines
>   ASoC: topology: Remove redundant log
>   ASoC: topology: Remove redundant log
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: topology: Log control load errors in soc_tplg_control_load()
      commit: ec5dffcd428f54c117158c7b2cd79a1e14aa5b70
[2/5] ASoC: topology: Remove redundant logs
      commit: 2316c11fa97779d06bfd7990f45b13a7b6ec1dae
[3/5] ASoC: topology: Do not split message string on multiple lines
      commit: 5308540278d776e10519db144cb0cf3b3dd7ffbf
[4/5] ASoC: topology: Remove redundant log
      commit: f9d1fe7e81b87378e7bb4a0be9c6fb29bbaa73c0
[5/5] ASoC: topology: Remove redundant log
      commit: f9d1fe7e81b87378e7bb4a0be9c6fb29bbaa73c0

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

