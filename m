Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7801553FC7A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F4771A9C;
	Tue,  7 Jun 2022 12:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F4771A9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599309;
	bh=sBaYugq1xPFjZqPwbsR8mD4Kd6QBYOF8Y29dQgVIFnI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7mQouPvN9h+GiqnOVKBXB/fI78xUF4fQ2QettiFZssFCTBpRsHajj8eWKjILhRmL
	 p/P39yYelEfNvq3Y6KdNRSA2XAODTnrh3Ieyv8KxB8RbnjD1t1Y64iIggr3jrqbP1H
	 ZK4aqKMl0/+KKiPgBPfJ3slMe/RTpJPnILZAdu3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CE0F8052F;
	Tue,  7 Jun 2022 12:46:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 539F3F8060D; Tue,  7 Jun 2022 12:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B4AF805FC
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B4AF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JVBFUfY3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8E972B81F05;
 Tue,  7 Jun 2022 10:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AA1C34114;
 Tue,  7 Jun 2022 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598781;
 bh=sBaYugq1xPFjZqPwbsR8mD4Kd6QBYOF8Y29dQgVIFnI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JVBFUfY3oP35uoMtrbJHwJUl6atnmUZ7r/majx+Lt7m2x3lavEwY6Y1inlSGqCMii
 EeChp+GadknXLHlYN4zehy6nTZ4TGtf5N8GSnaAr5ol6PBuUKG7stJlFXy/cOZYdSf
 H4mJP1REcjwf41T4IxYR3kQzHiQq1kkD0rRL3hdHsiH5eDVxzxPqKp4+sA6Il6SqjB
 sfQXfejgVNpG8EM0JavqKyqh2yWTWDK//PnvgfG8n2I0QiF3N2Jba9FUh6WXnutf9e
 KP6CGKP4ht5ezYXbIMQJoTNClU2zYbmFqXhpDyljusgcZiX/883aqEzRMzokliiNZH
 YXVoQp3Sf0OjA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 tglx@linutronix.de, christophe.jaillet@wanadoo.fr,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <84d94977c57deee9e85249f18394ebf8d72497bc.1653724723.git.christophe.jaillet@wanadoo.fr>
References: <84d94977c57deee9e85249f18394ebf8d72497bc.1653724723.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: ux500: Remove some leftover from the "Replace GPLv2
 boilerplate/reference with SPDX" rules
Message-Id: <165459877943.301808.15291099978666980985.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Sat, 28 May 2022 09:59:22 +0200, Christophe JAILLET wrote:
> The "Replace GPLv2 boilerplate/reference with SPDX" has left some empty
> "License terms" paragraphs.
> Remove them as well.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ux500: Remove some leftover from the "Replace GPLv2 boilerplate/reference with SPDX" rules
      commit: 8466579b63cc9aa957b7b4f273087512f989d2a1

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
