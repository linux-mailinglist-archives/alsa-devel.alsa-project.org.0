Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D73481388
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 14:31:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6DC9179B;
	Wed, 29 Dec 2021 14:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6DC9179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640784687;
	bh=w6y+9dzjomrSxzPcW24vCF6O/7bcBimAL2ZN9jS8ljg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sEQi296fA3eIyxpYwMK79hFE69F2KMuDwcALaWwYBkTTgxbIY3EkVOKIAOLUdYFge
	 32DEMKsTl0H6T2WH2D4XREkWqInnXlvsrA2thoPFIk7A8H/erUQFuDFIDevDwCWM5F
	 Z5zARshXcM/kOeLgNmg956x7qPqJfPlhvGwjiNZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 372CAF80279;
	Wed, 29 Dec 2021 14:29:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEEEEF80246; Wed, 29 Dec 2021 14:29:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC80AF800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 14:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC80AF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="elI2EpHj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A664F614B2;
 Wed, 29 Dec 2021 13:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7887C36AEC;
 Wed, 29 Dec 2021 13:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640784571;
 bh=w6y+9dzjomrSxzPcW24vCF6O/7bcBimAL2ZN9jS8ljg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=elI2EpHjUB9aJk3DJnPn/IzH6GdXQV9wWItA82EsK3fLcr12rBkc0RPTT0+yo23st
 PrUe2rTvxJV3J1eKJA7edVTwpiLBmrpI0QLoHHphhDFz4HH7xZhmpVOgb5TY8iW10q
 eWo71swh3BHJepACiPL6I+8Jd55ZhE3/6WS692WBnxZ49Po53BjpnlPa9/LGi6XOpY
 hlC24u8N3GAIO3jGxI8woskJU+9PrlBmwjYjHMlNfLZWDa3Sbihgw+1LGZxxc/oF+9
 xgsQktkjNmUE5yaD/50YW+aGyRIBsA4NOx1Yf/p6H0uBbDW40W8qW2zJXrlXnOEZ9x
 z/SRta6yd6org==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20211222141920.1482451-1-festevam@gmail.com>
References: <20211222141920.1482451-1-festevam@gmail.com>
Subject: Re: (subset) [PATCH RESEND 1/2] ASoC: cs4265: Fix part number ID
 error message
Message-Id: <164078456960.1246652.4845859047265094767.b4-ty@kernel.org>
Date: Wed, 29 Dec 2021 13:29:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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

On Wed, 22 Dec 2021 11:19:19 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The Chip ID - Register 01h contains the following description
> as per the CS4265 datasheet:
> 
> "Bits 7 through 4 are the part number ID, which is 1101b (0Dh)"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs4265: Fix part number ID error message
      commit: 8f85317292f1d99e8a70a400a46ee697d64e3326

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
