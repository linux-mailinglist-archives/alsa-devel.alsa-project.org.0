Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084364A4A69
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 16:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 739931689;
	Mon, 31 Jan 2022 16:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 739931689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643642455;
	bh=U81rLjtR8IWf25YlfkzFt9hF10+zIQLW61njAr/UKkQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HmwodXLwH5F6W1I/QMO0pbuJKoCwsu3y5gc9mHJmhDPE1PdN/+Y+6SDA3ZPqDk/Jf
	 b176miNIvOyyMyXooodkbJ1cX+T4Z8lPyBxAlA2kai19P6Nr8dmb59i8MdEP1voXVr
	 ZT+VNG1fcREhVThOyjov4ZQkiF4BoSLaBUlZ5k24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92AEF80302;
	Mon, 31 Jan 2022 16:19:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 631AFF8028B; Mon, 31 Jan 2022 16:19:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3BF9F80095
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 16:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3BF9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LcMKN1a7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7537A61423;
 Mon, 31 Jan 2022 15:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99572C340E8;
 Mon, 31 Jan 2022 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643642380;
 bh=U81rLjtR8IWf25YlfkzFt9hF10+zIQLW61njAr/UKkQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LcMKN1a7e9Uw3CSgeFnrAQbtA21WcvH0Nn8y0UfSFiYYR0GBigo5Y+dlss2oK4IIq
 UU9gg2u0WFpYZibW9LuMHXsVWCet5yd1j7EaP9tC8FKwcq9C/l8kcrnQzsRLaDaIJv
 FgYzxi7MfY72iNyor0lhbgHzB3LCaiPPU7ApzW2JSWF/07OHL/Ixtz8dDfnC4pAjXu
 RVqGrhTeu8LZ8MO/rAMeertOSRMvfZpGAKL4VpkeUesX2W91Iv1mt+bLI0licqIL6D
 hJFwAPFvseu/SsZJgNtHTPaoBpBM8Zxj72y9N9y8QjPg93jACT7WBhdTp5edMdyOVl
 CLZ3S25dkawUg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220129080259.19964-1-rdunlap@infradead.org>
References: <20220129080259.19964-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: max98927: add missing header file
Message-Id: <164364237834.3159101.12950435355735915006.b4-ty@kernel.org>
Date: Mon, 31 Jan 2022 15:19:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 Alejandro Tafalla <atafalla@dnyon.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

On Sat, 29 Jan 2022 00:02:59 -0800, Randy Dunlap wrote:
> Add a header file that provides the missing function prototypes
> and macro to fix these build errors (seen on arch/alpha/):
> 
> ../sound/soc/codecs/max98927.c: In function 'max98927_i2c_probe':
> ../sound/soc/codecs/max98927.c:902:19: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
>   902 |                 = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~
> ../sound/soc/codecs/max98927.c:902:63: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function); did you mean 'GPIOF_INIT_HIGH'?
>   902 |                 = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
>       |                                                               ^~~~~~~~~~~~~~
> ../sound/soc/codecs/max98927.c:909:17: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>   909 |                 gpiod_set_value_cansleep(max98927->reset_gpio, 0);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98927: add missing header file
      commit: bb45f689fa62110c263c86070bfcb9ecbb6e1e23

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
