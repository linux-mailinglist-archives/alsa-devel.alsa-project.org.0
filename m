Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D85230F7A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 538C21713;
	Tue, 28 Jul 2020 18:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 538C21713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595954068;
	bh=BZwhUZpe5e425x06t4BOtTNWFnuWqYsrqCx1geT9dOQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQ69FMtdmDrAwCvGfYlffEdnN0LrzA/RLLv1TbaAMCXYkwy7fIjXsyT815avN4PPk
	 i4fOJDYhsm4wfZOlbe2wPIknJlDR2MlMTH0xJ6C54tGs+hpBUh2KEWpWl1F/nI1pKD
	 fBqmcw6Vxhu8dNcZ+2OH0/p9LMhzMgMyNTaSzGsU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D30DDF802DF;
	Tue, 28 Jul 2020 18:31:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4AEAF802DD; Tue, 28 Jul 2020 18:31:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 465DCF8029B
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 465DCF8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FIIi3X5A"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D96F820829;
 Tue, 28 Jul 2020 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595953869;
 bh=BZwhUZpe5e425x06t4BOtTNWFnuWqYsrqCx1geT9dOQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FIIi3X5AbAI5i9/srqq3IewIwxymh2RBtPjPxSHN6NF3injqq9I+s7Hi3eXKzX7LV
 f0oF9yg43Y59xlydcLgrSWypyhVN7GxcOgPeaQW7vwuAwbEpq3Hb5MIbh/Wvk0IaEE
 k1siPY87yDV+dJdfQBwNFLPa4qSpBV3ozKok7fO0=
Date: Tue, 28 Jul 2020 17:30:51 +0100
From: Mark Brown <broonie@kernel.org>
To: bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 rjui@broadcom.com, nsaenzjulienne@suse.de, sbranden@broadcom.com,
 perex@perex.cz, linux-rpi-kernel@lists.infradead.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, tiwai@suse.com
In-Reply-To: <1595564371-13692-1-git-send-email-sw0312.kim@samsung.com>
References: <CGME20200724041800epcas1p278804da75ff7212de2004577df8d6e63@epcas1p2.samsung.com>
 <1595564371-13692-1-git-send-email-sw0312.kim@samsung.com>
Subject: Re: [PATCH] ASoC: bcm2835: Silence clk_get() error on -EPROBE_DEFER
Message-Id: <159595383113.15027.15618107122015365931.b4-ty@kernel.org>
Cc: jh80.chung@samsung.com
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

On Fri, 24 Jul 2020 13:19:31 +0900, Seung-Woo Kim wrote:
> Silence clk_get() error with dev_dbg() on -EPROBE_DEFER.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: bcm2835: Silence clk_get() error on -EPROBE_DEFER
      commit: 92a007944e37a6de8820dca83e802f35c6faca3a

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
