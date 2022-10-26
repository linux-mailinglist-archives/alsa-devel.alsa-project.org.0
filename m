Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ADC60E845
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:05:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04593968;
	Wed, 26 Oct 2022 21:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04593968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666811156;
	bh=MbMwiX/pGAueXuKo7/7bAImu8Ly5i5IAfaLd6twJoUs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PppFlI9gq0ZaQ8iYpHzTWgKECoS7Db7MNjClVTD6gaZeIhCPu/xQOPxkwlqBn82c1
	 3NMwx2B5n508IaQvDqTXimDH14K4dYLnAtNHp1l/Qtws2YeQinrsEep57mL9sxJANf
	 0X9nUavVFWErN+AA2oJ4MtLMuCrGtBNZNf4gq7C0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4BCBF80557;
	Wed, 26 Oct 2022 21:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20F88F8027C; Wed, 26 Oct 2022 21:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75DDEF80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75DDEF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hY99RpqQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D18CD62032;
 Wed, 26 Oct 2022 19:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF7CC433C1;
 Wed, 26 Oct 2022 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666811068;
 bh=MbMwiX/pGAueXuKo7/7bAImu8Ly5i5IAfaLd6twJoUs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hY99RpqQWwK7Nd9zFFAEio3/SVfRQWqQb6otwCBOCv8cC2pzVwshlIUKAVgWQU2C3
 5SuF1qrtJ6Ts/P050YwpfBdSS9TE8GnPyCtIEFsKaRyTl+4UkZD7VTbESrLYTadkaH
 IZG7dESfdzgzpRhTP9X62wN1QkrDHQ1nlVseCLMlsg/OKrs4yuRAqNZHxGZC9DQb2G
 99WXQtyW+a58mRXTQB7ucdU/D4Zyo6Z/yozu6iCkqV/Qoo05KrSQx5HaB8ZNFXAhvE
 rsrL+HkxpaYrxdeXf1tBzJDIcifqoaJeOdddLHKfFUDgMnayYP1GDTF2P+r1HtV15j
 gDd1N2+HbKO4w==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/16] ASoC: SOF: Intel: HDaudio cleanups
Message-Id: <166681106731.960840.7984323722217742775.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de
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

On Mon, 24 Oct 2022 11:52:54 -0500, Pierre-Louis Bossart wrote:
> This is the part1 of my HDaudio cleanups, before the addition of
> to-be-announced HDaudio extensions.
> 
> The patchset includes more consistent use of read/write/update
> helpers, removal of useless waits, structure members and programming
> sequences, removal of confusing sharing of private_data between FE and
> BE.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: SOF: ops: fallback to mmio in helpers
        commit: 01278cb6fa82083000a9e0b56c8b004caf5b6a73
[02/16] ASoC: SOF: Intel: use mmio fallback for all platforms
        commit: 42b00e9da59f2220bb2a052b72ff1463c8c4ca2c
[03/16] ASoC: SOF: ops: add readb/writeb helpers
        commit: 74fe0c4dcb41678543915cb97928c366ac1aaceb
[04/16] ASoC: SOF: ops: add snd_sof_dsp_updateb() helper
        commit: c28a36b012f1fed177e787d242c592017d284538
[05/16] ASoC: SOF: Intel: hda-dsp: use SOF helpers for consistency
        commit: 33ac4ca758b80421640cb5edb08b531f5be3da20
[06/16] ASoC: SOF: Intel: hda-dai: start removing the use of runtime->private_data in BE
        commit: 0351a9b8f8447935e67b98829c1ad287de426f7e
[07/16] ASoC: SOF: Intel: hda-dai: use component_get_drvdata to find hdac_bus
        commit: 4842f79f8fdd9a5aae3d5db98ab3e3a36a387cfd
[08/16] ASoC: SOF: Intel: hda-dai: remove useless members in hda_pipe_params
        commit: 8d44a4fceeb073ee325b6ad91f7a617b9290f8ce
[09/16] ASoC: SOF: Intel: hda-ctrl: remove useless sleep
        commit: a09d82ce0a86772a6bbfe118414708957ed1a5b1
[10/16] ASoC: SOF: Intel: hda: always do a full reset
        commit: b48b77d836cac43a5bce4f4a1f5e9f8f6e9b1da4
[11/16] ASoC: SOF: Intel: hda: remove useless check on GCTL
        commit: be4156a25dfa34c0cb2ab9e02b8a085ff986e9ec
[12/16] ASoC: SOF: Intel: hda-stream: use SOF helpers for consistency
        commit: d66149dc0fc2b72f5f2d5050d529f5a7f212700d
[13/16] ASoC: SOF: Intel: hda-stream: rename CL_SD_CTL registers as SD_CTL
        commit: 38bf07805955bc16ba436c9d822df43e6b4a8fa6
[14/16] ASoC: SOF: Intel: hda: use SOF helper for consistency
        commit: e1e71c60eed6cb057d8ded6bb543f48c32b1e029
[15/16] ASoC: SOF: Intel: hda-stream: use snd_sof_dsp_updateb() helper
        commit: 847fd278610dda8568e1633b80abd56e08de5690
[16/16] ASoC: SOF: Intel: hda-stream: use readb/writeb for stream registers
        commit: 3d824ceb8a9cd3d9947767d2ae0231f483a5bf8d

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
