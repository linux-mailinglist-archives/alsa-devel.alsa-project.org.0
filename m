Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E85A7DAF
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 14:42:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78DD016C6;
	Wed, 31 Aug 2022 14:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78DD016C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661949726;
	bh=VJzf5SMukgnOhcfk4fRzmhPNEX69oZvYp5xql0sUwi0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgU2MUdtSVb9iwbKt9PNnzIMEtJlv75PUTo5YDEMTZmC+xTur3ExoYdmznhewnA99
	 v9rYjE060tFuRGFPh/Z4eQ0I+qWGrgmjpUrKONTK1+YM3SesbQp3dJfOqxiA7v6jmB
	 CNcecxZC6P2D7ZFxut2GMiOz4RXv7BKne6zHjsNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D89F80128;
	Wed, 31 Aug 2022 14:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46043F80448; Wed, 31 Aug 2022 14:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18591F80128
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 14:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18591F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hflMLsoM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 911C2619E1;
 Wed, 31 Aug 2022 12:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88230C433D7;
 Wed, 31 Aug 2022 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661949658;
 bh=VJzf5SMukgnOhcfk4fRzmhPNEX69oZvYp5xql0sUwi0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hflMLsoM4EqU3I+v34GfrKGbKTnEwZVp+bhQtI8fx92UthCxDhYmcB8MiNGbl19AN
 wd125Tn64emwO8sVfyV3i16ZNCWCzqQRshFITpVVYMQSAL9+Qx+bmE/NvM+jgJcj9k
 L/7xwiOCD4/rfvhzWMG1wy+1PThCVULGX1KJj+0rqmrpTe3Jg6M/1uCU0dDwSl2jy4
 dT7g/PevZM1wXs3P7KtHUVafQAw+pW7UjJQM7j9wNRu8rRMb4o9VQhb1vR2LKLMqg7
 hSaboqse8641rFF0GA/NB+Gm8cJzfHNRL3FQ4t7xZwEI628lFgGaH8oAnNCjWOKkw6
 UYiDjTkJz1jnw==
From: Mark Brown <broonie@kernel.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220801063501.51439-1-venkataprasad.potturu@amd.com>
References: <20220801063501.51439-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: Modify dai_id macros to be more generic
Message-Id: <166194965527.85274.9760279024689489230.b4-ty@kernel.org>
Date: Wed, 31 Aug 2022 13:40:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Vijendar.Mukunda@amd.com, vsujithkumar.reddy@amd.com
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

On Mon, 1 Aug 2022 12:04:56 +0530, Venkata Prasad Potturu wrote:
> Change dai_id macros to make I2S instances in order.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Modify dai_id macros to be more generic
      commit: 99a387c7818fe422fa96458f56bc74f05f263013

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
