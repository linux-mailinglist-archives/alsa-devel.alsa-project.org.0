Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E24D70F4CB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 13:06:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48F56C0;
	Wed, 24 May 2023 13:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48F56C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684926392;
	bh=y4WSNpY8SSlTpEkkRsMR3TAjOQ7RO5pCexsKa6zngko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XDFmV+r3DLsVAhL39p9rHlD3JExAHB21wIwfo/dQOrb8gGPEN4AkWqIT6B7PsgDqV
	 b/N/ru4TC5o0N/S2p/axpG8koyU5dV95fgiULfg0hxWeGT6ai7J0dWTBD2xAv2rSdQ
	 ApChAn65TnPXL5RJskITTJuiI9G+eXWhpOxC+5DU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D908F8055B; Wed, 24 May 2023 13:04:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1444F80551;
	Wed, 24 May 2023 13:04:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F7ECF8016A; Wed, 24 May 2023 13:04:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21FA1F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 13:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FA1F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L/pMlrXc
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 946C363BAF;
	Wed, 24 May 2023 11:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BA9C433A0;
	Wed, 24 May 2023 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684926274;
	bh=y4WSNpY8SSlTpEkkRsMR3TAjOQ7RO5pCexsKa6zngko=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L/pMlrXcgXt6WJjXMv4dfRYRfzLEBarU/2p8aA+heUgPV+acQkfqSzi+gk38g7uUl
	 bBZhvJDCIqazncp3Q997xhWffiPHkas9lwRdnTwCoY7pKwuKjNkN+yFmDZwtknsiLV
	 dGXCcl1LVgMkTLOUP0Hvu8hB8rlNuOUvjOKFA/rWkmVbBw2YcXUtCmQdsvBDczTOBj
	 QTSRj6upQLkfPWmcoo2oOkjogx5ggtBpxxUNlTmI8foKlwtyzDYV0nY2Rua7EdW0bI
	 QUJ0eBbASpaIoZR/LOMfoKMYleR0zst0L18QI4XqLRpabkh3xP8apUWJ0o08Aw7wD/
	 k++pHEcNZkgbQ==
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230512110343.66664-1-fido_max@inbox.ru>
References: <20230512110343.66664-1-fido_max@inbox.ru>
Subject: Re: [PATCH 1/1] ASoC: dwc: move DMA init to snd_soc_dai_driver
 probe()
Message-Id: <168492627199.37175.12727003456067615127.b4-ty@kernel.org>
Date: Wed, 24 May 2023 12:04:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 5CROFKVPNL6A4EWQQLXP4PERUIVCP4RV
X-Message-ID-Hash: 5CROFKVPNL6A4EWQQLXP4PERUIVCP4RV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CROFKVPNL6A4EWQQLXP4PERUIVCP4RV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 14:03:42 +0300, Maxim Kochetkov wrote:
> When using DMA mode we are facing with Oops:
> [  396.458157] Unable to handle kernel access to user memory without uaccess routines at virtual address 000000000000000c
> [  396.469374] Oops [#1]
> [  396.471839] Modules linked in:
> [  396.475144] CPU: 0 PID: 114 Comm: arecord Not tainted 6.0.0-00164-g9a8eccdaf2be-dirty #68
> [  396.483619] Hardware name: YMP ELCT FPGA (DT)
> [  396.488156] epc : dmaengine_pcm_open+0x1d2/0x342
> [  396.493227]  ra : dmaengine_pcm_open+0x1d2/0x342
> [  396.498140] epc : ffffffff807fe346 ra : ffffffff807fe346 sp : ffffffc804e138f0
> [  396.505602]  gp : ffffffff817bf730 tp : ffffffd8042c8ac0 t0 : 6500000000000000
> [  396.513045]  t1 : 0000000000000064 t2 : 656e69676e65616d s0 : ffffffc804e13990
> [  396.520477]  s1 : ffffffd801b86a18 a0 : 0000000000000026 a1 : ffffffff816920f8
> [  396.527897]  a2 : 0000000000000010 a3 : fffffffffffffffe a4 : 0000000000000000
> [  396.535319]  a5 : 0000000000000000 a6 : ffffffd801b87040 a7 : 0000000000000038
> [  396.542740]  s2 : ffffffd801b94a00 s3 : 0000000000000000 s4 : ffffffd80427f5e8
> [  396.550153]  s5 : ffffffd80427f5e8 s6 : ffffffd801b44410 s7 : fffffffffffffff5
> [  396.557569]  s8 : 0000000000000800 s9 : 0000000000000001 s10: ffffffff8066d254
> [  396.564978]  s11: ffffffd8059cf768 t3 : ffffffff817d5577 t4 : ffffffff817d5577
> [  396.572391]  t5 : ffffffff817d5578 t6 : ffffffc804e136e8
> [  396.577876] status: 0000000200000120 badaddr: 000000000000000c cause: 000000000000000d
> [  396.586007] [<ffffffff806839f4>] snd_soc_component_open+0x1a/0x68
> [  396.592439] [<ffffffff807fdd62>] __soc_pcm_open+0xf0/0x502
> [  396.598217] [<ffffffff80685d86>] soc_pcm_open+0x2e/0x4e
> [  396.603741] [<ffffffff8066cea4>] snd_pcm_open_substream+0x442/0x68e
> [  396.610313] [<ffffffff8066d1ea>] snd_pcm_open+0xfa/0x212
> [  396.615868] [<ffffffff8066d39c>] snd_pcm_capture_open+0x3a/0x60
> [  396.622048] [<ffffffff8065b35a>] snd_open+0xa8/0x17a
> [  396.627421] [<ffffffff801ae036>] chrdev_open+0xa0/0x218
> [  396.632893] [<ffffffff801a5a28>] do_dentry_open+0x17c/0x2a6
> [  396.638713] [<ffffffff801a6d9a>] vfs_open+0x1e/0x26
> [  396.643850] [<ffffffff801b8544>] path_openat+0x96e/0xc96
> [  396.649518] [<ffffffff801b9390>] do_filp_open+0x7c/0xf6
> [  396.655034] [<ffffffff801a6ff2>] do_sys_openat2+0x8a/0x11e
> [  396.660765] [<ffffffff801a735a>] sys_openat+0x50/0x7c
> [  396.666068] [<ffffffff80003aca>] ret_from_syscall+0x0/0x2
> [  396.674964] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc: move DMA init to snd_soc_dai_driver probe()
      commit: 011a8719d6105dcb48077ea7a6a88ac019d4aa50

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

