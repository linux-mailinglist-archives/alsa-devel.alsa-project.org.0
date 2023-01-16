Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173266C2AB
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:50:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546D35774;
	Mon, 16 Jan 2023 15:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546D35774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673880645;
	bh=y3TvSgmud3kXyKu5FipycE51zj70NUWuclGNv3ekUzI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V1JWAsAiHcix0Hsg08FGRJGfxVnOWlSVjfd/8z5MzEPBis1o19awmXWVFcWFYMqab
	 /G/JByx5McaG0ppBDXeHjZ1vUd3pSbmGUaibivnKgXH8CmCfoyg81ZiuMLPtqm1A0q
	 RvPdzREEGGLLPt3OH7uGo3Libwe9hL4q+N1noyCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB5FF804BC;
	Mon, 16 Jan 2023 15:49:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A37F1F80543; Mon, 16 Jan 2023 15:49:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D98FAF804BC
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D98FAF804BC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=congVETM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E48960FEA;
 Mon, 16 Jan 2023 14:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D8BC433F0;
 Mon, 16 Jan 2023 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673880543;
 bh=y3TvSgmud3kXyKu5FipycE51zj70NUWuclGNv3ekUzI=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=congVETMqSTg+NovrE+Hk6lcnH29x2ibRHjJVl/HNwy9SJ5g+pge5GDmUySEQ9TQm
 VkCCMvB1z7aoB/O4yrBA1Lj2LK95vmQt/rhr1a3Np4rtHuV9HuqEtfJWh6m7dTq4Hq
 CT8nbrEymleKK4LtiirjfGPdzDNGymG8J4/Gt1QYkNd3IdaD583TI+4l9uIh6YRikC
 aLX7xW8ZQV6qmUzhAhT+o4qmovoAjOSi2M/sE0fA+feUyr4VNyVaSGno57Z9GfK/0n
 80imCdanPW5jNGAtc5bhHrx5Qhg5lYFNCJMm8vrPOmLMxnr/uV7CXnmVtB337enPcX
 PyPI98NnzYsBA==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
References: <20230102114152.297305-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/8] ASoC: codecs: wsa883x: Simplify &pdev->dev
 in probe
Message-Id: <167388053865.388539.17611906188714090984.b4-ty@kernel.org>
Date: Mon, 16 Jan 2023 14:48:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
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

On Mon, 02 Jan 2023 12:41:45 +0100, Krzysztof Kozlowski wrote:
> The probe already stores pointer to &pdev->dev, so use it to make the
> code a bit easier to read.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/8] ASoC: codecs: wsa883x: Simplify &pdev->dev in probe
      commit: d5ce5d3895a33fa8e0dce89c2404facbdef55dcb
[2/8] ASoC: codecs: wsa881x: Simplify &pdev->dev in probe
      commit: c617c9e7024d152426acf9f1aaf01070b6852f13
[3/8] ASoC: codecs: wsa881x: Simplify with dev_err_probe
      commit: 31a90367443b21f76b972c00aad3430447c999d6
[4/8] ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity
      commit: 738455858a2d21b769f673892546cf8300c9fd78

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
