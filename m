Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36DC4C78B8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:21:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D54A190B;
	Mon, 28 Feb 2022 20:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D54A190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076111;
	bh=QMnH25jeKQK2fr6BizBXEDFvSipSItzPlv7VILXcuB8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ogUxnA7h3RJVgB/ulkmr3InaOQndZjbyjzXhmcr2tBpk8WoK1kgpztC5WviBVkvRd
	 OQRoZzIHgaP1xJKiIplyawegDkJ/ivTWY+zuIVkFLzeS/QgzRYTxeLSK6Jj+CkTK8a
	 8fmSBvfKGBaP5FqU1Es1dBZkTN3NtJLxiNVcVbdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB8B1F805B0;
	Mon, 28 Feb 2022 20:16:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC57CF80539; Mon, 28 Feb 2022 20:15:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DB8BF80519
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB8BF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qn1xxKzr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEB2D61583;
 Mon, 28 Feb 2022 19:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E1DC340F3;
 Mon, 28 Feb 2022 19:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075737;
 bh=QMnH25jeKQK2fr6BizBXEDFvSipSItzPlv7VILXcuB8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qn1xxKzrBMx6gzQOnPPikBTdhge6w+TPfpMphxMBnscom5bnyygc/8+0MtZxR/mlF
 lQMZXw7xF93AQ8LF/0IHoO5yolN9gSPcFnO2mXiVfL9On7Js+kcjllsTv3C8nVXm9e
 o4jzyaBbq+WKIijT+/QyE9p2HyeW53fYW340f1KSuRXF4lhKkHJR2oxXunEg3BaGHX
 4hxIC+ABh5JmFgS84rMlOfNi1M0kuHEGkKNLESRzeImbLuWx4iasiIOItTsfJxwIkY
 T9EDk1wClMIGRFsjjLWkN7DYnS5ckZf9+zYWO/D5QEvFSpjvrzVaCzlqLFNMxIhmK8
 16MyVlXgjk/zg==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20220224011046.76904-1-yang.lee@linux.alibaba.com>
References: <20220224011046.76904-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Remove unnecessary print
 function dev_err()
Message-Id: <164607573514.3538791.6139956984733372716.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>, lgirdwood@gmail.com, tiwai@suse.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Thu, 24 Feb 2022 09:10:46 +0800, Yang Li wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
> 
> Eliminate the follow coccicheck warning:
> ./sound/soc/mediatek/mt8195/mt8195-afe-pcm.c:3126:2-9: line 3126 is
> redundant because platform_get_irq() already prints an error
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Remove unnecessary print function dev_err()
      commit: 7d642c9c14b6fae0c05b91a92a86fae6674a2126

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
