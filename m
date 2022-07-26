Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5815813DE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 15:08:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A42C1F7;
	Tue, 26 Jul 2022 15:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A42C1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658840938;
	bh=5vfyw6yYUChKtbkAcEWjo+xF7Z5H41jAaN5AzeKRx2k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vuRlra6PpUXAuRJ/mzQ3niCQAVVWtSM3DAIrKvp1y0HleI4Z1FxbgyuoG+RMEpsm4
	 YvMhjb8vqT0axOgA+aawOTHl4aS6cy2MfX/p90SrIGhYo1Hl1fdmneBO07sbjnwS6T
	 XTCuNhrDHz2+J114o5Q68p4PAX/+pyULnbJAGhU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF77F80271;
	Tue, 26 Jul 2022 15:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 453A7F804C3; Tue, 26 Jul 2022 15:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8ACF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 15:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8ACF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Lk2wM3hv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EF4761565;
 Tue, 26 Jul 2022 13:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F5CC341C0;
 Tue, 26 Jul 2022 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658840863;
 bh=5vfyw6yYUChKtbkAcEWjo+xF7Z5H41jAaN5AzeKRx2k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Lk2wM3hvB6R5/WDi+JTMbybV/pYDB37LDcZdS09RdSOhYvbSGczbGOGybzA8WeZUM
 NTqvLEDqAhj6794beBR5Q4LbnPufwDHJiWnodiAam6HYyFAFqhcwbHzkYv90nN/b/7
 jn85qFZ0D6KOmlMAG4Y0YvDTWTMCtYgPTkjYoMdFGXVXDp4M3bMvpEmnL/ZiuYuyfv
 WhV2k6oacwVh78KQ747XCYcC48oO0Zm63tIKqUrqruDyDcod/GiUb8T5QiP6YmJFUN
 0Ur1ArUc3Ein84cjsB9MAlITPoxUVRGA3g9D3MsHZXQk1vHmszH/6P+atkb5YWkFYa
 0eNjxI2KauDfg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, alexandre.belloni@bootlin.com,
 perex@perex.cz, nicolas.ferre@microchip.com, 
 Claudiu Beznea <claudiu.beznea@microchip.com>
In-Reply-To: <20220725101130.1780393-1-claudiu.beznea@microchip.com>
References: <20220725101130.1780393-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH 0/5] ASoC: atmel: one fix and few cleanups
Message-Id: <165884086146.21705.600847037457505702.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 14:07:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Mon, 25 Jul 2022 13:11:25 +0300, Claudiu Beznea wrote:
> The series adds one fix for mchp-spdifrx and few cleanups for
> mchp-spdifrx and mchp-spdifrx drivers.
> 
> Thank you,
> Claudiu Beznea
> 
> Claudiu Beznea (5):
>   ASoC: mchp-spdifrx: disable end of block interrupt on failures
>   ASoC: mchp-spdifrx: use single tag indent for structure
>   ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
>   ASoC: mchp-spdiftx: return directly ret
>   ASoC: mchp-spdiftx: add and remove black line around
>     MODULE_DEVICE_TABLE()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mchp-spdifrx: disable end of block interrupt on failures
      (no commit info)
[2/5] ASoC: mchp-spdifrx: use single tag indent for structure
      (no commit info)
[3/5] ASoC: mchp-spdiftx: remove references to mchp_i2s_caps
      (no commit info)
[4/5] ASoC: mchp-spdiftx: return directly ret
      commit: d346a4ad305bf3f99e5824e0c132fac7e0b53657
[5/5] ASoC: mchp-spdiftx: add and remove black line around MODULE_DEVICE_TABLE()
      commit: 96f6017d652a78e06e34e535526826a22aa69dfa

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
