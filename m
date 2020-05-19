Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 737281D9786
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 15:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6642175B;
	Tue, 19 May 2020 15:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6642175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589894454;
	bh=/W235ZXLquPgLiHQpzwUCkiv/Zauu8a7ukvyN8H+274=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0UOVC3Guuvidx17M5FcTdfT1LVfarvt4Qj+GUWa4F/134L3tywkdeKf6tgWMEE3Y
	 tHjNZSd43cSmxBMVRy1LtMW6z3jA/rBk7b4cbCbT7bkafW00IkSjeVZnZT2dgQ1JKI
	 B6lpsPQWboWmSM5+/3JVD96fViu1zyNjNYoQYErw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D68FAF80229;
	Tue, 19 May 2020 15:19:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 211FAF801A3; Tue, 19 May 2020 15:19:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2673BF80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 15:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2673BF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ck1yJZW0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E08F7206D4;
 Tue, 19 May 2020 13:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589894345;
 bh=/W235ZXLquPgLiHQpzwUCkiv/Zauu8a7ukvyN8H+274=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ck1yJZW0nqJb1mw3mpDx4TAIjSEtLcBIHmMGPOjPkhQYLwt1k+IWvkA8C3fLsP3gq
 IbCRWzOuSC7JK4uuA1JuwDf1sI3iLj9BIIczAous/rzTcgjr/PsXgZMShWkqrvgZDH
 gSlrGv4Tvnvms8z7Hal67vJbV0aAe8Q09JTF//J8=
Date: Tue, 19 May 2020 14:19:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, Xiubo.Lee@gmail.com,
 tiwai@suse.com, perex@perex.cz, festevam@gmail.com,
 alsa-devel@alsa-project.org
In-Reply-To: <1589278979-31008-1-git-send-email-shengjiu.wang@nxp.com>
References: <1589278979-31008-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Set ASR76K and ASR56K based on processing
 clock
Message-Id: <158989434292.51282.3388450779255544189.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 12 May 2020 18:22:59 +0800, Shengjiu Wang wrote:
> The processing clock is different for platforms, so it is better
> to set ASR76K and ASR56K based on processing clock, rather than
> hard coding the value for them.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_asrc: Set ASR76K and ASR56K based on processing clock
      commit: f8953043e6e24f9425249464605a541d00950709

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
