Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AFC1B5E37
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 16:47:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFA9169A;
	Thu, 23 Apr 2020 16:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFA9169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587653261;
	bh=ouaLyaFaXouhSIb+wrWnSlt9DqALrAhjlqjCElpgS7g=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kZ7moqdT+KUXzjuuhhjp98rbWp1BbCwsBZhQX1xhchVYTpUUKv/OLUIvoJvkUOL2e
	 0J3WfdwHPGboOiinIL3tDW8Cy6sUCZbeoM9LYlYYLZzJs9tmET2lSUnxZEu7zSMoP1
	 bKJziF0jdonbIZ/q5+bO14swQ94cWe9mF0Ok7ELc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E92E8F801EC;
	Thu, 23 Apr 2020 16:46:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09985F801EC; Thu, 23 Apr 2020 16:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68E50F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 16:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68E50F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mo017Odn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA8F92074F;
 Thu, 23 Apr 2020 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587653150;
 bh=ouaLyaFaXouhSIb+wrWnSlt9DqALrAhjlqjCElpgS7g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Mo017OdnUQuNzRU/DoH52zW/Bx1O1/3BpXiiCet5NjjUSD6ySgyWo3uyf6w2wU357
 W3lJ2nnoy8Wf0At10D3aNn/4uo2PKVh6XztYcf1Fjl9kmCvZvNgu12PVoT7GmDt4qn
 M8Dh5kFbl5xRMU3NitZh2o7l7yB62evy9eY4nPhs=
Date: Thu, 23 Apr 2020 15:45:47 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
In-Reply-To: <20200422130443.38815-1-andriy.shevchenko@linux.intel.com>
References: <20200422130443.38815-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1] ASoC: Intel: Skylake: Replace guid_copy() with
 import_guid()
Message-Id: <158765314784.33774.15097394581404247333.b4-ty@kernel.org>
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

On Wed, 22 Apr 2020 16:04:43 +0300, Andy Shevchenko wrote:
> There is a specific API to treat raw data as GUID, i.e. import_guid().
> Use it instead of guid_copy() with explicit casting.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/intel/skylake/skl-sst-utils.c | 2 +-
>  sound/soc/intel/skylake/skl-topology.c  | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: Intel: Skylake: Replace guid_copy() with import_guid()
      commit: cade2f59e7ae3d1ccec9c1e0e971308ca6a74296

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
