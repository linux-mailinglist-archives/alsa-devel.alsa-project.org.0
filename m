Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D722A83EB
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97316168D;
	Thu,  5 Nov 2020 17:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97316168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604594929;
	bh=jjAsr0+ZIP+PdEVNsUQ8ujyXuXzfv/mf8ecvEu/AAJs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aKdM0PcrN/5iaFDsZG+L9xCymu9samPMyylZ5PUMSoGdL0PSseC8QmzTdAvl85Yb+
	 dQANC3SJCua7gStF0ig0k59kX1L1PT14k8Vrl02TC2NkdcSzi44EOz+ZAsEg2WnBee
	 3vMqU1gMp30g2jirV3Oq+paSVK3Mdz2k/NZxW0J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F01BF804BD;
	Thu,  5 Nov 2020 17:46:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC9A1F804CC; Thu,  5 Nov 2020 17:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9382CF804BD
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9382CF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M5bcnQ27"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC69E221F8;
 Thu,  5 Nov 2020 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604594751;
 bh=jjAsr0+ZIP+PdEVNsUQ8ujyXuXzfv/mf8ecvEu/AAJs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=M5bcnQ27OtYsL+MkDMcTIZUEdibPRdnprM9xeY3zMaDdLilntClzFjGISgqgSGV2b
 1dMWnbTNhZbad//mR9XDxe22DoR3GV53rLhbF8ru1ZZ9aQCOBIc2HLnL1WLzjAEfbz
 FkjCWzSP/BX3Icn3W54bF4JvD7ZHF1jEPOEKViFM=
Date: Thu, 05 Nov 2020 16:45:39 +0000
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20201026100129.8216-1-cezary.rojewski@intel.com>
References: <20201026100129.8216-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: pcm: DRAIN support reactivation
Message-Id: <160459472199.54851.4449416811424744361.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, ranjani.sridharan@intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On Mon, 26 Oct 2020 11:01:29 +0100, Cezary Rojewski wrote:
> soc-pcm's dpcm_fe_dai_do_trigger() supported DRAIN commnad up to kernel
> v5.4 where explicit switch(cmd) has been introduced which takes into
> account all SNDRV_PCM_TRIGGER_xxx but SNDRV_PCM_TRIGGER_DRAIN. Update
> switch statement to reactive support for it.
> 
> As DRAIN is somewhat unique by lacking negative/stop counterpart, bring
> behaviour of dpcm_fe_dai_do_trigger() for said command back to its
> pre-v5.4 state by adding it to START/RESUME/PAUSE_RELEASE group.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm: DRAIN support reactivation
      commit: 4c22b80f61540ea99d9b4af0127315338755f05b

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
