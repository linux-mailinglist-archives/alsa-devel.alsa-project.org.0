Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB511B0CF8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 15:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 408191681;
	Mon, 20 Apr 2020 15:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 408191681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587390036;
	bh=LabIAdcjRXkFzanlO5dwkADJ/hSPssTCX7vloN7yEXM=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jxhfM3ODDoeaxdZkHzxl8YxLaZNvuO9GzhTfgcJGaLCilIh5ZPegBet+DSwiF3oY3
	 H5g0BUmiEQgEogTX82INi+8Wq7c1AiBLICVkpJeVm7/graOi271G+I/GskOc/DxRVW
	 /vu9nC5XQAOhQyWr8wssQeWdb4r4zhddi0by1RIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4163F802A1;
	Mon, 20 Apr 2020 15:37:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2313F802A0; Mon, 20 Apr 2020 15:37:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E47E4F8029A
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 15:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E47E4F8029A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iM1yKWrC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC4CA20735;
 Mon, 20 Apr 2020 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587389835;
 bh=LabIAdcjRXkFzanlO5dwkADJ/hSPssTCX7vloN7yEXM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=iM1yKWrCDAx0nbJXQwLmEZfNlQFjZX7GQvb2CK2OLYBlINsvcNS34icauslzLlciW
 DsUmahSAchoUj66nhcnfnY9RB74I8l1SsDSgdmuUnx2syEbAj0IxSEmXBr/SAtAEak
 E7XF2p1uniIGZMiKKiNRrkQ925kj6RtAy3Qcb/rw=
Date: Mon, 20 Apr 2020 14:37:12 +0100
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 amadeuszx.slawinski@linux.intel.com, perex@perex.cz,
 Jason Yan <yanaijie@huawei.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20200420042858.19298-1-yanaijie@huawei.com>
References: <20200420042858.19298-1-yanaijie@huawei.com>
Subject: Re: [PATCH] ASoC: topology: remove unneeded semicolon
Message-Id: <158738983288.28866.14153649784300796683.b4-ty@kernel.org>
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

On Mon, 20 Apr 2020 12:28:58 +0800, Jason Yan wrote:
> Fix the following coccicheck warning:
> 
> sound/soc/soc-topology.c:2344:2-3: Unneeded semicolon
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  sound/soc/soc-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied to

	broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: topology: Remove unneeded semicolon
      commit: 980f91778a2f4dcca43d16b7a83feda8df5c96e7

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
