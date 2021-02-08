Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A30313DC8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 19:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A9116B4;
	Mon,  8 Feb 2021 19:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A9116B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612809698;
	bh=xgfXFXjxKi9MNGtKtz9Ymxo6K71+ooCHg7rZVVUShK8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K1zChbI/bmIeOiglvgMBYKI8SpjlDz6nBXSlLEpPd3zOwur/MmxNPm1GAgWHM7dAh
	 NXYiq08yh6EinBet3WzgnLoHnWHizntvs/lsqw/tmvB6o1T9gqcRtq040reXZ6wdFq
	 i8TtzFxBM/afNto+aYeaOGJYV48GzC7lY/mXTgm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C108BF802A0;
	Mon,  8 Feb 2021 19:39:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C139F80290; Mon,  8 Feb 2021 19:39:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D51E9F80278
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 19:39:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D51E9F80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ce9O3Y4e"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D49964E6B;
 Mon,  8 Feb 2021 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809556;
 bh=xgfXFXjxKi9MNGtKtz9Ymxo6K71+ooCHg7rZVVUShK8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ce9O3Y4eN/3AFIMoDMSQNp5IJmirdGXjxOzxsX8HI2R2EEuFZZwh4EYeudaHrOt5J
 tgLvLfbYs9wjnsiO3hAqCEp2tnc4U2Q5/DlgQjPigUSo4KUOr0VU4TMqGWXaDJi4sj
 26THtsD/Qh/paOPbYPAEfXyETlzac6jt/8YicP84D35XRiBODs/Wqa7ms7l3npNnMH
 a6DD9fAbtSeaFybrCGb3UW1Ql/dt9dZf250MFOXqIZHo3UjPmpSl7pNxOnfJSwZqQB
 e9Reqimn24mtQ+DVIqsS3JPB9R8nlVvryK5ZRwR9bLJfkbP9JThCcW8JoXsVn7/1D+
 gOkG1WyhyP+Lw==
From: Mark Brown <broonie@kernel.org>
To: Timur Tabi <timur@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
References: <20210206225849.51071-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: fsl: constify static snd_soc_dai_ops structs
Message-Id: <161280948304.10741.2031202191928010331.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

On Sat, 6 Feb 2021 23:58:49 +0100, Rikard Falkeborn wrote:
> The only usage of these is to assign their address to the 'ops' field in
> the snd_soc_dai_driver struct, which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: constify static snd_soc_dai_ops structs
      commit: 38d89a564847048c0f6fe53a829d15edb4f21da3

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
