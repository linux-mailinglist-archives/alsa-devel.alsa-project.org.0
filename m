Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A41E873C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 21:06:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC99179D;
	Fri, 29 May 2020 21:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC99179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590779191;
	bh=oCLmuSFOYKgFT6nDA7OcDA0Y9yeomZLxOtkTEkoHh1s=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MugcUz0sfaMEGSgQXTW1YGq2EgLhqijta/ACEi8+jfXoaCIACgpRAIWWNBdXnEgv2
	 M7zFyKsxmI2k0RrkzM5lofE10FzFsQ0ISrJU33Ruxbs2Rd22C0taUP/da8iJTWJz9U
	 2GyLgSrGimARJB23eLKyXkAc7CZ2+e4YwGXj3WvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DB70F80149;
	Fri, 29 May 2020 21:04:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2429F80107; Fri, 29 May 2020 21:04:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F37DF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 21:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F37DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="loTPW2Wd"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 905A92077D;
 Fri, 29 May 2020 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590779082;
 bh=oCLmuSFOYKgFT6nDA7OcDA0Y9yeomZLxOtkTEkoHh1s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=loTPW2WdPd7Ynta7qQoa9HqeHBeQ8tad0m2Un6fXeRc4t2bCOfDWg8ztibQzH8umr
 24JhrkJPQ2LRzL+n3MZOOBbAzbnkR6tExA8+eAdFj83TWogKXbciWc/8P+NVadI8VL
 TEnDk8EkAjRPDZlHiWJT8x43gRarT/iwzux1ukNg=
Date: Fri, 29 May 2020 20:04:39 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200529160358.12134-1-kai.vehmanen@linux.intel.com>
References: <20200529160358.12134-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: fix generic hda codec support
Message-Id: <159077907947.45368.11792432375349674.b4-ty@kernel.org>
Cc: Hui Wang <hui.wang@canonical.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
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

On Fri, 29 May 2020 19:03:58 +0300, Kai Vehmanen wrote:
> Add support for using generic codec driver with SOF. Generic driver
> is used if:
>  - snd_sof_intel_hda_common.hda_model="generic" is set, or
>  - fallback if no other codec driver is found
> 
> The implementation is aligned with snd-hda-intel driver, and fixes audio
> support for systems like Acer Swift 3 SF314-57G, on which this issue was
> originally reported.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: fix generic hda codec support
      commit: 89d73ccab20a684d8446cea4d8ac6a2608c8d390

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
