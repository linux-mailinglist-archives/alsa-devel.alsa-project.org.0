Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0249559F873
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 13:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962911657;
	Wed, 24 Aug 2022 13:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962911657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661339633;
	bh=WN2bNE7LCOmWySlUEEWLIkJNJKcud+TzDqPnjTAbMsg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f+6GU5YAhgSb74tAwJOnd3CArIRY2dU+Obe27g/fYrN5Je6+kzr4/AoQ2ElntrwKp
	 o/ThEj6YLFuiPDRC+qxgj0Se+f8aZu/SY1rsZV5K1AGdKijvLak0pebkejgfPCM4EY
	 Obawpz6APjrJ25rKRuZPJg5w/Nx5Q5ZqyBLsG/f4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C0BF80515;
	Wed, 24 Aug 2022 13:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74AFFF8014E; Wed, 24 Aug 2022 13:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D08F8014E
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 13:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D08F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s1BbX4zp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37CA5B823A6;
 Wed, 24 Aug 2022 11:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE19C433D7;
 Wed, 24 Aug 2022 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661339537;
 bh=WN2bNE7LCOmWySlUEEWLIkJNJKcud+TzDqPnjTAbMsg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=s1BbX4zp04DOfkshyVXnAv78gF+UR1DDeXcbnQAW89ZJYk8ubed8PMRnNHHcXUwsN
 StSBms6vHOYCOC+0qB7TRFKlSoGk2ZgQC112ocwodLbfSsJk0/7UoVXu9LkY9IGWFD
 QSHddN0LXyGS9DnyzrMrn7QVnWF3CnQNMl5ANZqBAjJJPa6NVom5azBx71sQWgi7yj
 wVeKvFux5wKeiLTPhKGT/3eqdRSoHIV7HJf25+L+MvrC9LAol0WDFRiMFgwITwi3q5
 tCq6GXs1wDxxXPDiKTIaaYXx2xqBN+1u2Hd7O6f01THAe9DlS4CKEiMBajIlirVNVN
 hS8pPiuWsJJ2Q==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220823124359.24865-1-peter.ujfalusi@linux.intel.com>
References: <20220823124359.24865-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: Skip IMR boot after a firmware
 crash or boot failure
Message-Id: <166133953643.17904.7544751600598124284.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 12:12:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Tue, 23 Aug 2022 15:43:59 +0300, Peter Ujfalusi wrote:
> To make sure that we start from a clean state next time when the DSP is
> powered up after a firmware crash or boot failure we must skip the IMR
> booting attempt.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda: Skip IMR boot after a firmware crash or boot failure
      commit: 3b99852f4c874062295704dd483b03cab61301fe

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
