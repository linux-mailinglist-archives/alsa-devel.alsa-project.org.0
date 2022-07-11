Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E35706DC
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 17:20:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1832EE12;
	Mon, 11 Jul 2022 17:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1832EE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657552845;
	bh=/A3PTdW5tYRvqp6LbUd4hnfzACdhbSnZU5uWQJBjF6E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/rQRWNSJkAwReXZOHwI6hOhXvJ0cVKzmhk9MxWzJmePTtZsDORnzFUq32LJmgoUo
	 2qK0bLPkLtVRw3xofH6jqrCrp/ScCNsEoOlgCubBCYcZ9asqjQn8OPLgrqqX1dbLOn
	 lkNsdQiVi7oRJNnlaD8vQ//tBv3nd6JNiDOY4GSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B3A1F800E1;
	Mon, 11 Jul 2022 17:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22C68F80543; Mon, 11 Jul 2022 17:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B86BAF80256
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 17:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B86BAF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bil69G3Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 182C7615CC;
 Mon, 11 Jul 2022 15:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18E4C341C8;
 Mon, 11 Jul 2022 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657552735;
 bh=/A3PTdW5tYRvqp6LbUd4hnfzACdhbSnZU5uWQJBjF6E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bil69G3QZKz9IFDmv3QykqamC6u2h62z9Pms8eDjeSG2NbOyaKiDfAyQtuvFzGCFD
 1S8XLqdM6HzqJFTl9NFsbxTQLiCFn5cXm8BONNLgalr137E2iWIYL6uIL82Aw9pvGq
 asAE4ykf9jtGnA7nQzVAkDBdXQsrekBHlRa3bdC1rvoNdBVHosL2dXdxjBHkPUBDUv
 Q1qLXCZ0WVt95khiC6h1+yPjOmoTX0/LvpP3iHrqOodMgUQKmq9YyXumao1n1NMNeI
 aBoRMYlD1fVZPqa2YYqpl3/vaPNfX2y2r9w7s3L2z8zXleBFRn3/vqWcTd0UCUWI8s
 FH9rvqvDXEzFw==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@microchip.com, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <20220711112212.888895-1-claudiu.beznea@microchip.com>
References: <20220711112212.888895-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: remove space in front of
 mchp_pdmc_dt_init()
Message-Id: <165755273352.520536.8724051987921046485.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 16:18:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 nicolas.ferre@microchip.com
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

On Mon, 11 Jul 2022 14:22:12 +0300, Claudiu Beznea wrote:
> Remove extra space in front of mchp_pdmc_dt_init().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: mchp-pdmc: remove space in front of mchp_pdmc_dt_init()
      commit: 375f53566cf04324825b7a0f545aeb4405963bd0

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
