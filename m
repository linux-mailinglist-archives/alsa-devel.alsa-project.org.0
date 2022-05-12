Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5872B524F9F
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB4B91AC1;
	Thu, 12 May 2022 16:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB4B91AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364862;
	bh=UIXcV2KLWijXWL19jQLq1vEhgqxz6qEWy8qt2aKyHXE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THj+wyYLRDBhh0tQjIh2tILh2bi4OsztWAPPD6R2sgQuRJdiclzqelDyDewepfnJe
	 R4+S72IbV9F/uvc/0yytpDI+seEu2ghcRqo7YyLxW8SADXQcO2vkrC1GWPThoFOHfs
	 igflj8cyn0NMmcX5r3D3zJCu/8h3Ogyp48sUp8v4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE46F804FE;
	Thu, 12 May 2022 16:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F7C8F80245; Thu, 12 May 2022 16:12:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 084C9F80154
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 084C9F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a+r+E+To"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E14FCB8284F;
 Thu, 12 May 2022 14:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC6FC34114;
 Thu, 12 May 2022 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364763;
 bh=UIXcV2KLWijXWL19jQLq1vEhgqxz6qEWy8qt2aKyHXE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=a+r+E+ToFiNe9Q7bFQULMTHx1L1w/qPqi22IiPMWuBdhHM2PMyik/wtrfUatP3Qwu
 f/ymLloRnIPL9gHtXw8KX1zJpXeCsNNNDvaH1XbsPUkrKJSYy6yaa46/QrqqvBA45K
 dLouZyUfxUxr1YRmmWGcRSDN1+AQL5tYeAqEbhxqk236jNDgSiejU3wcugptP9q0Uo
 otnhI8wtvttwXf8huK8VHoDKu4xsvCq4/vcQ+z6ByhxcY41Nr5NtxJ76o0VPgGe/qd
 l9+7DqfbVcaauw+IjIpsjDbd0OKcVgYPDNs0t7Nilmfyyl3i8GXeZac0ijp0e7YC8S
 rMHxvAAY8lZiQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 tiwai@suse.com, shengjiu.wang@nxp.com, nicoleotsuka@gmail.com,
 shengjiu.wang@gmail.com, festevam@gmail.com, perex@perex.cz
In-Reply-To: <1652183808-3745-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652183808-3745-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_ssi: Add support multi fifo script
Message-Id: <165236476117.1016627.2134369167163504091.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 10 May 2022 19:56:48 +0800, Shengjiu Wang wrote:
> With dual fifo enabled, the case that recording mono sound
> in the background, playback mono sound twice in parallal,
> at second time playback sound may distort, the possible
> reason is using dual fifo to playback mono sound is not
> recommended.
> 
> This patch is to provide a option to use multi fifo script,
> which can be dynamically configured as one fifo or two fifo
> mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_ssi: Add support multi fifo script
      commit: 7aded7003a4e949b3bf73f060771f9db018a6d96

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
