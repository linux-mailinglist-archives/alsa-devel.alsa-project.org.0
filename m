Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCC2FDDA0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:08:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095721868;
	Thu, 21 Jan 2021 01:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095721868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187691;
	bh=Y/wa9Mf/0iAavFyxeuwT39lhA2cZcDPtk63eCqQq4po=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zu+vknQvgtyUdx3EqgU6RGIm1hcV7ccg1Rjjr8W4RbDcYq7PoSe8n6Crtkoz/VH9s
	 XVT9WDAsUM9jfWjKUQAH1OtxdtYom0rU0d86/8wtGQRdv7Ux9xdP/GOqVs7HHczcxD
	 bPcRCgTB/ZH3BVdZG9v/5FToKyLGWiUrtRxLV9KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC446F80164;
	Thu, 21 Jan 2021 01:06:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09423F80227; Thu, 21 Jan 2021 01:06:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9054EF80164
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:06:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9054EF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IIgDsOLC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 416F623716;
 Thu, 21 Jan 2021 00:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187582;
 bh=Y/wa9Mf/0iAavFyxeuwT39lhA2cZcDPtk63eCqQq4po=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IIgDsOLCoiq0zt1/LdpJQrFLBx2BeYwUxm2couzcNJ/EskqetY+2SXgkdUsf9tFwC
 xTY/dff/cFDysDuQovaCaAzmV+hXKesGvnndEOzm3Y+cvW3J6SIrHjvqKx1O4vddc4
 ztr5FyP7ABC+p9t3ajnSHCET+3vI7YcXtwEcuv3irUjmgFanVtsOxtRr6rHMR26b9d
 OJv4PXJZz6m4DcfQ26J9WuuJP5E4Z42TG20F61tScMLADO+SqPfVJh9XXCZCgNWSMR
 5y9A5cD4RL/83btw4e+fsMg9PvDuqrKhGto5vQEYuH7X2zV3j9IBzJMs9e7+mJ/wA+
 5VAjoLqw054jA==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
References: <20210120152846.1703655-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: (subset) [PATCH 0/5] Add KUNIT tests for ASoC topology
Message-Id: <161118753484.45718.2035617869863702205.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

On Wed, 20 Jan 2021 16:28:41 +0100, Amadeusz Sławiński wrote:
> This series adds unit tests for ASoC topology.
> 
> First fix problems found when developing and running test cases and
> then add tests implementation.
> 
> Tests themselves are quite simple and just call
> snd_soc_tplg_component_load() with various parameters and check the
> result. Tests themselves are described in more detail in commits
> adding them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: topology: Properly unregister DAI on removal
      commit: fc4cb1e15f0c66f2e37314349dc4a82bd946fbb1

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
