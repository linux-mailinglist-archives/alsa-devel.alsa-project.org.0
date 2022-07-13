Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344E35738E3
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEAE81741;
	Wed, 13 Jul 2022 16:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEAE81741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722726;
	bh=m65ju1eBUrKQs14mEqgPvnSbDjpwIWUCfEMPByfIU5g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXu1kqlIGTfz0nn9j+ZTD1D/WgdfmyZlhGngNVJkHino3oZhRYeErJPSyn3NjsJew
	 0iyjHlCgaKkR5cjWtlnlrKqn2pBCvnC0krqh7c+UtRVryrCKSaB8aBIruK3m0hfUhi
	 /+4PT8Dff/8bq4iRqdEEhrbg7PWTdQjDpwQq0b6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E89CFF80542;
	Wed, 13 Jul 2022 16:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75FBBF80249; Wed, 13 Jul 2022 16:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2DE6F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2DE6F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qZ4xj6xG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2789B82018;
 Wed, 13 Jul 2022 14:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45C2C34114;
 Wed, 13 Jul 2022 14:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657722657;
 bh=m65ju1eBUrKQs14mEqgPvnSbDjpwIWUCfEMPByfIU5g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qZ4xj6xGMqoovXDCeentESv+5VY55WwldlwuwIy312351Ae85knj5+iPjhTU2Z007
 s9atahdoGkG38VyoD80QGqf+L3wd/K00FEaQhp5wLC9RgqlNV4ovyLMbCBapmv2vBV
 NhVg7uBUdrEOnnwmjBKnBIBpAkBI0sX/Qjd1bBq4YTK9NSe5oN5V3w8avrYFreEZ3L
 f7IC6n8l/64WCJhG4iiY8BhZu/EkTszyyri6YSQBPYfY54wPjXRYhObMCO426Bg/oM
 G7GOwwI2fLEi2H0wyofVdIs+N6gOu7Hm9AcZ0fLfuULeDwOsXxJReaws2EDLVFfkF7
 WRpbjQL3QqHnQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, dan.carpenter@oracle.com
In-Reply-To: <Ys2IRPHWGIwuVs21@kili>
References: <Ys2IRPHWGIwuVs21@kili>
Subject: Re: [PATCH] ASoC: amd: Fix error pointer dereference
Message-Id: <165772265539.116109.6232452976191452367.b4-ty@kernel.org>
Date: Wed, 13 Jul 2022 15:30:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 yang.lee@linux.alibaba.com, Vijendar.Mukunda@amd.com
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

On Tue, 12 Jul 2022 17:42:12 +0300, Dan Carpenter wrote:
> The "gpio_pa" pointer is an error pointer, there is no need to try
> put it.  Calling gpiod_put() on it will lead to an error pointer
> dereference.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Fix error pointer dereference
      commit: 73acfba792b06156b7c805162fcd89fdb71646f9

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
