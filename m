Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB32C26170A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED4116FD;
	Tue,  8 Sep 2020 19:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED4116FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599585877;
	bh=l5Q+9JBKRPoCD6QymRFJVpPNknfC6qEsMVteCOdwfp8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/KVppB/gRr34DFIrc48664e2wjQZo7ufuJ0+vLFvY7JRhTNdKELo0kF6/PiLBmfk
	 wY6iH9gLLd6pqu+vp0H5HtDZVt2j0q01JQVSwhY4dkJkJR3zgcuCSoUmGdMs7ittI8
	 9uau4g/FCSq1W6sP2B/BE70XVvo5HXiq17BkJITA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C30E3F802DD;
	Tue,  8 Sep 2020 19:21:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD0FF802DC; Tue,  8 Sep 2020 19:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8812AF802C4
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8812AF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L8+4aczg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E757206B5;
 Tue,  8 Sep 2020 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585679;
 bh=l5Q+9JBKRPoCD6QymRFJVpPNknfC6qEsMVteCOdwfp8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=L8+4aczgivxtFFzt6J8jzxpFMUENyq/HhBGekGW9/9I+NxKIqJmk5IgRVkwEVxBzD
 LsGocg1cJ8V1KkWcHUDwZQ3MmqVUi1TbsAZ63bvPXTz/Q2PddnRChMjljXf3wAjyb9
 jgnrkTYj1E6uMVIN3jnNF+LsnoXAeVZfD7s3hUMk=
Date: Tue, 08 Sep 2020 18:20:35 +0100
From: Mark Brown <broonie@kernel.org>
To: kernel@pengutronix.de, lgirdwood@gmail.com, xobs@kosagi.com,
 nicoleotsuka@gmail.com, linux-imx@nxp.com, shengjiu.wang@gmail.com,
 tiwai@suse.com, s.hauer@pengutronix.de, timur@kernel.org, festevam@gmail.com,
 perex@perex.cz, Yu Kuai <yukuai3@huawei.com>, shawnguo@kernel.org,
 Xiubo.Lee@gmail.com
In-Reply-To: <20200825130224.1488694-1-yukuai3@huawei.com>
References: <20200825130224.1488694-1-yukuai3@huawei.com>
Subject: Re: [PATCH V2] ASoC: fsl: imx-es8328: add missing put_device() call
 in imx_es8328_probe()
Message-Id: <159958562064.16576.4755759237768710693.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yi.zhang@huawei.com
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

On Tue, 25 Aug 2020 21:02:24 +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, imx_es8328_probe() doesn't have
> a corresponding put_device(). Thus add a jump target to fix the exception
> handling for this function implementation.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-es8328: add missing put_device() call in imx_es8328_probe()
      commit: e525db7e4b44c5b2b5aac0dad24e23cb58c54d22

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
