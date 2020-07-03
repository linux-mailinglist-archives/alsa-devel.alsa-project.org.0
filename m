Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E9213E2D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 19:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0D016C0;
	Fri,  3 Jul 2020 19:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0D016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593796067;
	bh=6qbXbqZcal6qUM8m7y1H835971AOT3MG+/JeJM4Mvvo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NbvE7z0BFKaqgfCJyWS/7iau1WLcjRxSG3X3jZkCj4nY3DV+yXORl4QFZvZ1d4EHy
	 NfkaicQLb6QpnFUwmF6XCJjdAWbhynFbyrZ9YfPopShRHv3IA8oyOsDrawkwqCByn9
	 Hmiq1o4bdurbRCQUsnU5Y5w7vGbAjLTV65pvqgGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41634F802DD;
	Fri,  3 Jul 2020 19:04:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EDB9F802C2; Fri,  3 Jul 2020 19:04:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B833CF802BD
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 19:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B833CF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kL89XxMC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDB8220B80;
 Fri,  3 Jul 2020 17:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593795841;
 bh=6qbXbqZcal6qUM8m7y1H835971AOT3MG+/JeJM4Mvvo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kL89XxMCD1uP1P9nfTCwFTRCu7eRiXWQYekGDxRPBArb+k7sr1jh9+gY3jlLl7K+q
 l3n9qQ4RV6nf2VcW3ZugUBQElUI2uF7AHQuci4M1KqhABFD3TXliGf6tCH/v3b4zU/
 QVPfD/x5ctycONXovCHTF3GnPm3gHfGY9hS8kCh0=
Date: Fri, 03 Jul 2020 18:03:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>, Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200703030910.75047-1-weiyongjun1@huawei.com>
References: <20200703030910.75047-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: ti: j721e-evm: Fix missing unlock on error in
 j721e_audio_hw_params()
Message-Id: <159379581381.55795.18016494611644548015.b4-ty@kernel.org>
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, 3 Jul 2020 03:09:10 +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function j721e_audio_hw_params()
> in the error handling case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: j721e-evm: Fix missing unlock on error in j721e_audio_hw_params()
      commit: 59b44649a8f2380dfbf282db9922ef863c8812a6

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
