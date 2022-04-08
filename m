Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DBE4F9400
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F963191B;
	Fri,  8 Apr 2022 13:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F963191B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417219;
	bh=lWoMPg39uyTP/hr0yF/yCGHxTt9syuOEe++UUP9kO2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FghhtQeZwg+bxPFTwTNwkEZnBOncsdUHgMp9wdZmBuJ3auvP1PHXiLpq9438WPFFa
	 LNcsKYZqeUqkDIFEKoJdmytZTOkrtnVOqtBFbBv9O/Y356ZL7LopH0qoqnzjFSlkI7
	 Ud7F45Gm/fao4uFbzRSOmLuwTpjr0ouXdVBkDXv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C7BF80533;
	Fri,  8 Apr 2022 13:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 320F2F80520; Fri,  8 Apr 2022 13:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CCBEF8051A
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CCBEF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l92riz3A"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91C4B61FBC;
 Fri,  8 Apr 2022 11:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB0AC385A3;
 Fri,  8 Apr 2022 11:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417057;
 bh=lWoMPg39uyTP/hr0yF/yCGHxTt9syuOEe++UUP9kO2Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=l92riz3AuGpmwoYbqUhTX6nRH1rXoz0p/H708Lsgm0Cl1Ie5BO1AJtuVGAQ+2eYsx
 LPRxdLnnEOtvFdBlxGDzNx55rgv2bbm4oeL/zlnmnuHCC2xIe9r7eR8GMnl//RyEDu
 cb3Lrhw9AuKlr24uy2t1up8pC32MqC3QUR2ehWGJjA7tcNpXv3p9kjKcZOalmns6NR
 Wo9sZp+DHUqlg4OMU/zU0myu/gVdqqvnExYwtOS6f4JC3bz7doBvDFCsTY29iltYrq
 fd2qPvheOXW13ACGhRG6PqX4/E15QCCVQf9EVMQg8RXaPcWT36dB10xmmP2db6mu+3
 24oAKPbvDnAdw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, zheyuma97@gmail.com, tiwai@suse.com, lgirdwood@gmail.com
In-Reply-To: <20220405121038.4094051-1-zheyuma97@gmail.com>
References: <20220405121038.4094051-1-zheyuma97@gmail.com>
Subject: Re: [PATCH] ASoC: wm8731: Disable the regulator when probing fails
Message-Id: <164941705528.1295287.5270437045199279011.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Tue, 5 Apr 2022 20:10:38 +0800, Zheyu Ma wrote:
> When the driver fails during probing, the driver should disable the
> regulator, not just handle it in wm8731_hw_init().
> 
> The following log reveals it:
> 
> [   17.812483] WARNING: CPU: 1 PID: 364 at drivers/regulator/core.c:2257 _regulator_put+0x3ec/0x4e0
> [   17.815958] RIP: 0010:_regulator_put+0x3ec/0x4e0
> [   17.824467] Call Trace:
> [   17.824774]  <TASK>
> [   17.825040]  regulator_bulk_free+0x82/0xe0
> [   17.825514]  devres_release_group+0x319/0x3d0
> [   17.825882]  i2c_device_probe+0x766/0x940
> [   17.829198]  i2c_register_driver+0xb5/0x130
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8731: Disable the regulator when probing fails
      commit: 92ccbf17eeacf510cf1eed9c252d9332ca24f02d

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
