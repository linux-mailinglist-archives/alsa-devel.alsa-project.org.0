Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF2524FA0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70E71ACA;
	Thu, 12 May 2022 16:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70E71ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364872;
	bh=tLRm1gt0dfdj3Zg1SK1amryfSa02+W6LQsgnP3iGSlw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHWrvfhP39esOM2qCuaVxRQYEG7gXW+17JmxzTTYPsP/gvYOnKSSk8hYAIfir1Xtv
	 owS50h29eeCT5KuRxKdZlzq5DPuOS+6gO7K0CBNh5sfx7qGRjwlfLuif39guJYTbQX
	 iT59/5gWJBUVdfH7ZX1rlVyaKBaoWgmpm1yTJ+Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AABEF80245;
	Thu, 12 May 2022 16:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500D1F8032B; Thu, 12 May 2022 16:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A53F8010B
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A53F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dX09OXXu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A85A5B8284C;
 Thu, 12 May 2022 14:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCFDC34117;
 Thu, 12 May 2022 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364766;
 bh=tLRm1gt0dfdj3Zg1SK1amryfSa02+W6LQsgnP3iGSlw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dX09OXXu36Oyp6S5k1oT1e2eO9k85/jNMHbJr5d64l93qQR54dZf4/+FjjQG4R3Ht
 WvxpVK+rmiONY0vw+FjvPux3sA1YB2WcWeCNOsYDVGRTOhSYnjYEFjbre/xP4Ct6VZ
 MUGFh2/eOKIrx8EZFfciVFmDq3oropMtsWy02lw/soYMR9A3SZd3QWHk2LHIP4A/z1
 +UnbMKTsq3IwlbWfCoNE5GgPd+sAsXVcvcwqj671i/KWpPTMuu5clz5iZjTgzQp/ni
 iH71sBB0ZVzpbJeDF6h6EdL/80WvIantJt/kVqsgAM2wIPD+N7HROyyPyfbng+kI66
 w0obt0/3us2WA==
From: Mark Brown <broonie@kernel.org>
To: tanureal@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
 james.schulman@cirrus.com, rf@opensource.cirrus.com, oder_chiou@realtek.com,
 tiwai@suse.com, zheyuma97@gmail.com, david.rhodes@cirrus.com
In-Reply-To: <20220510153251.1741210-1-zheyuma97@gmail.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
Subject: Re: [PATCH 0/6] ASOC: Fix the error handling code of the probe
Message-Id: <165236476384.1016627.11149997612368396008.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Tue, 10 May 2022 23:32:45 +0800, Zheyu Ma wrote:
> These drivers mishandle the regulator resource in the probe function,
> failing to disable the regulator for probing failure.
> 
> Zheyu Ma (6):
>   ASoC: cs42l52: Fix the error handling of cs42l56_i2c_probe()
>   ASoC: cs35l36: Fix the error handling of cs35l36_i2c_probe()
>   ASoC: rt5645: Fix the error handling of rt5645_i2c_probe()
>   ASoC: tas571x: Fix the error handling of tas571x_i2c_probe()
>   ASoC: tas6424: Fix the error handling of tas6424_i2c_probe()
>   ASoC: wm8903: Fix the error handling of wm8903_i2c_probe()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: cs42l52: Fix the error handling of cs42l56_i2c_probe()
      commit: c1ce4ba5021a9730c00bab6f8122702deb69d37e
[2/6] ASoC: cs35l36: Fix the error handling of cs35l36_i2c_probe()
      commit: cf7250e95d309ae518918613fb904a4565ffc85d
[3/6] ASoC: rt5645: Fix the error handling of rt5645_i2c_probe()
      commit: 7883c193d7ae1ccc20ee4c06d2a1fea40074e454
[4/6] ASoC: tas571x: Fix the error handling of tas571x_i2c_probe()
      commit: ef1878fd0cd61f0f3fafdf518bb8f1df742ef760
[5/6] ASoC: tas6424: Fix the error handling of tas6424_i2c_probe()
      commit: 68cacb5cf5cf04aaa95be1fd76eff728dfddc613
[6/6] ASoC: wm8903: Fix the error handling of wm8903_i2c_probe()
      commit: 83d1b65d4cbe6fb0bbdacc18c1f4ad0450275d8f

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
