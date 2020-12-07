Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522AD2D1769
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 18:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B52F175C;
	Mon,  7 Dec 2020 18:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B52F175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607361770;
	bh=vBo8ahB0eRZMy0RamLCRGK3e/TarQHy4ro4CEoCtiLY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXy/iETXq1FgbxTbEgHRIwYkAR0jehQeq/KEhXWLL1sLRUVJ0iCON2jRk3l2o9u1T
	 bRLWbFH5kAdesKFDwtgYzFej5vLOv9To5bvdYCrkZpj4sQLY/HR5dW5sz3H2aIRegr
	 dhcqvq1PAJWTbuJWcT3mhSJ/phGHLtCKQDOAIE9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3C91F80264;
	Mon,  7 Dec 2020 18:21:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E3F8F8020D; Mon,  7 Dec 2020 18:21:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04F71F801D8
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 18:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F71F801D8
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201202193343.912942-1-ranjani.sridharan@linux.intel.com>
References: <20201202193343.912942-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH] ASoC: pcm: send DAPM_STREAM_STOP event in
 dpcm_fe_dai_shutdown
Message-Id: <160736164879.53222.1089898934708039437.b4-ty@kernel.org>
Date: Mon, 07 Dec 2020 17:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, hdegoede@redhat.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Wed, 2 Dec 2020 11:33:43 -0800, Ranjani Sridharan wrote:
> A recent change removed the call to send the DAPM_STREAM_STOP
> event in dpcm_fe_dai_shutdown. But this causes a regression
> when a PCM prepare is not paired with a hw_free. So, add
> the DAPM_STREAM_STOP event back to dpcm_fe_dai_shutdown()
> to fix this.
> 
> The new sequence would be:
> soc_pcm_prepare()
>     -> SND_SOC_DAPM_STREAM_START
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm: send DAPM_STREAM_STOP event in dpcm_fe_dai_shutdown
      commit: bb9dd3ce6177e1f8cf01b0d45e6bd9b93f656bd0

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
