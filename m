Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B3967F9D4
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 18:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98DEEB7;
	Sat, 28 Jan 2023 18:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98DEEB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674926456;
	bh=UykfPTbGDvILC/tRy7XI1XkGj0Yf2yNGJ45GzxQQ+ZQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p95pJug0fQTiOZO9SuQgPflaqpA2KoSEhfPyFoDOlcYG3CjpFmy9fr4fvIfnWp6F2
	 a/Bb0Bmserb+4Rv9CCzWGqvLMyiaD+Blytu4Qyxsm8Tsef7sghgKvU8WGvcWcriWYH
	 aXqTzOtd9/tnNIxAtK5NQA7Ik7t0wpuVBen8OP5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB0AF80551;
	Sat, 28 Jan 2023 18:19:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD1AEF802DF; Sat, 28 Jan 2023 18:19:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58CACF8027D
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 18:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58CACF8027D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q/h7ILGe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8854CB8069C;
 Sat, 28 Jan 2023 17:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F1FC433EF;
 Sat, 28 Jan 2023 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674926336;
 bh=UykfPTbGDvILC/tRy7XI1XkGj0Yf2yNGJ45GzxQQ+ZQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q/h7ILGefhpfAwyN2R6Cfm0yd3vzqOWqf1/37XqBIzM6FUeS9VfVVZlUDMiNDuHnO
 yrXf0bhwP30iGJVmoFviQ7RMQ+q78tKuo87b8kyTJRvFz+B249R6cSGI3A10GlGO9A
 HqVM1QevzjZJ0Vx4Zra/k+Df1MsKAd0RjrmsgAuwpfWNKtx6H3vgZgHdwRUiIV5x3N
 tp2Y5e4xYbjdKVAzQNydZhlqM7+5VyaqzsbevEXPtvoQkK6T4RpjoCZhgu0bntAXbO
 tpE5K5UJZJdZNdqP5iAXLXAWChDA4BoffIXIBjc6BhqORr18cblKGmmrooV1FZS2Z+
 T1bOSnNX00f4w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230119073416.3064918-1-alexander.stein@ew.tq-group.com>
References: <20230119073416.3064918-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: imx-hdmi: Use dev_err_probe
Message-Id: <167492633131.2479102.10605156106740609522.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 17:18:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 19 Jan 2023 08:34:16 +0100, Alexander Stein wrote:
> This silences -517 errors and helps figuring out why the device probe
> is deferred.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-hdmi: Use dev_err_probe
      commit: 362e8d0f27c40864b4f8994624409f7b4316d2dd

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

