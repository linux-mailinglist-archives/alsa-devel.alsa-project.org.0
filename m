Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B25A7E0E
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 14:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72EE16CA;
	Wed, 31 Aug 2022 14:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72EE16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661950470;
	bh=wt5codHPshZK7VHJ956p2ozSievOlG8qxiyO7Ee+UZI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pkdgDZRSj0VhvwwW+Ak5kPJA6MHQ9oD08mQfz7uHUju0Ubty98DOq6Q7/Y8rzk7bC
	 eX2/mTjguq5WeLapKjrXNBt9szJbRMF9KGrXxWiOrL7cGWySYxHU6J0TagHYsxE6K5
	 2vzxC4m/kfvQngi3/k+RNZYzfpci3xeST3JC5Dxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77FE2F80494;
	Wed, 31 Aug 2022 14:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D54FFF80448; Wed, 31 Aug 2022 14:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 469A6F80236
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 469A6F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mw3weDLl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE5361A11;
 Wed, 31 Aug 2022 12:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60087C433D6;
 Wed, 31 Aug 2022 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661950375;
 bh=wt5codHPshZK7VHJ956p2ozSievOlG8qxiyO7Ee+UZI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Mw3weDLlql7G1SpnyDsUdPvSbpkCkU9KUmHbrExgtzc2nfaMjHKFR4/IznA8oMerc
 +zk+pnBr3vL8soT/SIT+Z16NTN2oUMyLb0Ojs6LdQHlw51kV+ZvUKnmgPpJx79lhI3
 vJaqfg0IMspZg88jkgtPkurfpBXd+tMouV8lazo0ucDmXONJ8hXg13iA4lcG7IUkSz
 f42xgqPyDJNmO1O1GvV2lDsFogqURUif4RR7bIYr3B77uAXokM/QQNRX/qo60lXhak
 sBYRzQDBbgY2yYv7m6rnIfjLhclwGeceIMo0VqQc9Wg/0fmuVDvvpF8AwEz+EWviiR
 9Muc2jOHIhjbg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
References: <20220822184239.169757-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoC: codecs: minor cppcheck cleanups
Message-Id: <166195037412.99184.15299525182207565398.b4-ty@kernel.org>
Date: Wed, 31 Aug 2022 13:52:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: tiwai@suse.de
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

On Mon, 22 Aug 2022 20:42:34 +0200, Pierre-Louis Bossart wrote:
> Small number of cleanups that were either missed in previous versions
> or detected by new cppcheck version.
> 
> Pierre-Louis Bossart (5):
>   ASoC: hdmi-codec: remove unused definitions
>   ASoC: wcd-mbhc-v2: remove always-true condition
>   ASoC: wcd9335: remove always-true condition
>   ASoC: fsl: fsl-utils: remove useless assignment
>   ASoC: ti: omap-mcbsp: remove useless assignment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: hdmi-codec: remove unused definitions
      commit: c90d6054ff9d75bc185c48b798b745aa2c05236c
[2/5] ASoC: wcd-mbhc-v2: remove always-true condition
      commit: 43265ceeb0b9cb1f8f5fb182adaa6c2ed4941478
[3/5] ASoC: wcd9335: remove always-true condition
      commit: c9a9b4dbc18f4dc609d47b9ac19545b31fb21e3f
[4/5] ASoC: fsl: fsl-utils: remove useless assignment
      commit: 3653a6a2a7c146f04940d572d2728c939b50cba1
[5/5] ASoC: ti: omap-mcbsp: remove useless assignment
      commit: 7a0431bbda8ae24de56ea1dadcf1a2e56f939707

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
