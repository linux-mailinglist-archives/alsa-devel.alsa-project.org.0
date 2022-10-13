Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFF15FDC93
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 16:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07CF5C8F;
	Thu, 13 Oct 2022 16:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07CF5C8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665672352;
	bh=L9DE9hBwSLM5JaCXLcIlpoE+HBbeeBOPZnvRaO3Xm6Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bsiEUC4sJe5PdxQ7/3a+s8XUx+hmDU1esukssPvXodIi3FHWVouRliDD5wuVlURmD
	 X+uvfa5IIFRPjG+ZocJ8EcnqpKCxX6wvMEum/C31GDuSsPSLtROhQNfOhDaeHCsbRL
	 z2iO5hiv8bZMwUwiSg2QQjQPuofzH/xsBMXZZxIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB325F80553;
	Thu, 13 Oct 2022 16:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08FDDF80543; Thu, 13 Oct 2022 16:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F58F80548
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F58F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ATTjg0D+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E28AB81E8B;
 Thu, 13 Oct 2022 14:44:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B302DC433D6;
 Thu, 13 Oct 2022 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665672243;
 bh=L9DE9hBwSLM5JaCXLcIlpoE+HBbeeBOPZnvRaO3Xm6Q=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=ATTjg0D++1erKR3/yxxiCKG2pC05PSr82NXb+ee8J/UX4PDGpGnzNtIqylpHJU7UY
 zg600oHG2xMXRNXSEIBpC2x1s+0fVJOUEdS3gs+4nMjfG7CG1z0fRRJESngiKqwAoN
 3WXi+eHvhiVul6L26RhRGuIZoe7xp/yqD6kEwUWYlF546FKrSKJ3JmHBmfZgUQ9itd
 /t7BZnV4OvZSD+aZhjHFoSHtokQyrazMa9mnIpxBD4lKdHX4wbNgvU06Qx5PkjeJ2y
 YEQ6IjQs+CMCBuqwWw2n3jS6zDafjR+jK2wNZAgSOE0RMfkdicWjrKoL/IzDYs08zz
 jy89jPOery59Q==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, quic_rohkumar@quicinc.com,
 linux-kernel@vger.kernel.org, andersson@kernel.org, 
 swboyd@chromium.org, judyhsiao@chromium.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, 
 agross@kernel.org, lgirdwood@gmail.com, srinivas.kandagatla@linaro.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, quic_plai@quicinc.com,
 perex@perex.cz, linux-arm-msm@vger.kernel.org, bgoswami@quicinc.com
In-Reply-To: <1665637711-13300-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665637711-13300-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: mark HDMI TX registers as
 volatile
Message-Id: <166567223944.170727.7516803650460275929.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 15:43:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Thu, 13 Oct 2022 10:38:31 +0530, Srinivasa Rao Mandadapu wrote:
> Update HDMI volatile registers list as DMA, Channel Selection registers,
> vbit control registers are being reflected by hardware DP port
> disconnection.
> 
> This update is required to fix no display and no sound issue observed
> after reconnecting TAMA/SANWA DP cables.
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
