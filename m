Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC6696C44
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 19:04:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A69AE8;
	Tue, 14 Feb 2023 19:03:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A69AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676397863;
	bh=34Nen5m82Ih5JAA2jFki5nFMtCWBQprb7z0xjZpbw0U=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cBbBfUuq4nvBLosKrWe8D8vAsw/wDP3U+AOYMD0KZYCXMzQi4q7B7IMWCvNiYHpbb
	 pQ+dEjAADhi0qH+hbUaKTYiRP75hlW8UKebIAq12osPEsqVLC54Haj+FPeRZTvV9sZ
	 uY4FQqigFVPN8bn5heFHTJSs+25KQGCfGsnCknOg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB07F8055B;
	Tue, 14 Feb 2023 19:01:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D76AAF80557; Tue, 14 Feb 2023 19:01:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 426C7F80552
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 19:01:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 426C7F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eezYBiv1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F6A0617ED;
	Tue, 14 Feb 2023 18:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A228AC433D2;
	Tue, 14 Feb 2023 18:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676397709;
	bh=34Nen5m82Ih5JAA2jFki5nFMtCWBQprb7z0xjZpbw0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eezYBiv1MXt1L3ERpQTVuTfDqimOqvfrVnfHMSV2RvSb3ibvEqO7EzXysP5n8m84G
	 ya7oY0ndAThsRPkTf7wX9T0qI+uAujdxE6moVP0Ajo+pSKsTQxyOzmqohKN25u484C
	 QoLmyjsRsGgJg78u+r421MWqMgvda4WeAaGICkWur1TO/e+cPzYu+HVmQv3gUzc3Tn
	 pLWg87hWWKuH0b5x2AKoXqhp8Ht9waSv4Xqb/5+OXHjBic2SUS4bW3je6QhOHqW81O
	 /wt65NCDWNtslA7eJQM2li/tnRqCfbJddhZYfIoGOv3sVFkDBVmyeuYnJB+IPmqMyP
	 +0iGgNc67K2CA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Kaehlcke <mka@chromium.org>
In-Reply-To: 
 <20230209012002.1.Ib4d6481f1d38a6e7b8c9e04913c02ca88c216cf6@changeid>
References: 
 <20230209012002.1.Ib4d6481f1d38a6e7b8c9e04913c02ca88c216cf6@changeid>
Subject: Re: [PATCH] SoC: rt5682s: Disable jack detection interrupt during
 suspend
Message-Id: <167639770737.3067697.4910964647967248815.b4-ty@kernel.org>
Date: Tue, 14 Feb 2023 18:01:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: 5YAXAJ276G7ZFSE6RJNRIV6UHLC2F4IS
X-Message-ID-Hash: 5YAXAJ276G7ZFSE6RJNRIV6UHLC2F4IS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Douglas Anderson <dianders@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YAXAJ276G7ZFSE6RJNRIV6UHLC2F4IS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Feb 2023 01:20:23 +0000, Matthias Kaehlcke wrote:
> The rt5682s driver switches its regmap to cache-only when the
> device suspends and back to regular mode on resume. When the
> jack detect interrupt fires rt5682s_irq() schedules the jack
> detect work. This can result in invalid reads from the regmap
> in cache-only mode if the work runs before the device has
> resumed:
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] SoC: rt5682s: Disable jack detection interrupt during suspend
      commit: f7d00a9be147d9c6feeb19591b39f8102f70cc45

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

