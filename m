Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75352D4556
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 16:26:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD1C16E3;
	Wed,  9 Dec 2020 16:25:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD1C16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607527579;
	bh=KYdXwWw3dxkNfwNm8SUTdxo4g7gcXSW1AOKvcTo1J08=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZHRtjYpem1Erq7WzsoIdSa6QqBSu66QYytEAPE9n/pS2Z8ilA6hA7r2myCnG/a1+L
	 6VDECvCvPje0LI1x1x7jl75xTnSGHd5C1CvR29WOLtLxvctMn3HAALch1TCaseFZOE
	 y4se89FpnEipR9XLWcryXACGdBJvBS1jTmCIir8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEBD5F804CB;
	Wed,  9 Dec 2020 16:23:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFDD5F804BD; Wed,  9 Dec 2020 16:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6069DF801D8
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 16:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6069DF801D8
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Paul Cercueil <paul@crapouillou.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20201207125338.119397-1-paul@crapouillou.net>
References: <20201207125338.119397-1-paul@crapouillou.net>
Subject: Re: [PATCH 1/5] ASoC: codecs/jz47xx: Use regmap_{set,clear}_bits
Message-Id: <160752715602.48520.8596440910035760463.b4-ty@kernel.org>
Date: Wed, 09 Dec 2020 15:19:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, od@zcrc.me, linux-kernel@vger.kernel.org
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

On Mon, 7 Dec 2020 12:53:33 +0000, Paul Cercueil wrote:
> Use regmap_{set,clear}_bits instead of regmap_update_bits, when
> applicable.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs/jz47xx: Use regmap_{set,clear}_bits
      commit: ad13c835442cdb2a964588fd03327f51dbcd4dfa
[2/5] ASoC: codecs/jz4770: Reset interrupt flags in bias PREPARE
      commit: a346c77836183f6e3e054c5da022e0fde2773683
[3/5] ASoC: codecs/jz4770: Adjust timeouts for cap-coupled outputs
      commit: 6b4da5374b10a48be18df26288125746f1858507
[4/5] ASoC: codecs/jz4770: Don't change cap-couple setting in HP PMU/PMD
      commit: 4f293dfea9f6d23a972be0e38556f5b0c02c2d4e
[5/5] ASoC: codecs/jz4770: Add DAPM widget to set HP out to cap-less mode
      commit: e648e3f1165354f04a4deed1f41152a287b68d59

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
