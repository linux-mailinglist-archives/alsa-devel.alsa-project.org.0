Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E32DE2B6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 13:20:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1090A17A5;
	Fri, 18 Dec 2020 13:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1090A17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608294055;
	bh=9kNe8C8PSo4rr3n8SgIw9xoT5taqQecbG2EBbdPdgqE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/LeMKcdnwivTk23XC+htRXgp1ZcYjX/MKFDKuzI4pGmIIoSoxgw/q7JOziGUGk3u
	 Ud13cVARFnhvlZ0e0vCXHLJAcSrbSRGqcrPIg/jFLgrZHVil8rlhmos2FDnb26uPMn
	 iIcBGI+VPsy72ltOddKXdKVzMmbXjeOWY+n2KfnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69621F804FA;
	Fri, 18 Dec 2020 13:17:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4936F804D6; Fri, 18 Dec 2020 13:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A45CAF804D6
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 13:17:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A45CAF804D6
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20201217074556.32370-1-yung-chuan.liao@linux.intel.com>
References: <20201217074556.32370-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v3] ASoC: max98373: don't access volatile registers in
 bias level off
Message-Id: <160829377017.10885.108778143464822701.b4-ty@kernel.org>
Date: Fri, 18 Dec 2020 12:16:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

On Thu, 17 Dec 2020 15:45:56 +0800, Bard Liao wrote:
> We will set regcache_cache_only true in suspend. As a result,
> regmap_read will return error when we try to read volatile
> registers in suspend. Besides, it doesn't make sense to read
> feedback data when codec is not active. To make userspace
> happy, this patch returns a cached value shich should be a
> valid value.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98373: don't access volatile registers in bias level off
      commit: 349dd23931d1943b1083182e35715eba8b150fe1

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
