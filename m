Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A388411852
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9028C16B9;
	Mon, 20 Sep 2021 17:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9028C16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632152067;
	bh=kW5h4Wp87ZySDniC1nxTtzJqO7Y1LElsVScvvjvZqWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eO3oN0WhKv13NN1b0GMhyQ6YpW2RGlYjRU+sFXaQMHvRghJDUoukzWCfqGJy0vsKM
	 gZHcFHjqfnBrTkSMu6nIJx/7FSzg0URqQtrA47c/ODZyrTnthtqUi69iMCVTJedPYj
	 5sMnpSZclHMkM2wzhOJZayCce2YqVVGdR2t8k4YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F75F804F3;
	Mon, 20 Sep 2021 17:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1919F804E6; Mon, 20 Sep 2021 17:31:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 482E7F8025D
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 482E7F8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g/h5ImWa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08B3A61107;
 Mon, 20 Sep 2021 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151912;
 bh=kW5h4Wp87ZySDniC1nxTtzJqO7Y1LElsVScvvjvZqWM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g/h5ImWaDriQyw1F6OxleG+ut1hQLVNC9avWfgfw6oWKtcC8Q+MdFWKr4q80PXpFN
 bXU3gfXst8amN4xAFcfIh3P0k+ossMuvxriMTdNwrLuNZkc5E7klPkIXMIvBnrmoIn
 f5Xnj+dYq+0uRH9c/9RyGOQzkPvfLZWemiQXYL1ZK5CgCegz5MiJAkI0jYeEPs6tIV
 MeYHHPDettiCGGo8jV1X6kUmU723lau+S4QK88JK+x5EHYf2Dl/tFsB8X+Wkh+jojK
 eb+9aw1XyYlwasdsbWUD7ieC8R+v2Yhp6YcCBwMAJ2zIN+FXKf0nsFNZvJEN5vk15w
 ZzOVQnupicfiw==
From: Mark Brown <broonie@kernel.org>
To: Derek Fang <derek.fang@realtek.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: dt-bindings: rt5682s: correct several errors
Date: Mon, 20 Sep 2021 16:30:49 +0100
Message-Id: <163215150720.38322.16264774156845282309.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920112106.140918-1-krzysztof.kozlowski@canonical.com>
References: <20210920112106.140918-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Mon, 20 Sep 2021 13:21:06 +0200, Krzysztof Kozlowski wrote:
> Correct several errors in rt5682s dtschema:
> 1. The examples should be under "examples":
>     'example' is not one of ['$id', '$schema', 'title', 'description', 'examples', ...
> 
> 2. Missing type for vendor properties
> 
> 3. clock-names should be an array:
>     properties:clock-names:items: {'const': 'mclk'} is not of type 'array'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rt5682s: correct several errors
      commit: a7a18abbd26caf22e40165eb734e67d338735f5b

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
