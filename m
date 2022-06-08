Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E70543187
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 15:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52F291883;
	Wed,  8 Jun 2022 15:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52F291883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654695419;
	bh=5LB/laBhD+UgSSOr7WRcH6UEhfeHkVEIj7KyPjpj7bk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LsjoTRTRrDIeUb73HziipQ34v2gavnxLRTCYP1Ub/bhlok1vflIfvlLMBVo2YiKNY
	 Bi+N01OZfpzXaVaUoAN1Y+piB4CzN71mC5wFJdQuzDJJszUHIxIpweaOA21Wx8x+ix
	 H53gWYA/7p9grDVu3yYnnSR/3PGSz3ce6uR6yF0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E6FFF80510;
	Wed,  8 Jun 2022 15:35:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3E04F80245; Wed,  8 Jun 2022 15:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36393F80245
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 15:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36393F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hEdu1RTA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9E1D61ABA;
 Wed,  8 Jun 2022 13:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FE5C3411D;
 Wed,  8 Jun 2022 13:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654695324;
 bh=5LB/laBhD+UgSSOr7WRcH6UEhfeHkVEIj7KyPjpj7bk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hEdu1RTA30wC/gVRvrUhamV4CIrMaI7UIJc2NGAqmGgsT6dbAjDo4FBPJFL+b+/D8
 ZJeBpPbyJkpirCUplI61/Gq1yjZHZG4T5C+bCPyeGkGggfU/0M5VKj8E8Z7vQxDLAj
 Ji90W1x9PiwNLAiSlagnIz/Z44sWRwPGDOs7wgOvqFrzAZ5kDqulANOtym3pL7fQwd
 EFgw/Zk0iwP9DDGNfAEwwBWMsP8Mx21B6nLRwN9wUvrBBirQZkQO45yLF+wNTvd78t
 QCXWFe0ImNoRz81zN2mnXF3xtLYcoTV46kHQs4fH+PW2JMJaUb/CSMPI4miSidZAbC
 4bn+/O3h0XkDw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jiaxin.yu@mediatek.com, angelogioacchino.delregno@collabora.com,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 Colin Ian King <colin.king@intel.com>
In-Reply-To: <20220608082338.2083456-1-colin.i.king@gmail.com>
References: <20220608082338.2083456-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: mediatek: mt8186: Fix a handful of spelling
 mistakes
Message-Id: <165469532211.615471.3502999805996832817.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 14:35:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 8 Jun 2022 09:23:38 +0100, Colin Ian King wrote:
> There are several spelling mistakes in dev_err messages. Fix them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix a handful of spelling mistakes
      commit: b09654e39c89a86680528345f3a95b832236ee82

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
