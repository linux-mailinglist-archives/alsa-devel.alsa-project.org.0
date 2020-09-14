Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB43268E6C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 16:54:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B311687;
	Mon, 14 Sep 2020 16:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B311687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600095266;
	bh=a1JalLnTBAaxUOfrKmYR9snF+OmsXWm89BgkakJgbtY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2L3ZBthck7P0MlbUl1bSEHutX6Juvg91feONurHwsSvJT9i1fzVqnbDsvNuhvBne
	 dFAstKWyCCmJT93lBWFlVVaS4kWiPZMf8FP53S9Pp1QtC89mCx+QCJd1MIMsn0Nimj
	 Msrli5M3bHvKVviHmP1olIZXLHHcFUv1CWik/U28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BC72F802A9;
	Mon, 14 Sep 2020 16:52:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 545C5F802A9; Mon, 14 Sep 2020 16:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA1E2F8015A
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 16:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1E2F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nHlZxjOb"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BAD520715;
 Mon, 14 Sep 2020 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600095117;
 bh=a1JalLnTBAaxUOfrKmYR9snF+OmsXWm89BgkakJgbtY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nHlZxjObjD7RILUNaeRVhzLzrOscBBQnb049NK7Yru+8eWh4YiKW/a3s0V8AA7qRi
 XjU463tCuCy+ATejyKUCV06FhpHxkXJ3afF+6hxo7gX5hYF/UtAwqno023/mh4W98f
 ZSsq9Le8WOkOHrA9gNfVNN7x7BiOihLCGyBRgOhQ=
Date: Mon, 14 Sep 2020 15:51:09 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alexandre.torgue@st.com, arnaud.pouliquen@st.com,
 lgirdwood@gmail.com, Olivier Moysan <olivier.moysan@st.com>, tiwai@suse.com
In-Reply-To: <20200911081507.7276-1-olivier.moysan@st.com>
References: <20200911081507.7276-1-olivier.moysan@st.com>
Subject: Re: [PATCH] ASoC: stm32: sai: add pm_runtime support
Message-Id: <160009506912.439.13820832041582523614.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On Fri, 11 Sep 2020 10:15:07 +0200, Olivier Moysan wrote:
> Enable support of pm_runtime on STM32 SAI driver to allow
> SAI power state monitoring.
> pm_runtime_put_autosuspend() is called from ASoC framework
> on pcm device close.
> The pmdown_time delay is available in runtime context, and may be set
> in SAI driver to take into account shutdown delay on playback.
> However, this shutdown delay is already handled in the DAPMs
> of the audio codec linked to SAI CPU DAI.
> So, the choice is made, not to support this delay on CPU DAI side.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: add pm_runtime support
      commit: 4e723e7565c4031568fb9db18253cfbf6442831d

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
