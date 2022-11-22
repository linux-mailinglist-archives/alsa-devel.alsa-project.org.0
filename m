Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F70563400D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 16:22:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1613415DC;
	Tue, 22 Nov 2022 16:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1613415DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669130558;
	bh=pv6DHXbCL6yXysk9sSNTTSvzWcnaP+5o92VqM7YT5x0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWl28y7jggfnGkXvneX8KzBd758+JT94qUmIu/Q5l9mu3BX0mLWVS7V+QfAvFx6Gq
	 iZ/niBSFfvxUftbv+Z70tX2f+qkLCOJPMEpAPn+RCIaHPw8ESqw812453OnKwCxEBT
	 QN6nIiejzTi3+TubQ0Lz9/lBsCLo4MFcNw3QmhLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CFDF80310;
	Tue, 22 Nov 2022 16:21:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCCA4F8026A; Tue, 22 Nov 2022 16:21:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC6DF80149
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 16:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC6DF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C8WiWx0e"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 773ADB81BE0;
 Tue, 22 Nov 2022 15:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E19C43470;
 Tue, 22 Nov 2022 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669130497;
 bh=pv6DHXbCL6yXysk9sSNTTSvzWcnaP+5o92VqM7YT5x0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C8WiWx0eXTtq5HcfFIVWcq5XEBuExn7zVfzOr/ttXArBcLCqCX6NS1cvsQjgYNzUV
 53E+s2sMfqHp4+eoVCgu2bh/WEWS5MFaD/axGnafvIlGce2tdj2kOX9p73zCGvrShn
 pxIuvBQx+sfPsHj44SaU3LycplUwXuz+iS/eS0Y5TLInQzcxAEXLQOme260LSEiqj/
 wzOsW+SdcO91XtHCK0AA/5oeo0jdCxn96QtOmwcGLJ+ndZdkdAe2NH4xtZIQiyQRwq
 CutMv4DPalPxZemMeQrg8K1MXhZnbauG4Pk/rcP7wzoPlvafSpv0ax3RL1trL4CPvL
 zaOfNZxRdNjXw==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de
In-Reply-To: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
References: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: add Dell SKU 0C11 support
Message-Id: <166913049539.240207.17364087478344074974.b4-ty@kernel.org>
Date: Tue, 22 Nov 2022 15:21:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

On Thu, 17 Nov 2022 08:27:55 +0800, Bard Liao wrote:
> Add Dell SKU 0C11 support with rt1318 codec.
> 
> Gongjun Song (3):
>   ASoC: intel: sof_sdw: add rt1318 codec support.
>   ASoC: Intel: sof_sdw: Add support for SKU 0C11 product
>   ASoC: Intel: soc-acpi: add SKU 0C11 SoundWire configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: intel: sof_sdw: add rt1318 codec support.
      commit: 8c4b3a8ea2c04d7979f378165e5c3dfa270659b6
[2/3] ASoC: Intel: sof_sdw: Add support for SKU 0C11 product
      commit: d84e10da17e7fc07e758a8b8f1fd6150bcd8ba08
[3/3] ASoC: Intel: soc-acpi: add SKU 0C11 SoundWire configuration
      commit: 0050e3d3d43db6a60b96eb8cbd2b9bcb0cd5db17

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
