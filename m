Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF45FDB3C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 15:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981EF5B55;
	Thu, 13 Oct 2022 15:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981EF5B55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665668566;
	bh=5RucPzasjZAZP0l3hS+Jt8c2WIjoMrxKXDryqmzXx3c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+60hbFs1At3+EeGZPd87YNhqAIvlBHd8p/PZpMOaUpXB7NQSBl4V9RrM9DrAQUHe
	 rs3aLfqZdiSrgxQOZnWFsijkzUbN54knRXF5BskQZ2/b0ggJYFQupSZHPqhD+FvsT7
	 MiPB5iNQ1fcISSl+k5wbXk45uXBU7R/8GzFB61vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE9FF804AC;
	Thu, 13 Oct 2022 15:41:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D4E8F80431; Thu, 13 Oct 2022 15:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BE2F800A7
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 15:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BE2F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ioMqYGsM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D244617AC;
 Thu, 13 Oct 2022 13:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5739C433C1;
 Thu, 13 Oct 2022 13:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665668503;
 bh=5RucPzasjZAZP0l3hS+Jt8c2WIjoMrxKXDryqmzXx3c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ioMqYGsMebFmkTKp3SgC+rTybO58zD6GQD+jrSCOCoC4zYMZADhKzyN43eCWrv7to
 gaTYpDCm1KIKqqao/un9wCgI7AvHLLK57VH+xBVF//iwKpG2Z7xz2zE7vQlunAADab
 psfewraMVlW1271JEkLpWf+dOofyiALWlt6vd6VtFTBy16E+AqvV9B5tqs3sg7VAnI
 Ur63JSJ1fbBM5K2sL6w8vFFlMPoVmx7zUjZfa+1e3F8pAytazNLLKFb9+AVIyabCZB
 BiZwndbQuaUt0cfTA2LOpNYLKU7FyWeT7SmMDI4q74bToJdWdKF9STlRsSZNrIVXM2
 Qnl8snXE+ibmw==
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20221006235822.30074-1-rdunlap@infradead.org>
References: <20221006235822.30074-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] ASoC: codec: tlv320adc3xxx: add GPIOLIB dependency
Message-Id: <166566850165.143340.13619454921265513543.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 14:41:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Ricard Wanderlof <ricardw@axis.com>
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

On Thu, 6 Oct 2022 16:58:22 -0700, Randy Dunlap wrote:
> Fix build errors when CONFIG_GPIOLIB is not enabled:
> 
> ../sound/soc/codecs/tlv320adc3xxx.c: In function 'adc3xxx_i2c_probe':
> ../sound/soc/codecs/tlv320adc3xxx.c:1352:28: error: implicit declaration of function 'devm_gpiod_get'; did you mean 'devm_gpio_free'? [-Werror=implicit-function-declaration]
>  1352 |         adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> ../sound/soc/codecs/tlv320adc3xxx.c:1352:57: error: 'GPIOD_OUT_LOW' undeclared (first use in this function); did you mean 'GPIOF_INIT_LOW'?
>  1352 |         adc3xxx->rst_pin = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   CC      lib/dynamic_debug.o
> ../sound/soc/codecs/tlv320adc3xxx.c:1400:9: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>  1400 |         gpiod_set_value_cansleep(adc3xxx->rst_pin, 1);
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: tlv320adc3xxx: add GPIOLIB dependency
      commit: 551f2994b8ccdbe296e239278531e345d6e94d4d

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
