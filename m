Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9BF21AA41
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:06:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A6615E5;
	Fri, 10 Jul 2020 00:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A6615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332372;
	bh=pu/BRRDFvnY7VdAK7VRlURGhF5E/6f6U+WeO9dB7VZY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCZ+Kslp75i/zksHatF9GIw2wjTfXs5mTFFYUoP325H21iKm4vq7fcK+WWiSOggUk
	 F+G/anNIjPKtoKjakkOzoC3NL3kXzHI48y7ia0okpOj6tNW0mJDoBWBbEZsd7lL2QL
	 uOzbl5nn+pJyouajZdr6ofhsi8UzVGm74jPbM/Q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 521ADF802FF;
	Fri, 10 Jul 2020 00:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833A3F802F7; Fri, 10 Jul 2020 00:00:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_32,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6775F802F8
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6775F802F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LivJJHit"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F054A20708;
 Thu,  9 Jul 2020 22:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332043;
 bh=pu/BRRDFvnY7VdAK7VRlURGhF5E/6f6U+WeO9dB7VZY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=LivJJHit/DJNozyXJaxeZPXEoTOddQwxQjL7a7cLP96rxFVSViDXbh5TFlaxVTqb7
 WwByjqLeywyIUcC/WcrIvg/OS+UzblmiIDE24n535sOpww9vYTAyyO3vnEiv2VwnI/
 GdZ/3RSCrlLRRtmDy2Ry8fsWR79ioBdbLTfuENQM=
Date: Thu, 09 Jul 2020 23:00:37 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200708163359.2698696-1-codrin.ciubotariu@microchip.com>
References: <20200708163359.2698696-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH] ASoC: atmel-pdmic: remove codec component
Message-Id: <159433200032.57213.13831700646787153662.b4-ty@kernel.org>
Cc: ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
 tiwai@suse.com, alexandre.belloni@bootlin.com, lgirdwood@gmail.com
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

On Wed, 8 Jul 2020 19:33:59 +0300, Codrin Ciubotariu wrote:
> The CPU and the codec both are represented now as components, so for
> PDMIC we are registering two componenets with the same name. Since
> there is no actual codec, we will merge the codec component into the
> CPU one and use a dummy codec instead, for the DAI link.
> As a bonus, debugfs will no longer report an error when will try to
> create entries for both componenets with the same name.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel-pdmic: remove codec component
      commit: f3c668074a04020c06e434c51b030bad1702aa12

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
