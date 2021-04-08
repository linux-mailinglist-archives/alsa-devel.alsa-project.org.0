Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492E358A59
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:58:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE95D167F;
	Thu,  8 Apr 2021 18:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE95D167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901084;
	bh=htlRiJ3+W5yCVRkjQ85b0eszxfKwlo/CNzzLketzYTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sRfr5yHmeRLtN/qfMKSHgODByL2UGWJR0ftU7GPVP1nTcq4az/zfwlEQxs2h0got2
	 /yBc8jGG6+DpD6mTUkyQK63PNo2bLfX22Zq5zaGMvMUs4ZcnEdswQiKvsVKt5IRzZx
	 Re09njQLMeb5Mi+q1AoaLLDzTBzNpi94oz87my/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96EEFF804AA;
	Thu,  8 Apr 2021 18:55:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5107F80482; Thu,  8 Apr 2021 18:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C98BBF80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C98BBF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RmBy6b20"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1870F6113A;
 Thu,  8 Apr 2021 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900936;
 bh=htlRiJ3+W5yCVRkjQ85b0eszxfKwlo/CNzzLketzYTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RmBy6b20oW2rFEaDuRn0qGKuUvtdaQhBhwTM6wrUFb9JqTVTyqVRfna5v/SQGI6Lq
 v6Agsvy6ZnKc/k3rf2irLJiEr/sVBhv+LiefbLH9rxOhmkx/RWNFIZ/tw11+ot01A2
 LJEJYXKZAU1Z9WhG/U59IbQt70pt5gtjmKOHDArwvCk4DhCZArwXftTD3xQhIYzC6E
 thuMwK5G7Rm3PUnFNnBXvR959caxIGB7oLeF5FRmVffNdjlUlEGRAnGxT0iRwJgVkj
 rDCd2inJ+M2tvII4ZJZJj9e8ZS2z7v/wUuYDmUttCp2FAmRIeRG3t6Z1mqwgWYi7vY
 5vCNjl1dEYK9w==
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>, Ye Bin <yebin10@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH -next] ASoC: tas2764: constify static struct
 snd_soc_dai_ops
Date: Thu,  8 Apr 2021 17:54:40 +0100
Message-Id: <161790012551.16915.4640106834409822350.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408062643.802908-1-yebin10@huawei.com>
References: <20210408062643.802908-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Thu, 8 Apr 2021 14:26:43 +0800, Ye Bin wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2764: constify static struct snd_soc_dai_ops
      commit: b186e7c17d9f2c2bc9cd0bd362402eddbea7749b

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
