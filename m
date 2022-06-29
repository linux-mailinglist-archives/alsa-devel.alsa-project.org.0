Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DC560215
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:08:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79C82166F;
	Wed, 29 Jun 2022 16:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79C82166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656511713;
	bh=hQ4GAhXdMgF49WKm+/UqfK/ikb/wVg3umyPPuTJc5B4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBeHOU3RtLI2H1nI8QG3/FOyR25DbmnnAW3nDsMIwub+GKulPTiHtYiFF3CsyA72V
	 c82YD4va58Mnwoc0OTeQiYAchIuel6N2V1BueO2Ec11YSy5iNbFAqE5WNP4pvWhLjX
	 RYBuON28KsQXTYoq0j842Yu9meT++a5e88yjnhOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89F3EF80542;
	Wed, 29 Jun 2022 16:06:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5B75F80538; Wed, 29 Jun 2022 16:06:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3CF0F800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CF0F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hiVpqZ5o"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DFBF61EB7;
 Wed, 29 Jun 2022 14:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FFDC341CC;
 Wed, 29 Jun 2022 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656511562;
 bh=hQ4GAhXdMgF49WKm+/UqfK/ikb/wVg3umyPPuTJc5B4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hiVpqZ5ooSG23Egrz8t0eRL5wRs4x59r5mR3X6pG1Biqem7zx+KjCFGD5aj3bnSLE
 evU6B9jOfOUqR6VyXKFqDfwxWniVsJmlTh5z7C/TsrAa5j5VwuMv/4xs22e0Uq+N6e
 bs35PYcgw2+ZnlKf/gPY0IxBi2CVBlIXc0D6fdslkM5VvmIt+eb4PqRCqCb+pEaKBT
 LJlpyWa0XjiPAF31i9So3nKSCyiLOfMzxUZ6N8awFxNi6529aFAecYXIvtOdbH8gAl
 hH6UQKeineRn3/Om8AnmpfmZSQwFg3VVcI6LqRDi65zz9k9vZDktcL39E172GJWUiK
 OQiZcKk7860WA==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, judyhsiao@chromium.org
In-Reply-To: <20220629080421.2427933-1-judyhsiao@chromium.org>
References: <20220629080421.2427933-1-judyhsiao@chromium.org>
Subject: Re: [PATCH v1 1/2] ASoC: rockchip: i2s: Remove unwanted dma settings
 in rockchip_i2s_probe
Message-Id: <165651156008.1437597.7188024938057495855.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:06:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 briannorris@chromium.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 29 Jun 2022 08:04:21 +0000, Judy Hsiao wrote:
> Remove the unwanted dma settings in rockchip_i2s_probe.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rockchip: i2s: Remove unwanted dma settings in rockchip_i2s_probe
      commit: d6910eaa6fc71c0307e16b310a07cdb347d26d7d

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
