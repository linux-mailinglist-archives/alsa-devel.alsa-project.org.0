Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E2405A46
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 17:40:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9471B16AF;
	Thu,  9 Sep 2021 17:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9471B16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631202052;
	bh=tkOzf4SWBI/A4DwsroAtEgpaaPJWTwSJSjBkhkWXmMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIlLkDGliOC9bBrXNGscChCgtwO6fHAMphJ24CQLDq9J5vAreQUG25jMFvmWNRCFR
	 EZaX0ABcOxurpviN4XUvJEHA2BHqh5Fn2EWo+fHlhRQbSci4GXwGYLohUlXsnRbE/e
	 bYoiL3N4w6bB3Rqeg9xuLp3bxKveKQM/BxMsNtOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94090F80253;
	Thu,  9 Sep 2021 17:39:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1D35F80224; Thu,  9 Sep 2021 17:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FB6F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 17:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FB6F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nJhV9fvf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB4761101;
 Thu,  9 Sep 2021 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631201968;
 bh=tkOzf4SWBI/A4DwsroAtEgpaaPJWTwSJSjBkhkWXmMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJhV9fvfNFeICwBDTUrqTTlfXKOrQ7ggctzbNDG8N1pai6ZW3kD0BiudT68fNafJ0
 nw+xWdmdXcE/rZOTItwmQZFMTEAuN9XPe0Ckvo5A1kA/s1H1yJS9SntciWBfQkscju
 t+Ejk5J2dwsBrLywTaXg5yjTdnM3se9sNUk6vX0QMpFtj9LuqT6D/JOkNsTOOOrUyK
 Sgk4A1T23zChKVB/1ZRKW5/L3v8q3gxB2jedgFRX6/huZlSRKVo1crlbFfTECMegYv
 d0oo1//1Mk4qEJf3d3ZXyEXrb1pynXGWlAzm0P+cnBgUQtezcL/sKMsGN5U5FJzbnA
 a27MmWQhZkD2A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Subject: Re: [PATCH] ASoC: mediatek: add required config dependency
Date: Thu,  9 Sep 2021 16:38:49 +0100
Message-Id: <163120168199.50116.8060254144301490373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909065533.2114-1-trevor.wu@mediatek.com>
References: <20210909065533.2114-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, geert@linux-m68k.org,
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

On Thu, 9 Sep 2021 14:55:33 +0800, Trevor Wu wrote:
> Because SND_SOC_MT8195 depends on COMPILE_TEST, it's possible to build
> MT8195 driver in many different config combinations.
> Add all dependent config for SND_SOC_MT8195 in case some errors happen
> when COMPILE_TEST is enabled.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: add required config dependency
      commit: 5a80dea93191d55840f42252ed3e4565a125a514

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
