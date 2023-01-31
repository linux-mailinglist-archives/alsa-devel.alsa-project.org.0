Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA1E682F56
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 15:34:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D5E982E;
	Tue, 31 Jan 2023 15:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D5E982E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675175647;
	bh=2uYCh2/FOYcNFdrQcKG7GGaUjzJYkNSFsVUKdKLj194=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UdrjgP5p6NpNewK3ndYl5x5exvm9yBkARRRzYXm4xkiyDhYqjlT+/5DBGksPc3D10
	 Z2yXyFKMxZNyv5q8i43609mmVGiQ6xVZBxJcZDQdigjo90RklW7U5cDotGcUNaDn1o
	 CQNWd+j7Bwkou+QxK5vBX4aLO7sf9VFh3Mo9QpkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B65F7F8053D;
	Tue, 31 Jan 2023 15:32:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94D5EF80548; Tue, 31 Jan 2023 15:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA81F80524
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 15:32:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA81F80524
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hhw12d43
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5E9A9CE1ED2;
 Tue, 31 Jan 2023 14:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D977C4339C;
 Tue, 31 Jan 2023 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675175557;
 bh=2uYCh2/FOYcNFdrQcKG7GGaUjzJYkNSFsVUKdKLj194=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hhw12d43bmcKC3lLIMV8Cnp2IVPybOeJGG081nDliunlXO0F4LoNzW8KWdlu+SO2V
 ZLMc+mDK/re8jyw1p5cLjbuIza/gKeinnd73nh9cR1WK3GKcG+1n1u7Uld4Lef+DjZ
 JGw8C8QIcNGacaFgtn8bIdzgaIe2Bppig/E8OlYJTmEy4tRPK6bC2QEZyJDvsO1uiG
 c6dXDjpYUCWvxiRpZQ/+5AkgdBoAv0chtw3ouSIv7wPJlvl5Au7Lt7fEBJIZYUVcR+
 LNEXYiRnCe2cnSfbRoP5jct70R0Dnfytk1NOv69fDW6JKA8Ke17wRUFx/ITuV7Fo5R
 h1RYvJoQns0Fw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, 
 pierre-louis.bossart@linux.intel.com, james.schulman@cirrus.com, 
 flatmax@flatmax.com, jonathan.albrieux@gmail.com, povik+lin@cutebit.org, 
 13691752556@139.com, shumingf@realtek.com, ryan.lee.analog@gmail.com, 
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
In-Reply-To: <20230113055301.189541-1-wangweidong.a@awinic.com>
References: <20230113055301.189541-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V10 0/5] ASoC: codecs: Add Awinic AW88395 audio
 amplifier driver
Message-Id: <167517555317.691025.7198905748945109915.b4-ty@kernel.org>
Date: Tue, 31 Jan 2023 14:32:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: yijiangtao@awinic.com, zhaolei@awinic.com, liweilei@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 13 Jan 2023 13:52:56 +0800, wangweidong.a@awinic.com wrote:
> The Awinic AW88395 is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier with an integrated 10.25V
> smart boost convert
> 
> Add a DT schema for describing Awinic AW88395 audio amplifiers. They are
> controlled using I2C
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: Add i2c and codec registration for aw88395 and their associated operation functions
      commit: 62fc25fbab5f416372b2890de313e38bec75b61d
[2/5] ASoC: codecs: ACF bin parsing and check library file for aw88395
      commit: 4345865b003be60fed335efbed5aee61aac86da0
[3/5] ASoC: codecs: Aw88395 function for ALSA Audio Driver
      commit: 06d2fe9cb42354e9910b1305ec984d0de7225f3e
[4/5] ASoC: codecs: Aw88395 chip register file, data type file and Kconfig Makefile
      commit: 14bd857286115bab1e7860ab6e30016b0cae8233
[5/5] ASoC: dt-bindings: Add schema for "awinic,aw88395"
      commit: f88b6c0c070ea9b1fcf9d042d77ce8af62a020cd

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

