Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7471A27B57F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBFE1889;
	Mon, 28 Sep 2020 21:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBFE1889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601321952;
	bh=eb4KPVAJh97urPybGYCkAyei3EZUU+NAGt7oeK2z6cE=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cr6JeAQKxICd9xhobzyaEM1CfSZwnDmVSwN51r16dcUXP+eHHNDjYYQ6AL8njyafU
	 HqRfaHaVQA/o9rBW+mmSf5yOWb5m/P4sPxCPExnYAFtP7K9gBLMyJJKH5tdcmZ98qI
	 6swQ96pOYlUOVPlWXQZdZp5iodal0GKrnBoQoxww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB57F802D2;
	Mon, 28 Sep 2020 21:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE169F802DD; Mon, 28 Sep 2020 21:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5961BF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5961BF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KaT4LjPW"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 209352075F;
 Mon, 28 Sep 2020 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321754;
 bh=eb4KPVAJh97urPybGYCkAyei3EZUU+NAGt7oeK2z6cE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=KaT4LjPWz8mQsvw+IpPMoAC/B8kTosTqegEyqb+lYWNy3NJUcWvCyPEGmkQKuazRJ
 mSHPRgJMsTRZWriVpiiHNavx83yPL7K6UXuYytoyKAEdtdEy9Mt/MwnfRMTiZ1AQpf
 mJqVRlruuGn7KqWR9Clqia6rYPZ+xXkOHAx/S6ho=
Date: Mon, 28 Sep 2020 20:34:57 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200925212719.23286-1-krzk@kernel.org>
References: <20200925212719.23286-1-krzk@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: sgtl5000: Add common clock properties
Message-Id: <160132168198.55254.15502764557761339058.b4-ty@kernel.org>
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

On Fri, 25 Sep 2020 23:27:19 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (assigned-clocks and similar)
> to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dt.yaml: audio-codec@a:
>     'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: sgtl5000: Add common clock properties
      commit: 3bf7b94293922e436556b5ac06081af2a3775225

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
