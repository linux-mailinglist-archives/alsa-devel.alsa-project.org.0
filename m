Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228EC5B8552
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB14E189D;
	Wed, 14 Sep 2022 11:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB14E189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663148535;
	bh=ui4a4307ErOPtFPrDWbQDs8itl5K/H0TZiMAW9g5cJI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oczX4WQ3/l1ucrCJS7VmruBR3GGtVnqxLmb+gjm7DNXGNwLTqVluoUxv8XcHYDgdT
	 tU2NTO7OXw3n71paLrmS4wu8CQ8PPeGWAxHdI2N5EF6QsJXHS5BpIfmjZWn1bh7YAk
	 ctKwBFw9hdFCAF6SBY3bl1Wp9LcmD8VeWcfgFGfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4010BF80533;
	Wed, 14 Sep 2022 11:40:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F263FF80538; Wed, 14 Sep 2022 11:40:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EBA5F80533
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EBA5F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RthdDpg8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 029C461AC6;
 Wed, 14 Sep 2022 09:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D843BC433D6;
 Wed, 14 Sep 2022 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663148423;
 bh=ui4a4307ErOPtFPrDWbQDs8itl5K/H0TZiMAW9g5cJI=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=RthdDpg8Xyhwd8u568+xgwUj4PRMmUv1XKg3xc8PdASGHU+uUxe14wwHqaWJpS6ta
 K7XeTMClkmYEYrgKm2bV545GrJBBt9O3mojUMp2vLChm6V/vF58NJS5CCHYpUxkosF
 NBZj59B7f86GS2gZFB2hmkTHafjnAXwlaauUdvhYc/c0WCDJFLhlGS6qDrgU1YMtvv
 88enqTA5Na95PY9YuWoFLh8PfiC9cFccKr2H3fYpPJPZWCNTv4KJ3T9xMEps6+BuKZ
 czA+Zljc43KaXqoHoErBR8b0oIhLHkrKlxospBPSTKuF7/2xLlmatFyJix+HMJKUA/
 7o+S6SZUIs+Zw==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Andy Gross <agross@kernel.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20220910090856.49271-1-krzysztof.kozlowski@linaro.org>
References: <20220910090856.49271-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,q6afe: remove binding
Message-Id: <166314842061.314266.11703491169387696036.b4-ty@kernel.org>
Date: Wed, 14 Sep 2022 10:40:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
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

On Sat, 10 Sep 2022 11:08:56 +0200, Krzysztof Kozlowski wrote:
> qcom,q6afe is already documented in soc/qcom/qcom,apr.yaml.  The
> version-based compatibles ("qcom,q6afe-v<MAJOR-NUMBER>.<MINOR-NUMBER>")
> are not used (neither in upstream nor in downstream DTS).
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,q6afe: remove binding
      commit: 1c2d23fc6134fa72b040a36ae953e1a6614844f4

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
