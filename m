Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0C61C5550
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 14:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D8251737;
	Tue,  5 May 2020 14:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D8251737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588681170;
	bh=nPpNqyu4Di9UIreq4Pdy4TMDsYb/AXsBsPRG4EpT+1Y=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RS8Rs2AxnYD2ljZ0jVfJYDElHfoH3RkF3ZTiVeyjymfq+WHt60fTAItd5eKHKlU/w
	 uLBTcKJ7Z/9pCJYsnu6YVon3wR6Z5ylgbUI4oDVqIKxIeOY650/b/dn1IIU1DQkdlH
	 8x/HLzyiNMSQaqZkOoVh5BbCJG9/6/4B7TJ0TzXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62CB9F80162;
	Tue,  5 May 2020 14:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77EFCF8015F; Tue,  5 May 2020 14:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A10EF800EE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 14:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A10EF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gvp4zhT5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 847E5206B9;
 Tue,  5 May 2020 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588681053;
 bh=nPpNqyu4Di9UIreq4Pdy4TMDsYb/AXsBsPRG4EpT+1Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gvp4zhT5LkVvqxDPllq1uODFL/ATroY4PwAuB3S66S9ZL8upz2OjkO5N86L3Iyb1E
 8agCJb/tCthGCDzhKyQA+S9C3jQXs6YtwmmFQYlglasA3vKxcdJsZz24kxZ7UR9fDG
 lvwm3MNfoCtSvs76yb2UexZvvBZK4MP2/4ozwPuw=
Date: Tue, 05 May 2020 13:17:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200425184657.121991-1-stephan@gerhold.net>
References: <20200425184657.121991-1-stephan@gerhold.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: lpass-cpu: Document DAI
 subnodes
Message-Id: <158868105044.51563.15433748499783582656.b4-ty@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kenneth Westfield <kwestfie@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

On Sat, 25 Apr 2020 20:46:56 +0200, Stephan Gerhold wrote:
> The lpass-cpu driver now allows configuring the MI2S SD lines
> by defining subnodes for one of the DAIs.
> 
> Document this in the device tree bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
      commit: d5797ede0818b24252f79497e1c7e1245c328f6b
[2/2] ASoC: qcom: lpass-cpu: Make I2S SD lines configurable
      commit: 4ff028f6c1087bcaf1ee970d4ef43730ed0aaa8c

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
