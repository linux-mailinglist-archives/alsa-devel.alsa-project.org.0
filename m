Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7D279272
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22108190B;
	Fri, 25 Sep 2020 22:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22108190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066642;
	bh=mM9gr7QmADGTaHoBJX4KS+CFOPur7mCrz2hx6I90bGQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b16K+gcUKEJABpOmpqFjYHitBWTVjPBJqLFJ7uurqkWfC37qej26d57frblYdIfbQ
	 gQI8LgTa21LeONi/ToZ7zbe9gqdLl84l8NPDiwVsPjGnNxzipcY0WvEJ+HZPKDZO7O
	 z7EEA2Xn0U5QVh+YVAVuU38Rp5O3vUpo4eE7/0DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51AC0F80162;
	Fri, 25 Sep 2020 22:42:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE7D7F801EB; Fri, 25 Sep 2020 22:42:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 700BFF800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 700BFF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wTxbbRMK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4BD920838;
 Fri, 25 Sep 2020 20:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066531;
 bh=mM9gr7QmADGTaHoBJX4KS+CFOPur7mCrz2hx6I90bGQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=wTxbbRMKHhd+IoB87nAYO/s7aUKxKtfhy0AUZAI3UqcBSrc6tPgmDi//Lzbp19twN
 IFl3lHKAokLm10rqrXHQYU5qMNfdDllKCZt9ZiW+wMiSV11laOv+IsVGUV2k+oH5Ek
 Fw82xKAYop0eOg1bxQxAwPUCQRWH3N6H9AKceWBg=
Date: Fri, 25 Sep 2020 21:41:16 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, shawnguo@kernel.org,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, linux-imx@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 perex@perex.cz, festevam@gmail.com, alsa-devel@alsa-project.org,
 Xu Wang <vulab@iscas.ac.cn>, shengjiu.wang@gmail.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, timur@kernel.org
In-Reply-To: <20200916061420.10403-1-vulab@iscas.ac.cn>
References: <20200916061420.10403-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] fsl: imx-audmix : Replace seq_printf with seq_puts
Message-Id: <160106647646.2866.15040520105336965712.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org
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

On Wed, 16 Sep 2020 06:14:20 +0000, Xu Wang wrote:
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "devm_kcalloc".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-audmix: Use devm_kcalloc() instead of devm_kzalloc()
      commit: f95cc5c18c15a425c3dceec48df6b4e27a202dda

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
