Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6626576AA
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 13:52:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 109C46EF3;
	Wed, 28 Dec 2022 13:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 109C46EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672231950;
	bh=s3Txn3CCYMAINuVdaMFj5eS3c7GT6CDWa/bWGWX49pc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RlsESlBbAeYbgbEPYrNVtXcjrnci+Ath6ygMLpgOtQ360caIZ03rQhMKqcj7p/bEn
	 2PMFd4mcuRn713IAOcN+SZoH6LjUq5sU7efwjhNGimEaoqrmanFR3mJzMGWfdUl4OQ
	 xTe02jBcEj1x1EIs2g+HQazaiu829NX+3oVc3ie0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AE58F8049E;
	Wed, 28 Dec 2022 13:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECA6DF80310; Mon, 26 Dec 2022 04:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EB75F8027B
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 04:32:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB75F8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZXx064i5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5169360C61;
 Mon, 26 Dec 2022 03:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EFC9C433D2;
 Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672025549;
 bh=s3Txn3CCYMAINuVdaMFj5eS3c7GT6CDWa/bWGWX49pc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ZXx064i5rzq++NFOg11/wWaYl1fWBWbUUVMfNobuX1gR6W+hSC5ZaIT6xMvUkTbzq
 uKsKmPlP0Osoqt3ugX6Jfs12ItSnAT2NYH7dk2L+o+0+q2TEXpuxPP+n517ttUD3B5
 qERgwZvw07+bg0wqawChHt9pmtSu0jNWxxTY4ZiIJYITZEI0pf/eE3E2hOO32H/1pi
 kRFc6KGtABB/2V9Bn76V1EKJYHbpXbJgtJ4cicnkkjfmrqdOYoYYZdUWhIIjno3hJF
 AKMqe2WqeZ/Z/UT0sDmee/HfVbq9AKYnEqjtJVTpIEQ4+UAzbfm79swmY7Zbv+nhP1
 /yZj5hZlsSzMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 69A72E5250A; Mon, 26 Dec 2022 03:32:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common
 DAI properties
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <167202554942.9518.4179971549708682531.git-patchwork-notify@kernel.org>
Date: Mon, 26 Dec 2022 03:32:29 +0000
References: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221203160442.69594-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Wed, 28 Dec 2022 13:51:26 +0100
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
Cc: heiko@sntech.de, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 cychiang@chromium.org, samuel@sholland.org, katsuhiro@katsuster.net,
 khilman@baylibre.com, joabreu@synopsys.com, derek.fang@realtek.com,
 olivier.moysan@foss.st.com, povik+lin@cutebit.org, linux-sunxi@lists.linux.dev,
 flatmax@flatmax.com, james.schulman@cirrus.com, vincent.knecht@mailoo.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, alsa-devel@alsa-project.org,
 tanureal@opensource.cirrus.com, david.rhodes@cirrus.com, cy_huang@richtek.com,
 thierry.reding@gmail.com, srinivas.kandagatla@linaro.org, groeck@chromium.org,
 chrome-platform@lists.linux.dev, lars@metafoo.de, fengzheng923@gmail.com,
 alexandre.belloni@bootlin.om, drake@endlessm.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 ckeepax@opensource.cirrus.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, mripard@kernel.org, biju.das.jz@bp.renesas.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, mcoquelin.stm32@gmail.com,
 rriveram@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 spujar@nvidia.com, nuno.sa@analog.com, festevam@gmail.com,
 hayashi.kunihiko@socionext.com, jernej.skrabec@gmail.com, wens@csie.org,
 bogdan.togorean@analog.com, arnaud.pouliquen@foss.st.com, stephan@gerhold.net,
 rf@opensource.cirrus.com, broonie@kernel.org, bleung@chromium.org,
 mkumard@nvidia.com, j-choudhary@ti.com, lgirdwood@gmail.com,
 konrad.dybcio@linaro.org, asahi@lists.linux.dev, rohitkr@codeaurora.org,
 shengjiu.wang@nxp.com, codrin.ciubotariu@microchip.com,
 alexandre.torgue@foss.st.com, paul@crapouillou.net, ricardw@axis.com,
 shifu0704@thundersoft.com, krzysztof.kozlowski+dt@linaro.org,
 airlied@gmail.com, frattaroli.nicolas@gmail.com, agross@kernel.org,
 devicetree@vger.kernel.org, bgoswami@quicinc.com, shenghao-ding@ti.com,
 lkundrak@v3.sk, robh+dt@kernel.org, tzungbi@kernel.org,
 linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
 andersson@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com, afd@ti.com,
 daniel@ffwll.ch
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello:

This series was applied to chrome-platform/linux.git (for-kernelci)
by Mark Brown <broonie@kernel.org>:

On Sat,  3 Dec 2022 17:04:40 +0100 you wrote:
> Rename name-prefix.yaml into common DAI schema and document
> '#sound-dai-cells' for completeness.  The '#sound-dai-cells' cannot be
> really constrained, as there are users with value of 0, 1 and 2, but at
> least it brings definition to one common place.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/3] ASoC: dt-bindings: Extend name-prefix.yaml into common DAI properties
    https://git.kernel.org/chrome-platform/c/3fda85324b8d
  - [2/3] ASoC: dt-bindings: Reference common DAI properties
    https://git.kernel.org/chrome-platform/c/58ae9a2aca6f
  - [3/3] ASoC: dt-bindings: maxim,max98357a: Convert to DT schema
    https://git.kernel.org/chrome-platform/c/8a5a05583a04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


