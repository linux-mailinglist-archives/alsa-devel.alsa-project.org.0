Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508B021AA39
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7031614;
	Fri, 10 Jul 2020 00:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7031614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332224;
	bh=4XZXghP0KTDIIt5L05ntOBUp1suBQZqY9M5sNdVCKMQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFoS2pQYv46+/9WlVrysSb3ORWSV1zLQGe/+TWQRiOUbPO6zYmpcl2F6PRpcdb+Nv
	 bagG22YmX3OGzax27y8IhLMms0A49utbXLCDoOiPhM/pSAGBQ6SAqAqLqWhmSQQl0u
	 HG5dBZwSMHD4+hnwFCKxgpY8db6rvtBdD3UHIQfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF0FF802D2;
	Fri, 10 Jul 2020 00:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC45EF8025A; Fri, 10 Jul 2020 00:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02F72F80216
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02F72F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PfcBW9dD"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F72C2067D;
 Thu,  9 Jul 2020 22:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332023;
 bh=4XZXghP0KTDIIt5L05ntOBUp1suBQZqY9M5sNdVCKMQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PfcBW9dDToPKCRJDAcJF8ViNtJzT7v1E6q4CNSxZ7y987lZWr4ZY0k+GpVo/ucDKv
 FjFAu1kSl4RVkN62T6TREjBp/FPHiRUahUMgyND5wYHZP8ecsxfHP0hkIG7AC8WUZ9
 bG2MHCY8XgrcmWn51wmYkziCPcFTAwEQNoH6RYi4=
Date: Thu, 09 Jul 2020 23:00:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200709122445.1584497-1-tzungbi@google.com>
References: <20200709122445.1584497-1-tzungbi@google.com>
Subject: Re: [PATCH 0/5] ASoC: mediatek: mt8183-da7219: support machine driver
 for rt1015
Message-Id: <159433200031.57213.3941224850488069645.b4-ty@kernel.org>
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

On Thu, 9 Jul 2020 20:24:40 +0800, Tzung-Bi Shih wrote:
> This series tries to reuse mt8183-da7219-max98357.c for supporting machine
> driver with rt1015 speaker amplifier.
> 
> The first 3 patches refactor the code for easier to change for subsequent
> patches.
> 
> The 4th patch adds document for the new proposed compatible string.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8183-da7219: sort header inclusions in alphabetical
      commit: 31add0d56e5c4964009bca8d507ff91350e17b5e
[2/5] ASoC: mediatek: mt8183-da7219: remove forward declaration of headset_init
      commit: cbafb2cc5f56320acca0b9bec7e4f19f15597cbe
[3/5] ASoC: mediatek: mt8183-da7219: extract codec and DAI names
      commit: e5d4bdffc8c89ce253e5663fecd09c893ece7eec
[4/5] ASoC: mediatek: mt8183-da7219: add compatible string for using rt1015
      commit: f739f2ce708cccf1b071e7a1219d932e476b26cd
[5/5] ASoC: mediatek: mt8183-da7219: support machine driver with rt1015
      commit: 9e30251fb22eccaf2199cdfdc02c90459f83bea7

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
