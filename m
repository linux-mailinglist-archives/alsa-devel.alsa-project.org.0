Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E25229977
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 15:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA6321662;
	Wed, 22 Jul 2020 15:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA6321662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595425642;
	bh=TGwGtl4hnSuAa0lA1jAL1oK0QKXm5nHXnNhEo7w5Eu8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=awB2eaxb/i4OB4ga/K0oJ8cFhB90lmLh6ldKoamxSbg8UMs5Wsz+DYNoj+FZpXp/A
	 vuXry227AE8L0YpOBJ82DD+5Tf467rStOqgkI+noRuQSVXky3uYp7cTc5gLyiBk444
	 7AKearDVdfmB526/bTa5xM/4PjUfcYL9hFa632GQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23E93F80272;
	Wed, 22 Jul 2020 15:45:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856E8F801F5; Wed, 22 Jul 2020 15:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B18EF80150
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 15:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B18EF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gN+M0Ngv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E9CF20729;
 Wed, 22 Jul 2020 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595425492;
 bh=TGwGtl4hnSuAa0lA1jAL1oK0QKXm5nHXnNhEo7w5Eu8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gN+M0NgvkHhpabJCkc6BjoIbynDIBQn954c4mMAbcS+BOgNAKZpz+0gbW7P60Fosx
 tZZttzu+zW/VMIV82ItK85Rc59r8XrA9SlkRQNoHIZ+LyqoTd/CtMrvpnacb9bDpvZ
 +NxDvV+BN78fYWauyerDontCuqGCHpVweRYoRkT4=
Date: Wed, 22 Jul 2020 14:44:39 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200717101950.3885187-1-kai.vehmanen@linux.intel.com>
References: <20200717101950.3885187-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: hdac_hda: call patch_ops.free() on probe error
Message-Id: <159542547442.19620.8026322678999646660.b4-ty@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
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

On Fri, 17 Jul 2020 13:19:48 +0300, Kai Vehmanen wrote:
> Add error handling for patch_ops in hdac_hda_codec_probe().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: hdac_hda: call patch_ops.free() on probe error
      commit: 640f835cd052bba403f955db15130ff813be78d2
[2/3] ASoC: hdac_hda: fix memleak on module unload
      commit: c3ec8ac82105e9589dcd72636b6fd114db690d55
[3/3] ASoC: hdac_hda: fix deadlock after PCM open error
      commit: 06f07e2365378d51eddd0b5bf23506e1237662b0

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
