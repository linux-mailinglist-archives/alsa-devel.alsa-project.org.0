Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E255184FDEE
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Feb 2024 21:49:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FDD2832;
	Fri,  9 Feb 2024 21:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FDD2832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707511782;
	bh=kNYvhk7i0JhSWiEEGVEhYUrUfkcIqOwz6wex6co/WgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OMgrmkTeqhPVApIDJnDRIgNwsm8Bxo0bVanYyXq6Sr0mFOMziwnjS37wu7ZAjyFoV
	 lK9IOBAGIr0ki4LE/5t+WXOGpzgxUzfJcYcDzZqBCBwgtGvS6yS56JT7HBXt+IX9gY
	 03B1igRb4DvF4lbRyQJJk0vr+R48dQBP8CeP/3pY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2D6CF804E7; Fri,  9 Feb 2024 21:49:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F9A9F805A0;
	Fri,  9 Feb 2024 21:49:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2640EF801EB; Fri,  9 Feb 2024 21:49:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFBA8F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Feb 2024 21:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFBA8F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p+BnZhMk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FC4BCE20A5;
	Fri,  9 Feb 2024 20:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72246C433F1;
	Fri,  9 Feb 2024 20:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707511732;
	bh=kNYvhk7i0JhSWiEEGVEhYUrUfkcIqOwz6wex6co/WgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p+BnZhMkShGU4OjQhUHSxnll3ajog1zrbSQXGWsEIDjTdNAPmQV6lQPd1FheOiheC
	 lM4sIR9NkK8yfVdGIPTn4R96bQkX96CphVgquGXgPZ01rhpy4eSn+KWHoL/gPzzUhL
	 sRGlWD6SBhzW5s/AI3BfrthEyvglHSr3jeVqXb7OEjqBWFFxwsqkX/6IlrBjUkotqI
	 Bfl0JVHG5Xhylo9jbo96AyiMWGWImW4VQCf5g07wgo2CzX7H4SQAUZbcFJ7a4X1fNb
	 IQM6bIrtuuO9emiQ56kKROqtk2zSpoZJYSK3oG3LkCiVwI9oAj5x5m0SBKi7WmBICC
	 30wYoR58vow7Q==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240209145700.1555950-1-rf@opensource.cirrus.com>
References: <20240209145700.1555950-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Remove default from IRQ1_CFG register
Message-Id: <170751173117.2414457.382973415866845999.b4-ty@kernel.org>
Date: Fri, 09 Feb 2024 20:48:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: TZTNIPISCPJPVQEY7VWMG7MXDY4TUIAD
X-Message-ID-Hash: TZTNIPISCPJPVQEY7VWMG7MXDY4TUIAD
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZTNIPISCPJPVQEY7VWMG7MXDY4TUIAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 09 Feb 2024 14:57:00 +0000, Richard Fitzgerald wrote:
> The driver never uses the IRQ1_CFG register so there's no need to provide
> a default value. It's set as a readable register only for debugging
> through the regmap registers file.
> 
> A system-specific firmware could overwrite this register with a non-default
> value. Therefore the driver can't hardcode what the initial value actually
> is. As the register is only for debugging the value can be left unknown
> until someone wants to read it through debugfs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Remove default from IRQ1_CFG register
      commit: 727b943263dc98a7aca355cc0302158218f71543

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

