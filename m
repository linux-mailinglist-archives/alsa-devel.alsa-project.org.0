Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2B55526E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 19:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5423E1E72;
	Wed, 22 Jun 2022 19:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5423E1E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655919112;
	bh=WpJxGSkPnoTmSLwPwAWBaxy5WCwKFsEXIi5/wZIjC5Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aocRlyYt/4rTBzMxgZoizuiz5ynSHKEVFxhtYm7qgViuwxPlJf8FBZ6Qhv87HCd13
	 77b52XJVadFtrgj/6SSjAJ4CKThDcqok5TwpGHqzh+L+QXwPnl4/nVvRr0dsfa03aU
	 dwSQompwUjfbkPOBrj5AGTy6Zt3CRnZF7aVUC0Dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDEEAF8053B;
	Wed, 22 Jun 2022 19:30:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70597F80100; Wed, 22 Jun 2022 19:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4745EF80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 19:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4745EF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O8jxIq/L"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3876CB8205B;
 Wed, 22 Jun 2022 17:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC7AC3411B;
 Wed, 22 Jun 2022 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655919007;
 bh=WpJxGSkPnoTmSLwPwAWBaxy5WCwKFsEXIi5/wZIjC5Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O8jxIq/LPamDMoq3ZB2j4wKsgadFaOqNRR2sr+IiON6+3oKt+nbysJU5zpEoBOByl
 fHmubXbbNGi5HsAVhjywJjEsxEmjTw71SSTsJr5e/wmXA3GWk4Ki9vdn6oQlVG3jqT
 QQtlHrEY+c3CoRRr0TmpuAJ0g9VGIpx7EfPEqG+U6cuTP5Sz4PgZiwIMmkffuNxd0U
 64ztA/4TMUpRS4RSCgoXh85rrTNo9jaNjhEzenVzLKNeYpjLIXHfH90Osum6p7LKOb
 v/wPfk30TGijakLXclDCK7BscWP31fN8u3E4QnoSIoaDYuWRk7S9IcE1e5M6Zg+yy+
 KMyCln03Hi57A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, heiko@sntech.de, wens@kernel.org, tiwai@suse.com,
 perex@perex.cz
In-Reply-To: <20220621185747.2782-1-wens@kernel.org>
References: <20220621185747.2782-1-wens@kernel.org>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix crash on missing pinctrl
Message-Id: <165591900483.1405752.13168398437677956332.b4-ty@kernel.org>
Date: Wed, 22 Jun 2022 18:30:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, wens@csie.org, judyhsiao@chromium.org,
 linux-arm-kernel@lists.infradead.org
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

On Wed, 22 Jun 2022 02:57:47 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Commit 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO") added
> pinctrl lookups, but did not skip the lookup if there was no pinctrl
> device tied to the I2S controller. As a result, the lookup was done
> on an invalid pointer in such cases, causing a kernel panic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s: Fix crash on missing pinctrl
      commit: c3b5fd7fbb698496461f280728b456d9927f22af

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
