Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F764543179
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 15:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9549B186B;
	Wed,  8 Jun 2022 15:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9549B186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654695387;
	bh=+GnQKbwGMCWw8XgfFRYw+CrVz2HXfRoGElyVWcL3KoI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UnRTzh5DgNij9XOOjMeN0FATf79wAVCI/tZAu5PLdCdaOfgpfUvFpsHUd2tTtxSCv
	 AlSmFxAeVAxkBpTICFxI4vG6ML0IdkkIUrrMWT3MQL8Z6dHO6/DQ3+6ficZV1rnhxG
	 HNxu/5yll0o7b940wA/jgNPX/VURWh6O+fwuVygI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA2AF80245;
	Wed,  8 Jun 2022 15:35:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C125F800C7; Wed,  8 Jun 2022 15:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7456F80118
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 15:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7456F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ezbcb9Q3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A929B827B8;
 Wed,  8 Jun 2022 13:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAA3C341C4;
 Wed,  8 Jun 2022 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654695321;
 bh=+GnQKbwGMCWw8XgfFRYw+CrVz2HXfRoGElyVWcL3KoI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ezbcb9Q3ev68jF8/iZ3Gt2e5ksQXudBMYGd8n+KD8+cENEH593y3FFAQxJoWTIWVQ
 c2++6QwrOJN7y/sFS+KVbUj7LLB6VLur9fmRGvmLh6WivS4UnrJNpDX7I9efWlVk5p
 sFR08+YmLEoLc64QlgwqlVgeCdP+fHs9mLzgJOsTu/uA7aTgWTYFHWNVmeS/+wX0wI
 0dCfcNCzHyUMXSmuGKy/idL/Wzl9V1hm22MaVtlhEQuXr9SIVBMf8PA7Kz1Cs+53iF
 NlORnGexBCPsK7pyuy0rko8MevYRfiDYSCnBScn7m/qzY4SbbjfMKTjbvEsqLMWm7T
 +BWwcJx9XpfFQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
References: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: harden SoundWire codec/machine drivers used on
 Intel platforms
Message-Id: <165469532064.615471.17514799001183886802.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 14:35:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org
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

On Mon, 6 Jun 2022 15:37:45 -0500, Pierre-Louis Bossart wrote:
> While testing fixes for SoundWire race conditions initially reported
> in [1], I found additional issues in codec drivers. When the order in
> which drivers are probed is changed, multiple errors are reported,
> from unbalanced pm_runtime_enable() calls to invalid mutex lock magic
> numbers, workqueues not initialized and missing resume sequences.
> 
> In 'nominal' usages, there is no change of functionality, this is just
> a first step to test random device/driver bind/unbind sequences.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove
      commit: f9e9bdd5bb180325256e3bdfeb9c4c6526133478
[2/7] ASoC: rt711-sdca-sdw: fix calibrate mutex initialization
      commit: 716c2e7e1608a89423ec84398b99ff2fa855d161
[3/7] ASoC: Intel: sof_sdw: handle errors on card registration
      commit: 768ad6d80db2dbbb1bfbb5e616d701a0b560f12a
[4/7] ASoC: rt711: fix calibrate mutex initialization
      commit: 74d40901ebad7c466a95b1ae3c6891f1ba09786f
[5/7] ASoC: rt7*-sdw: harden jack_detect_handler
      commit: 05ba4c00fa9cb077a0dd91f5e6056951a787f63c
[6/7] ASoC: codecs: rt700/rt711/rt711-sdca: initialize workqueues in probe
      commit: a49267a3bd102e3991514e884aac89cc0d0b5f35
[7/7] ASoC: codecs: rt700/rt711/rt711-sdca: resume bus/codec in .set_jack_detect
      commit: e02b99e9b79ff272e8c299a3ee53bdb194ca885e

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
