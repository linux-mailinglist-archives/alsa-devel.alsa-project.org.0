Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCEB329548
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:40:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA1601681;
	Tue,  2 Mar 2021 00:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA1601681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642039;
	bh=nrIQj+PF6xl0Ng8IlfsVHRNF45bzLAB5oRssCxEx3LI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QNJL0NeoHQlBP7l0+//upjScxwMOp1aAI2jqDBEP9WxsI7cGmz6fRh0vmdGuMt3iy
	 ipt1xaWTxxjiFi+ePWWYiC4jtfgrqEAqVWfXdtFikpD6EE+wbZQLxqTguX0axb8sPR
	 dtO3y0bjKcMQCrjwmSTgfKmGRalAc8FIHZCM1ao8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9148F804D9;
	Tue,  2 Mar 2021 00:36:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED45F804D8; Tue,  2 Mar 2021 00:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F416F804B4
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F416F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QFJZgQAR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23F94600CD;
 Mon,  1 Mar 2021 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641790;
 bh=nrIQj+PF6xl0Ng8IlfsVHRNF45bzLAB5oRssCxEx3LI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QFJZgQARvXFK8J+2oAFqDC000HBhw2EThvON11Q1b7pTQHLSlVqy/ErvxjO5rrdqo
 c26YP5TSaD6WHogyBG6FVNT9wqFRVOwJc/UghCcMUrvnp2qoCVVaHbx2s/BJOQl8/c
 xhpoJOiaaYuh2MpENMlPx0qetTaGMIwk41adsyNGxKUgxdgGOJvrRZ9ASkYYjXbcK0
 rPLli8qiJhGacalRXuO5VhV9TqhM1/pK7s+0W0fgAD1ZLet4fLgPjTRweepxUzQKzx
 nWOGLbkeLvbjj/VzRzbTn5dMNUw87WQlzcSCE5YY8czDFJOVsemTgjEpCTYEGehw2d
 yxdg/8OftwmZw==
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20210226143817.84287-1-hdegoede@redhat.com>
References: <20210226143817.84287-1-hdegoede@redhat.com>
Subject: Re: (subset) [PATCH 0/5] AsoC: rt5640/rt5651: Volume control fixes
Message-Id: <161464168097.31144.7188432033841191426.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org
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

On Fri, 26 Feb 2021 15:38:12 +0100, Hans de Goede wrote:
> Here is a series of rt5640/rt5651 volume-control fixes which I wrote
> while working on a bytcr-rt5640 UCM profile patch-series adding
> hardware-volume control to devices using this UCM profile.
> 
> The UCM series will also work on older kernels, but it works best on
> kernels with this series applied, giving e.g. finer grained volume
> control and support for hardware muting the outputs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5640: Fix dac- and adc- vol-tlv values being off by a factor of 10
      commit: 24a7b77daed8f973bf8a5ed2f83344f44f9f6396
[2/5] ASoC: rt5651: Fix dac- and adc- vol-tlv values being off by a factor of 10
      commit: e4ffab875d32bf4ffa37b5cd725ace9e15d1707d

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
