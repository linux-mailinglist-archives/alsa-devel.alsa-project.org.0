Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E8279295
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9225D192E;
	Fri, 25 Sep 2020 22:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9225D192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066838;
	bh=cLGCGu0fXOBAhLAOL+Vx73SUpPBBubCY99whgp9Yt8I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uPGoXv94qLJnW4iRKTY4KPyogDI5oqwMBYJht2eAr318XS9+Mgv3StYaRRpwjJ3Wk
	 7SPoLgntTHg0mpJFr29YKcVtSk0aPxjIrRV9keghxn4FZUmZFdv0/F3N5Tr1ntxTB1
	 udB5tjnqufrYoMX1mSHtrrMImV25+B2oJa/Uq3ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5690EF802EB;
	Fri, 25 Sep 2020 22:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06780F802E8; Fri, 25 Sep 2020 22:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A87F802DC
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A87F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cG6tfkw8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0484720838;
 Fri, 25 Sep 2020 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066561;
 bh=cLGCGu0fXOBAhLAOL+Vx73SUpPBBubCY99whgp9Yt8I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cG6tfkw8+C5FbHzdHYHvGWf4Fo7TnI/OTRixxNF84vXWT/Ckzorapdlp82RIjpVX/
 TvvlmpqCjG6goIBUzFF8/vqjgiK7i81XLHNNReq1qg86lOCiWvDpgKLWgCLK2eGp7t
 4INvxD+3aZed8nHelL1Zgmi+E9F5Q5QGvzU/WYJI=
Date: Fri, 25 Sep 2020 21:41:46 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
 tiwai@suse.com, agross@kernel.org, linux-kernel@vger.kernel.org,
 plai@codeaurora.org, bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
 perex@perex.cz, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, rohitkr@codeaurora.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
In-Reply-To: <1600448073-6709-1-git-send-email-srivasam@codeaurora.org>
References: <1600448073-6709-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together
Message-Id: <160106647646.2866.13772789972277251884.b4-ty@kernel.org>
Cc: vsujithk <vsujithk@codeaurora.org>
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

On Fri, 18 Sep 2020 22:24:33 +0530, Srinivasa Rao Mandadapu wrote:
> Update lpass-cpu.c to enable I2S BCLK and LRCLK together.
> Remove BCLK enable in lpass_cpu_daiops_startup and
> add in lpass_cpu_daiops_trigger API.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together
      commit: 7e6799d8f87d7ab7ae55a229654d161b5bfae874

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
