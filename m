Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B430A1D7F02
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:46:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6274F1738;
	Mon, 18 May 2020 18:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6274F1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820379;
	bh=jSTUZkWtwSyKaBcbUmAcrmdIRhqb/aHxqvQA4UoYAOw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGLzcYXSYtvIFTwKh7sCPCqtXSmLDuY0MITfjYDUpbBA5NC+7L9m2XuHYBOXUxIWu
	 YJpp8Ihh3BDipJEtxvDahredac0HKCHKH0OjgwyAn6xTGIHh6MSEuOkGFTEYS2OWlj
	 IKvqmkW2YiV4O8x7r3DpvWaRGyDgw4VaTr1VkcQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD98AF802DF;
	Mon, 18 May 2020 18:41:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 982F4F802DD; Mon, 18 May 2020 18:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F67AF802DB
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F67AF802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dL8A1AA6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 294D4207E8;
 Mon, 18 May 2020 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589820096;
 bh=jSTUZkWtwSyKaBcbUmAcrmdIRhqb/aHxqvQA4UoYAOw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dL8A1AA636o0b1p67fAtB6DnGYsy9gh8/W29Ix6Eiqs+obUA0ZqolepSbFxHO/oBG
 PjT3+vny9b/c+0q2UIg4ZbjRzgQO4WxnvZB3A/szf6+vL9I0hHyIhrKv7UuMLm9nmW
 zc+X6tigvmKHt6dvMeRT0+uZaGjJ7UI3NOXlj15Q=
Date: Mon, 18 May 2020 17:41:34 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200515210731.10942-1-pierre-louis.bossart@linux.intel.com>
References: <20200515210731.10942-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: minor fixes to machine drivers
Message-Id: <158982005877.28736.397896609215041664.b4-ty@kernel.org>
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

On Fri, 15 May 2020 16:07:26 -0500, Pierre-Louis Bossart wrote:
> Minor button remap changes, inspired by recent Chromebook patches,
> typo in component string reported by Jaroslav and driver name change
> not submitted in last wm8804 contribution.
> 
> Pierre-Louis Bossart (5):
>   ASoC: Intel: soc-acpi: change machine driver name for WM8804 platforms
>   ASoC: Intel: sof_sdw: fix typo in components string
>   ASoC: Intel: sof_sdw_rt711: remap buttons
>   ASoC: Intel: sof_sdw_rt700: remap buttons
>   ASoC: Intel: cht_bsw_nau8824: remap BTN_0 as KEY_PLAYPAUSE
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/5] ASoC: Intel: soc-acpi: change machine driver name for WM8804 platforms
      commit: 75ac6dce7f03b0714ee5809ff18c4d2bb2db85e0
[2/5] ASoC: Intel: sof_sdw: fix typo in components string
      commit: 9d05a1e50c012368a133152515ee67fd08bea9ed
[3/5] ASoC: Intel: sof_sdw_rt711: remap buttons
      commit: 1f64a08bd5a9a218deb37c03c1e98e9567379698
[4/5] ASoC: Intel: sof_sdw_rt700: remap buttons
      commit: e6d5cb3ba13e6e54d3ac8cdf891d38042b7c36c5
[5/5] ASoC: Intel: cht_bsw_nau8824: remap BTN_0 as KEY_PLAYPAUSE
      commit: 47f98c55a50c26359b25533810da3724f08113af

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
