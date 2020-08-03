Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F0323A9EF
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 17:54:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1041665;
	Mon,  3 Aug 2020 17:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1041665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596470077;
	bh=0iWsV1WaTVwN8U1EJ20zgze+6oCHd3om09hk1PDSxwI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNDC/DdFAZ/2HW9aUHbvN9GBECgB17c1tzHGDm3aelTH1QW0b3yjKIDJUqv2nc10y
	 GUb92Ghaj6CrcDYO07YLYfMGZreDSt4ZxdViKlsnvDw3WDxddv0sYFYCOkgGKH96ZF
	 wGeVfNzQunDzv1x0kHWQ6MQSLt90tCYbiLL4Cn5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98098F80234;
	Mon,  3 Aug 2020 17:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ABE0F80234; Mon,  3 Aug 2020 17:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2221F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 17:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2221F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tnud3Ozh"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1FE22076C;
 Mon,  3 Aug 2020 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596469966;
 bh=0iWsV1WaTVwN8U1EJ20zgze+6oCHd3om09hk1PDSxwI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Tnud3OzherBkJe6Zh1v+vPIuyIH17i0o5KbccCus9tmdoxBBDl8N1b/uZDs0VxtMO
 kx8YygsBhW6QjhFHbTgFUULr+vAI0I/LbcI6AwQbM2gzJiyZUh3lIY2CIfiProDSqQ
 qty8KxocOsTV+8kT4yvKrcgDqM9MP6AVrrdQeZN4=
Date: Mon, 03 Aug 2020 16:52:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com
In-Reply-To: <20200730123138.5659-1-hui.wang@canonical.com>
References: <20200730123138.5659-1-hui.wang@canonical.com>
Subject: Re: [PATCH v2] ASoC: amd: renoir: restore two more registers during
 resume
Message-Id: <159646994088.2524.17974008545850176515.b4-ty@kernel.org>
Cc: stable@vger.kernel.org
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

On Thu, 30 Jul 2020 20:31:38 +0800, Hui Wang wrote:
> Recently we found an issue about the suspend and resume. If dmic is
> recording the sound, and we run suspend and resume, after the resume,
> the dmic can't work well anymore. we need to close the app and reopen
> the app, then the dmic could record the sound again.
> 
> For example, we run "arecord -D hw:CARD=acp,DEV=0 -f S32_LE -c 2
> -r 48000 test.wav", then suspend and resume, after the system resume
> back, we speak to the dmic. then stop the arecord, use aplay to play
> the test.wav, we could hear the sound recorded after resume is weird,
> it is not what we speak to the dmic.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: renoir: restore two more registers during resume
      commit: ccff7bd468d5e0595176656a051ef67c01f01968

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
