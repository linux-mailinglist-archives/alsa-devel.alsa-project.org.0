Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF1750707
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0475F7F4;
	Wed, 12 Jul 2023 13:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0475F7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162623;
	bh=j1lgOkiqZl2ylPYx2qvyKimXaRK52M1zf0sTgvIFSuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YoHX4Btsgp+BzFYwwJ+CuC+KnPGa31Dn6BAybQHgZK6vEPgB6Fjd7qxHbQJeHfVEt
	 emZ4FISOnTZw74j5DFdoSoDCHyKbe/0FfR344c5J+dGLmTzBeRpnrB/eeJvGkP8jBp
	 BRbkDIxwfYxfn5vkECoS9fmuFWHyln+P8RUVvP2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 462E3F805E7; Wed, 12 Jul 2023 13:47:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CE8F805E0;
	Wed, 12 Jul 2023 13:47:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EDB1F805CA; Wed, 12 Jul 2023 13:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E0CAF805D2
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0CAF805D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SLUF3s/S
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AA7761797;
	Wed, 12 Jul 2023 11:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A301C433C7;
	Wed, 12 Jul 2023 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162422;
	bh=j1lgOkiqZl2ylPYx2qvyKimXaRK52M1zf0sTgvIFSuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SLUF3s/Ssn0i4CTiFLoAcm0Ymwe+DLfMOGBBXyQDaT4s0DQMVxaKRavYx9hZwGu/m
	 ptit0ZW5WGr7hbRiOih9Hzmwow4T3tpg7vz9ZrBy/05oXPZhCj/U1jKRE0OM98F1uM
	 kg0h1TGRV/gg/mgbpOzuKOgZb1wnSKorKzN2hk2865SUAzfAeogwGMkuygzv7y1HAg
	 l0WaYp/vTjFlZ/sxXQvKOOW9HYz+9tWtYgoYuqN+YQwlDz/2i4A03gdzQI5RcjekvU
	 PWBXnP7JcfbkYSWlLWUFRrsavyjOfPLuRzGn+IsYJcvLi6nUtkHr1dLSF8BJSGCxb+
	 F0SufDxjQ0KOg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <878rc1kerv.wl-kuninori.morimoto.gx@renesas.com>
References: <878rc1kerv.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core: protect dlc->of_node under mutex
Message-Id: <168916242215.46574.9918581139892744995.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: Q6JVCEWZBXCNPVERV5WJPDIJ5M7NYFVH
X-Message-ID-Hash: Q6JVCEWZBXCNPVERV5WJPDIJ5M7NYFVH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6JVCEWZBXCNPVERV5WJPDIJ5M7NYFVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Jun 2023 23:52:20 +0000, Kuninori Morimoto wrote:
> dlc->of_node will be set on snd_soc_get_dlc(), but we want
> 1) protect it by mutex, 2) set only when successed.
> This patch do it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: protect dlc->of_node under mutex
      commit: 065aa861b1243704b329a6d8407d8399614df6bd

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

