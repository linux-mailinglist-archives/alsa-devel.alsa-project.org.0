Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B03D167C1AE
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 01:31:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00C482B;
	Thu, 26 Jan 2023 01:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00C482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674693097;
	bh=d4HSQHdGnlTFmLj+LdiMNKnyGFgOUaR5G/kz7dGHLhc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSI3aIbPqvGtIuAUEQYrvayMJAzhI403IBwXeVOoMPU4TEJV+Reh73sN/SPSu0tkU
	 9mPLGUm3/3pigZdYyj8ELs8ICn9Q2cqkw1iXGgZmKstFZAMym//X6ywJZWv8KJYsKH
	 wQqqQo+U0s050HF7g6S4qSvCFkpXP9skbkA1wN1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E49B9F80564;
	Thu, 26 Jan 2023 01:29:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6201F8055C; Thu, 26 Jan 2023 01:29:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 223AAF80553
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:29:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 223AAF80553
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ne+nDVS4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DADE7616F5;
 Thu, 26 Jan 2023 00:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87372C4339E;
 Thu, 26 Jan 2023 00:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692941;
 bh=d4HSQHdGnlTFmLj+LdiMNKnyGFgOUaR5G/kz7dGHLhc=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Ne+nDVS4cq2sqBXf+4BfrBvFkiDT+2mSiafpt8HwbUHceLylv87Nn2BkShpX1Et/N
 YJCyn1UvB0jV65XuzIEpw47qpKuOqjhuNN6cwuZRZSJBeK1tbop+Sl71jaDDCAmd0i
 YoiWODGbhuoaPT88WBJjHUKCS5Zw1u9p1GUo9YT7c1aCN9cYBxxniZ+3lpLHqe8E/+
 sd+ERuluGjzAiR1w1XgAiPyOwh1WhifDmrLAUp0FWzeNfNhyJPx8jBBuBttxPairRS
 S9oTKrt8JQ0SDzRVRE19CWsOQJr0mCK+ppjjoezxVKkr/HTi9OqWgBLj40nZ3eqsXo
 uks+2MH7Eekrw==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
References: <20230118101542.96705-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: use fallback for
 SDM845 sound cards
Message-Id: <167469293821.2696228.18433894144147250698.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:28:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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

On Wed, 18 Jan 2023 11:15:41 +0100, Krzysztof Kozlowski wrote:
> All SDM845 sound cards are compatible with each other, so use one
> generic fallback compatible for them.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: use fallback for SDM845 sound cards
      commit: b4090b7cda255daafe816a00f2848f4f8e761786
[2/2] ASoC: qcom: sdm845: add remark about unneeded compatibles
      commit: 3a14adc51605452fdf1c009cc3333c7e399821d9

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

