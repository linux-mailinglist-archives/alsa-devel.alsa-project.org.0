Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A19F5451AAF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:39:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7921676;
	Tue, 16 Nov 2021 00:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7921676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019544;
	bh=dNbrA5B4b4+Ag9RO7dz3zsWBu6pH2mX1Z0iPeM2m728=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mbb92h2uH2+f8VRq+Ude36U7oXPsP7OCShWyyb2LSwOzF1GPsUlqkxs0f6AJURatV
	 tXR6jRd/nVDxUBt74wDiAM4jD9//RymRa8/llP9ilFAhzUoLB3DbzWVTqiqztule0u
	 NX5Ss0XUJY9X17Kn8hmpIlWrwknfq0nVdHtR7vcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 636C0F80518;
	Tue, 16 Nov 2021 00:35:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94E45F80506; Tue, 16 Nov 2021 00:35:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01A52F804EC
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A52F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uq1lwOsY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8055663259;
 Mon, 15 Nov 2021 23:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019313;
 bh=dNbrA5B4b4+Ag9RO7dz3zsWBu6pH2mX1Z0iPeM2m728=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uq1lwOsYHobSBucnRjy5gceiucdb4P2mGgvCC+sUBHLHxUCsL3Z0pg4KxXhSGpgZQ
 KRRtm0dCl6qV6aEGUeEoO0vv1/QGRvl/XPjDQTaRna9EOhQG7dUeRJ3bvdIrAzmEex
 FfPZT8PV5sfBfGKsAS4zWojUucqzjzZ1AF3QlBe2dZuumBifV/DnpJLAnoqE+dyvpK
 l1zLnbP3JS3cbHVAzvC4Xs0wQJEYOFN7IiSxj7oyMscuyOMWRiajb/35OsBjqoNxL3
 9BTt5R4XKGRfyZuCFXdzZAzrjHOGmpfEzc27M0++mTkdINwHOsUA7b66JRw23hYxXr
 NH0Bm0+oVhcSg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Mac Chiang <mac.chiang@intel.com>
In-Reply-To: <20211109133808.8729-1-mac.chiang@intel.com>
References: <20211109133808.8729-1-mac.chiang@intel.com>
Subject: Re: [PATCH] [RESEND,v2] ASoC: Intel: add sof-nau8825 machine driver
Message-Id: <163701931125.675370.7511732416848901928.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:35:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, CTLIN0@nuvoton.com, bard.liao@intel.com,
 sathya.prakash.m.r@intel.com, vamshi.krishna.gopal@intel.com
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

On Tue, 9 Nov 2021 08:38:08 -0500, Mac Chiang wrote:
> The machine driver is a generic machine driver for SOF with nau8825
> codec w or w/o speaker additionally. Depending on the SOC
> HDMI, DMIC, Bluetooth offload support are added dynamically.
> 
> Only add information related to SOF since the machine driver was
> only tested with SOF.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: add sof-nau8825 machine driver
      commit: 8d0872f6239f9d067d538d8368bdec643bb0d255

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
