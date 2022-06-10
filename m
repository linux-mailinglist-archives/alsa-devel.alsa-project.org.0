Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3726546A04
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:00:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56933193D;
	Fri, 10 Jun 2022 17:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56933193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654876847;
	bh=9UbQKLB/2Crd4lVzXcvXY2iYNGiANULUMGW05bekvD4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uW1AkSINe2RdEes4buViRU3ZQ6d4gvBHoylL3vwyUTPrGeMe/S5ghSNus3Qj4dkIn
	 IfyGZ8eLNxWqnQadaJ9Xrc7wKh8T2WuyRplWdHM3cUeI3KRQRKd59mw0r9CH60ARoN
	 YsomuGuFCQeffMofCG90NH7wTGrNRwQGduNL3HKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A100F8052D;
	Fri, 10 Jun 2022 17:59:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A314FF80520; Fri, 10 Jun 2022 17:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D77BAF804D2
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 17:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D77BAF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fvV1R77Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37E3F61FDF;
 Fri, 10 Jun 2022 15:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FC8C34114;
 Fri, 10 Jun 2022 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654876733;
 bh=9UbQKLB/2Crd4lVzXcvXY2iYNGiANULUMGW05bekvD4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fvV1R77ZjWdutWTfmPlTOgC2Y/aPEqg7Qmm/Lc80eO9ZXIYTqsMh8ouu0xRwI+IIA
 /ul/5Kac8jl7lR8kq0Wte1v/RPXN8t5piTjA8lNU9xVxXN/WheXf8FdLp59ugFSlhn
 Nuo6Ho/u1R1QV20lSN4lttrj75mj3AN2LmCJ1rlt2vLmBz1TSjmmHce4SXkAllq/SU
 t0Xh60uuoP1iFlgcnG9nJfIUbELFBXnQSybF2c2KR0yjZ63LW7imOl/zn5OoxzQD2Q
 +9cKLaeVR7XBTNwiurXEqYpR239oSern25OvIBfccCpCQn5NP//xadL5d7FYrw90Uf
 dKfvwddCKyzuA==
From: Mark Brown <broonie@kernel.org>
To: amadeuszx.slawinski@linux.intel.com, oder_chiou@realtek.com
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: (subset) [PATCH 00/11] ASoC: codecs: Series of fixes for realtek
 codecs used on RVPs
Message-Id: <165487673193.1755957.10182060787861198748.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:58:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 cezary.rojewski@intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Thu, 9 Jun 2022 15:35:30 +0200, Amadeusz Sławiński wrote:
> Our tests platforms do use realtek codecs, while implementing avs driver
> and machine boards for it, we identified quite a lot of problems with
> those codec drivers.
> 
> This series aims to fix those issues.
> 
> Amadeusz Sławiński (8):
>   ASoC: codecs: rt274: Move irq registration and cleanup
>   ASoC: codecs: rt286: Move irq registration and cleanup
>   ASoC: codecs: rt298: Move irq registration and cleanup
>   ASoC: codecs: rt274: Enable irq only when needed
>   ASoC: codecs: rt286: Enable irq only when needed
>   ASoC: codecs: rt298: Enable irq only when needed
>   ASoC: codecs: rt298: Fix NULL jack in interrupt
>   ASoC: codecs: rt298: Fix jack detection
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: codecs: rt274: Always init jack_detect_work
        commit: a43b4394bb35391b74486a788be6634ed91e221a
[02/11] ASoC: codecs: rt286: Reorganize jack detect handling
        commit: 3082afe097cc5d794c28a629f3492a0133ee4891
[03/11] ASoC: codecs: rt298: Reorganize jack detect handling
        commit: 1eb73102da280b28bc3899f694e673bf3e4d0afd

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
