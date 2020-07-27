Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A2D22EE21
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 15:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A060D16AB;
	Mon, 27 Jul 2020 15:58:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A060D16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595858363;
	bh=aXB8OuZKjJ99TwcQL9C/buv5PV0zEHUF7o6/ZjPRQKs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+JhcQhfebGG+y/BYI9AEKzVSpf7JWwpkXle6HnU8CnuMNbYFUHskYK3+VpndQ763
	 2rwOeYfmIFuU3ZKRioL8rxxTvzif4xKb3S3oCol0COkscSdrsOM+OPKNYmX1wGKnkw
	 OsShFhdu9s/hXTnEoyI5dQDnKa3siyhX64VX+cf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4D9FF801F7;
	Mon, 27 Jul 2020 15:56:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE9AFF80171; Mon, 27 Jul 2020 15:56:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08095F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 15:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08095F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mywIZv0S"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 63E842070B;
 Mon, 27 Jul 2020 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595858208;
 bh=aXB8OuZKjJ99TwcQL9C/buv5PV0zEHUF7o6/ZjPRQKs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mywIZv0SX1ZOQi/CgjmoXgbexBj7H+kdN23PM1EAXQfZtSqwC3YEqelyT3RFHjsjb
 K6WkE6qHikR8tn89kt3XJfRKKcSF6Zl6CT+9khxKQoOFsl+D0yDuSzX4shsMwavb1s
 L8IoSn9ApKWyNj/vQ0wWWyyOw3WMZdErNNlWjSZY=
Date: Mon, 27 Jul 2020 14:56:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200727082502.2341-1-stephan@gerhold.net>
References: <20200727082502.2341-1-stephan@gerhold.net>
Subject: Re: [PATCH] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX, TX,
 RX} defines
Message-Id: <159585818664.22279.12867263399663815841.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Mon, 27 Jul 2020 10:25:02 +0200, Stephan Gerhold wrote:
> Right now the direction of a DAI has to be specified as a literal
> number in the device tree, e.g.:
> 
> 	dai@0 {
> 		reg = <0>;
> 		direction = <2>;
> 	};
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: q6asm: Add Q6ASM_DAI_{TX_RX, TX, RX} defines
      commit: 34facb04228b36006a37727fddee59cf069d95d4

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
