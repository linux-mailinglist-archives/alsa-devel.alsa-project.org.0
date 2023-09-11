Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508879A979
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 17:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4FCBDF2;
	Mon, 11 Sep 2023 17:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4FCBDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694445028;
	bh=dGQGzd+Ul+UdwvqxqfILW6piLPh9F5r6zMtsnARsiEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j8Gi5FywrVThsvji84qYYj+rdKjlX+5EfLik4SJSLAJyxM2g4hquY41LLKtD9kDOq
	 /6ifje5+w+rgo1y5lwburLpS82XSn/ChL78dNm74Z6zNR6FELgjSF0AB0zhUkOoTY/
	 EB8BuicpgrZtz5ZsB2QlUhZYdX3F6ogVALKDTcHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C69F805B6; Mon, 11 Sep 2023 17:08:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A28B0F805AE;
	Mon, 11 Sep 2023 17:08:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 309CFF805AF; Mon, 11 Sep 2023 17:08:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B11B7F805AC
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 17:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11B7F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fn9e1VkT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAD5461207;
	Mon, 11 Sep 2023 15:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75DAC433C9;
	Mon, 11 Sep 2023 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444888;
	bh=dGQGzd+Ul+UdwvqxqfILW6piLPh9F5r6zMtsnARsiEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fn9e1VkTT01GUXkeP/sAS9Eo93ZakS6K6yhpX+VgWSYMCPvKfBhyCqduRKs47e2OQ
	 vx+DKFuqym2tGTA9jljIbHn7Jp27XicOpdBmMIc++Ut672YUtWh99Tao8eoc1b+5uF
	 oYy4K0JxBB0YtpVTTivn5KtHS49XUM40d/31Izq0FAKFQ8lE9NFueXzzaH3+IkgyW7
	 v+Knz7x4g5y+ejV/n6YibOCXiarLXmMB+RHljBs6Ws+S0KFwAD1Ggt5fwXboBYKzZw
	 V1WfYA2SV8slfW1F0QaFCySp5gpmji71+4/f7rHPWHBVNKKZBhRytFuQUtvI7sXkc1
	 koBSCH+WNSXDg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20230909120237.2646275-1-linux@roeck-us.net>
References: <20230909120237.2646275-1-linux@roeck-us.net>
Subject: Re: [PATCH] ASoC: wm8960: Fix error handling in probe
Message-Id: <169444487119.1851820.9800176360912652515.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:07:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: THSFCPAO2GX2GPSUDSK2UN7VSHDKIKBC
X-Message-ID-Hash: THSFCPAO2GX2GPSUDSK2UN7VSHDKIKBC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THSFCPAO2GX2GPSUDSK2UN7VSHDKIKBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 09 Sep 2023 05:02:37 -0700, Guenter Roeck wrote:
> Commit 422f10adc3eb ("ASoC: wm8960: Add support for the power supplies")
> added regulator support to the wm8960 driver, but neglected to update
> error handling in the probe function. This results in warning backtraces
> if the probe function fails.
> 
> WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2396 _regulator_put.part.0+0x1b4/0x1d8
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.5.0-11075-g92901222f83d #1
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x68/0x90
>  dump_stack_lvl from __warn+0x70/0x1a4
>  __warn from warn_slowpath_fmt+0xac/0x220
>  warn_slowpath_fmt from _regulator_put.part.0+0x1b4/0x1d8
>  _regulator_put.part.0 from regulator_bulk_free+0x44/0x64
>  regulator_bulk_free from release_nodes+0x50/0x7c
>  release_nodes from devres_release_group+0xbc/0x138
>  devres_release_group from i2c_device_probe+0x180/0x268
>  i2c_device_probe from really_probe+0xc4/0x2e0
>  really_probe from __driver_probe_device+0x84/0x1a0
>  __driver_probe_device from driver_probe_device+0x2c/0xc4
>  driver_probe_device from __driver_attach+0x94/0x144
>  __driver_attach from bus_for_each_dev+0x70/0xc4
>  bus_for_each_dev from bus_add_driver+0xc4/0x1cc
>  bus_add_driver from driver_register+0x7c/0x114
>  driver_register from i2c_register_driver+0x3c/0xac
>  i2c_register_driver from do_one_initcall+0x68/0x3b0
>  do_one_initcall from kernel_init_freeable+0x18c/0x240
>  kernel_init_freeable from kernel_init+0x14/0x144
>  kernel_init from ret_from_fork+0x14/0x24
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8960: Fix error handling in probe
      commit: d7e47e32192bb88f5b2dc8e655fa587ecf9d71e0

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

