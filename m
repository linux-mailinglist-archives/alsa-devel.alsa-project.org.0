Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D70C2F4EAB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:30:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E05E1742;
	Wed, 13 Jan 2021 16:29:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E05E1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551808;
	bh=dyauwb24INGNpF0q813+eq0KQ0oxo8bW0ttTQIXtB5s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLH0QwvaZS046cYxoxw9mMySJCZ6Jsk8jwkBhI+z4uOzTcY68j26Xat0530WAIWEL
	 hzBf+XbS1MLdKVaVcLvLl5rc9oZ53fR2soR8ZILE+PoOlDFsTEYFYty3wvyQjm4ils
	 qPwShWxD3soSSds2dmUvfEE4wyeWQYJ/+SWzeduw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF34F804E2;
	Wed, 13 Jan 2021 16:27:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32FCEF804E4; Wed, 13 Jan 2021 16:27:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FDD1F804E2
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FDD1F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kNJwRoXS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D255E23382;
 Wed, 13 Jan 2021 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610551659;
 bh=dyauwb24INGNpF0q813+eq0KQ0oxo8bW0ttTQIXtB5s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kNJwRoXSdtCaNh4a8zxvqHb/iTzgTTK8LuWCdH9f23whKWIXQgMsxPOqvmNo14Qau
 bPvai+BMAJM8VyUCOqvNFTOtZ4//pQKLOjlJJabD8xzodQu3hVNaRmXfDwBTJSSUIK
 UwKQmZb2agG+yZwoPM6B8HfOpa1flznv6H57K/pHFhss3kM8dzEqQu3vJL0wdggJgF
 3GCNA5kau+E5lbVk22ljJpfKv6kJQ9NXgNDe7obS+bTDH8fYHbqLJXt+vQPWHoNyz3
 qyB0jdzfoD0qO1ZQvL9SzFXPTdmRCK2zQSAF7Iu/G7vi4fUTveKd1bDqqJOwNypceT
 xF1NtEw/139dA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
In-Reply-To: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
References: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH 0/2] Enable DMA mode on Intel Keem Bay platform
Message-Id: <161055160365.21623.8772802884649174403.b4-ty@kernel.org>
Date: Wed, 13 Jan 2021 15:26:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, lars@metafoo.de,
 pierre-louis.bossart@linux.intel.com, jee.heng.sia@intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com
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

On Tue, 15 Dec 2020 13:33:05 +0800, Michael Sit Wei Hong wrote:
> Michael Sit Wei Hong (2):
>   dt-bindings: sound: intel, keembay-i2s: Add info for device to use DMA
>   ASoC: Intel: KMB: Enable DMA transfer mode
> 
>  .../bindings/sound/intel,keembay-i2s.yaml     |  14 ++
>  sound/soc/intel/Kconfig                       |   2 +
>  sound/soc/intel/keembay/kmb_platform.c        | 157 ++++++++++++++++--
>  sound/soc/intel/keembay/kmb_platform.h        |   9 +
>  4 files changed, 167 insertions(+), 15 deletions(-)

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: sound: intel, keembay-i2s: Add info for device to use DMA
      commit: 9ddaa1e6181b3d33080f2ed7c27cb0bba819e562
[2/2] ASoC: Intel: KMB: Enable DMA transfer mode
      commit: 11b943c06a1c1baafb0325896e666d77f5ac78b8

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
