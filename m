Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47425D5A5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 12:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7025A1AF8;
	Fri,  4 Sep 2020 12:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7025A1AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599214005;
	bh=iUMJZ9XEPBrALRtw0yY0mY/bAWNjuejgCUBl80L18YI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgSn6HBdWU1xUiqtKz9g/KJRU+sBJzs/nGyesc7f3XGRK4MOxVPjUb6KCyS0PEYM/
	 wJKmKLUIArtMxxo9NdIP5FIzq+BJieXTnWrdbhfiIOC/M06WRNpxLYQ7Xv8F5D0unC
	 qhgK/zZPwnRY/jwNVmRlINUJB0mQtx/NghldKeng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 999D8F8025E;
	Fri,  4 Sep 2020 12:04:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B896BF80268; Fri,  4 Sep 2020 12:04:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A4FF80257
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 12:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A4FF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Uy0+wzkM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 805C9206D4;
 Fri,  4 Sep 2020 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599213858;
 bh=iUMJZ9XEPBrALRtw0yY0mY/bAWNjuejgCUBl80L18YI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Uy0+wzkM5dV28M5FUEtM5PZPtvnwn3gl3sNxfM6QfXGocyLE6P6D0tEdVOGN3sr7D
 OvA0CUKiWI17SejscqTfLX4lZo73stZmeUvhal6nPIzUMtAhe6ILq/wcrfPSEeyLVY
 YYJlWzEVNt4ecKxWoPnLNvoRXkzk1mv2YRnwkpaI=
Date: Fri, 04 Sep 2020 11:03:36 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
References: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: multi core support for 5.10
Message-Id: <159921381111.42159.653916682345610756.b4-ty@kernel.org>
Cc: daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com
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

On Wed, 2 Sep 2020 17:07:53 +0300, Kai Vehmanen wrote:
> This series extends the multi-core support in SOF. Capability
> to specify which core to use, on a per component basis, is added
> to topology. The topology load functionality in SOF is modified to
> power up/down host controlled cores based on the topology
> description.
> 
> Guennadi Liakhovetski (2):
>   ASoC: SOF: add a "core" parameter to widget loading functions
>   ASoC: SOF: support topology components on secondary cores
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: add a "core" parameter to widget loading functions
      commit: 0dcdf84289fbf61cd42cbb1e379e2150aa17e31e
[2/3] ASoC: SOF: support topology components on secondary cores
      commit: d1c6c4a9fd3da5c735386b0cdb44d79667f10a1b
[3/3] ASoC: SOF: topology: fix core enable sequence
      commit: 8c9ff1219aef657954540147522ceaecced71b2b

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
