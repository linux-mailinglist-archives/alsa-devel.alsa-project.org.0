Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F1449B13D
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9696D20CC;
	Tue, 25 Jan 2022 11:23:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9696D20CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106242;
	bh=zLXcxuD3ZkIGicT8Whgipq8GPdiZk/A+XfSraaSJzf4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQTl27DiBlnbgVH6iulD1QH0JV0Q6BOB52YP0kJL1evi++OCf3KRQit1l4l5xfOnz
	 H9pBBufE3TVgLyA4KiEV9uFDvqjqJjZXMkl8VIp1Yv5aToCPzjoykwi4UAS88UYquO
	 PWKiQJ1hwZo+HvDvr/CD5V3NhEp8ygoLrhKPf16M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 474FAF8053C;
	Tue, 25 Jan 2022 11:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B4FEF80529; Tue, 25 Jan 2022 11:20:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F24DEF80525
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F24DEF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y14QzTgr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 451ACB81754;
 Tue, 25 Jan 2022 10:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0D2C340E5;
 Tue, 25 Jan 2022 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106033;
 bh=zLXcxuD3ZkIGicT8Whgipq8GPdiZk/A+XfSraaSJzf4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Y14QzTgrFpXzrWbbcMNOXARwsxeKQH+BQ8VtqaNedCYRr8DFYJ7Xzz7Aa8jsIjz/2
 ER+CvQSJPZ3teCQ4aaPSR1sD3Pqe8lWunBksZ4LPBOOhI9Ipp9qM448349akD+gQXk
 UfgsiG6DSxKYDZtRB/t4dg70ZQAc+ThecgFHsTPnxdbV/RZAa9XFPIsNxn7RR+TZmc
 9NQskfL9LEF7se8uQQeRA4odib58hF8di8HOrRuOJSoMA6ljlef0HeRR7xwQwUnEMo
 i48KG9j0O36y18xOoKTLUsYlk23ynwd98maouW3ps+J4YKOmjHUQ3X/vvm/f5+4YKW
 d5KzLnpjacxdA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
References: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: sof_rt5682: add two derivative options
Message-Id: <164310603211.74844.1328934003926514228.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 20 Jan 2022 17:02:24 -0600, Pierre-Louis Bossart wrote:
> Add support for platforms without amplifier (headset codec only) and
> without Intel graphics.
> 
> Ajye Huang (1):
>   ASoC: Intel: sof_rt5682: Add support for platform without amplifier
> 
> Yong Zhi (1):
>   ASoC: Intel: sof_rt5682: add support for systems without i915 audio
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_rt5682: add support for systems without i915 audio
      commit: 22cefca393ea3256fa7afb97cca39d5a088053f4
[2/2] ASoC: Intel: sof_rt5682: Add support for platform without amplifier
      commit: c8e98eaf2bcb91291b309f7f703dea345cae1411

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
