Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7184F7169A8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 18:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D271A3E8;
	Tue, 30 May 2023 18:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D271A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685464427;
	bh=2pvX4QGEsmlyGliLYQpywm7bs43IcnoElyDYvs9X10g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IC5MMCZLRrzALqOYk5/7AZhd8RI2SlKroXzz0YpZaw+S8GxA482bMQCSz0UqI628Q
	 tB1P9elVo1JCLPs8Cn0HkluDPfLc1ru3t8CZKZlYEUmPpuPYeK846u4UhiZLTfmIg/
	 2+/U07rkkERtQKUBgbdapZ5dmY7lJH61ihpbsr5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A8A6F80149; Tue, 30 May 2023 18:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B012F80149;
	Tue, 30 May 2023 18:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3541FF804FC; Tue, 30 May 2023 18:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5B08F800DF
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 18:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5B08F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H2DhVF1D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B40362A1C;
	Tue, 30 May 2023 16:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64D3C433D2;
	Tue, 30 May 2023 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685464357;
	bh=2pvX4QGEsmlyGliLYQpywm7bs43IcnoElyDYvs9X10g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=H2DhVF1Dit4JQZNyvnfenJy804ebmU0fa87f0uSElWZjaXyPsm7XuAUZTzjs1/Pjb
	 vCVm0jYgsuujMXblluel+gSQfN2KS7WIQKQKQBbU3fcsZuqpjyeCuvLEOvKBI1kEy7
	 4oSBkT9voZgv04vDX8Snum9pci14Im4RtHgvuY1SPl4xEeBUINhyVURU9h7++nNNrT
	 zPQ/Vc8vrbWwO0XQm9WuVdgZzdyNZGsfe1vzsf41zKvA7KapNctvWDHo21XWYv333O
	 7NU4vJH/4CdJy2mc6U5N9D8JlbZw3nsOPZnYknWFUxH8LsQJ6zBXXi2YQz9NksGkfJ
	 w5nP1Anb+9viw==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20230525113000.1290758-1-Vijendar.Mukunda@amd.com>
References: <20230525113000.1290758-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: fix for acp_lock access in pdm driver
Message-Id: <168546435447.570240.2693613153905931649.b4-ty@kernel.org>
Date: Tue, 30 May 2023 17:32:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 3DKO6QYAY7S3XWFWHJLTM7BX36JONZUV
X-Message-ID-Hash: 3DKO6QYAY7S3XWFWHJLTM7BX36JONZUV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3DKO6QYAY7S3XWFWHJLTM7BX36JONZUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 May 2023 16:59:55 +0530, Vijendar Mukunda wrote:
> Sending the mutex address(acp_lock) as platform
> data during ACP PDM platform driver register sequence,
> its creating copy of the platform data.
> Referencing this platform data in ACP PDM driver results
> incorrect reference to the common lock usage.
> 
> Instead of directly passing the lock address as platform
> data, retrieve it from parent driver data structure
> and use the same lock reference in ACP PDM driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: fix for acp_lock access in pdm driver
      commit: b6b5c6426efe27cbd954409a50604d99c79bd42b

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

