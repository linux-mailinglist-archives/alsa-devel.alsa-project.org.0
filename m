Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BC33A6FB0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 21:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D5631691;
	Mon, 14 Jun 2021 21:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D5631691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623700761;
	bh=gOtV2H3G16EwP1AcvCKrNDEsDikEYklsor3HqzolUsQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WF/f6meqOqTbEkMFNr0GqkwOapMbrcnERm6uSw+pbwfYS8wdL8Q4N2qoolt4Ek41B
	 mseAoogqfqdOzI1caZRgbAbEWAGU00gah3JsyDEx5dkEWwy+KV0JyWTTN9POXzBzR7
	 79gPh/t1tblqrTNofzRAIAJ1DrfwYtLFUdxLYJBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4459F80508;
	Mon, 14 Jun 2021 21:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86580F80507; Mon, 14 Jun 2021 21:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB5E3F804FB
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 21:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB5E3F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VrkjePLz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0B6A6128C;
 Mon, 14 Jun 2021 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700506;
 bh=gOtV2H3G16EwP1AcvCKrNDEsDikEYklsor3HqzolUsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VrkjePLzQ+cJwc8EkPKIaStwEFI+/x7mjolZ1lsOrRcSEWERVzfnUzXLPDKH1xppv
 8KTtgNxjN7YrSf/YTvdTS4rilZWBD5V66QMsw9zA++j9jEjbvnaOjBMf8WoA74cYLx
 tI91H17vGDRRyKEM21O7gI3FOQhQ25GJNBj3nutqpQ165wWmfGCcN7NjrQIL4ycM85
 PB/AhQjYH4ZLRv6SxguOzNt2s1E1UFOiazt0wYgNBUFwfQ4jbNLRitRoTeXcTAnpEJ
 Uo1KU+mxaSPhPPjn7iBMeE7Uax+9vCst+/xotHo1lfPYmcxFNlx+bjzyfKMz8rzT5q
 UspZER+O1LmrQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v9 0/9] ASoC: codecs: add wcd938x support
Date: Mon, 14 Jun 2021 20:53:47 +0100
Message-Id: <162369994008.34524.18038515036369844950.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
References: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>
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

On Wed, 9 Jun 2021 10:09:34 +0100, Srinivas Kandagatla wrote:
> This patchset adds support for Qualcomm WCD938X codec.
> 
> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices, RX and
> TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 7 x TX diff inputs, 8 DMICs and MBHC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
      commit: 10ee3e07d32bede6cd007fb76150a1ccd0628852
[2/9] ASoC: codecs: wcd-clsh: add new version support
      commit: 19c5d1f6a0c39cf910c8d211ea40ff758bcb3f49
[3/9] ASoC: codecs: wcd938x: add basic driver
      commit: 8d78602aa87a3805902bed83157526fdc5b837d4
[4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for wcd938x-sdw
      commit: e02c65f3a7ce11ce522e805c78ed2f1da5d96975
[5/9] ASoC: codecs: wcd938x-sdw: add SoundWire driver
      commit: 16572522aece6a142d303a25f32544643f52c383
[6/9] ASoC: codecs: wcd938x: add basic controls
      commit: e8ba1e05bdc016700c85fad559a812c2e795442f
[7/9] ASoC: codecs: wcd938x: add playback dapm widgets
      commit: 8da9db0cd6694c98f64b6ec413337ac834e05bb0
[8/9] ASoC: codecs: wcd938x: add capture dapm widgets
      commit: d5add08fcbce35faeeffa62d7e8f21fd979d8420
[9/9] ASoC: codecs: wcd938x: add audio routing and Kconfig
      commit: 04544222886881cb0865040dcdf747fe7e025947

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
