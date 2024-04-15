Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566F8A4706
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 04:34:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A1EFAA;
	Mon, 15 Apr 2024 04:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A1EFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713148479;
	bh=ltADpnck3bDi91NCZf1pP+UOclfMZOpaCHEqGrEgbLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qpLwO9xbHxc/NonW7+XPUrSjgG9QuF78k014j78UPrlXnZkCxxTnJ4vVTY7CRZ1tj
	 jsemgiax5ajuOiD4iYarPgWUR+qTlokFT75cfY9BiCvrXrng6n1vN9rMrdQuneF3aL
	 g3f/Gf3+/0QnrU6L0Xgvs3AInfZj56uFe5yAaEHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6ADBF80124; Mon, 15 Apr 2024 04:33:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA48F8059F;
	Mon, 15 Apr 2024 04:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74315F8013D; Mon, 15 Apr 2024 04:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5544BF80236
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 04:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5544BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=McJU8UO0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3EC960B94;
	Mon, 15 Apr 2024 02:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E28C4AF07;
	Mon, 15 Apr 2024 02:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713147979;
	bh=ltADpnck3bDi91NCZf1pP+UOclfMZOpaCHEqGrEgbLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=McJU8UO0THWgb3FRbJuBmq5tPScRDR2tta6nH6uwCPh/7ISyagAGQ/Ww0cTpyg+Fb
	 JHPlOQ+pyzrZ7Oj3bYUbr4MVUfQtBvAWiMjfUcP7wvaWFD3lom8hpkLrCmYK6uNFF3
	 HsLsEPmw0FEsizeH3iRCZ6Xx3LhT+sY/0cZFTkIoHKDyHlWwp4n/Vu8h9WK4YoqbFR
	 ZSdSt2z44A7yOWZtA7AwZVkyJpKgzR/TmLoMg+nfE8TyPPNohU9Xlvjp1MUVx285yg
	 17m/C9GJcnJZNhtirZufUbqYzX4b77/R5PZPLYYcftSFsqNwRK9xvoJ3MKvSCQlmdH
	 uQjyEDOlfhHkw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part4
Message-Id: <171314797772.1649319.9287188570062396979.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 11:26:17 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: T2U5UJYJSLOCD6SCM7T6UZSF2CAR7TCY
X-Message-ID-Hash: T2U5UJYJSLOCD6SCM7T6UZSF2CAR7TCY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2U5UJYJSLOCD6SCM7T6UZSF2CAR7TCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Apr 2024 17:03:35 -0500, Pierre-Louis Bossart wrote:
> More cleanups from Brent, notably the removal of the redundant
> cml_rt1011_rt5682 machine driver, fixes for SoundWire platforms and
> changes to sof_rt5682 to allow for 96+ sampling rates.
> 
> For the rest of this kernel cycle, we are still working on SoundWire
> updates for MeteorLake (usual missing ACPI signature required for
> topology selection and jack detection information). We'll provide
> those patches as soon as they are reviewed/validated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: Intel: sof_sdw: add missing sof_sdw_rt_amp_init for Realtek multi-function codecs
        commit: 7fda0efaa5fe6e93bb79a3a540a4b881ef788f66
[02/12] ASoC: Intel: soc-acpi: add support for HP Omen14 SoundWire configuration
        commit: 0f8edb15fb6e436f0da7ab25ffcbcaab3def7e8c
[03/12] ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
        commit: 4fee07fbf47d2a5f1065d985459e5ce7bf7969f0
[04/12] ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
        commit: b10cb955c6c0b8dbd9a768166d71cc12680b7fdf
[05/12] ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks
        commit: 744866d28fe6b1a651e63d03a57e06d66e3d460a
[06/12] ASoC: Intel: sof_da7219: mach cleanup for adl boards
        commit: 36a621070b4854670c43138bb8b19bdf8df77bbd
[07/12] ASoC: Intel: sof_da7219: mach cleanup for rpl boards
        commit: c3d1818f5ef5a9a930e468a799ccf1cade91e350
[08/12] ASoC: Intel: sof_da7219: add mtl_da7219_def for mtl boards
        commit: fe18a4be97d4064c9f3113f819780162cc586f16
[09/12] ASoC: Intel: sof_realtek_common: support 4xALC1011 amplifier
        commit: 551fb5593c2bd34e8711efe01dddf22d9c6200b2
[10/12] ASoC: Intel: sof_rt5682: support ALC1011 on cml boards
        commit: 6136d879f3c2240db636d614a1c39f17c6ceaf36
[11/12] ASoC: Intel: cml_rt1011_rt5682: delete driver
        commit: ca571e5a2e45b1a4113af2370fd1cf895f0b46d4
[12/12] ASoC: Intel: sof_rt5682: use RT5682S_PLL1 if needed
        commit: dcc2cd8000d11a046680a7476b0d96b0b956454a

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

