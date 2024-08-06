Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FCA9497C1
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 20:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103FB2BE2;
	Tue,  6 Aug 2024 20:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103FB2BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722970465;
	bh=GwyW3Er/ZhM1U9JNMXLYlDUeNmLpjI408pDROmOiuKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YkcArw1bcRqjH4QDPqc1c9+XIwBCTRAgsVcyNUo8HW5oRZEa4U3I/irubpPnrgBsv
	 8eXVRchYUWJHvQc8gL0NqLAYsNH11FMAl5/+ftorGGfckdeSkLVpozoJouEzRjgaDT
	 vOzMK19hN8KjtnQXhLpMWALEIaiOybKBs5snFVRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0623BF805D5; Tue,  6 Aug 2024 20:53:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89705F805D7;
	Tue,  6 Aug 2024 20:53:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 776BFF80448; Tue,  6 Aug 2024 20:44:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 847D0F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 20:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 847D0F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xx3k9QQ3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B231CE09AF;
	Tue,  6 Aug 2024 18:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD573C32786;
	Tue,  6 Aug 2024 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722969869;
	bh=GwyW3Er/ZhM1U9JNMXLYlDUeNmLpjI408pDROmOiuKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xx3k9QQ3niwQzXEYL3YjZSlWjEOwarZUxKWcqCIjXtUK1O+VUTU6OOMEOLmtP1Ica
	 UpQZmP8U+D8ptRKrWzFbneKEpDV++oCTCNoC1ZJ5WJ28PzCRm/1CQqi+XtFL3VZLCk
	 lPd8tDRo1JZ/D49swpOK+z2pI8vjZwKaVSiwns2n7bBLFea1SKhTaUWwHpElQo1ywI
	 kZysReRi116C7IK9vDGvla4q4KmZPoR2XdeBm1s7s96MMJ6ZI6IPWdCSIJ6r2y2gJ1
	 3EANIiSLcChsBeXSlnr/rm/GHY9JTq+6GxjIrGgZXZG4d36hwF3iMDTzRE8UBKNZGY
	 HEK0XTlmKLowQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <8734nrll6x.wl-kuninori.morimoto.gx@renesas.com>
References: <8734nrll6x.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: remove bespoke trigger support
Message-Id: <172296986843.432413.17945462453331217568.b4-ty@kernel.org>
Date: Tue, 06 Aug 2024 19:44:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: B3SNHKO5AG42SZQAIW3CMNRYTV4CTA63
X-Message-ID-Hash: B3SNHKO5AG42SZQAIW3CMNRYTV4CTA63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3SNHKO5AG42SZQAIW3CMNRYTV4CTA63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 01:31:34 +0000, Kuninori Morimoto wrote:
> Bespoke trigger support was added when Linux v3.5 by this patch.
> 
> 	commit 07bf84aaf736781a283b1bd36eaa911453b14574
> 	("ASoC: dpcm: Add bespoke trigger()")
> 
> test-component driver is using it, but this is because it indicates used
> function for debug/trace purpose. Except test-component driver, bespoke
> trigger has never been used over 10 years in upstream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: remove bespoke trigger support
      commit: 7d2fb3812acde0a76e0d361877e8295db065f9f4

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

