Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5D21AA33
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E844015F2;
	Fri, 10 Jul 2020 00:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E844015F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332187;
	bh=M2IRYx5B2G47zZ75rzHgCflaQlxzTPG+cp/pib1BpPc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BG2dzusdvrCaT+AY9Jub00jUq/wFVCNldpvml/89RuqPsxaluU/HqcF87jpTpxNQj
	 TJkR0nJtjx3hKKa5OreT+C4VIdf73Li7xi43utVBMGrRalT12yVnFwsKQGbYQHvLsT
	 yrtw0rXonYEhGZrwZ8L4QQdfwwrJC2ClpeQE5lJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E73F802A9;
	Fri, 10 Jul 2020 00:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC46AF80264; Fri, 10 Jul 2020 00:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21C11F800AE
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21C11F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xHlguaxF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 216EF2067D;
 Thu,  9 Jul 2020 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332018;
 bh=M2IRYx5B2G47zZ75rzHgCflaQlxzTPG+cp/pib1BpPc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xHlguaxFs2WNV0cRO13zBFeBTtZF6Jrigy4sPWtP1XgrbQ+oIJM5Na9B0vM9ixZAS
 0vRN7lYWbsvcnBQvvQUdw183EY0dDqCpbCpMecCw2UitcaYwwA/RpbaJr5MjI6t+BK
 wdA4CJGkW5ybDWFqXyD246+vP/mKgEmYWPOZARVg=
Date: Thu, 09 Jul 2020 23:00:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200708203215.231776-1-pierre-louis.bossart@linux.intel.com>
References: <20200708203215.231776-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 0/4] ASoC: codecs: add MAX98373 Soundwire driver
Message-Id: <159433200031.57213.11822067307645919238.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Wed, 8 Jul 2020 15:32:11 -0500, Pierre-Louis Bossart wrote:
> V3:
> Rebased on top of two fixes already merged from the v2 patchset - no
> code changes
> Added explicit commit reference in last commit message
> 
> V2 with a number of cleanups:
> split between I2C and SoundWire modes, as done for rt5682, and updated
> Kconfigs.
> removed useless initializations common to both modes
> removed idle_bias on
> fixed register classified as volatile in error
> fixed SPDX comments
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: max98373: split I2C and common parts
      commit: d7ee0c722117a6a0830637a3408f2ce1b78afedd
[2/4] ASoC: codecs: max98373: add SoundWire support
      commit: 56a5b7910e965c6905d112ce94fd9a9f5561f326
[3/4] ASoC: Intel: sof-sdw: add MAX98373 I2C dependencies
      commit: cb468cd5b9e1e1337fe4e9a3255892760d5c83ad
[4/4] ASoC: Intel: sdw_max98373: add card_late_probe support
      commit: be3afa120c5f8131ff835a270247b0a9cca0138a

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
