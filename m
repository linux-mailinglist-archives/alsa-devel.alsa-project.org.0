Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2F4D696B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 21:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E1721A90;
	Fri, 11 Mar 2022 21:24:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E1721A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647030307;
	bh=0Q2U7gB1v+g5WWvIldVX0hUeSGrWPkJ2QT7hjn6A0Yo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZusIW3W/J8iDDnwZQ+MkyLbXe896PZzuKG07SMEh4berN8IzNld7NPMYbHmshLCu
	 dIkx0EgIB5ACr58lVU1VSHrbQbhq/WVOwHRlnUDiOpzh9pJGAXvat3XWGKZRciAN1n
	 huA7MN7h/ONUbgNWNlUE1+SvL4c7LfxgbYWiWVxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CECD9F8051F;
	Fri, 11 Mar 2022 21:22:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D23F80085; Fri, 11 Mar 2022 21:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C51B9F80085
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 21:22:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51B9F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QrVweqGe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 255CCB82CFB;
 Fri, 11 Mar 2022 20:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550CCC340EC;
 Fri, 11 Mar 2022 20:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030164;
 bh=0Q2U7gB1v+g5WWvIldVX0hUeSGrWPkJ2QT7hjn6A0Yo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QrVweqGe+GyInwxsZiO6a4v37m+fStgNRwpgwYYe+wdYOpr1QEr16v3JBShPhcu5W
 p5gWAnI70O7KmRuOEcFUAwUyAdWVHSPo55JRgeKkPx8o+192p2lGZzVufBe6r3oxx+
 Kne4VEGgJsx0iz9PaGLGyiWFoBSplemkoNSdyQRy5DUauhKU3PS/GWroxfJ9eJOSqp
 QPV1tOfIGrfYFouBVYCnwcg0QKAALVZRhJEEh15pIS39J/inyGYGt+JqSMAncpeZ+y
 4SnLMiQJapma1nhXZj2Z2Av+xjEY1L13ioaoICTX2PxFF5grbbXdfkTKakC8JWapVc
 Jb2xQlBUVGPlQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, ludovic.desroches@microchip.com, tiwai@suse.com,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
 nicolas.ferre@microchip.com, Claudiu Beznea <claudiu.beznea@microchip.com>,
 codrin.ciubotariu@microchip.com
In-Reply-To: <20220311112818.1482372-1-claudiu.beznea@microchip.com>
References: <20220311112818.1482372-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: mchp-spdifrx: fix typo
Message-Id: <164703016207.264137.16463689754378807280.b4-ty@kernel.org>
Date: Fri, 11 Mar 2022 20:22:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 11 Mar 2022 13:28:18 +0200, Claudiu Beznea wrote:
> Fix typo in log describing failure of devm_snd_dmaengine_pcm_register().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdifrx: fix typo
      commit: 886e09c77d2b48559d26928a5705a20ef3ac117d

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
