Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D72873EA449
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 14:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C4241AA1;
	Thu, 12 Aug 2021 14:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C4241AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628770189;
	bh=MKJ7kDBbi+kI+OEuDOgJQvmiexrSsTJ4gF9df4OaPVA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hzr1e1d3Z8kXdCCNQgwAdd8fBWG2RfS0BPuUrl5+BDVyVbpxEkZe4pZmofz036TbE
	 DehvB8euuitgtUMq1SMeu9Fwbz9AJBCyNVqF4WemcHTmPhAvojeZqZ0CDXDif+YCay
	 HraglUPLXsk/VVBdw5+cpYbM5oBUmX6JBpP+QAsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8BCF804E1;
	Thu, 12 Aug 2021 14:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6B9F804DA; Thu, 12 Aug 2021 14:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2562F800AF
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 14:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2562F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cVxJ5xcS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B4E96108C;
 Thu, 12 Aug 2021 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628770045;
 bh=MKJ7kDBbi+kI+OEuDOgJQvmiexrSsTJ4gF9df4OaPVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cVxJ5xcS7ftQHE7XtPfIL0JrvEH4fyAeUrotB/7v/jvf5QgvBZ2D9OPgWRO5vNm3a
 8UKuZn897aTTbcJ9jxBLQyOcZDzf+9NLRrVraZUJc4P5Xw47jpTjK43Z8Exhg2Mqh1
 OiPBCJ+v7An04q8FWLZ9Yp+QbIOlmSTpNYpGrz16/U5PO345S93G0/K5W2br/qIsve
 +DanvHT3FdGftM0HBFU9IoPQnrE7vS5yW4fLkkisAZ6NXT0K5B2fQjn56vaNDBCPTn
 wP9vvc/ROlBmPrEri0VgJYAlr50vTYpReqn47asW9QfCYDU8HgYUfIgBLBJ5GtDVTo
 thL99MttxYpBQ==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH 1/2] Revert "ASoC: rt5682: Adjust headset volume button
 threshold"
Date: Thu, 12 Aug 2021 13:07:00 +0100
Message-Id: <162876970127.42668.10498865334575138313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210811083750.26680-1-derek.fang@realtek.com>
References: <20210811083750.26680-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Mark Brown <broonie@kernel.org>,
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

On Wed, 11 Aug 2021 16:37:49 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> This reverts commit 6d20bf7c020f417fdef1810a22da17c126603472.
> Since it may risk affecting other headset Vol- button.
> 
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] Revert "ASoC: rt5682: Adjust headset volume button threshold"
      commit: cf2a19f7d2b7d777b4a0ec6f3faa7fe3e4ad568e
[2/2] ASoC: rt5682: Fix the vol+ button detection issue
      (no commit info)

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
