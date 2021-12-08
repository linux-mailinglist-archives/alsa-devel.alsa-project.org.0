Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA246D8DE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 17:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 520C72673;
	Wed,  8 Dec 2021 17:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 520C72673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638982188;
	bh=9sl05KB/Wmmgh8hTPjQUEeSxpALKqcfSoRdKFAet8JE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sV0jDjGNTHITZETZVoqkFrjmhtvvPyLRltl3K9IIDnC7QsjOuGgfC1QY44iK6ZDRk
	 Qo+TDjoyw7920QclK5+yCaSsuRaYjw2ZIsvndouDRuDc/sBsi4eSUwUt0QAwfB2lgo
	 6m7CVKoz9QCF4/35UvhQrlZIDRwI8fu1xyr/Yw7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C4CF8051E;
	Wed,  8 Dec 2021 17:47:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C3BF80519; Wed,  8 Dec 2021 17:47:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD72CF80515
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 17:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD72CF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jviW+zWd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40F5CB821C5;
 Wed,  8 Dec 2021 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42E6C341CA;
 Wed,  8 Dec 2021 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638982015;
 bh=9sl05KB/Wmmgh8hTPjQUEeSxpALKqcfSoRdKFAet8JE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jviW+zWdyQMn66S2HDRfLnruwnaF/rvB2sTf6cUubb2j/WeBPnBxg+jBODq/Yazcq
 PL37dID/7dbpv8PmDmpvDE/kfVygra/a6mFTfrnE8Cj9nyuRW7Sr/pOxIRqYor1pvw
 Nygz5xsy5FY/XPvRMl9H86HyR6OaRNVf5V3LMl8ht+0FnEcC7yHVvKftoEwssktbJi
 dkczjxvBRmec4SCBi8QKibf5jEiJHBpO2svaiU0ug3PD/9awHakYEtUlrUR1qG144M
 DnT5zuVDPpquo3M4MsRxXel+7oOB6ukjlLO/btpp+HG+pMNvIMDQg87kNkiybQ+fLW
 TnrWzsXEJcAZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20211208151145.GA29257@kili>
References: <20211208151145.GA29257@kili>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: silence uninitialized variable
 warning
Message-Id: <163898201265.3880815.10727023271133668606.b4-ty@kernel.org>
Date: Wed, 08 Dec 2021 16:46:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Bixuan Cui <cuibixuan@huawei.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
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

On Wed, 8 Dec 2021 18:11:45 +0300, Dan Carpenter wrote:
> Smatch complains that we might hit the continue path on every iteration
> through the loop.
> 
>     sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c:831
>       mt8195_mt6359_rt1019_rt5682_card_late_probe()
>     error: uninitialized symbol 'sof_comp'.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: silence uninitialized variable warning
      commit: 9abc21c966619d6ead27fd48481966014fdc680f

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
