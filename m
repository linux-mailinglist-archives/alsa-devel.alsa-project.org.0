Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F030049B145
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:25:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89942215E;
	Tue, 25 Jan 2022 11:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89942215E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106323;
	bh=PPeOvJVjKQk1sgWBgXTRE3M3X/ghG6GwBr17kd9EHAs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NuC/AXHA/LJyDfkJs6Rl8DuOmiY1MQk7+B9icHtKrJgYD66CM/dEFviqf8AnZUtcK
	 zFC2miu8R70urffbcYz3DbvAy4gh012LNIthZJvok6SRdlWsjO3RWEdW5sqLPyvokx
	 Rp3mtGMWilEj8dazMR9RUc1BtIaiRr29PNMOIhZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E072F80568;
	Tue, 25 Jan 2022 11:20:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE200F8053D; Tue, 25 Jan 2022 11:20:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D60B7F80525
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D60B7F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dx/CfScU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2545DB8174B;
 Tue, 25 Jan 2022 10:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B62BC340E8;
 Tue, 25 Jan 2022 10:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106040;
 bh=PPeOvJVjKQk1sgWBgXTRE3M3X/ghG6GwBr17kd9EHAs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dx/CfScUZ2xfA9Ast+sVlMjDabJlKwxJVNGShS4Hgc0IGSpT5qNBm6ZqUhnQpAZJi
 NH2erSXALoBz7bbfLbkg+qEWYIUHQX9RRCES3p8LkA6B4aMDTvm0nz4SVY2dDKI6jq
 iTCNsb+6BbxmzEoLzFfzv/9Ad9ggJGLzIkpya2QNTT48/9508YL9LrppFc/Sc8iMOT
 f6OewycNyKOE50sDAcMHATWyLYlC3UT1UuAiFDdY6CLMtLtasVBlSWEK0K/6cbLmnT
 2VUGbhU9IG32KLJ/mreOtm/s55njGS16GBCwKEUcsj1A9N+aJCGnuwOEtj1mruyQ+x
 BNS4Z69RrKCUw==
From: Mark Brown <broonie@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
In-Reply-To: <20220121171031.2826198-1-jiasheng@iscas.ac.cn>
References: <20220121171031.2826198-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH v3] ASoC: codecs: Check for error pointer after calling
 devm_regmap_init_mmio
Message-Id: <164310603890.74844.13333058824598578375.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, bgoswami@codeaurora.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
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

On Sat, 22 Jan 2022 01:10:31 +0800, Jiasheng Jiang wrote:
> Since the potential failure of the devm_regmap_init_mmio(), it will
> return error pointer and be assigned to the regmap.
> Then the error pointer will be dereferenced.
> For example rx->regmap will be used in rx_macro_mclk_enable().
> Therefore, it should be better to check it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Check for error pointer after calling devm_regmap_init_mmio
      commit: aa505ecccf2ae7546e0e262d574e18a9241f3005

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
