Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176CE1C53B5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 12:54:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2D11736;
	Tue,  5 May 2020 12:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2D11736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588676052;
	bh=6eldmAKJS3vfCw/m2j008MyCpoSkTVPiIgfiMv12/yw=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=koQPjhuLGkzq+XnCD67NcWp4Rf9wX0HjlIwHrrvzI0u32E+EJy3u/4hVw2k3T4yKc
	 g4ISn5sJJczPxVkNEwRjzv30SZTvccd+Yo1VmR3KUEaJd8l1eurPrNAJ/Wp16qkNrE
	 NYiAhlA60A9nOTipTFtIqPiRGwF4MQRZ+SW/ivVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDDCBF80162;
	Tue,  5 May 2020 12:52:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2F1EF8015F; Tue,  5 May 2020 12:52:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D980BF800EE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 12:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D980BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EVMMyqNU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 928F6206A5;
 Tue,  5 May 2020 10:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588675939;
 bh=6eldmAKJS3vfCw/m2j008MyCpoSkTVPiIgfiMv12/yw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=EVMMyqNUrqDBvUsvNmwqmoLKrR5Jm/LXzLsUNVyMke+kowhYtJrS2xLoJKehUVDXV
 yqlLUzNz6KIy2aNwl+rk92TaTBEj1hFoTPgznnWDPJ80GkI5v9jZvlF2ru/4M2lOFN
 VSW81ybIN2+6idks79UzB/PU/+oXPr0lDjf87bbI=
Date: Tue, 05 May 2020 11:52:16 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kstewart@linuxfoundation.org,
 tiwai@suse.com, lgirdwood@gmail.com, tglx@linutronix.de,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 allison@lohutok.net
In-Reply-To: <cff745cc041c5208910821f0740f988926af8a66.1574418380.git.shengjiu.wang@nxp.com>
References: <cff745cc041c5208910821f0740f988926af8a66.1574418380.git.shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH] ASoC: wm8524: Add support S32_LE
Message-Id: <158867593662.11678.18322180422174799283.b4-ty@kernel.org>
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

On Fri, 22 Nov 2019 18:30:13 +0800, Shengjiu Wang wrote:
> Allow 32bit sample with this codec.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/wm8524.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: wm8524: Add support S32_LE
      commit: dbab677f324dcf26dc8c443e3ff39a4eaa6dcacc

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
