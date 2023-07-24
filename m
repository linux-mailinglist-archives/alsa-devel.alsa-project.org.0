Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDAE760030
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 22:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E254BDF;
	Mon, 24 Jul 2023 22:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E254BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690228890;
	bh=wumUdGoEsO+wr1meCTzDTGQK/LPizykrI6DIYemvJKQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LIqwd/A/EfmzLygsIECxonQknzEstnaSBIwu4A2kvi/0DtSmwxElBmgNd1LaUEOLI
	 2fQ7z5FEOI5d15dv4uHKwhGqMU3EYNj7ntvQvvTsLF4QEl3K/gK2ZPIB5xt/Ixg1Ts
	 pjq8FodY0B5ZgbdBqSejBoFLnG9Y2jWsu2msoEvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ED56F80310; Mon, 24 Jul 2023 22:00:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE65EF800C7;
	Mon, 24 Jul 2023 22:00:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D8EAF801F5; Mon, 24 Jul 2023 22:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1533EF800C7
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 22:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1533EF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gWgTxiwX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A55E6137C;
	Mon, 24 Jul 2023 20:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63BBC433C8;
	Mon, 24 Jul 2023 20:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690228817;
	bh=wumUdGoEsO+wr1meCTzDTGQK/LPizykrI6DIYemvJKQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gWgTxiwXbitkE+gwiExq+3oBsVPDlLQ2BuuFan2BGgtOOimEBrmD29tzZlaGN+LwF
	 19O57xJ5kSWpD5hCm4NZZiFjsSdLhctUFNdoQMnRUwG2rpIkXdYgTf0jMBIppKCv2k
	 wmYmDtf6RQmT2hZY5HeFYtpT2IjxoX/0ZFvPuh0pY+XDIf94+NAv8PBMII1m635O7x
	 Br/i677M8IYwcz/4TJFC6rWfBLlP75yG61Fyxj8qLwFxMM/uy99puzaHJ0gwMAUaPo
	 839OM8TE2tULk+KBWhJPc1tcKVl+tm5n/qWEMR8/dWdtIlXFCL1THaGL2PMqVti6PV
	 h7jjitzcaFONg==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>,
 DLG Support Opensource <DLG-Support.Opensource@lm.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dmytro Maluka <dmy@semihalf.com>
In-Reply-To: <20230717193737.161784-1-dmy@semihalf.com>
References: <20230717193737.161784-1-dmy@semihalf.com>
Subject: Re: [PATCH 0/2] ASoC: da7219: Patches related to a spurious AAD
 IRQ issue
Message-Id: <169022881524.1309709.2293379191441567680.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 21:00:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: RLK5JFWM73V34VWKZBB7NPP2JXN2DOVN
X-Message-ID-Hash: RLK5JFWM73V34VWKZBB7NPP2JXN2DOVN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLK5JFWM73V34VWKZBB7NPP2JXN2DOVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jul 2023 21:37:35 +0200, Dmytro Maluka wrote:
> This series includes 2 patches related to (but not fixing) the following
> I2C failure which occurs sometimes during system suspend or resume and
> indicates a problem with a spurious DA7219 interrupt:
> 
> [  355.876211] i2c_designware i2c_designware.3: Transfer while suspended
> [  355.876245] WARNING: CPU: 2 PID: 3576 at drivers/i2c/busses/i2c-designware-master.c:570 i2c_dw_xfer+0x411/0x440
> ...
> [  355.876462] Call Trace:
> [  355.876468]  <TASK>
> [  355.876475]  ? update_load_avg+0x1b3/0x615
> [  355.876484]  __i2c_transfer+0x101/0x1d8
> [  355.876494]  i2c_transfer+0x74/0x10d
> [  355.876504]  regmap_i2c_read+0x6a/0x9c
> [  355.876513]  _regmap_raw_read+0x179/0x223
> [  355.876521]  regmap_raw_read+0x1e1/0x28e
> [  355.876527]  regmap_bulk_read+0x17d/0x1ba
> [  355.876532]  ? __wake_up+0xed/0x1bb
> [  355.876542]  da7219_aad_irq_thread+0x54/0x2c9 [snd_soc_da7219 5fb8ebb2179cf2fea29af090f3145d68ed8e2184]
> [  355.876556]  irq_thread+0x13c/0x231
> [  355.876563]  ? irq_forced_thread_fn+0x5f/0x5f
> [  355.876570]  ? irq_thread_fn+0x4d/0x4d
> [  355.876576]  kthread+0x13a/0x152
> [  355.876581]  ? synchronize_irq+0xc3/0xc3
> [  355.876587]  ? kthread_blkcg+0x31/0x31
> [  355.876592]  ret_from_fork+0x1f/0x30
> [  355.876601]  </TASK>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: da7219: Flush pending AAD IRQ when suspending
      commit: 91e292917dad64ab8d1d5ca2ab3069ad9dac6f72
[2/2] ASoC: da7219: Check for failure reading AAD IRQ events
      commit: f0691dc16206f21b13c464434366e2cd632b8ed7

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

