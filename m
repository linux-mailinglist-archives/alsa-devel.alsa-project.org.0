Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1784FA61
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 17:59:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD37826;
	Fri,  9 Feb 2024 17:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD37826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707497975;
	bh=AvLOrQ/5l7Q/EehgFGFRv7j1W45bMn/crSWljIS41LA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hMRsOEfdeulCf36SrfG04wP0DunLl9omhoYAt5D26yNdkLoxjHSSpAiczhIF/Uumd
	 vRN5BzkBT3v5CYC8VlEp7XadyHoiDbGlOods8140cwHIRi68zp5LyDRo574k0yxe0i
	 lKBrTBhTfsTQHyg4bcQGmMJ+YLcUOZfLgqVbKl8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42A8CF80580; Fri,  9 Feb 2024 17:59:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F314F8057A;
	Fri,  9 Feb 2024 17:59:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 491FFF804E7; Fri,  9 Feb 2024 17:58:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28DABF800EE
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 17:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28DABF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NvGxiXpb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 685C0CE0224;
	Fri,  9 Feb 2024 16:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB6AC433C7;
	Fri,  9 Feb 2024 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707497922;
	bh=AvLOrQ/5l7Q/EehgFGFRv7j1W45bMn/crSWljIS41LA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NvGxiXpbBO0SuGlfg6DyIAXKdE0FbMi16XvqW0x6EUqEdOpn2YOzYx3JUN+qFS1q0
	 1Bo+kpqkHK5WEj1/7tjBCdcGQTT4o79eepoxB/Bz+hRK2wJQgMNw26SZ1mb5lPai3Q
	 Md/WIZlv9ibQU1sQ05N9wIPayS7B7dQiKpee+rzkusp08x6kvcNKdc8jAnBeFbYKab
	 iZkvAEc87nA9MV3B3DTTjSNTFAdsbedWehzqekwQw3A7/rn7qR3WRxbFOfCXNa3hvh
	 N2adG2QNeahT/eF3B4gq/q8vkV1Rj5Lb1p2HcAPXKCXXs08SJoTgNnQh1taSZgwV7H
	 vdxg+HMMr7gVw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20240209085256.121261-1-amadeuszx.slawinski@linux.intel.com>
References: <20240209085256.121261-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: avs: Expose FW version with sysfs
Message-Id: <170749791992.2378624.10999271693422387943.b4-ty@kernel.org>
Date: Fri, 09 Feb 2024 16:58:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 4VCLIKGFCMD6PIEL7JNW4XCOH4IUDF3B
X-Message-ID-Hash: 4VCLIKGFCMD6PIEL7JNW4XCOH4IUDF3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VCLIKGFCMD6PIEL7JNW4XCOH4IUDF3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 09:52:56 +0100, Amadeusz Sławiński wrote:
> Add functionality to read version of loaded FW from sysfs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Expose FW version with sysfs
      commit: f7fc624be3dbfb78047a1cab795b93c7235fbf1c

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

