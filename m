Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CF2EE67D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 21:03:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9189116AC;
	Thu,  7 Jan 2021 21:02:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9189116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610049796;
	bh=HGSx0opZPu5oWyiq/8ePuSyFXNVhUsYrLd4tA1Ak4MA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FN39FFzUs8JmdbcdY75F2+J5wIsypnE4WVa+9oy2DsjxJP5cd6KispxvteFh/agaJ
	 hGoRN8mBUe+WtrWnYZyGgQLTepexdvClEi7Sm9p3RiEyFNy4HNj0yFlpPrBa9VY8G/
	 DgBYoMU193R9sfIboB62u786S6/jqhE/2Ox+j/Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39F2DF80271;
	Thu,  7 Jan 2021 21:01:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAD12F802C4; Thu,  7 Jan 2021 21:01:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6C67F80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 21:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C67F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LCYTbaVS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B95223433;
 Thu,  7 Jan 2021 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610049683;
 bh=HGSx0opZPu5oWyiq/8ePuSyFXNVhUsYrLd4tA1Ak4MA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LCYTbaVSVj6VHYYzhkW84HOvIQ5ML6N9xZtey4TGOu8Ra7/dVHfwJJar3AaV4VFHp
 JaxRfzLAZyT+ZoAMFyglgjdP7gsPv6Avnlbz+IepT/vB5oODFaaSTCI2CMaAIr0Tl/
 Nn/3GdeYgyiWXOuAFiMoe4DcURq6T4iZXsbNRauQP7KzypC9qUUIMxqHBOlDSTikwJ
 lQ4We7RpgFo/+hp1ev7Ezz1UQ39p7KM8a6+wMR20rQAqjlD9rmXUIQ5yY/tGPZrCo7
 otol50bI1i5QOKKcEj0EPDi9nXXR4qg2MnLHX3BmLofAbCXscnfLMYhWV8yHoRK2dJ
 amx16kBvbuJmg==
From: Mark Brown <broonie@kernel.org>
To: 朱灿灿 <zhucancan@vivo.com>, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, perex@perex.cz, tiwai@suse.com
In-Reply-To: <AAoArwDfDnoefyxzy2wyiaqm.1.1608885766936.Hmail.zhucancan@vivo.com>
References: <AAoArwDfDnoefyxzy2wyiaqm.1.1608885766936.Hmail.zhucancan@vivo.com>
Subject: Re: ASoC: soc-pcm: disconnect BEs if the FE is not ready
Message-Id: <161004964961.33461.16112121160261528738.b4-ty@kernel.org>
Date: Thu, 07 Jan 2021 20:00:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel@vivo.com, trivial@kernel.org
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

On Fri, 25 Dec 2020 16:42:46 +0800 (GMT+08:00), 朱灿灿 wrote:
> FE is connected to two BEs, BE1 is active, BE2 is deactive.
> When closing BE1, FE/BE1 is in HW_FREE state, then BE2 is
> startup by mixer runtime update.
> 
> For FE is in HW_FREE state, dpcm_run_update_startup() will skip
> BE2's startup because FE's state is HW_FREE, BE2 stays in FE's
> be_clients list.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: disconnect BEs if the FE is not ready
      commit: 2c1382840c194533399818d0ed39dfc94f906187

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
