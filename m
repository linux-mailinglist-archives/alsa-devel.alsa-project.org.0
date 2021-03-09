Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F5332EC8
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 20:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83781878;
	Tue,  9 Mar 2021 20:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83781878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615317010;
	bh=hwI6kC4mBqrnC0CTov6gJku09IaTgZ+T/06Xvzo9GIw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHweLrkF26tCqi8JA42NPXg7KlEGlpt274P4BwJeX6rfAItrEt6fvXwJWZnM7efLJ
	 2ECxfT6/FBxIvX6pTivjCcnCnHQdu9VtYZWHE/zT/L8TRzbgA1qBx/JWv5jVK3NdgZ
	 7ibIO9k0Tuo6AtJMPbwdoU4yd8Q8GMOz0CH8xHS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9258FF80166;
	Tue,  9 Mar 2021 20:07:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7396F8028B; Tue,  9 Mar 2021 20:07:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64E4BF8029B
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 20:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64E4BF8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CS43ATgX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D709365230;
 Tue,  9 Mar 2021 19:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615316866;
 bh=hwI6kC4mBqrnC0CTov6gJku09IaTgZ+T/06Xvzo9GIw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CS43ATgXMarGu0GvJWBWlVVsyTKh5krHdovWQarBjU6g8WcGRimIgWThq+XGGhLU5
 qQaWSdStIszeJoLKHjzDNhUuMvviTC+0UgcOOnG4KzzMsWJT3jsx+M862iCUMJof4x
 VSfTw4b8Y1d7Rfcwxl+LVD8aqod8MWaiFFVFhXQv6Yvq4bQgSRXE0/wjHylu05ZK5G
 HilVqsE3Z9htt2PGxuyNLuJFICO+dYQ7rLxZDcJuEz/aSfveUofVbz6pmvPdfTtKu1
 g3FwH3J7lCG61iyLFcsyKGvgKS6WbfWBpou1Q9ekky9m0ZVvFVQGBgpMTYFusVSPJd
 2HBBOR8B7YAQQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Takashi Iwai <tiwai@suse.com>, 'Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20210309131458.1884899-1-weiyongjun1@huawei.com>
References: <20210309131458.1884899-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt715-sdca: Fix return value check in
 rt715_sdca_sdw_probe()
Message-Id: <161531678411.49117.17895673664091013218.b4-ty@kernel.org>
Date: Tue, 09 Mar 2021 19:06:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 9 Mar 2021 13:14:58 +0000, 'Wei Yongjun wrote:
> In case of error, the function devm_regmap_init_sdw_mbq() and
> devm_regmap_init_sdw() returns ERR_PTR() not NULL. The NULL test
> in the return value check should be replaced with IS_ERR().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca: Fix return value check in rt715_sdca_sdw_probe()
      commit: bcfb088e7686b45b1f323e92315954e97bf634bc

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
