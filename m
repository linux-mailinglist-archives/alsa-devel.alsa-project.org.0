Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AC526E4FD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:05:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A026D16AB;
	Thu, 17 Sep 2020 21:04:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A026D16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369511;
	bh=CVDmgxGyA7cpvTQu42ofHENQ5z/H41BZE5Ht5owFFoA=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E2U10Nn2V8BiVg1dT1EN+abty1iVxyxTTKBaVxDvg/Bi1HWxBQY9/XWUL2FVAFLux
	 OST53hNe+u9NbkjE/BQ29QRhBWpxtnW3xwyv55tv/wcL0bMVq+YVFAGMsYC8sZrrG6
	 7f2p/TvNZIoy2yC9JXTN8d3tdAmwbpY2jxs3qV3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56148F80323;
	Thu, 17 Sep 2020 20:58:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE71F80328; Thu, 17 Sep 2020 20:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2186DF80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2186DF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ADR2dVWR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C721221E3;
 Thu, 17 Sep 2020 18:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369113;
 bh=CVDmgxGyA7cpvTQu42ofHENQ5z/H41BZE5Ht5owFFoA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ADR2dVWRCVro7vZdLrnCBgcOfwqDA0PE+3WXzXoStrj0NnlkT6KPIIl1DmqTWC1x7
 gvjoCBT5eGhj1s1LTo36sQ3CKfGtdU0uCq0MMT+Elf2Uwkx3GxUlc3XNdUzzrDdGvs
 F34ICzyqNZBYWrNbmcwH9a0cjMzvIK4prIFT9BTE=
Date: Thu, 17 Sep 2020 19:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Bakker <xc-racer2@live.ca>, Sangbeom Kim <sbkim73@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20200902160025.20922-1-krzk@kernel.org>
References: <20200902160025.20922-1-krzk@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: aries-wm8994: Match compatibles with
 enum
Message-Id: <160036900935.20113.14067381532897187524.b4-ty@kernel.org>
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

On Wed, 2 Sep 2020 18:00:25 +0200, Krzysztof Kozlowski wrote:
> The common pattern for enumerating compatibles is enum, not oneOf.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: aries-wm8994: Match compatibles with enum
      commit: cac17861c950832a60d405f597c2acc2f40a0136

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
