Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54167D2CA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 18:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC52FE7E;
	Thu, 26 Jan 2023 18:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC52FE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674753086;
	bh=if+ZZR9mriJNhiK1akAY2Str+irW5BQMixOqBjyg1fM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Viv3X30eEnIS0y5xs+yrYU6pdLmhRefARmlE48b70HGOGq9CaPzqmQwaaIigT5Fxf
	 5fOCkTWZv9HisMozMxUljMuHqYc2imRqJmHZTA4xoTsBDBPhAX4EJ/pnrcXiLEcJnI
	 SWAbgeiLZjAC4i+zRLFFGtRYRWVFVidiD2tphE1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8707DF803DC;
	Thu, 26 Jan 2023 18:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D70D3F8025D; Thu, 26 Jan 2023 18:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC0A4F8025D
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 18:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC0A4F8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dTNlG/bH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 512EEB81E6E;
 Thu, 26 Jan 2023 17:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDACBC433D2;
 Thu, 26 Jan 2023 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674752995;
 bh=if+ZZR9mriJNhiK1akAY2Str+irW5BQMixOqBjyg1fM=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=dTNlG/bHwQJv9i2yhSDxGCUewNDtoybJyCqWIrugN0Jpb295ax9aY4nGKEmKP33Uw
 GYuZRCfjhKSfgxqDDsuphTvev2OsO/+kjoNLeIwWtvsnQjRZfRss+G8KChgu+PMpd/
 e/KMWxvoMJH1LoM7K3kYXkuIGIDy+/aB6Ve81kqFCsKg3D8VhT+Jybjrbjgpf1t/wB
 LrD+VIBKmc3cX6ZRFB1n0zwRWwOO/Ji0+ASh4NlM+jUcbx6tNE3yeKcbKRtssH5jVF
 DAGeom+4sOJM0SQmXRZhyn64CIsWj8kB8mHjE4Aw9EwYNE//BH18qXjD7LfsUf/rf0
 PcYnR0edZqKiA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126100722.9473-1-krzysztof.kozlowski@linaro.org>
References: <20230126100722.9473-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rsnd: simplify list of
 compatibles
Message-Id: <167475299258.4003145.8163069094653403292.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 17:09:52 +0000
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

On Thu, 26 Jan 2023 11:07:22 +0100, Krzysztof Kozlowski wrote:
> The fallback compatible in a list (the last one) cannot be enum, because
> it is always fixed.  Also if such fallback is used alone ("Generic"
> case), it's not a list anymore.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rsnd: simplify list of compatibles
      commit: 167b3a2b23c86ce44518afde93c82b65295ea60a

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

