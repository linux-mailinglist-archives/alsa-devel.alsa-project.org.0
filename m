Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CD248C9A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA00D17D9;
	Tue, 18 Aug 2020 19:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA00D17D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770631;
	bh=ak6+QCL5n29G4GLWbvhUOxpo7V6NC6tHUrZDrPnF8Pc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOtpWt3MX2aN1FkE9JgslHBpeqe/T0SMSXJB/OiGStW2ui4fjnTff/R3WPKqAP9QG
	 FabBm+QAYlyrXmsSp1HqeQhUdKLjrDT9pGxwqdqNEuRGLam0SM6hNxhmAm30KVJEHb
	 odVrY7+hk7xrBHKXS+sc1hyolqloBhca/x4utBdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8181F803AE;
	Tue, 18 Aug 2020 18:56:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6724DF803A6; Tue, 18 Aug 2020 18:56:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8531F802A8
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8531F802A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q4zuPDC4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D82F920825;
 Tue, 18 Aug 2020 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769776;
 bh=ak6+QCL5n29G4GLWbvhUOxpo7V6NC6tHUrZDrPnF8Pc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Q4zuPDC4Obrg7RPGEUput1lScWOndJrBqR+KVJcVRXyS42FLRHADsncbSCT2jMp4r
 1seJ867b9hUM6uZ2/rwGB7e/pzCLsdtgx5NmkHrPnrNbAz5Y3wX6pYIfbKGjsv1yWL
 R6LGyEqG4l9fZGzun99/SOoEWm0UcbzElnd+SLi4=
Date: Tue, 18 Aug 2020 17:55:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
References: <cover.1597164865.git.Adam.Thomson.Opensource@diasemi.com>
Subject: Re: [PATCH 0/3] ASoC: da7219: Reorganise device/codec level
 probe/remove
Message-Id: <159776961932.56094.1814239239605160041.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Yong Zhi <yong.zhi@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
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

On Tue, 11 Aug 2020 17:57:22 +0100, Adam Thomson wrote:
> This patch set reorganises and fixes device and codec level probe/remove
> handling within the driver, to allow clean probe and remove at the codec level.
> 
> This set relates to an issue raised by Yong Zhi where a codec level re-probe
> would fail due to clks still being registered from the previous instantiation.
> In addition some improvements around regulator handling and soft reset have
> also been included.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: da7219: Move required devm_* allocations to device level code
      commit: 21f279f34c212e82f0330697394840898908f7a6
[2/3] ASoC: da7219: Move soft reset handling to codec level probe
      commit: aa5b18d1c29023b315073661b74c67f91bf2f27c
[3/3] ASoC: da7219: Fix clock handling around codec level probe
      commit: 78013a1cf2971684775f6956d5666237ac53a1aa

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
