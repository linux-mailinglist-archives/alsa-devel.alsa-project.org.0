Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E8763E2B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 20:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91989203;
	Wed, 26 Jul 2023 20:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91989203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690394997;
	bh=NTBn5X0j7XuSBmPMzoKfiYJ/TdH2cNjPJlEowlXaV9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VyZxvE3c8mFBaj9Nqs7x2pe6JhkLitTZ+NpYyg02h0SJBRG0gF9qyRcQv/NDqcVVV
	 tosM5T2pv+B1190JNB6y8QI3yyTDJlNL3qOau3njyyIIlxUoR7j7ZuqbGbBfpoGIfL
	 SIHl7Eq/LkbyIQbudwx2+jmHRuSorILSvRauYfWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C01D9F80553; Wed, 26 Jul 2023 20:08:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB21F80548;
	Wed, 26 Jul 2023 20:08:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C49F8019B; Wed, 26 Jul 2023 20:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65928F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 20:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65928F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=R6lbkP4i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C402D61A3C;
	Wed, 26 Jul 2023 18:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C95CC433C8;
	Wed, 26 Jul 2023 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690394886;
	bh=NTBn5X0j7XuSBmPMzoKfiYJ/TdH2cNjPJlEowlXaV9U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R6lbkP4iXgdD7bUJ9ZArAqTc5m87HFx2yaatg6Tix/V1uximK4qYoQSMKJQNiZ35V
	 CTBki/UQXe91ejyvOL7AqYwp3ilXc2fKi5gDPzWEXpJkxEBq+rzEBiERf1gYK0Mqlf
	 fIDR2ESmwaLD/8LGIlUA6RXh2pWE55xI3oo1xWDdvuEvc8LrOFUtz5Qgv8Nn8L84yN
	 fqgSb9LIoRWn7mZ2X/aAZsGARf/pdPsEvvEPCHQmomFbJSEtf+/0g9zBhLBlpfYP3o
	 qb6rt90w0LwTRo05f5NKNuOY820z95WSVSQfxm8MT0c4n2miGYT7fJTBhggcxSL3u+
	 YGInkuMF28yJQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 Vijendar.Mukunda@amd.com
In-Reply-To: <20230726091051.658754-1-shumingf@realtek.com>
References: <20230726091051.658754-1-shumingf@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1316: fix key tone missing
Message-Id: <169039488415.108395.4554412269504685422.b4-ty@kernel.org>
Date: Wed, 26 Jul 2023 19:08:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: UGV6VHRN2YN44QAEX2QU7BBV62LFA7W2
X-Message-ID-Hash: UGV6VHRN2YN44QAEX2QU7BBV62LFA7W2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGV6VHRN2YN44QAEX2QU7BBV62LFA7W2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Jul 2023 09:10:51 +0000, shumingf@realtek.com wrote:
> This patch adds a control that there are three options to control the digital volume output.
> The user could select "immediately" to make volume updates immediately
> and avoid key tone missing issues.
> In default, the driver selects that the volume update when a zero-crossing with a soft ramp.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1316: fix key tone missing
      commit: 8744776363c370b0eeb0ed50cb0212d7826639b7

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

