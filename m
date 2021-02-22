Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E962D321C64
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:10:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 846B0166A;
	Mon, 22 Feb 2021 17:09:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 846B0166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614010212;
	bh=OmxIEtcBGpIvS3Ts7xASVyTtAwL7Z13+OB6riT2HaoY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsPNJimChzcC89J3fpBAQMpj/g4VTuRr4+bUBppTD5Md5gafUYnVaA/1OvZg4QHuM
	 QN+wzy6JJvXFhtG7EOumjxJMz/xFLb7A/khu1boR4/qAtT9Y68cdP4EJsXmXKZJ7WO
	 23sKx+jRKAbl2GUkjx828Vlww+Kwq/9NAoQ1fpn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53812F80249;
	Mon, 22 Feb 2021 17:08:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C14AF80234; Mon, 22 Feb 2021 17:08:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1CADF80129
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1CADF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ig1Bqyl6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D5C764E40;
 Mon, 22 Feb 2021 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614010103;
 bh=OmxIEtcBGpIvS3Ts7xASVyTtAwL7Z13+OB6riT2HaoY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ig1Bqyl6VrLdqQT5+uOJjKRbBzw+shgpkJq9x/R6Z2/aJD+rCDVpznxw/X0Sv52vS
 VTGlA5Gs1lfEJKQfYj4Xm3rmAdME3m5Wk//6mA0Qk05Gqb5AzD5DdSCJ+gock8yZ3h
 6DHqZurn3TeUX+oX3cE1HBzqZvd/1U9IudcqUQ+hjIHQnCzzavCx9qjSr+vAzG1CKX
 0ibSIhYkssw3Mj5IwoGXIDMvr827Qel3isLVBfcLTQBCz9SxJx7aCeKdLQ1nyn6QUS
 MLDUodxYeX5R8dkkePHkZhCIGZ89ElS+uDtReQwf/SmqY3Fto1wSFuC+gAP+GBsVBQ
 E7n6f51ZSgWDQ==
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20210222090057.29532-1-jack.yu@realtek.com>
References: <20210222090057.29532-1-jack.yu@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt1015: fix i2c communication error
Message-Id: <161401004265.2538.16028409471544371850.b4-ty@kernel.org>
Date: Mon, 22 Feb 2021 16:07:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, derek.fang@realtek.com,
 flove@realtek.com, shumingf@realtek.com,
 peter.chuang@lcfc.corp-partner.google.com,
 allen.cheng@lcfc.corp-partner.google.com,
 sunshine.chao@lcfc.corp-partner.google.com
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

On Mon, 22 Feb 2021 17:00:56 +0800, jack.yu@realtek.com wrote:
> Remove 0x100 cache re-sync to solve i2c communication error.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt1015: fix i2c communication error
      commit: 7fb08871c38ba9e871d20d64f3a27409baf7b754
[2/2] ASoC: rt1015: enable BCLK detection after calibration
      commit: 2979ef760e73e2a1a34cd4da5d2c78371dfe1028

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
