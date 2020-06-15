Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D59E1F9B98
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 17:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4271E166F;
	Mon, 15 Jun 2020 17:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4271E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592233791;
	bh=8P4ykyY8jMlSD8oJWEmDnxXO3o+Qr3wpbMtJbKmW9TI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HcY8mN3PggaK95zGxhMgdDyZOoT5OjKkJn+OFFSpzPhLNj81FjtICStC9jYCutVrN
	 KIXt5lHTVO6SdXQGtl9moUlVYPBIIU6dJ/u46L4UF6uns7GGb1w7lWNHmiVRqkKTng
	 J3EkWu0TSuQfOp3VTheGD++tERhM25MQgI3njiOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 229FAF802DC;
	Mon, 15 Jun 2020 17:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A445CF802E3; Mon, 15 Jun 2020 17:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B310F802DC
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 17:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B310F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ldg4Kbuf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A9442074D;
 Mon, 15 Jun 2020 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592233553;
 bh=8P4ykyY8jMlSD8oJWEmDnxXO3o+Qr3wpbMtJbKmW9TI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Ldg4KbufKcgTOoKDAfoTn2Ai3j7ShEZqCqVryxxNOI7mvxCIT+FIf57U37craYpCI
 t4hZL1ckrme8kKqbfi8cDh9tiVVglAi10+YE5c5Dutvz4KeiPUC/gXxnAhto2MREPq
 QX0lnF/DiXaDxnTRa/MHsuazsyV9wXUATd4YhIPc=
Date: Mon, 15 Jun 2020 16:05:50 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "jack.yu@realtek.com" <jack.yu@realtek.com>
In-Reply-To: <20200615032433.31061-1-jack.yu@realtek.com>
References: <20200615032433.31061-1-jack.yu@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1015: Update rt1015 default register value
 according to spec modification.
Message-Id: <159223353044.8967.16766188900025141454.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Mon, 15 Jun 2020 11:24:32 +0800, jack.yu@realtek.com wrote:
> Update rt1015 default register value according to spec modification.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: Update rt1015 default register value according to spec modification.
      commit: e74a1e7eaed95f2c6422e7cf9ed70154f17a6db3

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
