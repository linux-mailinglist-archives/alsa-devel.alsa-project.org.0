Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB71261716
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBFE169A;
	Tue,  8 Sep 2020 19:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBFE169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599585922;
	bh=LBPJd0L8n/8XJ1Qd3rukDT67d+MY/Hku7khI6Rr1pvo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUPHmzRSP7rdunsyy0UNGyUNcCzKPp30iOGd99r2lmUf3p4OlAyJnUrfSouQDUWan
	 TwYfoyyXy5RGEy+HIEkTi0v6uepmJyPxK2SSAdjlDBQ9NZQSi9XdixDM6TleCAzpNe
	 SfzA4Nv1sCIC4VvDPRwJZue0yoXhsG2JLEdW92W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 573D4F802EC;
	Tue,  8 Sep 2020 19:21:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00509F802EA; Tue,  8 Sep 2020 19:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F15CAF802DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15CAF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HtUemtIh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25B7820768;
 Tue,  8 Sep 2020 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585684;
 bh=LBPJd0L8n/8XJ1Qd3rukDT67d+MY/Hku7khI6Rr1pvo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HtUemtIhp+/hT1zo7fMsAvV1/P2t8geWpqWRJNFCRVaCs+dO9tRGWD9gFCy0gEB37
 uzjBk4oL9gzFS20og6n+M4rJtRp6ZM0nLVoLZAhpOCBz6gq++wArsmpJsEISni19dE
 muQ+yMftQS70NQ9zd1uS3feRxASh/HRh/Rj93AG4=
Date: Tue, 08 Sep 2020 18:20:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200908070044.1142644-1-tzungbi@google.com>
References: <20200908070044.1142644-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mt6359: fix failed to parse DT properties
Message-Id: <159958562063.16576.3044446748020736063.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, jiaxin.yu@mediatek.com
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

On Tue, 8 Sep 2020 15:00:44 +0800, Tzung-Bi Shih wrote:
> Mt6359 platform device is instantiated by mfd_add_devices().  In the
> case, dev->of_node is NULL so that mt6359_parse_dt() always fails to
> parse the desired DT properties.
> 
> Gets the DT properties via dev->parent->of_node.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6359: fix failed to parse DT properties
      commit: 6835302853169441069e11bc4642300c22009c2e

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
