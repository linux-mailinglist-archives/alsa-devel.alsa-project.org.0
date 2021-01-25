Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D283302638
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 15:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4404186A;
	Mon, 25 Jan 2021 15:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4404186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611584450;
	bh=35Q3CaKANlTL19K6ltM5nGI9OOiOXEEyad3cWZFbNe0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AgU8yFpmqwykLdufVyVyD+ncZw6ugOaV6Mem6VM5tTdfb6lldyeXlZptFchThbyn9
	 NzkCmbc+M2hkEZI9aNiAX4epYkpDJPcdpTSN5KcdQSvPb9GOoC18DhVXrWocbP47f1
	 seufIzgoMWSCHbqhrHoCq/TZvGDMt+VBFtP+Xsgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77D53F804CC;
	Mon, 25 Jan 2021 15:18:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C097FF804CB; Mon, 25 Jan 2021 15:18:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FC8AF804B1
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 15:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC8AF804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mjw2spSV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E26AC22C9E;
 Mon, 25 Jan 2021 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611584299;
 bh=35Q3CaKANlTL19K6ltM5nGI9OOiOXEEyad3cWZFbNe0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mjw2spSVLdANHVo/BAQzwM+JuOW3RddidDKYwbhyCykINkjmbX4Xl7X5cEMfOUGld
 jX4rtMLczpZX5ijn7hKpOUKk/fS49x9+hsbX/bBtu6v53Mb4ZhDK+wi+q8C9sdSx5X
 idRAGfk+ikWhg4cZswxj4+Q9vU0t+Kr93C4MBuVVS6eiN7OWZsLHicVUFJ9nh1uw2D
 LOkokRZRTNo5R6q8IO91vWT/SQWhGWWzsTQtO4Tz3tJbAPHB3ZSv6gyKHhT8iaZWiu
 tog0qsyL9vk2BUfaMa1/FxJW3LiLaZ29qmcSMaJoqm8X6EmejLcawV2+5QmbhvROc+
 ksMci1tm77pHg==
From: Mark Brown <broonie@kernel.org>
To: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>,
 alsa-devel@alsa-project.org
In-Reply-To: <ce650f47-4ff6-e486-7846-cc3d033f3601@blennerhassett.gen.nz>
References: <935820c1-0c96-6c85-26e7-ce0b741737dc@blennerhassett.gen.nz>
 <20210120190759.GH6794@sirena.org.uk>
 <84e36db4-b78d-de1b-3575-62b19035ea43@blennerhassett.gen.nz>
 <ce650f47-4ff6-e486-7846-cc3d033f3601@blennerhassett.gen.nz>
Subject: Re: [PATCH] ASoC: ak4458: correct reset polarity
Message-Id: <161158424213.32959.11328598571672763596.b4-ty@kernel.org>
Date: Mon, 25 Jan 2021 14:17:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, kuninori.morimoto.gx@renesas.com,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Fri, 22 Jan 2021 21:27:08 +1300, Eliot Blennerhassett wrote:
> Reset (aka power off) happens when the reset gpio is made active.
> Change function name to ak4458_reset to match devicetree property "reset-gpios"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: correct reset polarity
      commit: e953daeb68b1abd8a7d44902786349fdeef5c297

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
