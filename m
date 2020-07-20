Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29F22636B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 17:35:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ED701607;
	Mon, 20 Jul 2020 17:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ED701607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595259316;
	bh=U8BjP3XmZshFoqQV0oQtOilzNMqlfZ6xzp4J71jzAdw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UgpKCXCeUBLI9mTr6XsHTzbeIiAvPqPrV7d6itJZj/UdBRMDq0aL8DwIUq+FoddMf
	 74QxFppGumGLCjpx7yy7NejRtInHB2uZ+VdAbE+ybKcn2/nOycqheOtqT2x/kygL/2
	 +CIB37ecIH59QPIme4K3LVPw6pyVk8/75NxNCi9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B204F800CE;
	Mon, 20 Jul 2020 17:33:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F29CCF800F5; Mon, 20 Jul 2020 17:33:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77BDEF800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 17:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77BDEF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="it1bk0iG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1946822482;
 Mon, 20 Jul 2020 15:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595259176;
 bh=U8BjP3XmZshFoqQV0oQtOilzNMqlfZ6xzp4J71jzAdw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=it1bk0iGaEVdc5HKpt4vqw8MFp7eiAcLERL0su/keoLMfXHsOIXZRWGPW3ZBh0wGW
 oUO6KAgw1QrqB6aevz58ek7Ulzk0yhf1kVUWxY/3zqeeKp1s8yiAVdk8EuK0RouDAy
 S0IstsZij9h4Cf5mUX34gX7FFB1EGQrjcTMwNX54=
Date: Mon, 20 Jul 2020 16:32:44 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
References: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: Intel: machine driver updates for 5.9
Message-Id: <159525916427.51283.12850898284536870609.b4-ty@kernel.org>
Cc: tiwai@suse.de
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

On Fri, 17 Jul 2020 16:13:31 -0500, Pierre-Louis Bossart wrote:
> Small patchset to harden the SoundWire machine driver, change bad
> HIDs, update PLL settings and avoid memory leaks. Given that the
> SoundWire core parts are not upstream it's probably not necessary to
> provide the patches to stable branches.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw_rt711: remove hard-coded codec name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: sof_sdw_rt711: remove hard-coded codec name
      commit: 1f891055c7d0ce665247c09e97db927f2db37ce7
[2/5] ASoC: Intel: sof_sdw_rt711: remove properties in card remove
      commit: cf0418cd06ce42fcf35beb33e315b5a77e596926
[3/5] ASoC: Intel: sof_sdw: add support for systems without i915 audio
      commit: 15ef2ea035db7bcb9a9d0bf3747fbb7dde67dd97
[4/5] ASoC: Intel: sof_sdw: avoid crash if invalid DSP topology loaded
      commit: 6b540ac763e9d11506ec1eb6b0fadc70292bb4a6
[5/5] ASoC: intel: board: sof_rt5682: Update rt1015 pll input clk freq
      commit: 0d95d06a7aae38f3bd61582e00f0cc06b35ca0ab

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
