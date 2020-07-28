Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B561230F58
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:33:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B421704;
	Tue, 28 Jul 2020 18:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B421704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595954011;
	bh=fu8BQVTYRHqSDmcTdXV9xFLRNxBetsC48Rb8C5QDh1I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aG5eXy90hVxYDuEduWyXRSdmi7Fd0+uoyUV/NkdGw8iWb96k5dXBKHZj98d8uhZ8z
	 lbZGtjLWukR3ZSDHFzebJbw+s3MquVO6ZOjFlJppbf7iWu1IJ1gXi7DjbMBLB08ya/
	 OIUiBk+1RKa65hJM0nLiB7IheYYq/BBVAj55RxWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05760F80256;
	Tue, 28 Jul 2020 18:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D224CF8021E; Tue, 28 Jul 2020 18:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48C8FF8021C
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C8FF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1YLaHe37"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9AB31207F5;
 Tue, 28 Jul 2020 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595953856;
 bh=fu8BQVTYRHqSDmcTdXV9xFLRNxBetsC48Rb8C5QDh1I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1YLaHe372Df4C+OmkxB5LvO5WUv8a1r0Fc2ygts+NDilE1mBLB0Qa2mew3erHtD/a
 znZjKHMvBz8onC8sp0PX72hzzzT09WCgvyw9UYf4RQYPUOa4m3UsPF0dh3LwDrMd7g
 lzVZ14g6bA1GRiI9uEyt97Yskg9kGXN5f+tefu6k=
Date: Tue, 28 Jul 2020 17:30:37 +0100
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, perex@perex.cz, Dan Murphy <dmurphy@ti.com>,
 lgirdwood@gmail.com, tiwai@suse.com
In-Reply-To: <20200723160838.9738-1-dmurphy@ti.com>
References: <20200723160838.9738-1-dmurphy@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: tas2562: Convert the tas2562 binding
 to yaml
Message-Id: <159595383113.15027.14495128108452214806.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Thu, 23 Jul 2020 11:08:37 -0500, Dan Murphy wrote:
> Convert the TAS2562 text file to yaml format.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas2562: Convert the tas2562 binding to yaml
      commit: e35cf9f5edb18fd9daf1c6ba7a89f463334526c4
[2/2] ASoC: tas2562: Update shutdown GPIO property
      commit: f78a97003b8babb1c49e2e4a6b46f15ac31ecf49

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
