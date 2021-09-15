Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DC40C844
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8C95183B;
	Wed, 15 Sep 2021 17:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8C95183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719531;
	bh=RZMWp46HzGUA8UW/blcNKPqDUhpcyxQH6zpAklpYtDo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4AFh20NbCMWtPBbj5+8Akms9obXq98duDs6lublLjIbQWKgO4hatjsZmymrrM+ua
	 2seXyNRruxjjqhk1r6Zc6AC5AITEkry0yPrhbFiTpV4lR49Ybu9VBlgFnFRWp9Nm96
	 gKAL2fCtwi2KtMX3j7qFENiWNTmlPjdnlGZy2P28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43CA3F804FE;
	Wed, 15 Sep 2021 17:22:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0C63F804F2; Wed, 15 Sep 2021 17:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F44FF804E7
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F44FF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uV/IXOeT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DDFE60FC0;
 Wed, 15 Sep 2021 15:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719364;
 bh=RZMWp46HzGUA8UW/blcNKPqDUhpcyxQH6zpAklpYtDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uV/IXOeT4W9EVJaFvrYdEG9S6g2zdfnQEHGyF/+DJXhdFAjVRZk2IN2xz1pKfnlOS
 kuJHn0TErG4jGI1O4xADPskgoQF76/oneT/a7tZr3ST8InqY+QmhzRtQz7bxMQmf1p
 WUUu37Kf0BtDcuTWsyPeoRTsVdW3/PUW5FiFT7j/3ZJMTR9FGphGPm2YC/K67VJhcL
 EKyxaXFU0LHeaeuh+JYuNbfhWqTdvoylMXyPFYRvbvq3Xn+QVvw59ii2LZyr96DGsG
 hr7Dt9Q8bGMVK11mglIyxuFBiF8/KvQ2hNgrrNiBr6H6g4PVDAyarlInaa+GYyHkRo
 ccck4v9CsczXg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/6] ASoC: cs35l41: Fix use of an uninitialised variable
Date: Wed, 15 Sep 2021 16:21:46 +0100
Message-Id: <163171901943.9674.2959464194056507984.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, james.schulman@cirrus.com,
 Mark Brown <broonie@kernel.org>, david.rhodes@cirrus.com
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

On Tue, 14 Sep 2021 15:13:44 +0100, Charles Keepax wrote:
> The loop checking PDN_DONE doesn't check the return value from
> regmap_read, nor does it initialise val. This means if regmap_read fails
> val will be checked for the PDN_DONE bit whilst being uninitialised.
> 
> Fix this up by switching to regmap_read_poll_timeout which tidies up the
> code and avoids the uninitialised variable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: cs35l41: Fix use of an uninitialised variable
      commit: c2f14cc2bcdd532f8a18450407ffc27bbbff2319
[2/6] ASoC: cs35l41: Use regmap_read_poll_timeout to wait for OTP boot
      commit: 3a2eb0b4b02060340af10a1db3c452472471be2f
[3/6] ASoC: cs35l41: Combine adjacent register writes
      commit: fe1024d50477becf35128f3ef03bf3525a2cd140
[4/6] ASoC: cs35l41: Don't overwrite returned error code
      commit: e371eadf2a93a653211331b66beaac3b1bcbc931
[5/6] ASoC: cs35l41: Fixup the error messages
      commit: 3e60abeb5cb51bccc8bcc6808eef2037ab412334
[6/6] ASoC: cs35l41: Fix a bunch of trivial code formating/style issues
      commit: 4295c8cc17481e0d7d4c3a404eaf87dc8dfc26be

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
