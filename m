Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E491ACA8D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:36:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B841666;
	Thu, 16 Apr 2020 17:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B841666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587051416;
	bh=cm5eKnHDf7WtBLQg4e4NaXwt9ZqZ+pLml8cOimogapc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fDm9bNyCULPcMCuuJU4xLee8dnzXX3QaP+8X5Yqn+41jcNa1eLyQHyPApMgZlMqyQ
	 mwUf2aawnsqNZaygbGaDc7JBmctSH/zDYeN59JPYuGI+gR56HUycvXLM1Y/yJmXsco
	 fnVCoYWvjtBihGiFGPOvAapElrfY7yl4VWkPKxi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47BDBF8027D;
	Thu, 16 Apr 2020 17:34:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A125F8014E; Thu, 16 Apr 2020 17:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 894ECF800AB
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 894ECF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b4W9GgOX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8132F22244;
 Thu, 16 Apr 2020 15:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587051262;
 bh=cm5eKnHDf7WtBLQg4e4NaXwt9ZqZ+pLml8cOimogapc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=b4W9GgOXN/tS7grTIz9CDv4DUjSrIlCNQHob785c8VYERJqv1rOX4qR6zIw/deXRv
 n2hQyhWBnifk8HYUqbbUoVkxBYpVd4U4qgXO2JMRxoGuqYpuJXh16xzjvZ2iTrlWbS
 V/OOISaMNNInmoGKm9GsYAjr/rggvJeb0Z2B0B/8=
Date: Thu, 16 Apr 2020 16:34:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200415081159.1098-1-stephan@gerhold.net>
References: <20200415081159.1098-1-stephan@gerhold.net>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: qdsp6: Suggest more generic node
 names
Message-Id: <158705078452.48712.10956473806918313608.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
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

On Wed, 15 Apr 2020 10:11:58 +0200, Stephan Gerhold wrote:
> Change the listed examples to use more generic node names, representing
> the class of the device nodes:
> 
>   - apr-service@<id>
>   - dai@<id>
> 
> Both names are already in use in arch/arm64/boot/dts/qcom/sdm845.dtsi.
> 
> [...]

Applied, thanks!

[1/2] ASoC: qdsp6: Suggest more generic node names
      commit: 35c638d039bbabbca7affb52960d468951d811c1
[2/2] dt-bindings: soc: qcom: apr: Use generic node names for APR services
      (not applied)

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
