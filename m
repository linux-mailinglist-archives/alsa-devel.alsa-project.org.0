Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2165494628C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 19:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1B746A8;
	Fri,  2 Aug 2024 19:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1B746A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722620166;
	bh=YWvezw92xAZWv7n4r3RrTRKa6gnXq4ASQa04Qmrwlcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F0WwH+xus9NzSzhQApFM+mjUZo11EOVaroeLYyu8kaH2M71myskBTK29HFPUE9Pfv
	 b/PH8WPMMUB5GmBRPXEAONUWvou/PNLr9IRZPXq2Mzd4yTfIIpsYcPJOawxxLQQ1mm
	 HoFqNUkEXjZo0bs5b6+eAmSa59IpgazmTj8kQs64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6C63F805B6; Fri,  2 Aug 2024 19:35:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1328BF8057A;
	Fri,  2 Aug 2024 19:35:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C402F8026A; Fri,  2 Aug 2024 19:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7220FF800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 19:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7220FF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OQKJYQpD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDCCC62B0B;
	Fri,  2 Aug 2024 17:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EF2C4AF0A;
	Fri,  2 Aug 2024 17:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722620120;
	bh=YWvezw92xAZWv7n4r3RrTRKa6gnXq4ASQa04Qmrwlcg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OQKJYQpDP9k12LhGXQpYibv78JOlREWlm6aLhP5b+OKbI1QunhDylm7Kg7Yep0SLe
	 P2hWyZXLpmOVu3lByB8KGFcPuzMuvVCW4Go6v6mUz+jcCBpKR16fb3S0RhEOk8g+b9
	 C7VzfuG/KtToI/S9R93WRi3ZyN0Qaycjh4JLSOAQP3I5ytAMJFvnsUIGyHwpzqMN/0
	 UBXsgXXWqCUWENf4aVXrJRLJKQ9DSSaDiH8rNhtz7b7cgdothx0e+2aQAWCGtTSPyN
	 28bV5u0FhJsVS7NLX5ac4dYZpuMLFaj8dH9jRAriXfdc4AFxOc+FNkD+SVdrnPT1FC
	 SnORQRIj/pMWQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 00/12] ALSA/ASoC: use snd_pcm_direction_name()
Message-Id: <172262011922.68355.11972812555968212748.b4-ty@kernel.org>
Date: Fri, 02 Aug 2024 18:35:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: IWDALNG3EZAAVTJUPUFIQHXPZCFRCJZM
X-Message-ID-Hash: IWDALNG3EZAAVTJUPUFIQHXPZCFRCJZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWDALNG3EZAAVTJUPUFIQHXPZCFRCJZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 02:04:43 +0000, Kuninori Morimoto wrote:
> Many drivers are selecting strings "playback" / "capture" by own
> handling, but we have snd_pcm_direction_name() function for it.
> This patch use it.
> 
> One note is that snd_pcm_direction_name() will select
> "Playback" and "Capture", instead of "playback" / "capture".
> Almost all drivers are using it as dev_dbg() or dev_err()
> so no problem. But some other drivers are using it as other
> purpose. It might be issue (?). For example ASoC debugfs dir name
> will be changed by this patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[06/12] ASoC: stm: use snd_pcm_direction_name()
        commit: 7dfdcde20179383d4acfee61692a22955d5a8217
[07/12] ASoC: sof: pcm: use snd_pcm_direction_name()
        commit: cda4aa0069b73e3404ee61864b4814ccc7b7a6ad
[08/12] ASoC: sof: intel: use snd_pcm_direction_name()
        commit: baa779902020d8921cf652944309d1284a63811c
[09/12] ASoC: fsl: lpc3xxx-i2s: use snd_pcm_direction_name()
        commit: 8156921e620827319460e8daa9831d731b0d75fd
[10/12] ASoC: tegra: use snd_pcm_direction_name()
        commit: d6db65bc62fd19915a9926e08b9cbcfbadd64291
[11/12] ASoC: soc-pcm: use snd_pcm_direction_name()
        commit: ebbd6703d4635d36b35f12a1365dfd7894c0ff12
[12/12] ASoC: soc-dapm: use snd_pcm_direction_name()
        commit: bb660132868b5208d6a5f2bd184425cf788f4ef9

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

