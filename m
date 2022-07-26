Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 351785814D8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 16:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81782F3;
	Tue, 26 Jul 2022 16:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81782F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658844707;
	bh=1d7qbWDQuZYAD2sGVg+HmWM5hj2n/J9MkNAK0ie+JsI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmVeFOeeb1ODPqoHaFAkb3Tx/ZhvFrPMoQT0i+Cro1SijQy2yRXZ8t4mmut2iktod
	 FwnG+bz/3DdpBrd/kZhiEl21Q+CS7Scv1V48l0pFWa09KVbDLfh3VNQFtlHGprgo9S
	 VsimHi/7Abiu1juuIDntbgjbVIgQEeX6yylba+Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED29DF80238;
	Tue, 26 Jul 2022 16:10:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2AF6F8025A; Tue, 26 Jul 2022 16:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91988F80153
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 16:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91988F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZY+ik8K7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F88E61601;
 Tue, 26 Jul 2022 14:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A90C433C1;
 Tue, 26 Jul 2022 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658844638;
 bh=1d7qbWDQuZYAD2sGVg+HmWM5hj2n/J9MkNAK0ie+JsI=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=ZY+ik8K7+ds9Bc6ALidqN6eBYk4ekWWqvNqhozyoYPuMyoMEw5aThMTn/aA/xZpAv
 uVhIyD62nyt65WHeftNaR3WoTk4FCLwjeFoqA0uTx/CqccQLxRZW8zpEea1mXYEmBG
 CTgwY16GLXM3RUZuAuMfZczsVfS4RzmglBTo5eDzZJBeDptdBicXJlVZdkaSMtGrP/
 swTng4fUny+UtoTtdudmc6AQQO1SuUqdhFdL1IGix3KnJUCm+r9jm5moT3gf1//Tgl
 JiPHzPrj9lnr8GYoH5AGfb4okgkpzraeWjJU3AoqN9KX8PZYPE88eSpo3FSqKKy5Lx
 QtpZaVVa9ly+w==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220726115917.101371-1-krzysztof.kozlowski@linaro.org>
References: <20220726115917.101371-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,
 wcd934x: use absolute path to other schema
Message-Id: <165884463590.37334.6138510290775984808.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 15:10:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Tue, 26 Jul 2022 13:59:17 +0200, Krzysztof Kozlowski wrote:
> Absolute path to other DT schema is preferred over relative one.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,wcd934x: use absolute path to other schema
      commit: ffe71829574a4848e9a376010a2ea74ae6d2d211

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
