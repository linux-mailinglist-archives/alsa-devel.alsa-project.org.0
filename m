Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1797425F4E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81D27829;
	Thu,  7 Oct 2021 23:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81D27829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642815;
	bh=RUK0kPmHAOwiyfYYe+mPAhOc9DXX1luwgMqnlpuewis=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LYXDcShPt0/9rqw9O34KDo4NEesz9fyJru2hMoaUd9ZdWN65hRwClTNqcFGv02r11
	 tVjmKNOpuCwyK8SYM1sNFFcJcK9cSyN+S3Ta/W+sEgVHkPH+KmW1uPMmYOs48gNECQ
	 uDXiUL1s67QXhqA9sl9f2zcK9/mqwGTZ1j/IGUDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9375F804E0;
	Thu,  7 Oct 2021 23:38:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 141D9F804ED; Thu,  7 Oct 2021 23:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3599AF8027D
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3599AF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bky+hSk1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF2FF61152;
 Thu,  7 Oct 2021 21:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642667;
 bh=RUK0kPmHAOwiyfYYe+mPAhOc9DXX1luwgMqnlpuewis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bky+hSk1pXSFDlknPO5K1ZVCm7ONjtvUy1WUgxq2PlDMFy33iR4Cesoss4nyTIcud
 Y64940WlXiX7C80VtmeuC+mO9CX7vmUzuwncx5TbOqfp6jmWQ7OYupIshAeG2zeAPg
 Mo8BaRQUauvNr8Ie12ot72Wh30Cxzig8SbcrGP9DkncCbhb6bxSuBaBQOBl42P14mF
 02AoHWxV3suPP18Dz/Ejz1TTiwmRjZuO6UOtzDQve3NBBvPx03g2WBlleIJmngUOwd
 kSN6BQaUO4MJLi4MsQxf+WLAR6QbMCKoaNBEd1bEBu2HNnDhcFZeqtvPdn80msSiyj
 cN2nuO7gTkIUw==
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
Date: Thu,  7 Oct 2021 22:37:25 +0100
Message-Id: <163364264608.649699.14383378670565096509.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
References: <20211006150428.16434-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

On Wed, 6 Oct 2021 18:04:25 +0300, Andy Shevchenko wrote:
> Access to platform data via dev_get_platdata() getter to make code cleaner.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: bytcht_es8316: Get platform data via dev_get_platdata()
      commit: 2577b868a48ef3601116908738efbe570451e605
[2/4] ASoC: Intel: bytcht_es8316: Use temporary variable for struct device
      commit: 6f32c521061b704c0198be3ba9834f5a64ea5605
[3/4] ASoC: Intel: bytcht_es8316: Switch to use gpiod_get_optional()
      commit: 10f4a96543b744c8cc7ef8b0799af21d911dd37d
[4/4] ASoC: Intel: bytcht_es8316: Utilize dev_err_probe() to avoid log saturation
      commit: c25d4546ca452b2e8c03bc735e4c65bc6dd751dd

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
