Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A62CD5BD803
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A501614;
	Tue, 20 Sep 2022 01:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A501614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629403;
	bh=G20gDX0+LQ46VEZJC2+OUz61ighMe+ilSUbmCNC2mcw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEObPZNnzHlr/WgIH7Ifavz6bGgTou6e2o8yqS8eWpH2FU+ZIh+u5+UUHn2zG1HgB
	 FrFpw5nU9vZrGt/RzbGtVDeA8ainNSzODOaqiFNOYY7bOSRLL8UuJsM7bVCARTQkii
	 opONiMT43Xzz2D52dnk+frGbpQmTTtqjKiTBL6z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B69F805E5;
	Tue, 20 Sep 2022 01:10:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D18F805E4; Tue, 20 Sep 2022 01:10:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3836EF805D8
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3836EF805D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cE6FJBcL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 09E53620DD;
 Mon, 19 Sep 2022 23:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62706C433D7;
 Mon, 19 Sep 2022 23:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663629044;
 bh=G20gDX0+LQ46VEZJC2+OUz61ighMe+ilSUbmCNC2mcw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cE6FJBcLfM7T4FHEwyOXz9YSZPNfK5R6s+DEBvlAIrXAqGKvU9zj/bWIYT8eACFCV
 lflX+z6o+nL0RTgJYn4oDezTB3UU4Jzh/vS0kbz/PJcRyOkcgJTL4goHTN7KtSzLDP
 V3CRwQ1gVMrZPFNOZuzkX1Ir8sjtheRxpMIHF0wdjKuxg32Vc3PavYV55sQ1MfdvXR
 XaUkYi3HzsN3KVuNIBOITWiSjIWGOYM5A0HIwLixGxjYM2Nzdoc/5oXG+MpmNh3Z1c
 KD8GjwbuTQ5vnaAw4qEFrWcX8Kb0x2tLWQNrJvkV6xIvoyksFjJ+SVb9YzwPtM4o8v
 IDfUIuk2u/57A==
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20220913025658.5005-1-derek.fang@realtek.com>
References: <20220913025658.5005-1-derek.fang@realtek.com>
Subject: Re: [PATCH 1/3] ASoC: rt5682s: Reduce coupling of Micbias and Vref2
 settings
Message-Id: <166362904214.3419825.3796970478481971117.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:10:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Tue, 13 Sep 2022 10:56:56 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> Some parts of rt5682s CCF function are implemented by
> 'MICBIAS' and 'Vref2' dapm widgets.
> 
> There is a risk of causing not expected behavior if we
> mix using dapm and CCF operations in machine specific code.
> This patch reduces the coupling.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: rt5682s: Reduce coupling of Micbias and Vref2 settings
      commit: bfc5e8b860ad2a87269975a6043aa6bb245d44bb
[2/3] ASoC: rt5682s: Reduce coupling of I2S1 setting
      commit: 6ea304a402322ed4449156805b0a79fa1e326ca7
[3/3] ASoC: rt5682s: Reduce coupling of PLLB setting
      commit: 3d47637719c312cfb49d3ba063dc3976535c0e9f

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
