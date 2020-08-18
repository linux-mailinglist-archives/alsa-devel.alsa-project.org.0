Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AA4248C2C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ECB5178A;
	Tue, 18 Aug 2020 18:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ECB5178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597769869;
	bh=o+F/8MUlDhT4G3FDAIPoSIgrE0yLotwO8+CXdKAqBY4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mWVVdd0qdu2chqSdJMP99W61viyCNhUJZuxQuUnJVZcChLWCc4lXDaUQ5qQk2dIh2
	 9aa1jDrARQBXfn2wshhOGXxySIbLGoXxqN7EpDkOiCU5jC3RrQVg4vY9zY7pIapHYE
	 VQH1+ZP8FpP7SsimtPYMrgv4Q+2WUc+ITQnrieyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FEFFF802DF;
	Tue, 18 Aug 2020 18:54:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ADB8F802E1; Tue, 18 Aug 2020 18:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B089AF802D2
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B089AF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Iun5+gKm"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B60E8207D3;
 Tue, 18 Aug 2020 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769665;
 bh=o+F/8MUlDhT4G3FDAIPoSIgrE0yLotwO8+CXdKAqBY4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Iun5+gKm4tPHsYcb3nSxK4BbBKAPkse89tlznPIX2KkHyqObmvaMLTz4PfHnSx3+F
 20m03IEQPtSeFQM7/ReUzHtGAGduJgD4sgNaLM1VBVY1RzirlzilPhaeRaORIeSSPC
 i9GNDLJcxnjGdEqdGhQNt3tCLGoomN+q2euB43Vw=
Date: Tue, 18 Aug 2020 17:53:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200801100257.22658-1-stephan@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
Subject: Re: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
Message-Id: <159776961932.56094.9628533027830690530.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

On Sat, 1 Aug 2020 12:02:55 +0200, Stephan Gerhold wrote:
> simple-card.c and meson-card-utils.c use pretty much the same
> helper function to parse auxiliary devices from the device tree.
> 
> Make it easier for other drivers to parse these from the device tree
> as well by adding a shared helper function to soc-core.c.
> 
> snd_soc_of_parse_aux_devs() is pretty much a copy of
> meson_card_add_aux_devices() from meson-card-utils.c
> with two minor changes:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: core: Add common helper to parse aux devs from device tree
      commit: 1ae0965dc21698ba41638c95b5478779f3c4a9e4
[2/3] ASoC: simple-card: Use snd_soc_of_parse_aux_devs()
      commit: d9ffff696c5b468ba5a4ddb2cbc05c9e4dd4b2d1
[3/3] ASoC: meson: Use snd_soc_of_parse_aux_devs()
      commit: 6bc37d32f630363b68059e3fa854383e6abf171e

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
