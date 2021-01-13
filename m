Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0B2F5178
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 18:55:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C773169A;
	Wed, 13 Jan 2021 18:54:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C773169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610560536;
	bh=VKQFaqffXhfR244XhGrBSCMJblHTpWefqzavC+ldkhU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CzSXqsBaARheoBpuMV+VNwE8dl92VQ2i8zmgPl2Ii2pezN/ql8dHcM8b1uHVIe7yZ
	 lVaDMMX98/FKu2zcndpJTwhSkOihesKNbWkS29seuDEefvwQzCxjBMocTBIp2EMdxi
	 uYNP1vDPKdjzcnAWYKY4HmSNN9WDvgKLj6QlhjXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EACB5F8025F;
	Wed, 13 Jan 2021 18:54:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29AA0F801ED; Wed, 13 Jan 2021 18:54:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D29EDF80113
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 18:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D29EDF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JGoPW/ob"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3970E2343F;
 Wed, 13 Jan 2021 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610560434;
 bh=VKQFaqffXhfR244XhGrBSCMJblHTpWefqzavC+ldkhU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JGoPW/objyOxbl7wNupZCyUZuCHAUoWDzh4xInu8g5rjw63TyV1ENyKwJz/Y9hx1K
 AW3rlLiHbgl+nAvWcKAEp+r0OE+dEFDdt49G7l/m96/gl74r4EedYO7eOWneboXVyI
 m1Wmr31IeJNECzMezVcqvs1NZEzK/8DEh+4a1102/i0LHAUcDLmi/cUNZJmcFAOyLc
 RI8AvM600kklll/6Y/ypuufGX52M/4oD86y/f24wic+qPajb5rypQLwlSHRDdEPQd0
 +gj0tMJ1U1jEFQdQaW6wXXozDR+Y7beeL5uxqspc3N0GjPkHGMrBiGIOpOAAk2ocPx
 s7MK2kHrWyzJQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210113150715.3992635-1-kai.vehmanen@linux.intel.com>
References: <20210113150715.3992635-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: fix page fault at probe if i915 init
 fails
Message-Id: <161056040078.11774.18170025770333640119.b4-ty@kernel.org>
Date: Wed, 13 Jan 2021 17:53:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com,
 Rander Wang <rander.wang@intel.com>, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

On Wed, 13 Jan 2021 17:07:15 +0200, Kai Vehmanen wrote:
> The earlier commit to fix runtime PM in case i915 init fails,
> introduces a possibility to hit a page fault.
> 
> snd_hdac_ext_bus_device_exit() is designed to be called from
> dev.release(). Calling it outside device reference counting, is
> not safe and may lead to calling the device_exit() function
> twice. Additionally, as part of ext_bus_device_init(), the device
> is also registered with snd_hdac_device_register(). Thus before
> calling device_exit(), the device must be removed from device
> hierarchy first.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: fix page fault at probe if i915 init fails
      commit: 9c25af250214e45f6d1c21ff6239a1ffeeedf20e

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
