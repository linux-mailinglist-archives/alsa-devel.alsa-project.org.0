Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E0F313DD0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9BA1696;
	Mon,  8 Feb 2021 19:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9BA1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809733;
	bh=3ois11Yw0OCVBp7rzynFPyjIFNcUmymvmaWvOWnKiZY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ua+jD5I5vEVzlp71pmBLPk7sFWfp043ld90Tf4qHwy3KJCrmuXBh8cDc7AE1o8z4q
	 YPiG+x4NSc4xQmRj2z1oxbe3XS4WJgUPfq9yHtHfXkieF/nO8qCuIso0/P6OwuVG15
	 cuoiCmyEX/g5Yx/cMtvnecYV/kzihda00Ta36JNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89DC0F802D2;
	Mon,  8 Feb 2021 19:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57733F802CA; Mon,  8 Feb 2021 19:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90201F8028B
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90201F8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uIw5+KV2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E772E64E66;
 Mon,  8 Feb 2021 18:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809562;
 bh=3ois11Yw0OCVBp7rzynFPyjIFNcUmymvmaWvOWnKiZY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uIw5+KV23s40ht3fT+Rmi7g980WoqipjxK3eG+JSwH42d86anriottqXxbX5ZxtIr
 8WejkzvKWQI8hhOCui1F6chkKEw05NJaXfBQl7wX7Hfy1eGbCyZmk4uplWFdaECMsl
 xc6cGtI/sc5ODHXze05FqVVasCRHrOYERM7/+uIHA4/ksN7gtA4khsVtm9O9ASlr94
 SvjJvCxXVX30omSsJjAiu6bR4C4tP5rPDsuOqxsFLoJur/gUrNFSTBbx/CFTeBpm8y
 yuWgOOq/tyRNiIx9Q6wPhIjqdEWHZxeE/rOpjJSLB5OLkJcuyrPx65MT53lPMmMDPp
 r59dktBONu7qA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Sia Jee Heng <jee.heng.sia@intel.com>
In-Reply-To: <20210204014258.10197-1-jee.heng.sia@intel.com>
References: <20210204014258.10197-1-jee.heng.sia@intel.com>
Subject: Re: (subset) [PATCH RFC 0/4] Add HDMI support for Intel KeemBay I2S
Message-Id: <161280948305.10741.11660965557935957578.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On Thu, 4 Feb 2021 09:42:54 +0800, Sia Jee Heng wrote:
> The below patch series are to support Audio over HDMI.
> The modification in this patch series shall allow I2S driver
> to playback standard PCM format and IEC958 encoded format to
> the ADV7511 HDMI chip.
> 
> ALSA IEC958 plugin will be used to compose the IEC958 format.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codec: hdmi-codec: Support IEC958 encoded PCM format
      commit: 28785f548d18e6d52785a1172e5c176784ce74cd
[3/4] dt-bindings: sound: Intel, Keembay-i2s: Add hdmi-i2s compatible string
      commit: d5e16dc5fdad09d7b3133b6aaea7848bfb518e04
[4/4] ASoC: Intel: KMB: Support IEC958 encoded PCM format
      commit: 1c5f6e0714c16e3ad8732e49e07082772dcc6f87

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
