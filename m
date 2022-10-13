Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF18C5FDC92
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Oct 2022 16:45:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C2FF5C89;
	Thu, 13 Oct 2022 16:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C2FF5C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665672337;
	bh=uacRl6EKOz/PYyP/Q0G6Bi+IfdVHb5USGVqqgC5eS8w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQ4vMeq45WE5/1I8HE4UlBw5xvWTa42zmr54DhOF+/q6PSdS1jaT9Bg0eue0/nbf6
	 LFfO2vUnWUdXJ8ITzte/oOmD4XAqpTZs9i1LVU0LQAOuwqcEA88AnoAJZNKqRRBF3k
	 kOZwzIjmpZa0tvZNHwUxguOXhXylDMsCFHs8M/Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89116F80548;
	Thu, 13 Oct 2022 16:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A41F80551; Thu, 13 Oct 2022 16:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EEB1F80542
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EEB1F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W9ogFuNv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 708CF61805;
 Thu, 13 Oct 2022 14:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EFDC433D6;
 Thu, 13 Oct 2022 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665672239;
 bh=uacRl6EKOz/PYyP/Q0G6Bi+IfdVHb5USGVqqgC5eS8w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=W9ogFuNv4ckrK0PZQDKL0SAtAjPp5FOqC90ap00ACNLECixegbzaDMKtFMD6oZDVv
 Mm8t8YjgEE/0Hun0e3uppSdhI4tQ3ISGe5bBaP80qBst0Vh4FazVoVoGi55AMmfg1F
 tyiEeiEGEUdGAreuoUUDXals1dkMYZ3Xrz7UKUkkSaDG54WD1HmDtJDlLxhuMUpyGx
 mcGNXCtVuhaPWIXvIXT5W212ZZSVMNRFpq/raNRZo3YUyI1+LDv/op7Td/2fRQu5Lk
 4hif4sjDNAc6bnc2Qvj6z56QCmOLuVbc2X30CMCajx8Ft3eDtcYfxGxoVSkIx1gdu8
 MG/R+Jptd2iJA==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20221012031320.6980-1-derek.fang@realtek.com>
References: <20221012031320.6980-1-derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Fix the TDM Tx settings
Message-Id: <166567223717.170727.7128686620734819962.b4-ty@kernel.org>
Date: Thu, 13 Oct 2022 15:43:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Wed, 12 Oct 2022 11:13:20 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Complete the missing and correct the TDM Tx settings.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682s: Fix the TDM Tx settings
      commit: d94bf16e920047c9b4ea2b57f7b53b4ff5039d9f

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
