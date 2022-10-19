Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532560447E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:06:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8618CA7E3;
	Wed, 19 Oct 2022 14:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8618CA7E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666181213;
	bh=mPpMcGtARME6VGyFtDY+y9UjMx3qdzGu76iRwKZx1Sw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPuFKMP7v/PbmVx5hE/md71l5VM62FBvoP6idVv/LvPuQu1ahYGeTIuEt1f6YywQ2
	 1XTryjvn3mM4oBBFX+MmZ6XiSmoBxuv4ZI6ufCrpUELi8yPSgODJATzmDuc1cf6kLw
	 32fT4Zbihm8V6z6Htz5uBtbuuFzkzT/ATzjsBdNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B02D0F8053B;
	Wed, 19 Oct 2022 14:05:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C96FF804F1; Wed, 19 Oct 2022 14:05:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA57F804FA
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA57F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u3vfQLZJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2479B822CC;
 Wed, 19 Oct 2022 12:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15FCC433D6;
 Wed, 19 Oct 2022 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666181105;
 bh=mPpMcGtARME6VGyFtDY+y9UjMx3qdzGu76iRwKZx1Sw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=u3vfQLZJ/ZfYpDUYSsIYen/WVASiVF1yr1bufPWpKcpqy1F6W5025ICRlDwBWlnvG
 nZMHEF7BwBiUEoY4+NeoW8LCEZwsUTlXNaVBuI9fNtDx4N3GBEUZFjnQPBkPVBhwAR
 8wTz6TZhOKUw5O7h8OHFrLhvdwUBrh7jF+Sfh+tvdVuEKHkV6+boDT296sdB3j4dc1
 5NYHroFYrSgkuVcErVepiSRmTPfUIP3aaTlVDW24jkcTFX2h67uZ/uRP0X6UpDJy9V
 TpF9AOalnH5VVQ+nfo5f4lnbnXYf8xd/e0pQOBPAdEqMv1MK3mfB0DCjOnDh5zs+gU
 CbCLklltaMG+w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
References: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel/SOF: simplify S3 resume flows
Message-Id: <166618110458.80223.3405293187719974346.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 13:05:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>
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

On Mon, 17 Oct 2022 15:49:43 -0500, Pierre-Louis Bossart wrote:
> All Intel drivers for cAVS platforms contain a sequence for S3 resume
> which doesn't seem justified nor necessary. Forensic Git investigation
> in internal repositories did not provide any rationale for the
> implementation, and tests show no impact when those sequences are
> removed.
> 
> This sequence was identified as problematic during a large HDaudio
> cleanup where all programming sequences were revisited before
> extensions are added.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: Skylake: simplify S3 resume flows
      commit: fac33cb5c12c58e031a5e2f8e3e8c7de8604a764
[2/3] ASoC: Intel: avs: simplify S3 resume flows
      commit: 8e1ae6f62c7e8f904949e9c60a4a38715c8c0aff
[3/3] ASoC: SOF: Intel: hda-dsp: simplify S3 resume flows
      commit: 9f68d6e64f51bf62f8d2f7d82a425470e9aa3b24

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
