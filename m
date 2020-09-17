Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECB26E4F9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E598A16AD;
	Thu, 17 Sep 2020 21:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E598A16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369469;
	bh=XKnazpfmRK7Z8j3eyFrJRLYU8mkw0ZAcQ1dMq+PPpVU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y7sPi08RO+izcWFnqYW4ASSZfmU6RKOJUm0Ki/ZMEaAR0Ie1p+914hvq0At9bGU0D
	 hUZauR71PjhfA2t4yWDLnCQzgrl3u/+PbrTC5a2uYFJjvu9xDR3mwYhttwDMrmWUIN
	 wZA38A2OgpU2/2Hbd8TrJIOnn4cBVZb25YLe2phE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29820F80317;
	Thu, 17 Sep 2020 20:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 551FDF80321; Thu, 17 Sep 2020 20:58:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF369F80317
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF369F80317
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GI21qcXE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D67AB221F1;
 Thu, 17 Sep 2020 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369108;
 bh=XKnazpfmRK7Z8j3eyFrJRLYU8mkw0ZAcQ1dMq+PPpVU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GI21qcXEg+RVsZ7JgoRVYBzO4tZIcIjM9M7rL8mXnsr9jaw3pah3t+yPhmqutdDau
 ACQtlPA8Z3M/9OOEeOuebD1raviy0FpK7A53FbkpdUwu7r9dFNPUoWigcUzjaKh/WS
 GQ57WUwN3nOmcqldV9cD49Op4PMzPYgfpnymV66A=
Date: Thu, 17 Sep 2020 19:57:38 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200915190606.1744-1-dmurphy@ti.com>
References: <20200915190606.1744-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/6] ASoC: tlv320adcx140: Idle the device while writing
 registers
Message-Id: <160036900934.20113.7109708512695608892.b4-ty@kernel.org>
Cc: camel.guo@axis.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Tue, 15 Sep 2020 14:06:01 -0500, Dan Murphy wrote:
> It was observed that if the device was active and register writes were
> performed there were some unwanted behaviors particularly when writing
> the word length and some filter options. So when writing to the device
> the device should be placed in sleep mode and then exit sleep mode once
> the register update is complete.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: tlv320adcx140: Idle the device while writing registers
      commit: df16e2210454ca0b8a59caf364dd287fbb76a804
[2/6] ASoC: tlv320adcx140: Fix BCLK inversion for DSP modes
      commit: 244ac15de75ca62ed7a09c7291b67aeead9e12ac
[3/6] ASoC: tlv320adcx140: Add ASI Tx drive
      commit: 38b9b7ca6f08489f3065e081e71c743775ed50c8
[4/6] ASoC: tlv320adcx140: Add the config to configure Tx ASI output
      commit: 42d5031d3ee858bc14df704439eefdbf38b8f628
[5/6] dt-bindings: tlv320adcx140: Add slot programming property
      (no commit info)
[6/6] ASoC: tlv320adcx140: Add channel slot programming
      (no commit info)

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
