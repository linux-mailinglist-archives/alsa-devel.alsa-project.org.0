Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B71C3958
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 14:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450D416F0;
	Mon,  4 May 2020 14:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450D416F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588595340;
	bh=7HeWhzNq4ru7hIGiV66ihin7t3xTqFDGYRWsgtPc7XU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S3gzGGmErKiGAGzTiu8PXPLWgOdpKFg3sgp8UP0I8sSDuIMq0OMWEVufecYmEddCg
	 cZOb32VOxivUTjY84J1Paj9W+o5qGLkfW3cXkKP+vC3j3DmCLqp3LBinWfl6B7Y5V5
	 Vbbp59TWx0KzozRblc/yU15xsRQTMsu5XuyaRSNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F58FF80258;
	Mon,  4 May 2020 14:27:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6443EF80249; Mon,  4 May 2020 14:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA80DF800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 14:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA80DF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sZIg8UYN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B745A2073B;
 Mon,  4 May 2020 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588595231;
 bh=7HeWhzNq4ru7hIGiV66ihin7t3xTqFDGYRWsgtPc7XU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sZIg8UYNN5bxn5Rx2FiMN81huW/nF77JV6cFZJUtl59wlcwMot4nYILDk+Kt9M+6e
 ppNSd6OwE/QuFAzYsMJsj/MvJccnx0OH2SEl8ZvzLo/EgYvWsdJyZ3wCu/PklIoQi0
 wtRldDB+t7QjFmUEy8XjdQsTy0wIT6rxBtERAt50=
Date: Mon, 04 May 2020 13:27:08 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
In-Reply-To: <20200502142646.19033-1-wsa@kernel.org>
References: <20200502142646.19033-1-wsa@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: max9768: update contact email
Message-Id: <158859522870.21499.16362674859345760035.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>
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

On Sat, 2 May 2020 16:26:46 +0200, Wolfram Sang wrote:
> The 'pengutronix' address is defunct for years. Use the proper contact
> address.
> 
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> ---
>  sound/soc/codecs/max9768.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: codecs: max9768: update contact email
      commit: 454b3766de45f8508b343e509fdde959b4ff289c

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
