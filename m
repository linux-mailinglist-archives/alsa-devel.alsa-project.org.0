Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03A669BB1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 16:15:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D41A72A0;
	Fri, 13 Jan 2023 16:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D41A72A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673622946;
	bh=0WpTZ6nAdG/LzLrC9ZtsqXlfpYYCo3tWtYNG6udfhc4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pU84rkMzqxgSliZHofVTN2TztXDswrVeLi7tTtAptgq8PsBPEwuHJl/Cfsx6SFPpR
	 8TVY7zCVBHqCfJBj8DvMbuFbAD0HBGgG0CCHIe1qdM+SbaV42DRR3xKsZGBVzxexuT
	 gSQuxk8+Qeg7Bsb7r5Cp7iaaWyqvvay7VTqQ9UXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57894F802E8;
	Fri, 13 Jan 2023 16:14:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEA10F803DC; Fri, 13 Jan 2023 16:14:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90190F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 16:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90190F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=o2JHeVE/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A4B061F41;
 Fri, 13 Jan 2023 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6147C433D2;
 Fri, 13 Jan 2023 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673622880;
 bh=0WpTZ6nAdG/LzLrC9ZtsqXlfpYYCo3tWtYNG6udfhc4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o2JHeVE/EBjb2DkY4qfHiVU4H5x+r37/2Cx4PC5srdknQwDgVuxT08ZCJLAOrmHBg
 vmelt25j6NfO3Dtu7s5VNSOKpjPmzV/d6b8OOGx5z0OC/Vh2loE5jEqgDBfQHj64BL
 oYxi/bXfmOB3KXO9nKvydcZIW00rSsdTnB2FLuRd5RkeV4kFqX3pr2UtYxc+gmscAW
 w0WhT+xZOJehv43rhkRRUsPakcrNnkZ0Y0PVOpujVOfdGtT1GFPv7UT+0SY9Z514o3
 LWaycPSg5lPmPqGUmm1YxATwjLC64z66io5Q/ahTHRiJoF/jyktvkff/0uFw2YjY9C
 QMGB/Sh1N2GMQ==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
References: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/3] Fixes for avs driver
Message-Id: <167362287864.139004.6556093020954977105.b4-ty@kernel.org>
Date: Fri, 13 Jan 2023 15:14:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 13 Jan 2023 20:03:07 +0100, Amadeusz Sławiński wrote:
> First patch fixes problems reported when performing shutdown. Second one
> is for a problem reported by LKP. Last one fixes problem reported by
> checkpatch.
> 
> Amadeusz Sławiński (3):
>   ASoC: Intel: avs: Implement PCI shutdown
>   ASoC: Intel: avs: Correctly access topology fiels
>   ASoC: Intel: avs: Use min_t instead of min with cast
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: avs: Implement PCI shutdown
      commit: f89d783d68dcc6b2ce4fe3bda972ae0f84df0dca
[2/3] ASoC: Intel: avs: Correctly access topology fiels
      (no commit info)
[3/3] ASoC: Intel: avs: Use min_t instead of min with cast
      (no commit info)

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
