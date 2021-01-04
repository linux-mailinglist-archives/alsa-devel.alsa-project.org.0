Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0915E2E9C35
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 18:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E181683;
	Mon,  4 Jan 2021 18:41:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E181683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609782120;
	bh=V2oGYPbSi6aA3r4g30F2Mg4qcT0P4CxmiDuS2SFjEas=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXeHyXjyR6Pvhxze2d8ks/wMMEQgFV9ZJpNdE4iIZsJufPVRPQOCDqJD6H5gROSKL
	 +lXLLEm72YB6NrddQW3b6NXgbJ33u+Iszve5+1wuVtWPHaqN626XQcED7qM99nyP12
	 Lf6avGIueHme0qMuM9sfetd/u2WKqNqyxLTIO7W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9338DF8012B;
	Mon,  4 Jan 2021 18:40:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80AF6F80166; Mon,  4 Jan 2021 18:40:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D13D5F80158
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 18:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13D5F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cuo94cEc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63FF720679;
 Mon,  4 Jan 2021 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609782015;
 bh=V2oGYPbSi6aA3r4g30F2Mg4qcT0P4CxmiDuS2SFjEas=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cuo94cEciJVUKipGgtXCAsrtR6QcFK8+YBI/6/W9JvUV6wyYKD+rJiZgJJFVlrOS7
 l3U/ZYGqH+3RdoOB8jCoSSNkpWKNbIN9E0117GZk/r0vtuTbQGj4Ht4Fq6QeMiZDDQ
 Y8s8DzDhDOxx4lJ+WsJFR76AkhlKrTy3MEJKGt6021RkzkUDZ3J9QmNkssAmiQH0D/
 DLD4vhAl0z7U5oMrfh6md93+zOUNdXH3aL8yszHlYm8DdZTXmyPcBUsymc37msDYj4
 QRdPhr8WSaCbtaWQNKXXb6dK8r13NuG5+0JXZr2C9yF5Rmop/WIB2iYRB65viBxivC
 DdZnvblRHQnbg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20210103135327.3630973-1-arnd@kernel.org>
References: <20210103135327.3630973-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: select SND_SOC_IMX_PCM_DMA
Message-Id: <160978198913.14397.3806558309581636752.b4-ty@kernel.org>
Date: Mon, 04 Jan 2021 17:39:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Viorel Suman <viorel.suman@nxp.com>, Fabio Estevam <festevam@gmail.com>
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

On Sun, 3 Jan 2021 14:53:17 +0100, Arnd Bergmann wrote:
> The newly added driver requires DMA support and fails to build
> when that is disabled:
> 
> aarch64-linux-ld: sound/soc/fsl/fsl_aud2htx.o: in function `fsl_aud2htx_probe':
> fsl_aud2htx.c:(.text+0x3e0): undefined reference to `imx_pcm_dma_init'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_aud2htx: select SND_SOC_IMX_PCM_DMA
      commit: a1f31cc4e98e1833f53fd2c6e9a218d6b86f5388

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
