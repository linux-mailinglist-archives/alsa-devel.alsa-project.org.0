Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFABA419DB0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AC216FA;
	Mon, 27 Sep 2021 19:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AC216FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765470;
	bh=067NhX2KE5L8SNJe0XByi+6nf1/19ex0q7fmHEeBESs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyYjDVKlVr0XzN5/Eek0aBI70luLwTuIUr4Imny4pxQWFG51DE4HajMH86L4CrwJS
	 nO+vVoE/x7QjP+Kfbp/V6rrHc0Lob9+qVEJEukem1uloHdfRGJbx5ytwL0euJbKt3q
	 w6492tsqUKlcua2Kybn0n6ktfzFUlMmdhtBhFtxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA796F805C8;
	Mon, 27 Sep 2021 19:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3FEAF805BA; Mon, 27 Sep 2021 19:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18494F805AD
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18494F805AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uGah5pBQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A915A610E8;
 Mon, 27 Sep 2021 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764900;
 bh=067NhX2KE5L8SNJe0XByi+6nf1/19ex0q7fmHEeBESs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uGah5pBQKNxidKJMt8BLfXaIbkZXLGwXw3sKNw8igZDUFRlgqIAfuPiTCIsHkMVAP
 T9cACov2/IGuj+YNEAAxRnfSkI2DYYXdjM0TBjYQ5KIOOLxZhsBcy4DOZiRlGMUlGV
 XlcpJZNumnio0ip9O+7dsMb88Oy5cL9cb5FuWNlv3Sd7YJoI2wh8XrwQQGMYeBOONJ
 kuZTG+3TbPE2cLRtP1BwB7cAKeEEmeKspCpJ5O/8l9X5e0qtkdG8LZY/UlwO4WqVd3
 +mBgisr80cTwbgrrA0ZzfJ1GLePeu96upa37XzsWi543ku93/2fv941QtIZu3XehTZ
 p5g8oqQVZm0Ng==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: zl38060: Update to modern clocking terminology
Date: Mon, 27 Sep 2021 18:45:52 +0100
Message-Id: <163276442022.18200.9810643203964298425.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921205117.4393-1-broonie@kernel.org>
References: <20210921205117.4393-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 21 Sep 2021 21:51:17 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the zl38060 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: zl38060: Update to modern clocking terminology
      commit: c5bc6275110627a2733bbadaa13e98b7031921f2

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
