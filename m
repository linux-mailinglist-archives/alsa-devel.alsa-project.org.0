Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AA351350
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3B416A0;
	Thu,  1 Apr 2021 12:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3B416A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272500;
	bh=S+Tn7YNmjASauhVBdQ1246mt1jLCt7fRaSlFTe22c4s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILLmG/dX9sxcJh5ncX7Nc42wRzAGPIhlx2Ev/MIZCYBn8/RGwJFy3Ag8+VGfRbEsI
	 Q/VceP6Hj39Rin/frdacAZu2DHCB3fF3DXO3b9cYceCbJcjodF3kVL0nIamqWtnZOY
	 HWqQZHUSpYkhvYP1VxnwEK4SMqaTUMPnpCa+8wpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C647BF804E1;
	Thu,  1 Apr 2021 12:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C29EF804B1; Thu,  1 Apr 2021 12:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D1D6F80482
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D1D6F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AatGBe4t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C855610A5;
 Thu,  1 Apr 2021 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272240;
 bh=S+Tn7YNmjASauhVBdQ1246mt1jLCt7fRaSlFTe22c4s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AatGBe4tS15dPxNCmeS2JEP+92IQYxix/mtkxcqzonfvoJMmgk81tH+F+XcOmXWTq
 eVIuK7ERkmilvZq/T/l0FKcDdAj3j/VAFrTAmtsRQvUEkgPoEHyeui90i6qybNFPkx
 hnb6u+tqqHk57kFnjRCkD6lrpFDfm+wxJ6sb8I2A3LW6FAVYMs+WzOHqAODvV/Jb00
 OdXVpbuYZh8754L/aiQHUtpxxfFsIHrQihqp85Wy6Eed/FCAhwhMxfP3Rs48EGKf6E
 y7KJ62jOoBlYsfTx4c4XglrqKp5O61o6k8EbZ97bcd1+ecrNgNADvmdIfsfainFlUj
 qvtZTARIXZOwg==
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, bage@linutronix.de,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] ASoC: sunxi: sun4i-codec: fill ASoC card owner
Date: Thu,  1 Apr 2021 11:16:25 +0100
Message-Id: <161726938994.2219.266176095597087685.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210331145915.12545-1-bage@linutronix.de>
References: <20210331145915.12545-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 31 Mar 2021 16:59:15 +0200, bage@linutronix.de wrote:
> card->owner is a required property and since commit 81033c6b584b ("ALSA:
> core: Warn on empty module") a warning is issued if it is empty. Add it.
> This fixes following warning observed on Lamobo R1:
> 
> WARNING: CPU: 1 PID: 190 at sound/core/init.c:207 snd_card_new+0x430/0x480 [snd]
> Modules linked in: sun4i_codec(E+) sun4i_backend(E+) snd_soc_core(E) ...
> CPU: 1 PID: 190 Comm: systemd-udevd Tainted: G         C  E     5.10.0-1-armmp #1 Debian 5.10.4-1
> Hardware name: Allwinner sun7i (A20) Family
> [<c0ce8544>] (dump_backtrace) from [<c0ce88f0>] (show_stack+0x20/0x24)
> [<c0ce88d0>] (show_stack) from [<c0ceda20>] (dump_stack+0xc8/0xdc)
> [<c0ced958>] (dump_stack) from [<c034d49c>] (__warn+0xfc/0x158)
> [<c034d3a0>] (__warn) from [<c0ce966c>] (warn_slowpath_fmt+0x70/0xe4)
> [<c0ce9600>] (warn_slowpath_fmt) from [<bf48f604>] (snd_card_new+0x430/0x480 [snd])
> [<bf48f1d4>] (snd_card_new [snd]) from [<bf53340c>] (snd_soc_bind_card+0x3a8/0xa30 [snd_soc_core])
> [<bf533064>] (snd_soc_bind_card [snd_soc_core]) from [<bf533b8c>] (snd_soc_register_card+0xf8/0x108 [snd_soc_core])
> [<bf533a94>] (snd_soc_register_card [snd_soc_core]) from [<bf55b888>] (sun4i_codec_probe+0x224/0x45c [sun4i_codec])
> [<bf55b664>] (sun4i_codec_probe [sun4i_codec]) from [<c09879b4>] (platform_drv_probe+0x58/0xa8)
> [<c098795c>] (platform_drv_probe) from [<c0984dc8>] (really_probe+0x108/0x510)
> [<c0984cc0>] (really_probe) from [<c0985674>] (driver_probe_device+0x100/0x1d0)
> [<c0985574>] (driver_probe_device) from [<c0985a74>] (device_driver_attach+0xb8/0xc0)
> [<c09859bc>] (device_driver_attach) from [<c0985b18>] (__driver_attach+0x9c/0x150)
> [<c0985a7c>] (__driver_attach) from [<c09825c8>] (bus_for_each_dev+0x84/0xd0)
> [<c0982544>] (bus_for_each_dev) from [<c09844bc>] (driver_attach+0x2c/0x30)
> [<c0984490>] (driver_attach) from [<c0983e70>] (bus_add_driver+0x120/0x20c)
> [<c0983d50>] (bus_add_driver) from [<c098670c>] (driver_register+0x98/0x128)
> [<c0986674>] (driver_register) from [<c0987908>] (__platform_driver_register+0x50/0x58)
> [<c09878b8>] (__platform_driver_register) from [<bf566024>] (sun4i_codec_driver_init+0x24/0x1000 [sun4i_codec])
> [<bf566000>] (sun4i_codec_driver_init [sun4i_codec]) from [<c030293c>] (do_one_initcall+0x50/0x274)
> [<c03028ec>] (do_one_initcall) from [<c040d45c>] (do_init_module+0x70/0x294)
> [<c040d3ec>] (do_init_module) from [<c040f9f4>] (load_module+0x2258/0x263c)
> [<c040d79c>] (load_module) from [<c04100c0>] (sys_finit_module+0xc8/0x12c)
> [<c040fff8>] (sys_finit_module) from [<c03002a4>] (__sys_trace_return+0x0/0x1c)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: sun4i-codec: fill ASoC card owner
      commit: 7c0d6e482062eb5c06ecccfab340abc523bdca00

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
