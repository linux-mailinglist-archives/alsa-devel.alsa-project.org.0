Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F626E4E4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA3251683;
	Thu, 17 Sep 2020 21:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA3251683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369311;
	bh=h2oBzSRlDP6lx+rd4sKX9zHni5NLmneiOlwvYFS28v4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FW2tC0qWeuQ4T3OpP1YL2Gf9xYs+pMcVX1rDg84V3mAasnzM1qXYqbRiCVIiATWD1
	 JpATL7XjWWI35BkA09OHL1Tgg5d1nP0bf3Il8Xtd3r2FPOL+tkCn3MXKDTOsf0Yzpt
	 em38GQtf0600fd3Ork27VCoTBRMA6xY2RpO8g8OU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99D1CF802DF;
	Thu, 17 Sep 2020 20:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A43DF802E1; Thu, 17 Sep 2020 20:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AAEEF802DF
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AAEEF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="COy9VIGa"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D2832072E;
 Thu, 17 Sep 2020 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369080;
 bh=h2oBzSRlDP6lx+rd4sKX9zHni5NLmneiOlwvYFS28v4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=COy9VIGawcbUC2qB47O6ifSy3VHIHqyKV/Slg/r590Y0r1xhwDQLyjWdTHieGTVa1
 ekqEU3m4TvI+HUfQNCzoMc529Mwgs4mau+JK2IkbI+5LX0EnIdCgSeDb8uOPgAgvep
 WjSJoYVYU9b70EnDGw7VXkRzUdzV7YrrpEAiKQhs=
Date: Thu, 17 Sep 2020 19:57:10 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
References: <20200910135708.14842-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: q6afe: add clocks support
Message-Id: <160036900935.20113.3270260230921504372.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, sboyd@kernel.org,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, tiwai@suse.com
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

On Thu, 10 Sep 2020 14:57:06 +0100, Srinivas Kandagatla wrote:
> q6afe already exposes clocks using apis, but not as proper
> clock controller driver. This patch puts those clocks
> in to a proper clock controller so that other drivers that
> depend on those clocks can be properly expressed.
> 
> 
> Srinivas Kandagatla (2):
>   ASoC: q6afe: dt-bindings: add q6afe clock bindings
>   ASoC: q6afe-clocks: add q6afe clock controller
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: q6afe: dt-bindings: add q6afe clock bindings
      commit: 4e398353a7e51410c34fd19f8b7dfc56fff5901b
[2/2] ASoC: q6afe-clocks: add q6afe clock controller
      commit: 520a1c396d1966b64884d8e0176a580150d5a09e

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
