Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3732FDD9D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:08:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85842182A;
	Thu, 21 Jan 2021 01:07:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85842182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187676;
	bh=ZLWvffTsDz1qNch4fD7+1+LXI31vPb+p7ftbWO67Jug=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XvSl596131C3sgz1WBXZ3WfPFOhdUk9az0VViMvfI9Jc4MktFzHPPMfdY5RXBIwIh
	 Babj9kWVFFKiN6Ly7QN091Lxf5s1JIlyuRAAM3OxBNsAmQ61gUBS2IfZ0HtmjPkT2f
	 u2GKSyVg+Dw804lEkM9nw9huoH0F960QDkDNh0H4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 157B4F80166;
	Thu, 21 Jan 2021 01:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E5B0F8016E; Thu, 21 Jan 2021 01:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11284F80137
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:06:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11284F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bmJfkUQM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A9FC23716;
 Thu, 21 Jan 2021 00:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187574;
 bh=ZLWvffTsDz1qNch4fD7+1+LXI31vPb+p7ftbWO67Jug=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bmJfkUQMKeQay1QoxU+kViI6A87yu3A9pcmztq+/h32CYr+RaIsDCPUREQSFEyG+s
 c6iFUAFHKaFm2KSaxIvBaRuDKajfx9nlARNtTyMsHYKfaoIinan20cvRjnGKOBY6os
 D+bUn9HzpdXhVnLGEc9Jbc3qHhkzn3SGdh31F+dkiBOFeiOHb20SWAa8xe3rGZYqmi
 VWT3rEua/jYXK1rYEftCLHBimlqqeywLkA9CO5uEvpVLaOLxHo16h52ePS4dRpkUk4
 4kB/CBo5u/B9kL+aJ5w4K3XSyv21JLigg47Aq6/GSMipNFfjb+HcmCkVsQKOENGAI8
 p0rMjMl0peNEw==
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20210120092237.1553938-1-tzungbi@google.com>
References: <20210120092237.1553938-1-tzungbi@google.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: mt8183: ignore TDM DAI link by by
 default
Message-Id: <161118753484.45718.2516194829359308534.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
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

On Wed, 20 Jan 2021 17:22:35 +0800, Tzung-Bi Shih wrote:
> hdmi-codec is an optional property.  The 2 patches fix DAI link binding
> error when the property doesn't exist in DTS.
> 
> Tzung-Bi Shih (2):
>   ASoC: mediatek: mt8183-mt6358: ignore TDM DAI link by default
>   ASoC: mediatek: mt8183-da7219: ignore TDM DAI link by default
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt8183-mt6358: ignore TDM DAI link by default
      commit: 5ac154443e686b06242aa49de30a12b74ea9ca98
[2/2] ASoC: mediatek: mt8183-da7219: ignore TDM DAI link by default
      commit: 4d36ed8eb0f749c9e781e0d3b041a7adeedcdaa9

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
