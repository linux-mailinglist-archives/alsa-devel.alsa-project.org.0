Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECA46559D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:36:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E317226CE;
	Wed,  1 Dec 2021 19:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E317226CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383781;
	bh=DbZYTt6Xk61X6E64B2G6G9w0VkROaHjiFX2uaD0wNNg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGM24MbvXBQf0izc5woXfQl6SmahXOVYWBfcRgW+KKMyk2d03JhVTtp9cEVRpV6W5
	 7qXeJcqxTAetczDxLR2lYSZ1lIU1sr0PDXJ3U8H/oREOR7y8WwOTqqRuDp+SpPZpta
	 1E+ytTPjkamHf+I/CJi44CDY3PnNHANIxuDo1dAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF25F80533;
	Wed,  1 Dec 2021 19:32:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E860CF80524; Wed,  1 Dec 2021 19:32:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA21F8051C
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA21F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SJ2EG+xr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18609B820FC;
 Wed,  1 Dec 2021 18:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA88FC53FCF;
 Wed,  1 Dec 2021 18:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383538;
 bh=DbZYTt6Xk61X6E64B2G6G9w0VkROaHjiFX2uaD0wNNg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SJ2EG+xrdvPZD6skv01hvMRDI4+2RGv4Ig9DI5MvpgJJwYwEA/gXuwPd/+5a1nNt4
 YRDybhqIWZvXurkJ1nLrP9zW7NBOXg18zY4GKgRuslx5x1DaGvJ0hB1DwyWr/OobpR
 SLBK8Yy59XdZMd4qdnz4KmTFGjIeyPZ35teoIpGAlx4yLvCOg/3OqgW9ho4Z7bBlfZ
 GyPU5C6AjZk6eJy04VHI6kOGbBzD7rMwLzQFTc2aSrn2ntTJtmLaXh89WUxg+rPaJc
 +hMf44lEJneiKx1V/gFEkWa8sFXy0XjhVkZ9Iy6nJLaX30r6oBpHY4/KZc8FY/MEYj
 iPMwW1ofG6MJA==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211127093147.17368-1-rikard.falkeborn@gmail.com>
References: <20211127093147.17368-1-rikard.falkeborn@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Constify static snd_soc_ops
Message-Id: <163838353641.2179787.17471282072655140099.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Bixuan Cui <cuibixuan@huawei.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Sat, 27 Nov 2021 10:31:47 +0100, Rikard Falkeborn wrote:
> These are only assigned to the ops field in the snd_soc_dai_link which
> is a pointer to const struct snd_soc_ops. Make them const to allow the
> compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Constify static snd_soc_ops
      commit: 8752d9a82fd065ef60c9a0e0e8ec820327509382

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
