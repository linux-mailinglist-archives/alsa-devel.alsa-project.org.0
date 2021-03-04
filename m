Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A332C5F7
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 02:01:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 617001AE7;
	Thu,  4 Mar 2021 02:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 617001AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819675;
	bh=uBkZynERxmvyUAijUlKSDbdv6TGVP86gqFUg4DlcEk8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t4XbOYjp8xfQgczTB3d820hjVczinNS7qkLOPFuczV6EVzUp+iIX0VBxadTOWo6LD
	 9IYMlXNh36JKCW12tr3DPhbK1HqA78FLBWJp8hDfOiSrXZoD3z82MZOIucJGLcaRxi
	 NUatUHjHLk7Pae3TUDFQca/DOCrYG/Z5uY/ZH0fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E60F802C4;
	Thu,  4 Mar 2021 01:56:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC1A0F804FC; Thu,  4 Mar 2021 01:56:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4618FF804FA
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4618FF804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sbLFKM5K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 365ED64EC3;
 Thu,  4 Mar 2021 00:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819374;
 bh=uBkZynERxmvyUAijUlKSDbdv6TGVP86gqFUg4DlcEk8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sbLFKM5Kjp4NJEQnhKpiH/BUSFPdnKrQp6N9aWPa9LUsaDt9PqvRlNAqXb/X79FaF
 XAtSY151PvTADXOtQ1FW5K+c+j9lQy/35N15FoogqTpRjeXjO4NC4qZykWhLsHcJRB
 +KGaa9WbTsIR8bmItg7YaCN4aZF/A2yF3rPKj7q9SOtU/RUkk0hJed+0s36aerEX4+
 0dR9bEwbx7r5cok4BHScOnS4nudAj/R3zky4SkSSEpt3UURPi9dMV/eTvsIzxtcMHS
 JumDnUyA30UJvuICmpwBznON2LdvKUv4LRhLLOPBakqrmqYV59gi5lneAW+46B9iMN
 XZZloES0cdKUw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210301165349.114952-3-pierre-louis.bossart@linux.intel.com>
References: <20210301165349.114952-1-pierre-louis.bossart@linux.intel.com>
 <20210301165349.114952-3-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: atom: fix kernel-doc
Message-Id: <161481924068.9553.4704528885499654912.b4-ty@kernel.org>
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

On Mon, 1 Mar 2021 10:53:47 -0600, Pierre-Louis Bossart wrote:
> v5.12-rc1 flags new warnings with make W=1, fix missing or broken
> function descriptors.
> 
> sound/soc/intel/atom/sst/sst_loader.c:85: warning: expecting prototype
> for sst_start_merrifield(). Prototype was for sst_start_mrfld()
> instead
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: atom: fix kernel-doc
      commit: 2acbcd2aae5788de5b3c98880688086ef23976bd

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
