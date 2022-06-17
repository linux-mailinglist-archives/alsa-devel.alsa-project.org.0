Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754954FCEC
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 20:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4391C1B5B;
	Fri, 17 Jun 2022 20:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4391C1B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655490840;
	bh=wJ8m+U7bXtXpjDViEgaXUZF8uJPWXrn0WCnK4QYVJ6k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVK1RuLUFCRshnTT1RVfBtZ4zm2hBAvwhbXsjZAVTkH9B1CfZE6KaRWrTmiVevhMU
	 dRnjmTsEPWlfWi56zKK9oYjvmNxay0W0KyljJZTZPNVjpmmSFOaxoJ0tuRaFdkkmrU
	 4GN1MPGymk8YvoBTnOTx5pBpiaJeQ5ZjjlCPBAvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A36F80529;
	Fri, 17 Jun 2022 20:33:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3519F80528; Fri, 17 Jun 2022 20:33:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6614F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 20:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6614F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rkxbNg0x"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4903A61F63;
 Fri, 17 Jun 2022 18:32:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F97DC3411B;
 Fri, 17 Jun 2022 18:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655490774;
 bh=wJ8m+U7bXtXpjDViEgaXUZF8uJPWXrn0WCnK4QYVJ6k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rkxbNg0xHZxeiHD1lFaSencUc+ktGPSRX/x6NYdi1W0tfCoMKoGP+IiFIdcVe7z56
 VIGw8gsKeD0qEIjUXpsw8Fs6JlphVGZCZJnq54QBqf1y8HMZvdBWR57VTLcggnp3rC
 r3XMOwjH2MtYcubBv1lsgsjl6WGrgwRryV84qpoqWgtBui5F7L0wrxNu0ytun0QBOl
 LIbpjA+uIooenxybZXAmLjUjuZ43/8kyFsfmRUqNCyOSzCLS1uggxullNMTpaldVQb
 rCQ4Qr7eYLD/0cJSMEvIEtWAvUW6OipQNrV/pPf8e+S4MHzwNj6to5zqV+pC4kooWo
 ZVC+67s6drVNg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220616201953.130876-1-pierre-louis.bossart@linux.intel.com>
References: <20220616201953.130876-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Fix compressed stream position
 tracking
Message-Id: <165549077336.980434.1154464970984445674.b4-ty@kernel.org>
Date: Fri, 17 Jun 2022 19:32:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Thu, 16 Jun 2022 15:19:53 -0500, Pierre-Louis Bossart wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> Commit 288fad2f71fa ("ASoC: SOF: Intel: hda: add quirks for HDAudio DMA position information")
> modified the PCM path only, but left the compressed data patch using an
> obsolete option.
> Move the functionality in a helper that can be called for both PCM and
> compressed data.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Fix compressed stream position tracking
      commit: a37a9224d0500f0cf5bf13cb225163c21b29e0f6

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
