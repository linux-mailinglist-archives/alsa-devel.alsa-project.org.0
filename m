Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C554B788
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 19:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F4618BB;
	Tue, 14 Jun 2022 19:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F4618BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655227325;
	bh=0oUJqP1mCI5IlGt5vTnBQHDnvzI5GNaQ+HZMPp+kobg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLe1uT6y9xyFlcOoUU81oiOTHpG80IBt+DIrXP+gLN59QiVSfw80W9+INib776DNh
	 dgq7zSgdc0Cm0X9wj2Txzpilo5ZUBrVluU+6uMWCFoOOunmeOgaye870QqRd6amFxv
	 gnFcHd6ojauLFUcFVMzpwr4Q8aDWEp1j+poy64fU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4385FF800E1;
	Tue, 14 Jun 2022 19:21:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE389F800E1; Tue, 14 Jun 2022 19:21:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F96F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 19:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F96F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EaqkKH/M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0CC66167B;
 Tue, 14 Jun 2022 17:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3287C3411C;
 Tue, 14 Jun 2022 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655227256;
 bh=0oUJqP1mCI5IlGt5vTnBQHDnvzI5GNaQ+HZMPp+kobg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EaqkKH/MmNdIJ2WzbxWDauLxZRi0PzVMuqDMnd3TR+mY3oLxra7KXtwMb8ZbWEKky
 izlTNhkm8igbm4twu4H4xnIwaiT2RKodZb6RS3jJfj5MaRVA2uMZ+HWIwnsqBsZTKC
 I2KiCYNFqsTRIy5utaxMLi1sBvOfNxz29ou2wtVlnmliZHsEk1C3714jXIjdIGCkbH
 u3I0HCQ/2CkUKOTPK2uOngAz2e9crVtfh5biEiMTlpUdNM06qdDHaaPjlP95N46ams
 R1yNPq6CEKMOx94+rM5pRcnOkbh6rtwx6Ccc3XYps2LG+DwAWOKPhrSNbg9tWuI7RB
 JD+YumShgAgmA==
From: Mark Brown <broonie@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
In-Reply-To: <20220604105407.4055294-1-broonie@kernel.org>
References: <20220604105407.4055294-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Fix boolean/integer detection for simple
 controls
Message-Id: <165522725543.2442209.10680964769464937742.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 18:20:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Sat, 4 Jun 2022 11:54:07 +0100, Mark Brown wrote:
> The standard snd_soc_info_volsw() detects if a control is a volume control
> and needs to be reported as an integer even if it only has two values by
> looking for the string " Volume" in the control name. This results in false
> positives if the control has a name like "HP Volume Ramp Switch" since any
> " Volume" is matched, not just a trailing one. Fix this by making sure that
> we only match at the end of the control name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Fix boolean/integer detection for simple controls
      commit: aa2a4b897132169fbc6d32932644b95875cf9c7f

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
