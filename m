Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832511C8A8D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 14:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A1D1812;
	Thu,  7 May 2020 14:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A1D1812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588854052;
	bh=I5hKmcE5mcDLVhZaWDRwI64U3QpiZUFmJdDuCE+vXmE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aAJLvdP1arh/XN6pvni1bfrMUWMgNIF4cn1b0sze2UGKzLYGHp0xaaAvd/F+7rKGd
	 fTKsAj3JlBcjTcOKfw/R7F60ihu7AjG+cLx/9NJM3ribHUSpeQ9ucV54LZI4VVK8Dz
	 j9fbp6Kks1QyyKZeQ5EekPq71uKWsGIqL6qCPKQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 225F8F8026F;
	Thu,  7 May 2020 14:18:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4B55F801D9; Thu,  7 May 2020 14:18:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7ABAF800F6
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 14:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7ABAF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fwpyh3Lq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 618C320CC7;
 Thu,  7 May 2020 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588853901;
 bh=I5hKmcE5mcDLVhZaWDRwI64U3QpiZUFmJdDuCE+vXmE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fwpyh3Lq9mAdWayXxnmENOvUYSaL7jTt72sbM3RezkaGAhPeWB5n+kBGgYIECnHHg
 rhiZgbOKFBvTWslJBreJjVlcVftxMHR2R4WhmM/Nw82hu5LE/J7/Urhwcxr4qSjXac
 6D73eceh/8FZ9DbaTnhzg6b6Wmx87GdNx1gwhibg=
Date: Thu, 07 May 2020 13:18:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200507094335.14302-1-weiyongjun1@huawei.com>
References: <20200507094335.14302-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt5677: Use devm_snd_soc_register_component()
Message-Id: <158885389338.38935.14311915230086603146.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, 7 May 2020 09:43:35 +0000, Wei Yongjun wrote:
> Using devm_snd_soc_register_component() can make the code
> shorter and cleaner.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/codecs/rt5677-spi.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: rt5677: Use devm_snd_soc_register_component()
      commit: 9558ad215509b75c72c84f4f7691f1bd80fda42a

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
