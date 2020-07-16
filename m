Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B0222F9D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 02:03:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FE0715F9;
	Fri, 17 Jul 2020 02:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FE0715F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594944204;
	bh=5mhLBJ7h6ElkX/0AxOdJ2+cHlZaRzaXjArcjaCDUEQE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vsAiRO0Jtznb1hnX1CRYVYripyVlQW7e651mOZAvGMdUQLUFNmfvxjxl5VyNjmcpI
	 DHi4XQaH+bZr8fauCnFWKQRKzbdjOGovQx6udbJTA/q7hk3xtRtzpMgtPrO5GQyav5
	 xhw5oYXtjBdF1zRRji0NM4EMDSA+Tvj6lOOOJuJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D343F80305;
	Fri, 17 Jul 2020 01:57:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22BE2F802FB; Fri, 17 Jul 2020 01:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A5DAF802EC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A5DAF802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cJnwPT3X"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 704F4207BC;
 Thu, 16 Jul 2020 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943858;
 bh=5mhLBJ7h6ElkX/0AxOdJ2+cHlZaRzaXjArcjaCDUEQE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cJnwPT3X2FH6FCM6jcYgB3hpoARd40Qv3iu7c0nfDjwEDgBgGe61Qip+68Yb39Ud5
 YhIohsWJYKHLJZ26Fig4h4IZt3QJz133+eMrfsNUkVF90NfgYQUGvBAxgBGWdn19iC
 9bmF8yHwcBnlFBpcKg6MmnhQ9mWee+6E0CN+OAt8=
Date: Fri, 17 Jul 2020 00:57:28 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, robh+dt@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, festevam@gmail.com, timur@kernel.org,
 nicoleotsuka@gmail.com, devicetree@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 0/3] ASoC: fsl-asoc-card: Support hp and mic detection
Message-Id: <159494380522.42174.2922411454169889285.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Wed, 15 Jul 2020 22:09:36 +0800, Shengjiu Wang wrote:
> Support hp and mic detection.
> Add a parameter for asoc_simple_init_jack.
> 
> Shengjiu Wang (3):
>   ASoC: simple-card-utils: Support configure pin_name for
>     asoc_simple_init_jack
>   ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
>   ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: simple-card-utils: Support configure pin_name for asoc_simple_init_jack
      commit: 764aafdb985b182bce0c91503e9233cb97a2f0d7
[2/3] ASoC: bindings: fsl-asoc-card: Support hp-det-gpio and mic-det-gpio
      commit: c3c058aba4032a0f88a2f203472d7b5076a926b4
[3/3] ASoC: fsl-asoc-card: Support Headphone and Microphone Jack detection
      commit: 3b171194493c5f7b2aa9b76deb402a8e98ab510f

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
