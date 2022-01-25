Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741249B134
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 236BC20B9;
	Tue, 25 Jan 2022 11:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 236BC20B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106109;
	bh=4XCKnN8xFhrkQ6vCbD+sDCKa+oAw0sswmbb3nIQMD30=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAs1/wuVjixck2+nHOYSEYr+xLaQhCEVeql5hikJVwIkE74COSESHZA4lgeY+8Mo8
	 KsvxpeRZBYO0t07u7BvzddNGpmrhM4G0jXGpxQO5YxpUBuHNUP3+b1usg89nzw1Ypd
	 rX5+pzHlfICdW/ptmr2v6foXJiWDGZkiyAAfmz1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DC97F80510;
	Tue, 25 Jan 2022 11:20:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA601F804FE; Tue, 25 Jan 2022 11:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 574E5F804D2
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574E5F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qv2lL5GX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1B7761631;
 Tue, 25 Jan 2022 10:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96410C340E0;
 Tue, 25 Jan 2022 10:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106015;
 bh=4XCKnN8xFhrkQ6vCbD+sDCKa+oAw0sswmbb3nIQMD30=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qv2lL5GXzVs3ZKFVKV+QjfsTdk1J4QaHLYck3C2tFm10JGyGf4Sjd77f7oK1QJTF/
 IRrlGsOqUiA6tj4z9f9cwakwuOgy2ULEaJVU9VuU4Dwc+J4sc3foslBfoP8UOMyGxa
 Ede2dfhxPP9UVSKW0QuKvRbEMhn9WwbPim0HAX9kqxb1fmKT7aWtyksn+pe21nV9cs
 PyfdmxKPde3jophCJMBUDsFFZPOCou81R+7qJn4r3xGfnQ8ZKkSDS/yLBLRMi2VWHJ
 33sYG7ASFheUSm7Eh5+7tlvLN/w+zBtbDBYeQtOlm/iMD33khZB0TISYCIog6Z4gHi
 rt62e0hxNPB/g==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, tiwai@suse.com,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, lgirdwood@gmail.com,
 srinivas.kandagatla@linaro.org, perex@perex.cz, bgoswami@codeaurora.org
In-Reply-To: <20220111013215.494516-1-jiasheng@iscas.ac.cn>
References: <20220111013215.494516-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: Check for error pointer after calling
 devm_regmap_init_mmio
Message-Id: <164310601334.74844.2027416131386442592.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 11 Jan 2022 09:32:15 +0800, Jiasheng Jiang wrote:
> The devm_regmap_init_mmio() may return error pointer under certain
> circumstances, for example the possible failure of the kzalloc() in
> regmap_mmio_gen_context(), which is called by devm_regmap_init_mmio().
> Then the error pointer will be dereferenced.
> For example rx->regmap will be used in rx_macro_mclk_enable().
> Therefore, it should be better to check it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Check for error pointer after calling devm_regmap_init_mmio
      commit: aa505ecccf2ae7546e0e262d574e18a9241f3005

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
