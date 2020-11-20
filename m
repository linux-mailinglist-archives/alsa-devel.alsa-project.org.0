Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D56972BB85D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 22:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BA81750;
	Fri, 20 Nov 2020 22:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BA81750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605907978;
	bh=fQE+1W08XxfCBd7vF8smIoqVAulL/tkcJGLL3E4/rVY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZO7pzJS5RXqICkcq9scHAFrNf5yuISF++bFXZnOY8qmzReaFs3dUoW4m2w8O60fE
	 n2dR81J8U404s2OlH/fTeaAkrUi5XtAKEXSkKxfw2A2cnyGBlBu2NvAtg/CdcOFbPz
	 FDYGMQa8MdsQRALmBVRW8TVB947E4lsb54ZHMTJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C02F804E0;
	Fri, 20 Nov 2020 22:29:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091C5F804E3; Fri, 20 Nov 2020 22:29:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2B51F804E0
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 22:29:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B51F804E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uCo7ggpr"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8145922D0A;
 Fri, 20 Nov 2020 21:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605907789;
 bh=fQE+1W08XxfCBd7vF8smIoqVAulL/tkcJGLL3E4/rVY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=uCo7ggpryoJ+4ZxoCs595QBY0KXftijwNbCpkeHPKSAvYZO5Uo1TqDrocj77x5TCU
 dZokeZiEi35PVxkI+PPo8ZNT4UClj8PBFDdzhP+uj3Ig3qH9vTATOJzY0HqVP85lKq
 xHN2xE2pKfoTqdksZozEYuKedZJlBFhjzeOjOEb4=
Date: Fri, 20 Nov 2020 21:29:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Patrick Lai <plai@codeaurora.org>
In-Reply-To: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
References: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
Message-Id: <160590773741.47461.18033846696938877967.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Thu, 19 Nov 2020 15:31:45 +0300, Dmitry Baryshkov wrote:
> Current code does not setup CPU dai (causing -EIO errors on playback)
> and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
> errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
> on RB5 platform.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: fix HDMI audio playback
      commit: ddf1c4b3944add7939f6778d8fb71df01e74d45f

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
