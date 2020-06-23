Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 714BD2052B7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 14:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D6417DA;
	Tue, 23 Jun 2020 14:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D6417DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592916104;
	bh=X1NGFk6VjiPCuw5A802fb9uY8jmPHXWXlHexWqTClhk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FRypLNclGf2PsLbv/Cf6JkaNgeFtGTgOOZTMrmEis8QYRrnPGETntOdUZ2aS/qqMN
	 sZYl31EpehX3pPGBQIEbO4qeMs2R4BTYmDxAwUQGIh2rMYDS4pownZEc0GfJbTBb3a
	 fqMNJpf+ptSIlPsGcU/43UO0fueEz8QYsxsfglMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A27F8025E;
	Tue, 23 Jun 2020 14:39:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04B4F80249; Tue, 23 Jun 2020 14:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FF20F8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 14:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FF20F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PanpWoHX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 482D320738;
 Tue, 23 Jun 2020 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592915951;
 bh=X1NGFk6VjiPCuw5A802fb9uY8jmPHXWXlHexWqTClhk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PanpWoHXKDMWNOztIEbisKquKENt9RiS2rMkBoDmD8o6KP2SHiMwIOUq+OcATpaLj
 LC0b2VB9IkVFSRAr3/Lm63WUnX/pEOQ2+WDYDSXvcYIF6Jv5W7v1lFnKb6fAbPNWLW
 9AcmP2WflmMD7szPGwmJLw0wco8ysLs8pK1xxLjU=
Date: Tue, 23 Jun 2020 13:39:09 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200622151348.28063-1-pierre-louis.bossart@linux.intel.com>
References: <20200622151348.28063-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt1011: fix KASAN out-of-bounds bug in
 find_next_bit()
Message-Id: <159291594453.44561.4198315468419375039.b4-ty@kernel.org>
Cc: Fred Oh <fred.oh@linux.intel.com>, tiwai@suse.de,
 Shuming Fan <shumingf@realtek.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
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

On Mon, 22 Jun 2020 10:13:48 -0500, Pierre-Louis Bossart wrote:
> KASAN throws the following warning in rt1011.c:
> [ 170.777603] BUG: KASAN: stack-out-of-bounds in _find_next_bit.constprop.0+0x3e/0xf0
> 
> find_next_bit() relies on unsigned long pointer arguments, but this driver
> uses a type cast that generates the KASAN warning. Replace find_next_bit()
> and find_last_bit() with __ffs() and __fls() to pass the value and avoid
> casting pointers to make the warning go away.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1011: fix KASAN out-of-bounds bug in find_next_bit()
      commit: ee8a41cd30a99b39bd5d46280cc778e275cd2390

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
