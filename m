Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C8D349852
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 18:39:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2783C1669;
	Thu, 25 Mar 2021 18:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2783C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616693941;
	bh=vhqgbXFhmrKfVpYNbmWIy+MRLeOTkYKmncyMmmdH2rg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQNj4BVJM3blbcDRGmIwEvx8/ngm/OyJ49FLcZzncMUCGnmuQmAhiYYMXAHy4fdmY
	 RJkcyBEkErAgtvVGGGEhtK5WT8dpvh6nUKYWJbzbDRkGv19y2BcZXPxsu1cLeF3n1/
	 +Hvg1DHO9Xu+W1GXiV9iMLkPgJn5awmIKroRj5qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 751DAF80268;
	Thu, 25 Mar 2021 18:37:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2034F80257; Thu, 25 Mar 2021 18:37:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15B30F80257
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15B30F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M/TRij5J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B2E461A2C;
 Thu, 25 Mar 2021 17:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693847;
 bh=vhqgbXFhmrKfVpYNbmWIy+MRLeOTkYKmncyMmmdH2rg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/TRij5Jd0h8R+vSJAunZT2jaPanu4ijRSgqrH6fCJHnLlKsdzTskNfi/a3LcQZZT
 nkvIoeTl5DVjddGsjY/oWvSMLdc45EKQdHcqaBjPmKRxaJqctAVXyKESjDC6oNbl0s
 ISfvtcUoPskRBGfkc4r+KuBfkAU+gJ10dEHUsMtq38o0/8lUFSTMESPYEiRhr+pRSx
 vY1tK1RW8u6CWGwYvoimRVWHC8quGXCg8nRv9YaahQlvi0cOY6QmkttQfG3ERqvsmM
 N5lJWAxPSzFei81xhlr5antnI4APUqEEMHWohFpkSjUyVvK7+Fi9PrHaJplSnyn+Sm
 VQzNdYmQuGmkQ==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com, gustavoars@kernel.org, tiwai@suse.com,
 perex@perex.cz, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@ti.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, daniel.baluta@nxp.com
Subject: Re: [PATCH v2] ASoC: wm8960: Remove bitclk relax condition in
 wm8960_configure_sysclk
Date: Thu, 25 Mar 2021 17:37:03 +0000
Message-Id: <161669370550.41585.9109635585401644966.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1614740862-30196-1-git-send-email-shengjiu.wang@nxp.com>
References: <1614740862-30196-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 3 Mar 2021 11:07:42 +0800, Shengjiu Wang wrote:
> The call sequence in wm8960_configure_clocking is
> 
>    ret = wm8960_configure_sysclk();
>    if (ret >= 0)
>         goto configure_clock;
> 
>    ....
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8960: Remove bitclk relax condition in wm8960_configure_sysclk
      commit: 99067c07e8d877035f6249d194a317c78b7d052d

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
