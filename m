Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 935AA50E73B
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22F341828;
	Mon, 25 Apr 2022 19:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22F341828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907678;
	bh=TdbF34bVczHz6zHafzOdQRaqX+OK0hUb4N/hiYwOEGY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n5gPDvHkT/2WbyT3xu4s6ySrXsdf3FiN/pwn8Hd70RmtucQiwIhqJdbdAqZGtPs/X
	 k/sXZhlKbGWoA0mRLNRWThgAeKv9bjnipdgnuFDzk9T6ksD+jbkixyLQ6vJi+cm36Z
	 uTzFGmad9Hb+0m0aVQq39HJYvXpycJQt6pBH43Wc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A457F80542;
	Mon, 25 Apr 2022 19:24:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A3B2F80536; Mon, 25 Apr 2022 19:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E84F80519
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E84F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k60uL/HO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C6B061583;
 Mon, 25 Apr 2022 17:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A88C385A4;
 Mon, 25 Apr 2022 17:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907469;
 bh=TdbF34bVczHz6zHafzOdQRaqX+OK0hUb4N/hiYwOEGY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k60uL/HOrPbSAe86WPWmvHYC+m/mXOB5TjBz2ifTYICwcpHDy1OxwASbeaQQXcPZq
 C3ZbnleM5+U2iNetBMc+BzxHJxiPEF0jf768VU2Fn1W49tmPTR+GqXTjUaZSNEL4xj
 Dj3HWRlWnC0aaXZJ/gEX6OZlPupvDSM1NnVEJjGEyYlGM+XUYJ4RWP3wNZTZBWQhQ2
 R/oMrZKaB82EWHUxuTlOCq/e+pqKK0rX6ZMZIKX32+pScpmRgv0PwQepp+ciWa8YH6
 z24e7dOpGcdDN3jPOPjOlMz840Md3kYJB5gp4qYMBUjc9xv06tAUnpLZptNwa50dpJ
 FdL/O/DChvP1w==
From: Mark Brown <broonie@kernel.org>
To: amadeuszx.slawinski@linux.intel.com, lgirdwood@gmail.com
In-Reply-To: <20220425091646.545216-1-amadeuszx.slawinski@linux.intel.com>
References: <20220425091646.545216-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: avs: Enable AVS driver only on x86
 platforms
Message-Id: <165090746743.583823.7445358807859458308.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Mon, 25 Apr 2022 11:16:45 +0200, Amadeusz Sławiński wrote:
> Only supported platform for AVS are x86 machines, so there is no reason
> for it to be enabled on other architectures. Allow exception for compile
> tests.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: Enable AVS driver only on x86 platforms
      commit: 47a1886a610aca6a55c18ee677f9176e73162e97
[2/2] ASoC: Intel: avs: Depend on SND_INTEL_DSP_CONFIG
      commit: 5755d0f63c677b8b63b82dceacd26d96617e3ba8

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
