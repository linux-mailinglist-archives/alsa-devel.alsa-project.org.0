Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4DD40F9ED
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA21178E;
	Fri, 17 Sep 2021 16:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA21178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631887566;
	bh=CoUVYEo7fgOBwEFTIbSZgJaRRDgozeRszombXxCWMOc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vMFmAosj2a4put651kQ2xi0A8ITaBOlS4r7empviKLU1Z+WBh6dBqqrWVMCUdbSlD
	 C6Nzl/t2vIIvebHVNoJ35vaMU9SaVwagAko7Kprdjtt55eWOO7uito9aIdVA7SZWlq
	 4YbcPx0Ga596ccf2S5Hjok1LDjP0m13FMZmLrGgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9BA5F8027C;
	Fri, 17 Sep 2021 16:04:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFB53F80152; Fri, 17 Sep 2021 16:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78EDDF80152
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78EDDF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gUc41pro"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D8E26103B;
 Fri, 17 Sep 2021 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631887478;
 bh=CoUVYEo7fgOBwEFTIbSZgJaRRDgozeRszombXxCWMOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gUc41prob34WTGXolgchVNz23eEN8sbz/GWDGzoVA6tKHXQNHFhWihNRYBwR9ooGB
 /bHzwjgDJH/oNuBV2uCKzFVx6H9urHsFNYVrTm7d14lwsjYBH7uj1jPlKEau3B/5Fs
 VIlKsHjhyYimb4qtTj27d7hFYGVQuLsOdE7oVpWu69xg0dPJyTps0g6AJMGGiUARt+
 1wJYSj7jkLa7VqtZgK9TuqVNSFqcaNHn9DCxLLRSZ/ZuSNm1rdwl+vqjdqjCDjLKxa
 5Se3NXvnRmKObKxZU4Xb9nsZXrBq+FU5Hu4lyX11cdOgJyezWIvBuFaOtuFBVxVj0F
 IwkDX0bq6n4+g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Subject: Re: [PATCH] ASoC: mediatek: mt8195: remove wrong fixup assignment on
 HDMITX
Date: Fri, 17 Sep 2021 15:03:44 +0100
Message-Id: <163188719815.50326.5771604177613195769.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210917082805.30898-1-trevor.wu@mediatek.com>
References: <20210917082805.30898-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
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

On Fri, 17 Sep 2021 16:28:05 +0800, Trevor Wu wrote:
> S24_LE params fixup is only required for DPTX.
> Remove fixup ops assignment for HDMITX.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: remove wrong fixup assignment on HDMITX
      commit: 3abe2eec87059260bf31033a8863c67c5d45b9d0

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
