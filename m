Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE05FDC8D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 16:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A7795C75;
	Thu, 13 Oct 2022 16:44:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A7795C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665672307;
	bh=NvwyE1DUE80ntZaLJ5MtSrUAvFGAB1vF7A51Xc8PXhM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZinNBBhdr08274ssW5atIVlGTJ+GJVv7DnjKOMc4MSkyZ+lvp9srDUfNab/dlZG7
	 yKpNxmuL44xsrbCj4oiL/E35TJFx9QxV61MSvOymYwvpCcg9VApsSiTmDeGZ/TjPCh
	 DuAyW8Fhr35LXPQ5eImcuOehvfsOV7pL+i4afDpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A46F8053D;
	Thu, 13 Oct 2022 16:44:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B53C2F8053C; Thu, 13 Oct 2022 16:43:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75FB0F80132
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75FB0F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g9R9GJtT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C265661808;
 Thu, 13 Oct 2022 14:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4D2C433C1;
 Thu, 13 Oct 2022 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665672234;
 bh=NvwyE1DUE80ntZaLJ5MtSrUAvFGAB1vF7A51Xc8PXhM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=g9R9GJtTg7FFJe6055C6CXI223Xhi9OyC0wc4IfG8ju3WBbgExL1Y99c+NAPi5nZu
 nLHQkx3d9C6lKkMPiOJBxsM4vEwpbY1ODj4KLv7z+VR2kAZ9npSM3/Q5yWP8e2wAcJ
 2yb9ot6OFf1BkgRmt/PwVCD+V7URzOw4/n2n3FSEHk6QB0+vOpSACKOpS6BQT0bcz4
 Ke5Im2DGZ6bMaSDE1dxCjK4e/ODNqTm6CeCkQop/vOWoSo9Ih1JZN9oB2TOabe5MKq
 hWyWh0N8sXN769affI4Mr8+G6Z4g+cMF+91d5u1W6Go4+rr+uHnyqG4XlWbE78D55f
 kr6M1X0C1OZQw==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, quic_rohkumar@quicinc.com,
 linux-kernel@vger.kernel.org, andersson@kernel.org, 
 swboyd@chromium.org, srinivas.kandagatla@linaro.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, 
 judyhsiao@chromium.org, lgirdwood@gmail.com, agross@kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 quic_plai@quicinc.com, bgoswami@quicinc.com, perex@perex.cz, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <1665569560-28943-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665569560-28943-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: mark HDMI TX registers as volatile
Message-Id: <166567223036.170727.7011980883912234789.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 15:43:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Srinivasa Rao Mandadapu <srivasam@qualcomm.corp-partner.google.com>
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

On Wed, 12 Oct 2022 15:42:40 +0530, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@qualcomm.corp-partner.google.com>
> 
> Update HDMI volatile registers list as DMA, Channel Selection registers
> , vbit control registers are being reflected by hardware DP port
> disconnection.
> This update is required to fix no display and no sound issue
> observed after reconnecting TAMA/SANWA DP cables.
> Once DP cable is unplugged, DMA control registers are being reset by
> hardware, however at second plugin, new dma control values does not
> updated to the dma hardware registers since new register value and
> cached values at the time of first plugin are same.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: mark HDMI TX registers as volatile
      commit: c9a3545b1d771fb7b06a487796c40288c02c41c5

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
