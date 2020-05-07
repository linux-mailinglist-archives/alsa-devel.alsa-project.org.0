Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC90C1C88F6
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 13:53:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7392917CF;
	Thu,  7 May 2020 13:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7392917CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588852420;
	bh=aQfoRTL+03GAIlVMFqFOQVntNI2o67UPHaZ7kUx0kjY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFSUK4XvE4DPv72dYBRJDyyeWDg9i+H9hv0vuVR5b9fP1/1ZVK/rfbV5ffcvvaMvV
	 oflRtxECQZSeF6tEuF+UrxSx6qw4XwfXCQaS/fSszUPpeJMJ2R2l1B62CNtctFx9Fu
	 1V4NRo/iCW3/AKFrOJJeWIXv43o6IBdSxna2GyCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F349F8015B;
	Thu,  7 May 2020 13:51:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C3BF8015F; Thu,  7 May 2020 13:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 433EAF8011C
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 13:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 433EAF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d1RFNlgC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE78820735;
 Thu,  7 May 2020 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588852304;
 bh=aQfoRTL+03GAIlVMFqFOQVntNI2o67UPHaZ7kUx0kjY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=d1RFNlgC50Hge2FiWLjq+y65XWKt40zVW/xNbbBYlAPcguCUdS+P9qSRAAW7QpSkj
 nz5pWbMZGNOXsORPhkS8z+ER6zySlV3p5d2R5CnroD9uBHid9O+C1GDpPWT9JX4HJp
 vfTxzQDs1Lf5tNF9nJQO9NPa4xgto6jzuh4/uCoI=
Date: Thu, 07 May 2020 12:51:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200507015442.191336-1-tzungbi@google.com>
References: <20200507015442.191336-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183: fix error handling of
 platform_get_irq()
Message-Id: <158885230163.13599.13759878447141400028.b4-ty@kernel.org>
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

On Thu, 7 May 2020 09:54:42 +0800, Tzung-Bi Shih wrote:
> platform_get_irq() returns negative value on error instead of 0.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: mediatek: mt8183: fix error handling of platform_get_irq()
      commit: fe944625194515e99fcbfb0d190d50986e2b6480

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
