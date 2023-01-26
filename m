Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D255E67C1AC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 01:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC149201;
	Thu, 26 Jan 2023 01:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC149201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674693063;
	bh=gd48QQ1G/fofkw08t5Nm1PtKKDKcVePwRYIRZ/2YscM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBsmkepvEnAd5c/wkarhK332YzvG1g9NXKviu5Bh8taroUDrIaTPywnAK9coWXlTa
	 O/RpIoH99Bm+LSUBTa+Fq/FKHJH2km4zz8hP7i3Dk8NjXdLcu7nQJib64Rx775bZ0w
	 kwkplgHXcSdtH53RcvN55V/mOYzrfRxfJCPCqKG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6501F80552;
	Thu, 26 Jan 2023 01:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71F7CF80163; Thu, 26 Jan 2023 01:29:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB366F80163
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB366F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rriKJ7Q6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FF26B81C6F;
 Thu, 26 Jan 2023 00:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1668EC433EF;
 Thu, 26 Jan 2023 00:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692938;
 bh=gd48QQ1G/fofkw08t5Nm1PtKKDKcVePwRYIRZ/2YscM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=rriKJ7Q6Cok9gWsDKHoLDJOlzvG7Q8T+zRjYTYlMDBLkFKpkAm4VTSp/smSQijp/B
 aBkMcMXriYwiT+PfmRL90DzVT3iLkfMHcpmmiKTJxMgvQyoP4q2Hp/S16lNLb3GU+2
 8AVRTrNGKFY0URApMz890qGMrVxn1ijgzONEfbYB6lcKg+qN6hyARGGzVmQhxr9aCW
 E016XyIqyHS+eZ2QMFCZxR8BKUCcnZYyHImLq/jOoLuxN51tD/n38Byxy7MiCfHlg0
 5JWPZspfkMZaNip9uW0VPJ5265ikiqQwUI5isom+LwEEMfLFk6I8e2t/jBJKNhaMxM
 Yfnx72mo+AcNw==
From: Mark Brown <broonie@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
References: <20230120153020.320270-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: samsung,odroid: correct codec
 DAI phandles
Message-Id: <167469293574.2696228.16859545876419546902.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:28:55 +0000
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

On Fri, 20 Jan 2023 16:30:19 +0100, Krzysztof Kozlowski wrote:
> The order of codec DAI phandles is reversed - first comes HDMI (always
> present) and then codec (physically not present on Odroid XU4).
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: samsung,odroid: correct codec DAI phandles
      commit: cc5be0e5477f53f2d4b3c9211206f34505ec17ba
[2/2] ASoC: dt-bindings: samsung-i2s: drop unneeded assigned-clock*
      commit: 73ab5b3aa59036e0e6689b0a20a5080ef7ab7c03

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

