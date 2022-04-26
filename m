Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B055104EF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B68718A5;
	Tue, 26 Apr 2022 19:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B68718A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650992991;
	bh=t+NgkpJB3vxQf6yAgzdBpY45jLxBhqyRF9ybIDrNW+U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JflqPzI9W/wVjg6shMm+Ll24hL1Zfkz7TuhOns5NTBuf5m6y5tuLxOEfJ6zEpSEch
	 Xh9OxJtXL0CyoD8Ih9H4aPsdJPJzdD/bHDd02CYxCWqLUsrLuSTbpB8cuKwPae0pf2
	 Ka66oqg0Kk9RfoeVMHc+R1UVjoFpnOn3y+yvmxrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DD0F8050F;
	Tue, 26 Apr 2022 19:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65781F80527; Tue, 26 Apr 2022 19:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3377F8050F
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3377F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dprNeE3G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DCB43B8210A;
 Tue, 26 Apr 2022 17:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864EAC385A4;
 Tue, 26 Apr 2022 17:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650992881;
 bh=t+NgkpJB3vxQf6yAgzdBpY45jLxBhqyRF9ybIDrNW+U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dprNeE3Gcz7UyJ56wAKgas6P4y19joJeUg1d4xyaKsYa4+7R4Cm6bsqgiITv+X8fK
 WYpgoGnQkJlMTCYuGURqgUtcZ1LVypg8UmBkfyHoKvuAvuA7b6V7VEhvChuD6QadKb
 aIukV+kkagv+uwXN7yJdF7DTErhc38CIGndmrWvPeDSYiCFzGdK18PsQ9bMHKXhrpr
 WCabTaXTdSCQin1TNYWqb2xN2LMrY5+OdQYLX1qNSqEknibbBKYPtR4hjYBsTdUkGI
 4XM6CABR1M0vW6SWHPR5tEZVeaveZ6Y9XcdO5MclzLEcmvB+4x5U/lIIsvi/GH5G8/
 Ujt94HRPiAlaQ==
From: Mark Brown <broonie@kernel.org>
To: stephan@gerhold.net, devicetree@vger.kernel.org, perex@perex.cz,
 tiwai@suse.com, lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 lukas.bulwahn@gmail.com, pbrobinson@gmail.com, krzk+dt@kernel.org,
 cy_huang@richtek.com, ryan.lee.analog@gmail.com,
 pierre-louis.bossart@linux.intel.com, srinivas.kandagatla@linaro.org,
 hdegoede@redhat.com, drhodes@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 ryans.lee@analog.com, Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20220423021558.1773598-1-ryan.lee.analog@gmail.com>
References: <20220423021558.1773598-1-ryan.lee.analog@gmail.com>
Subject: Re: [PATCH V3 2/2] ASoC: max98396: add amplifier driver
Message-Id: <165099287726.2323572.10174502705514813349.b4-ty@kernel.org>
Date: Tue, 26 Apr 2022 18:07:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lkp@intel.com
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

On Fri, 22 Apr 2022 19:15:58 -0700, Ryan Lee wrote:
> This series of patches adds support for Analog Devices MAX98396
> mono amplifier with IV sense. The device provides a PCM interface
> for audio data and a standard I2C interface for control data
> communication. This driver also supports MAX98397 which is
> a variant of MAX98396 with wide input supply range.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: max98396: add amplifier driver
      commit: b58581136770569d2ee4300b10c7c0d76bb86250

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
