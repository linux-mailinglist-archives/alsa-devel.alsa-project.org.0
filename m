Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0726E4DF
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:01:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA1416A4;
	Thu, 17 Sep 2020 21:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA1416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369267;
	bh=uQL/O+dIRBcVS0wEYhmb9uUButshwPZ/YTlprzgtQeM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8x6baRMYs984uKuW5OEwmPHl4MKqCybQZo5bp5HFMVTJKQ/1jkmzlrHWheHw9B/W
	 YuBBX5s3t6ImYNJC4Gyf+uaPl7jKXpHfpCyoxOIxtvD8FcDVu4yjxwj9LcIyVWVrKV
	 MyEqGl6SYaqjJtaBPD1mRbu2phnpayQvHNBikWO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C402F802DD;
	Thu, 17 Sep 2020 20:58:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11F48F802DC; Thu, 17 Sep 2020 20:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A398DF802BE
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A398DF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FAnInw9q"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B214221E3;
 Thu, 17 Sep 2020 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369075;
 bh=uQL/O+dIRBcVS0wEYhmb9uUButshwPZ/YTlprzgtQeM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FAnInw9q2E3d5j/MkfJqcZV9I3ZYoMkBNCDCcRyViZXt+52pkBcumPTIyjKZAWLQo
 hABqixID7pcQTffpa2EYfa08SUqJqd97KOgcqgPO9T53pm0PjGGN9Ffwcgt+jux8jN
 POyPk2bFRslZAEHbynGbz9Vn21zQlFX5TDPWCvFc=
Date: Thu, 17 Sep 2020 19:57:05 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: SOF: small fixes for 5.10
Message-Id: <160036900934.20113.14063684004477951915.b4-ty@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com
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

On Thu, 17 Sep 2020 13:56:25 +0300, Kai Vehmanen wrote:
> Series that adds debug support for IMX platforms, more details to
> FW version information, adds missing -EACCESS handling to
> pm_runtime_get_sync() calls and a set of minor cosmetic, trace
> verbosity and coding style issues.
> 
> Guennadi Liakhovetski (3):
>   ASoC: SOF: (cosmetic) remove redundant "ret" variable uses
>   ASoC: SOF: remove several superfluous type-casts
>   ASoC: SOF: fix range checks
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: SOF: imx: Add debug support for imx platforms
      commit: 18ebffe4d043bf5f3a9b669d8d91f855bde8f6b7
[2/8] ASoC: SOF: Add `src_hash` to `sof_ipc_fw_version` structure
      commit: 6eab771472af50e11a484d56ba444e2ec82e9126
[3/8] ASoC: SOF: debug: update test for pm_runtime_get_sync()
      commit: 7db6db9d1a4a7864cd2557e983e06f3adf788c6a
[4/8] ASoC: SOF: control: update test for pm_runtime_get_sync()
      commit: 99ceec5ca0cb29e3b1d556d108ddc54654377792
[5/8] ASoC: SOF: (cosmetic) remove redundant "ret" variable uses
      commit: b9f8e1387cf0c9911b26c9d1fca84605d923de66
[6/8] ASoC: SOF: remove several superfluous type-casts
      commit: db69bcf915a37d7b8e54acf5f67d09d8159eb616
[7/8] ASoC: SOF: fix range checks
      commit: 0e4ea878708be903566ad93d4972ad3dd4c1c30e
[8/8] ASoC: SOF: Intel: hda: reduce verbosity of boot error logs
      commit: 776100a4ce6da8f7fa451509e46852d69c2162a8

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
