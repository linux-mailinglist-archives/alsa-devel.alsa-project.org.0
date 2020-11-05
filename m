Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270C2A83E7
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3011B167B;
	Thu,  5 Nov 2020 17:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3011B167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604594883;
	bh=1RsXmYB4zCj2jaeADbfq59xOu2k8CzrD8CU1zJns5Ns=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLjH6hIOYlGooCFbhlAKvcg3kdLKXt9RjXxNzmOQTxOw2MDsTKHHV8H6E7B6mv72Y
	 cRnUYqw4O9EzakrBeltY/OyMov053D12DL6G/FO3Tx3ZC2yLn0u1h91GnvljRGfxu/
	 VG61nlxCHImp4m9NX5OY2hVrjCK+jjOm87FZlfnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C08F804BB;
	Thu,  5 Nov 2020 17:45:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A942AF80272; Thu,  5 Nov 2020 17:45:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1DE8F80272
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1DE8F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MLhqhGWk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8747A2080D;
 Thu,  5 Nov 2020 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604594739;
 bh=1RsXmYB4zCj2jaeADbfq59xOu2k8CzrD8CU1zJns5Ns=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MLhqhGWkfnNlnY+Z8zzA1y2bzWmyu1mhidmsGBJGklbZ+cKftwN7eSvqPEuMpnF/O
 fjMkwh+1jgbrjLe2znUd1EBmSwFA3mJPvAMDeANBzPDckSLp+JTAUgfBZ/S53Bqebn
 xOq9V6y8L5GeUZ3EUwwEQDtuKA5c+7y1qoRvAcNc=
Date: Thu, 05 Nov 2020 16:45:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20201105124747.18383-1-sudipm.mukherjee@gmail.com>
References: <20201105124747.18383-1-sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: Fix build failure
Message-Id: <160459472200.54851.16651455731881675062.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 5 Nov 2020 12:47:47 +0000, Sudip Mukherjee wrote:
> A build of arm64 allmodconfig with next-20201105 fails with the error:
> ERROR: modpost: "mt8192_afe_gpio_request" undefined!
> ERROR: modpost: "mt8192_afe_gpio_init" undefined!
> 
> Export the symbols so that mt8192-mt6359-rt1015-rt5682.ko finds it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: Fix build failure
      commit: 8bfe8c967546dc05385b52bac49ad972fea5887c

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
