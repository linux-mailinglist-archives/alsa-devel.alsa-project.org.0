Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C2A49B144
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:25:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3C2A280D;
	Tue, 25 Jan 2022 11:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3C2A280D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106304;
	bh=Z+vFeoPhCrp2cIP4w8FEaQQ4f4PeWG4p0BpqTYQ/4xw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pmR844WIGtAeQA/icIUfqeQgonU1Sh7M42WEVsGHBm5eyv5a1Q3+SJqEePG/B76FU
	 gDavJHgoFhhg+PI07ZZTFOoLg+Pi+NfLoTuPWJRbu4UfTpaJKIqSm4A+zEF08fb9/z
	 V+mHdwrUsD+vJLeATl9mBj61Ve+nW+65irGSoxYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8262BF80566;
	Tue, 25 Jan 2022 11:20:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C672EF8053C; Tue, 25 Jan 2022 11:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85F7CF80534
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85F7CF80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J+MoNDkI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 998D861636;
 Tue, 25 Jan 2022 10:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954F4C340E0;
 Tue, 25 Jan 2022 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106035;
 bh=Z+vFeoPhCrp2cIP4w8FEaQQ4f4PeWG4p0BpqTYQ/4xw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=J+MoNDkIh6spoqi782LHkC3HNWTLT9nSSGCDkzI4FXW8I5zjxqkMn5oyEU6Lf8YsV
 M7X119CLoqV4PE59loq5ocoUNyJ8CjNxMTm4g0RTIHUOT182uptH2AiB8k5EwzZcMj
 ifHem/jPhT8g0JrdPhuCrW4iuhoEbg0ZepocRUTEMYBEuQzrtAAcER7MAf76I9pGuW
 gO9oQ2c9BtU8AwLVAo+SvrmJn45gn9FGQVxAEEHFJCRIhLp3HjQLlg1Je2QWjK1PLH
 NTT5wzlLhbMu6SNhEQLaq+WHyivAIpADZp1MsWcttdGOwl3bPWhWVTFYHM1aC4yj+t
 ZDvUO0Fy+40ww==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
References: <20220120232157.199919-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: improve SoundWire _ADR handling
Message-Id: <164310603433.74844.11884238660727093855.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org
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

On Thu, 20 Jan 2022 17:21:55 -0600, Pierre-Louis Bossart wrote:
> Make sure the device version is taken into account when selecting a
> machine driver, in addition to device manufacturer and part_id, and
> simplify code with a macro.
> 
> Bard Liao (2):
>   ASoC: SOF: Intel: match sdw version on link_slaves_found
>   ASoC: SOF: Intel: Compare sdw adr directly
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Intel: match sdw version on link_slaves_found
      commit: f67c0c0d3b9048d86ea6ae52e36a2b78c48f265d
[2/2] ASoC: SOF: Intel: Compare sdw adr directly
      commit: 7afed13b582b0c3c2a283642fcd87e0db0134f39

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
