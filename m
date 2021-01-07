Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9C2EE67C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 21:03:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135DF1697;
	Thu,  7 Jan 2021 21:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135DF1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610049781;
	bh=PJgeKy1XGiQvnFqBwwZmmsLTvNTmtQ1IVJ+kf/APXuE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXReRiZ5ukIE8gEY5JdLioGGAzv1BPpTJ3RofPiVBhyIehtyk0FQc/fulq652sTuj
	 7EfZcrelHAt3Up/AqiA+wnvl8LrDtv1r2Lqfbo1qTfTS7JQLw321S/uKkiRz894Pwg
	 MslUf2hfTB2ZXKRnk68frD0fxq01SfmhDSiGN5aI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D24F80258;
	Thu,  7 Jan 2021 21:01:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A889FF80258; Thu,  7 Jan 2021 21:01:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBE35F800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 21:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE35F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rNWtIyc0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 855D6233A0;
 Thu,  7 Jan 2021 20:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610049678;
 bh=PJgeKy1XGiQvnFqBwwZmmsLTvNTmtQ1IVJ+kf/APXuE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rNWtIyc0Z6OePqZl8LWWsHMUcWk8JCv8z09HM1LDB4klktrIvmiax6YOUjvLaACZ8
 Wj8Pnea3+61YXZYaPyWFCzVgWle7Ne6pk7xVTHDgHkbM+mQVrkesfUDcUWk+KXebtC
 9PqTnWi2UKK0+sf7pqrHFKyKKYFtAEQN6QMUC1//hBdmyH/NwUWoR4jrJ70SmRfQaN
 sVuwMPLkCQ5dmixVUtOGq7NrAqPgzpKsjY2bNFmJEhW5dntqJTHvpJJSHqHzMXre96
 nR0Nu/M/8G2AI14+ek/EEP+nNHHd2Q/fGkEcwo8iag10b5LuA1pCOUUhRDLcQDHD3H
 yK7v2UZMJ3idQ==
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20210107120757.12051-1-hdegoede@redhat.com>
References: <20210107120757.12051-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Remove comment about SSP0
 being untested
Message-Id: <161004964961.33461.7335707124480424095.b4-ty@kernel.org>
Date: Thu, 07 Jan 2021 20:00:49 +0000
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

On Thu, 7 Jan 2021 13:07:57 +0100, Hans de Goede wrote:
> Remove a stale comment about SSP0 being untested, the
> bytcht_es8316 has supported SSP0 for a while now and this has
> been successfully tested on a GP electrinic T701 tablet.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcht_es8316: Remove comment about SSP0 being untested
      commit: aac568269bd80a510758ec5d5744b1a2eea3f049

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
