Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0824450C492
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Apr 2022 01:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EC641712;
	Sat, 23 Apr 2022 01:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EC641712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650669611;
	bh=6CpbZD2j3yHmQ98b+MYN0d6cYnCOFyRh694xakCM9ic=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abTYK96Dw4+++UNhajmJQwaSDIf2LEgrL+uf2NktHp4MCnSBEqjTUSMzMSOBDdBs1
	 JeyGdqNRR86pCkVdJpLOfW4oV3E4X01C6LHxg5Ms6I36tzJqhTVSBXuLj5y0aQ9CoL
	 Okq+210zRp3/ydHHwbEUG5DISZCrR1udE4+Hx4Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6775DF80534;
	Sat, 23 Apr 2022 01:17:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BFD8F80508; Sat, 23 Apr 2022 01:17:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 535DFF8032B
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 01:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 535DFF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="thzNq2VM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70939B8332C;
 Fri, 22 Apr 2022 23:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16053C385A4;
 Fri, 22 Apr 2022 23:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650669452;
 bh=6CpbZD2j3yHmQ98b+MYN0d6cYnCOFyRh694xakCM9ic=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=thzNq2VM+KGgIAVOhOevPD8vbOiwMwn4eSv2CqPVJCxeM2lsAWNfszY+Fvu6uASw4
 A8EiMeT4lD3efkp1PUaQhLPdUm5UV1LL6GfH0OromLpxHiHTVcoUetAx4g70dTVORV
 oIO/rzHZHUJ+dBCnzGVkzhwE6Z7ydJpcFsrpmpjjQlBPd486gOwtCOLhUYswTilsVW
 p7Hih+wBPF5w/OYPh77Fkg0c5ZxATlggZ3xsPXXLYwVwEMTQFzymjx4vwVq++NqaT8
 JwgE3nMERFMSZg9LO+ikHBtbadpU0cE/ACXQG37aExU8YCScuRGaZ3izx0F23PnarR
 Cl/WtrUQLRuRw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421202031.1548362-1-pierre-louis.bossart@linux.intel.com>
References: <20220421202031.1548362-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Revisit IMR boot sequence
Message-Id: <165066945080.12937.14875701637596981674.b4-ty@kernel.org>
Date: Sat, 23 Apr 2022 00:17:30 +0100
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

On Thu, 21 Apr 2022 15:20:31 -0500, Pierre-Louis Bossart wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> The sequence for IMR boot is essentially the same as normal boot with the
> difference that instead of DMA from host the firmware is loaded from IMR.
> 
> Re-structure the code to use the existing sequence and also add fallback
> handling in case the IMR boot fails.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Revisit IMR boot sequence
      commit: 2a68ff846164922196c38718ad8dc216819ccd38

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
