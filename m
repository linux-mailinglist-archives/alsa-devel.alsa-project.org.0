Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2D3E204B
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 02:51:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D681716;
	Fri,  6 Aug 2021 02:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D681716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628211065;
	bh=fTHM/wRD1qjGCQnQiJI1kW8b9Jaa9YRzRuDOy+fuKyk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMt8jGe3v85shbdBR4ck2CyWIN2slASs94kTDBgIqW3slChyXfcQ87BhnNoyAvqvg
	 HNHZ6dP0EjuK/iwbhJVp+zkIFktXFe1jGXdHCX++HYkEEjPyL35Pc9dHm8ImMoR0yh
	 q2WowkYCuZQkRwRNAB6wArJekparshvZ6kZtTa1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9969BF8049E;
	Fri,  6 Aug 2021 02:48:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 897DDF804CB; Fri,  6 Aug 2021 02:48:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2403CF804CB
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 02:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2403CF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bx984GwJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2228961184;
 Fri,  6 Aug 2021 00:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210910;
 bh=fTHM/wRD1qjGCQnQiJI1kW8b9Jaa9YRzRuDOy+fuKyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bx984GwJB9gOUCTufPE3xLb2Zld+ckYsUyOAtkPOfBTMG7nga//OuHmmC2uPNztaG
 fJuw2XUt4UCbKdy10oG9L2hsUPqzjdcTaKEdR2A11hcQvhH/tI177PQs0wp3JS5pga
 fjuOjhCCGwp2kJ12iUF7UrB215Rs+OzEIblBlbUr2wgh/igmzeczAVYrGoXmvXzm6C
 tdRMRNhOGC1fMKeNpD8gjldu0iij9nh23DzkWTqDhz7o1j8YarJEypbk1/xPgMQ0w2
 t/BrJwv1AoISeyJarkToaOBIcDFltzlgZwhNSFR9VtiBQ0uJdfYWm94zmS6+zToole
 BaZi1wCl3FrsA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/3] ASoC: codecs: cppcheck warnings
Date: Fri,  6 Aug 2021 01:47:51 +0100
Message-Id: <162821054282.18754.5123927273200874101.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
References: <20210804192456.278702-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Wed, 4 Aug 2021 14:24:53 -0500, Pierre-Louis Bossart wrote:
> Two minor corrections for return values, and one more important one
> for max98090 where duplicate reads don't seem necessary.
> 
> Pierre-Louis Bossart (3):
>   ASoC: max98090: remove duplicate status reads and useless assignmment
>   ASoC: mt6359-accdet.c: remove useless assignments
>   ASoC: wcd938x: simplify return value
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: max98090: remove duplicate status reads and useless assignmment
      commit: 221034aca4fdcf8a6552267d2d3aa6825fae29b1
[2/3] ASoC: mt6359-accdet.c: remove useless assignments
      commit: c18abd00333b8b4c6432f4a6789aa02e3b18fdc8
[3/3] ASoC: wcd938x: simplify return value
      commit: 8c62dbcb489aa038fcb9c73faa5c6b56f1f54902

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
