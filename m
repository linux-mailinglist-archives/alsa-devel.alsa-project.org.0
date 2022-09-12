Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE715B59B1
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 13:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1176D1680;
	Mon, 12 Sep 2022 13:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1176D1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662983730;
	bh=Lz5oNFUuA72y1EyKiFpnZ9ahzwx8HZpsQWwVu16+48w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DgzBGCpor6ElRkmZfIb9MU5lOkS0sLwrCqB1+xCqrGEU3AwGh+Xgr2B+EihB8NaIL
	 WBp9Xu6yEVHdBf9kVEaplWQNdmDy4anuy0C6DoLG1t9mNWU792c8yyzT7isKnFs5uE
	 fCrKRSBx6gva0dC+GY8FfBM5YsB71l5oDcG5cWKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 444DBF8030F;
	Mon, 12 Sep 2022 13:54:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1503F8027B; Mon, 12 Sep 2022 13:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8075DF800EC
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 13:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8075DF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SwVJn9bY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58511B80CB4;
 Mon, 12 Sep 2022 11:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F030FC433C1;
 Mon, 12 Sep 2022 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662983664;
 bh=Lz5oNFUuA72y1EyKiFpnZ9ahzwx8HZpsQWwVu16+48w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SwVJn9bYAx8OD+XShxj+5TsNzGtB/WsR6287t+NR8M2yqcH6CwSxIBDEAC1qyggX5
 nL6zZYZOaYCZeloBUmRyuVgmGEXSU1715TS1BCsBo0SDets7k9v3Txo+Nxhaz4oD11
 pERk7W1lWVGef5C8AAQt38aEKjS347G3GdX/C1uqJblsy64gNK4WGSTgCtM0Q3lZvU
 BCMbYnQPgmSTaGEeIfhrrMrNSSaJQZEbyCMlPayDb9a0EobgXekuImJiRuM8G1guB6
 HnWRxIqYh+As4+vZoL/KxvodG58/zmF1g2856mwgck3d2nKd3ddBq2BWeVHBZivR7h
 776KRNgM3fJeA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20220912072931.1856-1-oder_chiou@realtek.com>
References: <20220912072931.1856-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Fix the issue of the abnormal JD2 status
Message-Id: <166298366027.63446.10710500837218866849.b4-ty@kernel.org>
Date: Mon, 12 Sep 2022 12:54:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 Sameer Pujar <spujar@nvidia.com>, albertchen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Mon, 12 Sep 2022 15:29:31 +0800, Oder Chiou wrote:
> The patch fixes the issue of the abnormal JD2 status.
> 
> 

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: rt5640: Fix the issue of the abnormal JD2 status
      commit: b2ddf399d0555d3b517ed97f35767c054bbc6535

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
