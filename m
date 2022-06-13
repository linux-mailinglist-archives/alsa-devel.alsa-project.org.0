Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA250549D8C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 21:23:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E083176C;
	Mon, 13 Jun 2022 21:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E083176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655148231;
	bh=jyyR4o9I3S0IJYDStXO2QW9SLuDZFxzB6T63GTCQeJc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGrZeWzDtXa8NOtLPw2fH/QvKBDFKsxdYZJFd3rMPLhSIRypPC34KVBeYpzMh+hJe
	 bXAYb1yqxOWDA3GmfHyLRcwGYjcy5Lw+rzV6GrczGKqBo81WIRjqx+FaTnPt6IA3ur
	 fl+07MzhJYVHbuwDXytpycIDwgxqjXpLPKbyqj1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6DC1F804D1;
	Mon, 13 Jun 2022 21:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACA12F804D1; Mon, 13 Jun 2022 21:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DE84F804BB
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 21:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DE84F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="npw9o4pM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C65F5614F8;
 Mon, 13 Jun 2022 19:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32563C34114;
 Mon, 13 Jun 2022 19:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655148158;
 bh=jyyR4o9I3S0IJYDStXO2QW9SLuDZFxzB6T63GTCQeJc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=npw9o4pMot8B9ajgxSdG4rUiKV39RgzSAzFy4LDsVNzeDIsiaiJPO2zGbUZiy2hSp
 D+Z8K7tC6CLW8+IKlr/FBlRiL8OrDKY7qwY7c4vyJIyw25l1pRTWhubaZWiTm0E3zw
 I5FBSUcXcy+D4Fkr9KltSgXQVSnmi3dFdzfMlMYPkVO8U9E9i3tCEIxyyFUdXST3Or
 rEw6H2AUW+1X2CVQUFq6zVlGSy58ESIq6IV4nhvQd6nTXSM/f9yrlGn8L8vh9UJSgE
 mn5OEg+cSgZst+1DLpznzpu23eXWmwcGb9agw6C+SPNsPrSHiOta60c8nsbWHr6VeB
 j4rEIsFFbmeWw==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, hdegoede@redhat.com,
 pierre-louis.bossart@linux.intel.com, yang.jie@linux.intel.com,
 lgirdwood@gmail.com
In-Reply-To: <20220612155652.107310-1-hdegoede@redhat.com>
References: <20220612155652.107310-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix GPIO related
 probe-ordering problem
Message-Id: <165514815691.744585.12161097407681350045.b4-ty@kernel.org>
Date: Mon, 13 Jun 2022 20:22:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Sun, 12 Jun 2022 17:56:52 +0200, Hans de Goede wrote:
> The "wlf,spkvdd-ena" GPIO needed by the bytcr_wm5102 driver
> is made available through a gpio-lookup table.
> 
> This gpio-lookup table is registered by drivers/mfd/arizona-spi.c, which
> may get probed after the bytcr_wm5102 driver.
> 
> If the gpio-lookup table has not registered yet then the gpiod_get()
> will return -ENOENT. Treat -ENOENT as -EPROBE_DEFER to still keep
> things working in this case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_wm5102: Fix GPIO related probe-ordering problem
      commit: da440af07fc3dd2b5a5138671eba51991dd1fac8

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
