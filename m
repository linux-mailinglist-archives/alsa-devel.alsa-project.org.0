Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB5240DDD1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8982A18AE;
	Thu, 16 Sep 2021 17:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8982A18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631805519;
	bh=9Gk9zpsHW+o1AhEneMl7xErJHjJddOAqkm2Rp5bgtJ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MovN08Qc7pyMQRyoXriWSKm3p+3z4JLzYpPypRelg+hJGPNOi2VsLrshdZ6NfcFPR
	 XOYBWzkt67kSHnDFqj2yQNHszMasX/3CfKmNctWmssMr3cGqsuySb8cQgsSLZ6UaLQ
	 VJQGZXx0Jr2HZS5swlsRKlgjeuVKtp9npaBVyE3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E016F80507;
	Thu, 16 Sep 2021 17:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6704EF804FB; Thu, 16 Sep 2021 17:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D5AF804EC
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D5AF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vv4XmZqz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B27D96112E;
 Thu, 16 Sep 2021 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631805336;
 bh=9Gk9zpsHW+o1AhEneMl7xErJHjJddOAqkm2Rp5bgtJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vv4XmZqzqmzIeErwxZK7XzGhmjVW0Fs9nK0cEj1Zvdb9TehDKn70NHyh3nsjeObK/
 MbPyx+U5MB8/uBd+C5Rq1q4hzwOkAmRsFpiKp6L81u7sctGlQiKDiFYn23hK9pLSyJ
 +QJ9iEePf8sLUHI0uW809pwECgGDAtyHYhWWhoGL2UpyZTme7lSGdN6mbefC1TAK9Z
 Ie6c7xrc7py7+MErOYUmWOp4vQOwOVbKY1ctu3XaMEIIt3nPLq29QbSk4nDyM2lVEU
 E8laZzKa3secUy2C7XaGkn0PpAjcBzEpb7IXuVPiuc0Xfp+63WXVMaOFw3y5HQpgB+
 0zuYH55JeyCwg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Manuel Lauss <mano@roarinelk.homelinux.net>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: au1x: Convert to modern terminology for DAI clocking
Date: Thu, 16 Sep 2021 16:14:35 +0100
Message-Id: <163180495858.19842.13609592448291165418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915180256.39345-1-broonie@kernel.org>
References: <20210915180256.39345-1-broonie@kernel.org>
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

On Wed, 15 Sep 2021 19:02:56 +0100, Mark Brown wrote:
> As part of retiring the old macros defining the DAI clocking mode in the
> DAI format update the au1x drivers to use the new style macros.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: au1x: Convert to modern terminology for DAI clocking
      commit: 8461d7d83f1fe878c4cff72e322711dfcb5a53ca

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
