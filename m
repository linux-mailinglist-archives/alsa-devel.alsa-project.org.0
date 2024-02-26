Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B319867C47
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 17:43:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCFEB85D;
	Mon, 26 Feb 2024 17:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCFEB85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708965785;
	bh=yw07OWyD0LtGybRZCX/Yqm2aQwlLwnlMybFWhWjrytk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A747ARaGzljRFJ2rsCVKkoSlULWbITJ9mBOrT73LdRaFmtUEIVTuoS9eZSEO1EUML
	 Qgxc9CGOPgJPjziRzHRfaSzCE/nYcK4H+qPTpi9mUcTVs/WmQsqCC9PLbqzzghtHzn
	 drmuNh8Cl2OOfbPlpgxsYI+jVcDCyo5Tkfw2OSH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17D4FF8058C; Mon, 26 Feb 2024 17:42:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 749B6F80587;
	Mon, 26 Feb 2024 17:42:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 572DDF80246; Mon, 26 Feb 2024 17:42:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13E25F80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 17:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E25F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n3V2VU9Y
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C122BCE18AA;
	Mon, 26 Feb 2024 16:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41460C43390;
	Mon, 26 Feb 2024 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708965733;
	bh=yw07OWyD0LtGybRZCX/Yqm2aQwlLwnlMybFWhWjrytk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n3V2VU9YIFkybyzgFGadV160pUuRkp2plaLGHlaYeyQHlXcWr70M0e09RRifFEbht
	 lweekPfQpw0KnMwogvAjS4Yd5+Yl9jggk84KE6IP+Q0MNPT1U08Q9GGHqR8mHMEVIj
	 X7J/pKmfgLTXb39+YeEYE0VUSrmZyJQ/GyY+2wCFS/ahlfV39oaKj6Z0j6u5LHisrn
	 JIT99tz4DEFL6st8vHeFZp+aoSCD0QGD9pOb2dSYPNR7f6sosIrwgN1h3Qalt7LR+j
	 yICKTiRPwrZr5PzzsiSRc6UvhNxfjylF1HpoHVEytgpk88nqXpJfO9wahx5J9/Nqe/
	 7cOdv1qoG5kog==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240221150507.1039979-1-rf@opensource.cirrus.com>
References: <20240221150507.1039979-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/9] ALSA: cs35l56: Apply calibration from EFI
Message-Id: <170896573086.55097.17093703884740704115.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 16:42:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: NRIEN3K657FNGB222JKWCSSHV7KG6VTA
X-Message-ID-Hash: NRIEN3K657FNGB222JKWCSSHV7KG6VTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRIEN3K657FNGB222JKWCSSHV7KG6VTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Feb 2024 15:04:58 +0000, Richard Fitzgerald wrote:
> Factory calibration of the speakers stores the calibration information
> into an EFI variable.
> 
> This set of patches adds support for applying speaker calibration
> data from that EFI variable.
> 
> Patch #1 and #2 are bugfixes that are prerequisites.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()
      (no commit info)
[2/9] ALSA: hda: hda_cs_dsp_ctl: Only call notify when a control has been added to a card
      (no commit info)
[3/9] ASoC: wm_adsp: Add wm_adsp_start() and wm_adsp_stop()
      commit: 5519ac3a7164d5d1c31879bf5b0d279b58c8e88f
[4/9] ASoC: cs-amp-lib: Add helpers for factory calibration data
      commit: 1cad8725f2b98965ed3658bc917090b30adb14fa
[5/9] ASoC: cs35l56: Add helper functions for amp calibration
      commit: e1830f66f6c62d288d2c27a7ed18ab93caa0b253
[6/9] ASoC: cs35l56: Apply amp calibration from EFI data
      commit: 1326444e93c250ff99eba048f699313ba6acbf2f
[7/9] ALSA: hda: hda_cs_dsp_ctl: Add helper function to write calibration
      (no commit info)
[8/9] ALSA: hda: cs35l56: Apply amp calibration from EFI data
      commit: cfa43aaa7948be5a701ad4099588cf49d5a02708
[9/9] ASoC: cs-amp-lib: Add KUnit test for calibration helpers
      (no commit info)

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

