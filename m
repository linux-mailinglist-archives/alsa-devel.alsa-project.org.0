Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D88352DE7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 18:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B22416CE;
	Fri,  2 Apr 2021 18:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B22416CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617382052;
	bh=4sIpTgSDur+3mBloxvQ56ZsaGJdN5/RI/Nft0LEgjdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MnEfT+uM9qDVIz8xWSRrkQuvb7ho/yz4kK6if/Va9fTTqfp8yQtRPSR+PuVIHWuyI
	 5GNyNL3zbCbINbPpcwmbCn6cGYe/Q3R248QiggSX2nvRSaC9aNeUGkxC/gag1JDJpi
	 oaLIZmweI6eqX2jDGD7ro76KHzCwkpanqAWN+FeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A99EF802E3;
	Fri,  2 Apr 2021 18:45:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 725ACF80229; Fri,  2 Apr 2021 18:45:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71E6F800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 18:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71E6F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a+zntWuZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BF3261005;
 Fri,  2 Apr 2021 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617381936;
 bh=4sIpTgSDur+3mBloxvQ56ZsaGJdN5/RI/Nft0LEgjdc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a+zntWuZvDsJRY4KAPid03cye1Qmo5LSOPtRYM6BnTRSVK2YLmOX/nxXhpm2nKKIr
 h6gmnTp+PwOHZMS8OG2JC2BCLwERZq9BDZfyiZhnB8OGSxNZwIlEibMmMHtSqVHsBM
 7GMG8JMSE8TIWF49zU8WJPbdCNlYr6WjU6HlBacaNfgKM1mkewcWxeRWx3uRZvUk4f
 yxrNPG5mOi9iiD3FPY/ITNIYbvvOzjfEdITdHb0I09utZ22AluiLjFdXrk7E762+dv
 nUSZlqBqkUvA8tRF1g4W1uCtjgg1+VzseOeHtDGoMqlYuQYOJLs9sGMUM5+LvfnvUJ
 a5P5NMXFwEdWQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH] ASoC: fsl_esai: Fix TDM slot setup for I2S mode
Date: Fri,  2 Apr 2021 17:45:21 +0100
Message-Id: <161738082583.46021.16717970165504450295.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210402081405.9892-1-shc_work@mail.ru>
References: <20210402081405.9892-1-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Fri, 2 Apr 2021 11:14:05 +0300, Alexander Shiyan wrote:
> When using the driver in I2S TDM mode, the fsl_esai_startup()
> function rewrites the number of slots previously set by the
> fsl_esai_set_dai_tdm_slot() function to 2.
> To fix this, let's use the saved slot count value or, if TDM
> is not used and the number of slots is not set, the driver will use
> the default value (2), which is set by fsl_esai_probe().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_esai: Fix TDM slot setup for I2S mode
      commit: e7a48c710defa0e0fef54d42b7d9e4ab596e2761

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
