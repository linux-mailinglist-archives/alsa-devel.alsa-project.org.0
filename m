Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BA263092
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 17:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBC41727;
	Wed,  9 Sep 2020 17:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBC41727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599665498;
	bh=Jr/FIdFu7b5EpKxwrPHoPS0ApvfENs027hYFxggipgg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pw3qpOgdRypdQYZHaRLn+IXh9v0mUTqVZ7BENRi9cAMXEHt7jQ9TfbYgwCCBm0slM
	 Gn6GMyloXmIm5OHA2pAaKtdh50tl0H+aCglhud/9MIn+QsRcVNxgqOACbaKr48Kn9E
	 qUco32p297CMRCleW1hot2JJifR+SfbHSezzzN8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50016F800FD;
	Wed,  9 Sep 2020 17:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9C4F80227; Wed,  9 Sep 2020 17:29:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E912EF800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 17:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E912EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TxbqpeA2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02204218AC;
 Wed,  9 Sep 2020 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599665368;
 bh=Jr/FIdFu7b5EpKxwrPHoPS0ApvfENs027hYFxggipgg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=TxbqpeA2d8xL6Elb9+59XYE5M7Gkw/C4XvhKEvStFtI/S0FII0ubxl80UtCJvgVfX
 tzKCd3UZSpmRzVUtUwjba2yfDlgFVFiMdsHJJJU/DWpGZzJUBNXEX1xr8AALagN44T
 YyjsysjW4ccIAybOCr5AldSdvDmZLQgww//fo8YM=
Date: Wed, 09 Sep 2020 16:28:43 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20200903104749.21435-1-tiwai@suse.de>
References: <20200903104749.21435-1-tiwai@suse.de>
Subject: Re: [PATCH 0/3] ASoC: Kill tasklet usage
Message-Id: <159966532312.54306.11433641510365688720.b4-ty@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

On Thu, 3 Sep 2020 12:47:46 +0200, Takashi Iwai wrote:
> this is another series of patches to kill tasklet usages in sound
> tree, at this time, applied to ASoC drivers.
> The patches are applied on top the tasklet API conversion patches,
> found in topic/tasklet-convert branch of sound git tree, which will be
> included in 5.9-rc4.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl: Replace tasklet with work
      commit: a3d1f931ea4af3a9cae0098a957ce55293ce9ab6
[2/3] ASoC: sh: Replace tasklet with work
      commit: d668e640d50a981e35ccf0c87d2742b0ad26fe0c
[3/3] ASoC: txx9: Replace tasklet with work
      commit: dd8c0c0b37f1692a1202ea2c6f9d43aa0485faac

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
