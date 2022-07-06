Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3B568673
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:10:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1820E16E5;
	Wed,  6 Jul 2022 13:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1820E16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657105836;
	bh=tJJ+5MPN/oG82eYpJBXpRDJ/8GpcbhDDoR+MV9YNgrs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVPCQxeknA4TN8nMoSYGz3+TJli0SBtLAUMq8osVmRzG2cssTl39OyEmQUYAnRCj4
	 ajneodbq+hCn19zsOTvHaMTjx5VmeE3Aj8nkPqSblhTeyqAUCS+RzV2Jub5M/1Qm52
	 wuPAFbGQ3cr0n80PHM88u6iuj3VGpuRvEuJ/LF7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65608F80559;
	Wed,  6 Jul 2022 13:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3726BF80557; Wed,  6 Jul 2022 13:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05948F80557
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05948F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="klhrRaPF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AE47B81BE2;
 Wed,  6 Jul 2022 11:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9469CC341CA;
 Wed,  6 Jul 2022 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657105687;
 bh=tJJ+5MPN/oG82eYpJBXpRDJ/8GpcbhDDoR+MV9YNgrs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=klhrRaPFnI9RN+S7/luot2a7VHGRsjzSF3kxGEdUWAFasuw50Ah2kERLVj+AW1XNj
 oh8RLLzGt2UDszMS9IAq0z97fI1bhswPaEGYw5VTgOwr/fzfGv4YIvgB90aQ3XJmTT
 vveMtPMvIuju9pE30CPq+xal8/WupA6ztfUfK7MASA+bHyYpzSxEpUfRqs8YhR1JG7
 tc6l6Eu0dARYWq+8uQw+TVUPhCoPN0ncMWoI7WifIPW5uH5urjzv++LEen5fuNcBo7
 wWMhMRVMiuLrxkeeAFQluKxkRssDC1aef8q+I1v6YReiU4MN5Y9N8TbtieTebHhdoI
 KZK6ZUs3MNx4Q==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 konrad.dybcio@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, bjorn.andersson@linaro.org
In-Reply-To: <20220705182802.775803-1-krzysztof.kozlowski@linaro.org>
References: <20220705182802.775803-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] ASoC: dt-bindings: qcom,sm8250: add SDM845 sound
Message-Id: <165710568432.237380.17718065730024815126.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 12:08:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: stephan@gerhold.net
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

On Tue, 5 Jul 2022 20:28:02 +0200, Krzysztof Kozlowski wrote:
> The Qualcomm SDM845 sound card bindings are almost the same as SM8250,
> except "pin-switches" and "widgets" properties.  These were not
> documented in SDM845 text bindings but are actually valid for SDM845.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,sm8250: add SDM845 sound
      commit: 50791dcb7de32f9f78061f7f460966ac5616b38e

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
