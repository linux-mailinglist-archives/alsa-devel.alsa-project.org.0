Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B65ECC8E
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 21:00:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6FCB82A;
	Tue, 27 Sep 2022 20:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6FCB82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664305240;
	bh=aWwbM2FcbB4m2ZMOVJGrcGwpXL3zIDpNnuzwy+bKje8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaDLwETopNP+44L/9/YMW5RqePT9IRYM3QoCkFaH5mGVuivZeyM5bLtZa6JD3G0sH
	 zSPTKxhmzDjEHXF9KoZfw5EQ1OF6tTJB61tkAIevgZYNd/zSIobJq6Ljf0zukgntCa
	 oKZImEidEjuyRJAspvosHmo4VTaOWn3A20bI62WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19574F80496;
	Tue, 27 Sep 2022 20:59:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC4EF8025E; Tue, 27 Sep 2022 20:59:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8189EF80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 20:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8189EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PI86W4WQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E52561B41;
 Tue, 27 Sep 2022 18:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EA0C433D6;
 Tue, 27 Sep 2022 18:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664305177;
 bh=aWwbM2FcbB4m2ZMOVJGrcGwpXL3zIDpNnuzwy+bKje8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PI86W4WQZExn9qPgexr8c3lnxMuukf7lbiKbt5mPsHiL+lSPZ13s/gm0FrZsmUyCY
 HRKD7ZzKmK6WyKLZDsiXkRiWW2PGWN+XkUx2WxZg17P8imjWpx+wbH8eWedUVTry/a
 LGXB3IxTv6jwtKTdqXpSor7eq3KxlXJygDw/AfJWehYcebJSxefW5Cg6J9slByamgN
 DgWtRmh0vRoQU2nb1FkLS+vOJkad5LUqipiujkO+VEECkpGWszIgkpnZbJtZDF9e6W
 JhbcBz0IET5hlMH0e/GEo+BQ9cAiAGaltN7fNnjPwvtAd/pJ3fI+Nu50FHcT02yuEA
 3dHn8ujhZ4I3w==
From: Mark Brown <broonie@kernel.org>
To: arnaud.pouliquen@foss.st.com, olivier.moysan@foss.st.com, tiwai@suse.com,
 perex@perex.cz, 
 Zhang Qilong <zhangqilong3@huawei.com>, mcoquelin.stm32@gmail.com,
 lgirdwood@gmail.com
In-Reply-To: <20220927142601.64266-1-zhangqilong3@huawei.com>
References: <20220927142601.64266-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH v2 -next 0/2] Fix PM disable depth imbalance in stm32 probe
Message-Id: <166430517501.513274.13539394672852355316.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 19:59:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
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

On Tue, 27 Sep 2022 22:25:59 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced. We fix it by moving pm_runtime_enable to the
> endding of probe.
> v2:
> - Add reviewed-by
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: dfsdm: Fix PM disable depth imbalance in stm32_adfsdm_probe
      commit: b9a0da5b2edcae2a901b85c8cc42efc5bec4bd7b
[2/2] ASoC: stm32: spdifrx: Fix PM disable depth imbalance in stm32_spdifrx_probe
      commit: 0325cc0ac7980e1c7b744aab8df59afab6daeb43

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
