Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62632C582
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 01:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DCC31AB2;
	Thu,  4 Mar 2021 01:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DCC31AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819581;
	bh=y/4ld1aDnoKot5v+TmCzyCywC09EL0i5izDg3cpLCL8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=udNz3Izd+hHrrHqfOqzpFt71b9AlLemDSOLtxazt7R59d8N38hXDfXrzZSSHKVRTN
	 /kaRd3iDL0pTWxx3/yrV3lpDQ3RaqSB0+LIDNfyKhVITFSHCGgqH4iSf4aMLl23oHJ
	 GL0mMp/ZeETeXYwkGmm7cXDPtRQvoWxFpA05Z9QM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC45EF804DA;
	Thu,  4 Mar 2021 01:56:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6C97F804D9; Thu,  4 Mar 2021 01:55:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26334F804C1
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26334F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DY5ZlxmZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E8D864EA4;
 Thu,  4 Mar 2021 00:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819353;
 bh=y/4ld1aDnoKot5v+TmCzyCywC09EL0i5izDg3cpLCL8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DY5ZlxmZoxEWGbqUV5UE0cn0Wf2GlgjLWtYA4Vir3ZnAsVSW+W9gjqla//ZhX8A8P
 hw1UcTzrfR/ZO/WHKeYasd+Oto49k2m2kHIrPq/lhvgl47D461WNH+4koUDanaukAp
 i9uqD6ldLYoY1NbTHz8uSYg6M6vm7Y9t+GhCvjjqDPmJ1XDoNyys1Q8zdLa+q6dBCf
 0Cpem6uL7N8PLmb8+vHVayCn9hUy+3sv0WyvzMBzoVLozWX8Xs67mqiLBC1nSqcgXW
 VJK5/zpOgt2CkZ+MxY1fGJ1KXSc8XkWW6tEeNq7tXwax1T2ogHu9J5cGWpRv1Ixo//
 KvfmcbZYH9/mw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210301174659.117122-1-pierre-louis.bossart@linux.intel.com>
References: <20210301174659.117122-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: soc-dai: fix kernel-doc
Message-Id: <161481924069.9553.6829429266268373454.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org
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

On Mon, 1 Mar 2021 11:46:59 -0600, Pierre-Louis Bossart wrote:
> v5.12-rc1 flags new warnings with make W=1, fix missing or broken
> function descriptors.
> 
> sound/soc/soc-dai.c:167: warning: expecting prototype for
> snd_soc_xlate_tdm_slot(). Prototype was for
> snd_soc_xlate_tdm_slot_mask() instead

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-dai: fix kernel-doc
      commit: 17b898dfe583a89526f5fbd509a8bc9107b43960

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
