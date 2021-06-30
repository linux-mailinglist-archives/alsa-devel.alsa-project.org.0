Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9050D3B86E4
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 18:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08FB91671;
	Wed, 30 Jun 2021 18:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08FB91671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625069579;
	bh=tS9UOkmHfzsDiNUImRMpoSlMeUJv0SfmW99iaB0fyqs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WoM0GKjaj1b3WgKD7+82glwx3eQutFogX5stF20vA1PSnKNVwh4UwDUV7sxwW6grv
	 9rLzNIAZtCgnytlbG1TleLagc7eN9J/Q6d7Y5K6xIQPEUu8HJq1rysfPldYDR/jbXN
	 ppGdEHONAGslylzH5GUMrgVynvvPAzyEO11tnhgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A04A2F8028D;
	Wed, 30 Jun 2021 18:11:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E798F80229; Wed, 30 Jun 2021 18:11:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D99A9F80217
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 18:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D99A9F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UY+gmNXa"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A1DD61456;
 Wed, 30 Jun 2021 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625069470;
 bh=tS9UOkmHfzsDiNUImRMpoSlMeUJv0SfmW99iaB0fyqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UY+gmNXatbjEY9Il2jN9pHQO7EtNS5/veu/rwgzFRZEZU6Jf6xY6/gvNj1HfO7vBp
 KiRNt5lcbzaYyOMCqjgP/NmAaIPEURE708kZiMQH00zkZYdKGJ4l+QHwqHSx3KhCMS
 yGJ2lqfg2syPDZlthTnBrTERONMFqLZv8PwsjNPzHSUKzQc6KOyLUelvHdgdYnZKsc
 raEY7eTJMPJFrD2DaRb6NzGOK+tKGMnP/PY4MPi98LUxnhVLDi4c7viXSIhEVq05sL
 a0M83yuoX23qjA6jO7SMhaJAMu0bQM1z3ZP07iFqE54yTwrx/OTsO7j20wkDPr2rYj
 j8RQ96BLdV89A==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: (subset) [PATCH 0/2] arm64: tegra: Enable audio IOMMU support on
 Tegra194
Date: Wed, 30 Jun 2021 17:10:33 +0100
Message-Id: <162506854659.43525.4480397285287043164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628181118.2295007-1-thierry.reding@gmail.com>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org
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

On Mon, 28 Jun 2021 20:11:16 +0200, Thierry Reding wrote:
> This small series addresses a minor issue with how IOMMU support is
> wired up on various Tegra generations. Currently the virtual "card"
> device is used to allocate DMA memory for, but since that device does
> not actually exist, the path to memory cannot be correctly described.
> 
> To address this, this series moves to using the ADMAIF as the DMA device
> for audio. This is a real device that can have a proper DMA mask set and
> with which a stream ID can be associated with in the SMMU. The memory
> accesses technically originate from the ADMA controller (that the ADMAIF
> uses), but DMA channel are dynamically allocated at runtime while DMA
> memory is allocated at driver load time, drivers won't have access to
> the ADMA device yet.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
      commit: e6b66edfef64698d4d9ed3847c95cdfab9bde579

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
