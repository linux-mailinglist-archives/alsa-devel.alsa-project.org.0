Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A21251CFB48
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 18:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B1116BC;
	Tue, 12 May 2020 18:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B1116BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589302064;
	bh=D90eSYBg2xnKg1Y3zuRGdIZjdvgJi5Ph7kADh9s7i7A=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVRWNaZf8uVNoP/CUn4cHR8kRHuFpRRFBa6a2KBcc+yJ8MzgZ0fwHn0T22EHDIgCg
	 H+sV1NOXryKY5UZ3O1cO0By1jpg4GmgyKfNrvdenOVjY/tPvVmft1bZgU0tk3tfC8P
	 dKV5v9F4jMz5cDyst6Qchk0/l4VwXpwjEX+XwUEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F970F80292;
	Tue, 12 May 2020 18:45:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292FFF80291; Tue, 12 May 2020 18:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B137F80255
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 18:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B137F80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1wfzbSZT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F98E20714;
 Tue, 12 May 2020 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589301905;
 bh=D90eSYBg2xnKg1Y3zuRGdIZjdvgJi5Ph7kADh9s7i7A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1wfzbSZTZfumNeUNSD0ZZHH08oKAGW6/RPchxUTxL+b4CMYbqZVNPp/Mkv7C/ufxz
 BOmRHV2KL8Adau74IoZkvGK5P4x7VHriX5yD6FhR8QSLANSCRCdVXEcofp6iOtIw1p
 YWzeJyXtYNnJDH3nkfzc0+hN9dSPDM2jzYjHgg1w=
Date: Tue, 12 May 2020 17:45:02 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20200506212114.8502-1-cezary.rojewski@intel.com>
References: <20200506212114.8502-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v3] ASoC: Intel: Skylake: Update description for HDaudio
 kconfig
Message-Id: <158930188455.55827.3626760795244051754.b4-ty@kernel.org>
Cc: tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

On Wed, 6 May 2020 23:21:14 +0200, Cezary Rojewski wrote:
> With 'ASoC: Intel: Skylake: Fix HDaudio and Dmic' series applied,
> warning is no longer true. Remove it and update the description.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: Intel: Skylake: Update description for HDaudio kconfig
      commit: cc2d025a81a9f9ed4d05f4f65f43a183d6f18c0c

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
