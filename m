Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9286C5411
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 19:49:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD33EB3;
	Wed, 22 Mar 2023 19:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD33EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679510972;
	bh=vRyCJMnCyAuoopNjeih/gjR5r8abLDcNg5cK2aKkEdY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rKse3NAC1gKEfekMA4Wu4B5MX6GGbyl4bIbUwV+ZQXdTi+Hvu6n7907I1l5ZpvtXU
	 mWYajLA2l1xt+9G2vOhfsxis8QbHdCM53t2I0Hmuhb0qs9Cm76hdKaV6ufIb/RJBgh
	 SjoYNpRUAo93oXdoyMHFcrrCE7xWSP5WJTYRGFyA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A54DFF80527;
	Wed, 22 Mar 2023 19:47:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEB91F80482; Wed, 22 Mar 2023 19:47:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55638F80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 19:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55638F80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SkdUh7TS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 22DEF62274;
	Wed, 22 Mar 2023 18:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED422C433EF;
	Wed, 22 Mar 2023 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679510858;
	bh=vRyCJMnCyAuoopNjeih/gjR5r8abLDcNg5cK2aKkEdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SkdUh7TSuokwkeyO6DMCF3J2HwB7HC577bzat0hmYQdlNkBB2/LpK2zfmWP1ZRr55
	 FPwliJ9T4hxShtPLK9/LAXGCBhNsiNQswytSrmfdubywfU5vvYBwDkUWJPPuEXXB92
	 TFLcRiUOt/mqtcGPmwE4kQ3ML6mVKFy7irD79twMxACY4Shv2DV1KzHiYlgsEu4La+
	 O9zYgJb+ZO4wNcR3RjKXVTxoOJbXa0pFcaiGaiTigPsXbXtBor+hCXAwRSiRZnJZp6
	 7GT4WjXCfgg94cUtNEg6809SQYXC/DvIwr9mOw7xkvtSCpjQi/mdKus9V2r7mWTKhF
	 QINfSHnqg3lVw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
References: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: pcm/Intel: Handle IPC dependent
 sequencing correctly
Message-Id: <167951085623.1092488.1260839501140903476.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 18:47:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: 4TS7ZSZNBRYL4SKCH4ES2E22LELCIIVG
X-Message-ID-Hash: 4TS7ZSZNBRYL4SKCH4ES2E22LELCIIVG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4TS7ZSZNBRYL4SKCH4ES2E22LELCIIVG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 11:43:43 +0200, Peter Ujfalusi wrote:
> IPC3 and IPC4 firmwares handle and execute tasks at different stages, like
> managing DMAs.
> In most cases these are aligned, but we have few exceptions that needs to be
> handled differently.
> 
> This series introduces flags to handle the differing cases to make sure that
> the correct sequencing is used regerless of the IPC version.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: Intel: hda-dai: Do not perform DMA cleanup during stop
      commit: 1bf83fa6654ce8959948878aad14a6db586125b8
[2/3] ASoC: SOF: pcm: Make hw_params reset conditional for IPC3
      commit: 7d6f623c6a9d05195d1b19120383d4f42a1747db
[3/3] ASoC: SOF: pcm: Improve the pcm trigger sequence
      commit: 51ce3e6effab4fd4e13a3f187f4e256259f6e5a4

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

