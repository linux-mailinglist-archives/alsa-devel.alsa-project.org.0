Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2135EBFDF
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 12:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7643D15C3;
	Tue, 27 Sep 2022 12:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7643D15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664274992;
	bh=Owy1eL2zE7HjhpIKBG9ABMOlVvTMODzZLcYVa8P0yAg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8US1JpoGQQ+kgn8iQp3L5WXOuAGSTbPX2/kkmDhT9tND6WHWqelbmQMS/Nzjz5vz
	 jFHt5tAyNj0F/ZBLqKXg0b05x1mhbIBiLU6kEfBKwNcwvSRmvTmPU3fNv5+tcJUPxh
	 NQez4tCmSvA3XXDPwzjubvEsdU56yE3i6LefDbsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1C5F80551;
	Tue, 27 Sep 2022 12:34:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2CB4F80551; Tue, 27 Sep 2022 12:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09CBF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 12:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09CBF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LI+DMpEb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8DA3B81ADD;
 Tue, 27 Sep 2022 10:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3863CC433C1;
 Tue, 27 Sep 2022 10:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664274862;
 bh=Owy1eL2zE7HjhpIKBG9ABMOlVvTMODzZLcYVa8P0yAg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LI+DMpEborBOpALwawGLrA7Gp6QTKN9vCaonpEbHUS3pywUfHGgbjEcLZVvOGuB24
 oCikCvvncq1xAOHSRShgaZ6wxdyjW5P+R6TGVLFNuyVPbzlJZTf2aXuJr6/bx8rnOI
 Rfz09p+BdnMsKCUr7OXgWFntqOCcEP/V9RAtcOdh/TfA+fMml7FIHaNFIYNfGNi2T6
 pVTHWOy8bnlEN+NiFxJQ/aNvqVKTFbkKlRyg7hzf1oVtGUQ65ZEspimTMYmEGh1/Mf
 1mZ/3uhLCUfEWzMTbWKrA0AZwxgYvCroGbmaPt38qNEfwOZ7iAggm57nihzPjI8e7H
 b19wcoTmMwgPA==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, 
 shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com
In-Reply-To: <1663928147-10106-1-git-send-email-shengjiu.wang@nxp.com>
References: <1663928147-10106-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH] ASoC: fsl_asrc_dma: fully initialize structs
Message-Id: <166427485994.60697.4779578506404492678.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 11:34:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Fri, 23 Sep 2022 18:15:47 +0800, Shengjiu Wang wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The driver uses two statically ininitialized struct dma_slave_config,
> but only one of them is initialized to zero. Initialize config_be to
> zero as well to make sure that no fields are filled with random values.
> Let the compiler do this instead of explicitly calling memset() which
> makes it easier to read.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: fully initialize structs
      commit: 1849a1505533501ea39ed0538c2d35eba4704baa

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
