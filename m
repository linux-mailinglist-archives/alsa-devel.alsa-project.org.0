Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DA8BD906
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 03:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8473F826;
	Tue,  7 May 2024 03:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8473F826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715045791;
	bh=wLPyTumNZmOMXhzlJoaqM3kMwqIaGV/vQOf5CKud1p8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rfb4myjdrR4Wdy+L1vpisMDUu6GC3eApgxHYt475RIcwpXAWnOcIvitc57G1Rwi2G
	 hyB2HGWHMpYMBIs0mSqbFU4slEEI14n8fXMoI13XR9PIibld8br3G9ZUkvNKw+G97c
	 xoL2R59nkfnPU/tVW0zke0XWkxPd1bcGicAOvkvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1501F805A1; Tue,  7 May 2024 03:35:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C26F805A1;
	Tue,  7 May 2024 03:35:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED49AF804E7; Tue,  7 May 2024 03:35:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8765DF8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 03:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8765DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iZrlu8Vg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C05D060BAF;
	Tue,  7 May 2024 01:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCB6C116B1;
	Tue,  7 May 2024 01:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715045742;
	bh=wLPyTumNZmOMXhzlJoaqM3kMwqIaGV/vQOf5CKud1p8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iZrlu8VgNM9iPXVswIJ+owT6zT18ujRfBsLd8a7cy7C4gl/xS7Y11R9GxnRgYTikU
	 M2U2vue6tTmb9XN22h3h/B0syv+Ef/Zc/jLzsgDnCKRASqq0AFyWc/L/1hbCZygNWb
	 WuoLogJbMKQFGEfF+Y5wRVQjDW1+ButFwkV8L4WrBgiEUM9YykzinkFf8AkurMnkll
	 3bDQBmuXMtXUnlWU7wZhz61/lkOWpfKgbGRe1L6THHRWkjRF3FlEuE+31MpNQjFx2A
	 vXIVLT3OYDdiJY7yGY6xNDw6NnCih2ojp0D1rShDC2+UKDlgPMcIJdJqWTCWEG/rh0
	 1W+nv64y+O27g==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Intel: HDA/DMIC updates
Message-Id: <171504574162.1980570.10707988335766984091.b4-ty@kernel.org>
Date: Tue, 07 May 2024 10:35:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 3MTJDXLB4H5JUXQZHOOJ7QTZ7ABDIFA3
X-Message-ID-Hash: 3MTJDXLB4H5JUXQZHOOJ7QTZ7ABDIFA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MTJDXLB4H5JUXQZHOOJ7QTZ7ABDIFA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 May 2024 08:32:50 -0500, Pierre-Louis Bossart wrote:
> The first patch handles a problematic configuration where the wrong
> machine driver/topology is used: when the hardware reports an external
> HDaudio codec the direction is to ignore/discard ACPI SoundWire
> devices.
> 
> The last two patch deal with DMIC format configurations and allow
> users to select S16_LE even if the DMIC and internal copiers only
> support 24 or 32-bits. The code changes are located in sound/soc/sof/
> but in the scope of Intel DAIs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: discard SoundWire configuration if HDaudio codec is reported
      commit: 5a7543d0ca01d68d992f480d151efd693807e0ce
[2/3] ASoC: SOF: ipc4-topology: Allow selective update in sof_ipc4_update_hw_params
      commit: b679302526d637700e998da85ed1e06d8f7d3674
[3/3] ASoC: SOF: ipc4-topology: Correct DAI copier config and NHLT blob request
      commit: f9209644ae7688e82f629e737417bc8916db7b57

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

