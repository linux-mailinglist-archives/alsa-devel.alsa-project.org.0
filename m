Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9B1E841D
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 18:53:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A863917B4;
	Fri, 29 May 2020 18:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A863917B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590771218;
	bh=+FjkK7Ut3sfDr3so3hIlmM+NPksfhBFosBw2ovvITG4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HoHC7XXzqBGZ+9yWZVmd1+7/HtkaQ2rVC3NjAyu2CcMW0BaMaQqvrZDm7VmYk+qx6
	 9S4PccVHQU3C1hQrlNRppZIH2h5qqI9EIdxMg0PI1b/qpBmYrURn2YFFe27CwLMt/m
	 VZeAAbvGtPoKJk/O+eKwSBm5tpE5QBMxoa0PDsqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5738F80149;
	Fri, 29 May 2020 18:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5D54F8026F; Fri, 29 May 2020 18:51:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E975F8016F
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 18:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E975F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="whQKodd4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C7382077D;
 Fri, 29 May 2020 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771070;
 bh=+FjkK7Ut3sfDr3so3hIlmM+NPksfhBFosBw2ovvITG4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=whQKodd4Kb4fMXQHsLe64gocdNeTST9IfrTwQth54NS61TF1eIDrsN8814Mz5qF0O
 ss01ABNkjQROES0rwqM+ydPx9aWsC/qtx/6sbgC3iDioYCLIUwNVcl1BRw6WshwLdt
 n6UE9pjoh6lDzRVRemqTPlY1ZmOPMxw8nRM9lXkY=
Date: Fri, 29 May 2020 17:51:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200527022801.336264-1-yang.jie@linux.intel.com>
References: <20200527022801.336264-1-yang.jie@linux.intel.com>
Subject: Re: [PATCH v3 0/2] ASoC topology header parsing refinement
Message-Id: <159077105219.28617.1070908875891848465.b4-ty@kernel.org>
Cc: cezary.rojewski@intel.com, tiwai@suse.de, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, sathya.prakash.m.r@intel.com,
 vamshi.krishna.gopal@intel.com
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

On Wed, 27 May 2020 10:27:59 +0800, Keyon Jie wrote:
> This small series is to optimize the header logging during the topology
> parsing. This is verified work fine on both SOF and SST drivers.
> 
> Change History:
> v3:
> - Remove using the separated soc_pass_load() function and merge it to the
>   soc_tplg_load_header() body.
> - Add more Tested-by tags.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: topology: refine and log the header in the correct pass
      commit: 82ed7418736ded9c24529987d5aa9a39c185e4e9
[2/2] ASoC: topology: remove the redundant pass checks
      commit: c2cbd0a7194d05be501fe2cb48bcd10ff468aa87

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
