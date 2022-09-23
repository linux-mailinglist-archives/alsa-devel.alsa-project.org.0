Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669505E805E
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 19:08:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0978F827;
	Fri, 23 Sep 2022 19:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0978F827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663952908;
	bh=yv65ncJXP7zLVMNN7B/VDPHTlWRGuMb/y6L+TYsAh/Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nw30c8bIS9qS5NiVPb7j0O5CWk/J6Pt9cyIE+WFHqKNcxSK9IeBGZSSM1eV2nOdQW
	 snXHlej4N08ZHqKMGYxTomRZmyJBIMK24VTJrrO16LSZvQc6IJyAUmjggKkEbVpERN
	 gVskwhEzwy+2TaSFYZJI2vA6rkaqz3NadI7M8/KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E08F80107;
	Fri, 23 Sep 2022 19:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8286CF804E4; Fri, 23 Sep 2022 19:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13555F80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 19:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13555F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EYo3+adf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 444B3B8211A;
 Fri, 23 Sep 2022 17:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6DDC433D6;
 Fri, 23 Sep 2022 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663952820;
 bh=yv65ncJXP7zLVMNN7B/VDPHTlWRGuMb/y6L+TYsAh/Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EYo3+adffwYq+V60pgZhrnEsjdK72Opshe6krDmqOjpA643KcE3o8fELUUZ83oaEF
 CakBPYWSwvHxKiUb02XOIHkv8TkZ7TkRYc+JDWvJyBbJ19cocw0y6w3j1rCNVVljMB
 M1Pf+Cue4ZXGgZJ8bj2kNjshLULKhVznlQNYGYapbFAcqLdOWFTXo8+w/KnEDgF2hu
 RW0mANNFgode+5S6TMw+HyJ1dhHgbTcHxJ4NDM8hn7OiqWWUBowiAWW5JxgdJECTVu
 lcIR1V9q9O7ElSItDp6Nitb5BpSClXbhbfEuPjzzJFyQ8T3YcfV+bn1fxlg0nrtW3r
 J95mbaH4t3xlg==
From: Mark Brown <broonie@kernel.org>
To: linux-imx@nxp.com, shawnguo@kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, shengjiu.wang@gmail.com, 
 tiwai@suse.com, s.hauer@pengutronix.de, lgirdwood@gmail.com,
 kernel@pengutronix.de, Xiubo.Lee@gmail.com, 
 Gaosheng Cui <cuigaosheng1@huawei.com>, festevam@gmail.com
In-Reply-To: <20220923090355.507648-1-cuigaosheng1@huawei.com>
References: <20220923090355.507648-1-cuigaosheng1@huawei.com>
Subject: Re: [PATCH] ASoC: fsl: Remove unused inline function
 imx_pcm_dma_params_init_data()
Message-Id: <166395281690.610218.17739272553546985512.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 18:06:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 23 Sep 2022 17:03:55 +0800, Gaosheng Cui wrote:
> The imx_pcm_dma_params_init_data() are no longer used since
> commit c31da0b196f9 ("ASoC: imx-ssi: Remove unused driver"),
> and the function is used to initialize some members of
> "struct imx_dma_data", it's more readable to assign the value
> directly, imx_pcm_dma_params_init_data is useless, so remove it.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Remove unused inline function imx_pcm_dma_params_init_data()
      commit: 4f865485e8ef1d04de23fc1def1fa4e39fb00b91

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
