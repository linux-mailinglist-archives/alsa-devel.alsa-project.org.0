Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90E2760B6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 21:03:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C71F517A0;
	Wed, 23 Sep 2020 21:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C71F517A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600887790;
	bh=tTgpbuHqphH8gDOT55yTuud4yYT4Y2Ub9P91maO1ALs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJDd1KAl3zJbiBEgqSs941/PbojVecSpYIz+GERtJa8ryjRNVto0uEepPOBhq4pmd
	 Iz/GmctiIF2F3o2KnmdS/AML2tuFdLeYkoakYM6JYuLhR9v1mAa6RavHBlwLxMXV3b
	 IPTdPLBcXJN9A6pC6rl/He0DvloT00nUog4ZnJcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1FEF80254;
	Wed, 23 Sep 2020 21:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 850D4F801EC; Wed, 23 Sep 2020 21:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47335F8010A
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 21:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47335F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nmq2Q4GU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C90AB206FB;
 Wed, 23 Sep 2020 19:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600887673;
 bh=tTgpbuHqphH8gDOT55yTuud4yYT4Y2Ub9P91maO1ALs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Nmq2Q4GU+BGP11Zq+67R41jaw4tQ5E+UZQeQPQVEVGwy5+X0qMnq43zsaLpfRo2Y7
 cDCPGvN3Hvk9He6N5fo5R68uk7a91BeXqd5oA01wdsBdt8tGAv/0a6gUeGBaZpufVw
 MU66MANFRR4smXZu/F3mL3HHrRkWhTxIBTpU2M7w=
Date: Wed, 23 Sep 2020 20:00:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200923072939.3100468-1-kai.vehmanen@linux.intel.com>
References: <20200923072939.3100468-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: hda_dsp_common: use static function in
 conditional block
Message-Id: <160088761879.35939.9765842507672115316.b4-ty@kernel.org>
Cc: lgirdwood@gmail.com, Jaska Uimonen <jaska.uimonen@intel.com>,
 daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Wed, 23 Sep 2020 10:29:39 +0300, Kai Vehmanen wrote:
> cppcheck reports the following warning:
> 
> sound/soc/intel/boards/hda_dsp_common.c:17:0: style: The function
> 'hda_dsp_hdmi_pcm_handle' is never used. [unusedFunction]
> 
> Fix by moving to static inside compilation block.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: hda_dsp_common: use static function in conditional block
      commit: a3f18f82a2baf7b4fe434b96ad644a541e6c8c12

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
