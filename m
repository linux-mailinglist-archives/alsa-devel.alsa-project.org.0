Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E263553FC00
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863251949;
	Tue,  7 Jun 2022 12:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863251949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598926;
	bh=VWwzCqMXrN/G0KyRMlKG4MamL4lgLmSXarbHCk4VCkA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=chkgqFt1NwEZqjdSRMnA9c/ob7YrIUD12pZfbou5uCTHlzTgVR/xeKEwFpQdqjShu
	 Hja1ocm8z8iT5zTAU0j9yXa0sZfrTPjSLQJMAWDTivmzUa5AAecjZr2vVtDJVDzZ5p
	 CgWt2FL/tXpoVpivw6Fa8RKHe0/Ic4ZKKWaFNh+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A79F80549;
	Tue,  7 Jun 2022 12:45:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49300F80549; Tue,  7 Jun 2022 12:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C45F80549
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C45F80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bgS3geV/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6254361552;
 Tue,  7 Jun 2022 10:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34022C34119;
 Tue,  7 Jun 2022 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598737;
 bh=VWwzCqMXrN/G0KyRMlKG4MamL4lgLmSXarbHCk4VCkA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bgS3geV/mOzLet2UKYeM0PnA/8Xmll1Djy9ySD6xUZ+i+sR+WpVZIRkahpn4Mdo3a
 cAVRmDT8n0CigHgEDKNvLHkjsKiyPEfpZpcU8fiFLH7hpICXKUuN7nBOjWWLFad4WN
 vFSY+y9Ps3+fRN5sYJDjizcz4ZzDPaZ5WywyI04soPjf3ZGC7vqha5YhOXLRQ7oXwG
 kV1sr8hQhJBN0TmyFAbM40CAl9smif3NBJN95EVkB6vv1l95KimNOB7a0ZRG4J9pYC
 w8DPldUPG9BzMsBMP7GONGRUZqdsZQjPveFamdbhT+BJa5TdPsWIpRu1tQN5Ym7Qgz
 mH9BBfKjcaFxg==
From: Mark Brown <broonie@kernel.org>
To: rdunlap@infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220605163123.23537-1-rdunlap@infradead.org>
References: <20220605163123.23537-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: max98390: use linux/gpio/consumer.h to fix build
Message-Id: <165459873591.301808.2566417791038246308.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: steve.lee.analog@gmail.com, alsa-devel@alsa-project.org, lkp@intel.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On Sun, 5 Jun 2022 09:31:23 -0700, Randy Dunlap wrote:
> Change the header file to fix build errors in max98390.c:
> 
> ../sound/soc/codecs/max98390.c: In function 'max98390_i2c_probe':
> ../sound/soc/codecs/max98390.c:1076:22: error: implicit declaration of function 'devm_gpiod_get_optional'; did you mean 'devm_regulator_get_optional'? [-Werror=implicit-function-declaration]
>  1076 |         reset_gpio = devm_gpiod_get_optional(&i2c->dev,
> ../sound/soc/codecs/max98390.c:1077:55: error: 'GPIOD_OUT_HIGH' undeclared (first use in this function); did you mean 'GPIOF_INIT_HIGH'?
>  1077 |                                              "reset", GPIOD_OUT_HIGH);
> ../sound/soc/codecs/max98390.c:1077:55: note: each undeclared identifier is reported only once for each function it appears in
> ../sound/soc/codecs/max98390.c:1083:17: error: implicit declaration of function 'gpiod_set_value_cansleep'; did you mean 'gpio_set_value_cansleep'? [-Werror=implicit-function-declaration]
>  1083 |                 gpiod_set_value_cansleep(reset_gpio, 0);
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98390: use linux/gpio/consumer.h to fix build
      commit: aa7407f807b250eca7697e5fe9a699bc6c2fab71

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
