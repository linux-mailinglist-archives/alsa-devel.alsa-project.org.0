Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679E662BB0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:51:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CF97BB86;
	Mon,  9 Jan 2023 17:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CF97BB86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673283103;
	bh=Zs1I9hWh8DgJCvcIXxrzn5p90o5lzJJFhhZ5y5LaxTE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bT0nj6pB/qaMbsOjik83lsY+Sx2PX6+zU8zzh9hfCG0j+DVjiGcNtCVCOOICpuwSE
	 Q0IZbx5UuAuTx+tbpsVA4NDmL5UH5kSdXqBWvYpsmLFoI/73RWwI2nLlcVB97KeV+h
	 gmPQo6+dp1verbPbHdo2QffwV9yjuQXgV8Pw6rAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF18F80563;
	Mon,  9 Jan 2023 17:49:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFAECF80553; Mon,  9 Jan 2023 17:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3FAF80551
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3FAF80551
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p61IZ6WT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 39B3BCE10B3;
 Mon,  9 Jan 2023 16:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E475C433F1;
 Mon,  9 Jan 2023 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282955;
 bh=Zs1I9hWh8DgJCvcIXxrzn5p90o5lzJJFhhZ5y5LaxTE=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=p61IZ6WTpB8e8+dn4v8BtFUc7JGNi54Vd0i6Nvicq07pr7S8PtUqGbFAchDC4orhu
 E8mmU3g9MlDmT42YSWtDkT2bgoAt/wOr5pcaVkv9fd9z8LD4eOeFq+YCjxWJ8AQ17s
 X9L7TphpQvMvYmOI9IB/fYn6OfKL1hOefx0Ds2YRqw6mQ5iztpskoLD9O4XS+5vATP
 7a4/2RWTsOGxGXiGBCLRJxZ368/JLx3Lx3+UyRRD+nnL9xttarHeO4CM/3heR70UyK
 Lx1/H/m5hIKlN9Nc5hGCUXDT9YajYDeDJCf29kzkt2F/AITEBIi5NhAPvgP5G2+JAQ
 gKfRUTUlAJerw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
References: <20221227163135.102559-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,
 lpass-cpu: Document required-opps
Message-Id: <167328295277.323147.12695338235961954458.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On Tue, 27 Dec 2022 17:31:33 +0100, Krzysztof Kozlowski wrote:
> SC7280 LPASS CPU device node comes with required-opps:
> 
>   sc7280-herobrine-crd.dtb: audio@3987000: Unevaluated properties are not allowed ('required-opps' was unexpected)
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: qcom,lpass-cpu: Document required-opps
      commit: a1df78540da20b9ce30a5b24b395d2b4a0f4319e
[2/3] ASoC: dt-bindings: qcom,lpass-cpu: Fix DAI children pattern
      commit: 5f9cd0f7c1499174b099a1bda67693df268e711e
[3/3] ASoC: dt-bindings: qcom,lpass-cpu: Correct and constrain clocks, interrupts, reg
      commit: ffb2bbdf79d7e712782fd5f44fc250f3e07b3b92

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
