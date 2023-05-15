Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97711702B2F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0867B86E;
	Mon, 15 May 2023 13:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0867B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149174;
	bh=Dvh9tI9Xl3uzM2jJ1Xep2xAC6Nc/oaoWIoRatlpPUfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuoevR0l3a80vktAbtbEdr0u6Sa7PGe1qn6kc4hEGjIjE+ANjU2yZPO9uwTv1ytwd
	 tN8MmdjwNS+s+8woW98aLCO2IrXo291PMz8hXeVyy+NfxFR4G4uXRpBw8gDgpIQK4O
	 ONeBaGmxwtetb3Tk+ng+uaxWURs5HBnOyr1FysNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 341A5F805D3; Mon, 15 May 2023 13:10:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE47F805C9;
	Mon, 15 May 2023 13:10:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B68A2F805AE; Mon, 15 May 2023 13:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B7BDF8057B
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7BDF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a8nilyUv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8CD676227B;
	Mon, 15 May 2023 11:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4E8C433EF;
	Mon, 15 May 2023 11:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684148988;
	bh=Dvh9tI9Xl3uzM2jJ1Xep2xAC6Nc/oaoWIoRatlpPUfE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a8nilyUvosgWLYfZFkc00NkLieMjNhu0fdDIXucxn4MZjLLAzSkjY1MBHmVls528O
	 bw6Pce54LlBfFJAtCnN6qzksCr3wFKj/3oZ/ywXCiqaCO7nHsusv/WiVh8JvYafmmD
	 DfU+MMGLUhJKxzSYoXkTKSZxZvTI4RhZDRbY5mIoJihG4/+vs0XRV98R40a+GtxgFu
	 hnpSrES89Jv9zT9M0F8B6M+v0m4jxQ5WFOhUydaz7YqMQPkl0/9nfJBNK8md5Wm2eG
	 9UQf7g95XLVOmRgDpyJepSyBEVy+SWZBGrabXMQ/10uG6HIMTQpYUz1poUyV0sO1Mi
	 EOGwUz7HfoPNg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20230512144237.739000-1-rf@opensource.cirrus.com>
References: <20230512144237.739000-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Prevent unbalanced pm_runtime in
 dsp_work() on SoundWire
Message-Id: <168414898656.394037.4680314609233066357.b4-ty@kernel.org>
Date: Mon, 15 May 2023 20:09:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: NZ4KM3F6QQB53WEC5R3SZC5KSMYOSCAP
X-Message-ID-Hash: NZ4KM3F6QQB53WEC5R3SZC5KSMYOSCAP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZ4KM3F6QQB53WEC5R3SZC5KSMYOSCAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 15:42:37 +0100, Richard Fitzgerald wrote:
> Flush the SoundWire interrupt handler work instead of cancelling it.
> 
> When a SoundWire interrupt is triggered the pm_runtime is held
> until the work has completed. It's therefore unsafe to cancel
> the work, it must be flushed.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Prevent unbalanced pm_runtime in dsp_work() on SoundWire
      commit: 17082e09b94cfe60bf39088f3d37c1f10e6c5928

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

