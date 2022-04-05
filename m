Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F94F2987
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:36:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4A311632;
	Tue,  5 Apr 2022 11:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4A311632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151384;
	bh=GnVFPiOOhRcTD3zLND1UO5HvxhaKLW3t8URl9b6HK+Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gii7hubZKf6rvoHN8//15eYaI1+RMOEcSzsYjlTn6PcSD8/Xsl45RQIQzCMvUbV5n
	 xyVSJMGg5LXHAYulKSZDaMNTUsFG2SkuOo2OI7fDKwwMxXTnKR8+NgU4/QJww3xow0
	 nT8DBtsRUCBbh7INBbVq2vizuAOE/v8V4Cx9uBF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC7EF8012C;
	Tue,  5 Apr 2022 11:31:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43AB9F8057A; Tue,  5 Apr 2022 11:31:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31E58F80570
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E58F80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fyeHDRig"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34917B81C6E;
 Tue,  5 Apr 2022 09:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBF0C385A2;
 Tue,  5 Apr 2022 09:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151100;
 bh=GnVFPiOOhRcTD3zLND1UO5HvxhaKLW3t8URl9b6HK+Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fyeHDRigr5BDJW6HZOeDA6Yf7p0x35jw5jvCadGY2wXDdzIRdVhKfKSQkN5C+54Rw
 gz5idjEFI2weufyVqfM8UeEhVQVwwln7oLCieqPZ6u2KI2dQ3UUqUkxQKc+q3pno4o
 xAQjX0r0NlhrFoJKVTAlmjYIlNBKLbeJUeaLvKp7ah6+C6ERcyUlRQ9K8pqHD0aGOn
 41zSVNMUfk1VioouBDohnXCGOZssWtBZdBP8CVWxGq/ptHiSERYmFeSOQWw7AanlsD
 aJAtHoQB4+k2frBUzwMTXFUan3VrNwri46ExtosWZkg3eXPG/5cCaKdjPbVvNZh9to
 6jdbA6TAtr3RA==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
Subject: Re: [PATCH v1 0/7] ASoC: wm8731: Overhaul of the driver
Message-Id: <164915109977.276574.5874273006136998398.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On Fri, 25 Mar 2022 15:31:14 +0000, Mark Brown wrote:
> This series contains a bunch of fairly minor changes which overhaul and
> modernise the WM8731 driver, there should be no impact on the driver's
> functionality.
> 
> Mark Brown (7):
>   ASoC: wm8731: Update to modern DAI terminology
>   ASoC: wm8731: Factor component init out of bus code
>   ASoC: wm8731: Move regulator request into wm8731_init()
>   ASoC: wm8731: Factor our MCLK and mutex initialisation
>   ASoC: wm8731: Factor out the I2C and SPI bus code into separate
>     modules
>   ASoC: wm8731: Convert DT bindings to YAML format
>   ARM: configs: Update multi_v5_defconfig for WM8731 bus refactoring
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: wm8731: Update to modern DAI terminology
      commit: 00b87e18f3c0a98e2e22a95eb205c2ae03862a23
[2/7] ASoC: wm8731: Factor component init out of bus code
      commit: 3f4fb905510911f6149593a7321ae1825259b242
[3/7] ASoC: wm8731: Move regulator request into wm8731_init()
      commit: 5f1b9d1e424b91a8ae04211cbe4d354463c83583
[4/7] ASoC: wm8731: Factor our MCLK and mutex initialisation
      commit: 8875d104af6c237bfedb47309afd938984a3c05b
[5/7] ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules
      commit: 9dc15f81baf273b5aaaa3302ee8faacd78f361fd
[6/7] ASoC: wm8731: Convert DT bindings to YAML format
      commit: 0e336eeaf467cdd86d827d696e24081b638ef61c
[7/7] ARM: configs: Update multi_v5_defconfig for WM8731 bus refactoring
      commit: 64a1a4e04e4450a89940adc8f339a85e2c01d905

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
