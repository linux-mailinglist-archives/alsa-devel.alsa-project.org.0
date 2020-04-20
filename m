Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 813791B0E70
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 16:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29912168D;
	Mon, 20 Apr 2020 16:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29912168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587393133;
	bh=bPab1cXXjTKCGuVPa8Wpl3AqXztqKcJ3d16mm/JZp5o=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pEnPleM+74w3VSmfhF1cIJoBHpMB4Emic9nJVgZMikohltKm8xZHwwAQr+CxHn3UR
	 8CkuvsOwPseK+o+wKTDCsWbLqmNzly5wfBtmIhBZXdaFXGb0CsNjWcdRH+Peuwrp9m
	 q+kPbxvWbO4dh3cXLCU/DsOEv9PHSiqWZ28Xg6tA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CCCF802A2;
	Mon, 20 Apr 2020 16:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8BC9F802BE; Mon, 20 Apr 2020 16:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CB99F802A2
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 16:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CB99F802A2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kyEso5E+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65B4120B1F;
 Mon, 20 Apr 2020 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587392870;
 bh=bPab1cXXjTKCGuVPa8Wpl3AqXztqKcJ3d16mm/JZp5o=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kyEso5E+3LJnfxMS4uFChrckuUkcqy5XEwf6azX4hEDUzA0EXVht9utTshsBId9hn
 xdkC3feXceOdrz4N3WDbt3dvFL0GcBSMsofdSX/4/kkPdgek9rDQ84kmgDWDZAyC/v
 j4tOxeX76NyXMALvzpEONuAPOlr24/Jr0jkg3VL8=
Date: Mon, 20 Apr 2020 15:27:47 +0100
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>, tiwai@suse.com, lgirdwood@gmail.com,
 geert@linux-m68k.org, perex@perex.cz
In-Reply-To: <20200420125343.20920-1-yuehaibing@huawei.com>
References: <20200418090853.30340-1-yuehaibing@huawei.com>
 <20200420125343.20920-1-yuehaibing@huawei.com>
Subject: Re: [PATCH] ASoC: wm89xx: Add missing dependency
Message-Id: <158739283776.7647.10304654124585055590.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
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

On Mon, 20 Apr 2020 20:53:43 +0800, YueHaibing wrote:
> sound/soc/codecs/wm8900.o: In function `wm8900_i2c_probe':
> wm8900.c:(.text+0xa36): undefined reference to `__devm_regmap_init_i2c'
> sound/soc/codecs/wm8900.o: In function `wm8900_modinit':
> wm8900.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> sound/soc/codecs/wm8900.o: In function `wm8900_exit':
> wm8900.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
> sound/soc/codecs/wm8988.o: In function `wm8988_i2c_probe':
> wm8988.c:(.text+0x857): undefined reference to `__devm_regmap_init_i2c'
> sound/soc/codecs/wm8988.o: In function `wm8988_modinit':
> wm8988.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> sound/soc/codecs/wm8988.o: In function `wm8988_exit':
> wm8988.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
> sound/soc/codecs/wm8995.o: In function `wm8995_i2c_probe':
> wm8995.c:(.text+0x1c4f): undefined reference to `__devm_regmap_init_i2c'
> sound/soc/codecs/wm8995.o: In function `wm8995_modinit':
> wm8995.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> sound/soc/codecs/wm8995.o: In function `wm8995_exit':
> wm8995.c:(.exit.text+0x8): undefined reference to `i2c_del_driver'
> 
> [...]

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: wm89xx: Add missing dependency
      commit: 9bff3d3024e51122c0c09634056debcd6c7359ec

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
