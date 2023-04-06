Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 010F46DA276
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 22:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305DCEE9;
	Thu,  6 Apr 2023 22:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305DCEE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680812212;
	bh=UJMYYibpDilGRdbI0UjiJASBAPpT3lEG1ynZUwg2YQA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFvtv4BHMvwaNpyOt17/Ikx85GTktu/eJU519X4m71vXHjH0hIi1MqMYLLSiolrup
	 t3B6r6Zmm0R7TTvZ49IcCZyhfMhWNo34MwQLmCnHtYCf5TuxW+D2YRuQ7VaYYrbMb0
	 PalQwcnhb0Qn+Grqe7bQAt7moeudriXGeBbU67S8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DD7F80448;
	Thu,  6 Apr 2023 22:15:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73351F80249; Thu,  6 Apr 2023 22:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2343F80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 22:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2343F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dLVa7AqP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A114864357;
	Thu,  6 Apr 2023 20:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB41C433D2;
	Thu,  6 Apr 2023 20:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680812098;
	bh=UJMYYibpDilGRdbI0UjiJASBAPpT3lEG1ynZUwg2YQA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dLVa7AqPUGFefLGDo2T8owxcjLZ1U9k4HTQ+7ium+2EfO7XLdufBTI0KswIgJ1qSQ
	 wH+DhfiDn00U6DmbkVT8TX4F4qLx8rR7zSxYfxdtzIgNE8qbAYqjzRYslP6WiwLGaO
	 +yAhvzmUXTYULpKIu06d6gdiz3Wy1svd1X/tGAAbbWoZvnHDT2q+Szxj3dNeeLdf+P
	 qhkIo9GMtw7gf/N3T55HxZERUSDx/a40+Cg9f8gR2zm0D0WCveqMcPs7RIU9ROqR32
	 sc5o5HJ2yPvf+b3USyRFVtJcagsTjC09Eh2F5Bl2hWu5ixj42TuyjCmXWJUTvkiAZJ
	 4AehQ1fc+9jhg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230406154454.18163-1-pierre-louis.bossart@linux.intel.com>
References: <20230406154454.18163-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: MTL: conditionally wake WPIO1PG
 domain
Message-Id: <168081209585.200376.14213827343551500683.b4-ty@kernel.org>
Date: Thu, 06 Apr 2023 21:14:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: HRPV4YTSQIS57U7Y6OL2DJ3OJTN4EVJH
X-Message-ID-Hash: HRPV4YTSQIS57U7Y6OL2DJ3OJTN4EVJH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, Yong Zhi <yong.zhi@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRPV4YTSQIS57U7Y6OL2DJ3OJTN4EVJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 10:44:54 -0500, Pierre-Louis Bossart wrote:
> Wake IO1 from power gating if there is SoundWire enabled link discovered
> by ACPI scan.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: MTL: conditionally wake WPIO1PG domain
      commit: f747eb86e4a82d0823328f642a667bffce703028

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

