Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E2C27B581
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 21:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ABDF1867;
	Mon, 28 Sep 2020 21:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ABDF1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601322013;
	bh=1Mb3i9lZW4Laxdj7Sk4TswaLJBddRTPHUzEyLSpIJ9Y=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hRE1OohzK4lnPz92HmNr2ncNKY4Ay61J4KH7HyL9/l0xvaZHbOpbiSNEc+w1sSoCV
	 hyEYzhQVsb+OCadvFTDAp7xI2cyvc/QMBmX8jxZkR3B5T6qwuHrdgu2eSNVPceHJzh
	 cDWI1RYjzLIL2iXZNnCOzsWMOjxzvmA164IkrTjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129D7F802FB;
	Mon, 28 Sep 2020 21:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0599FF802E7; Mon, 28 Sep 2020 21:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 834A2F802DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 21:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 834A2F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IPDYCS4e"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 686E62075F;
 Mon, 28 Sep 2020 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321764;
 bh=1Mb3i9lZW4Laxdj7Sk4TswaLJBddRTPHUzEyLSpIJ9Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=IPDYCS4eIqvTKIG/xIzssJ0zXaEkc5QLDwflKnl5kBzMcIFnWKI/BVNTIc9PEBY2y
 vrDvHciwZW0w41l2PzZh9PjbiOVg+T9KQg3IZ92tMbChdjJ5+oIo60WbM2zIL8Zp+N
 jAHka+PkEUPCDROJwn2h/7ERCCTyIzbYoU2Z3444=
Date: Mon, 28 Sep 2020 20:35:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200925210509.83353-1-pierre-louis.bossart@linux.intel.com>
References: <20200925210509.83353-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: rt715: Add power-up delay to fix dmic pop sound
 issue.
Message-Id: <160132168198.55254.8270167950000919235.b4-ty@kernel.org>
Cc: tiwai@suse.de, Jack Yu <jack.yu@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Fri, 25 Sep 2020 16:05:09 -0500, Pierre-Louis Bossart wrote:
> Add 400ms power-up delay recommended to fix pop noise on capture.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715: Add power-up delay to fix dmic pop sound issue.
      commit: 16346a3cf02ebb8906c6a0ba907f83ea62cc874b

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
