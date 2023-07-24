Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C74760032
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 22:02:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F5C83A;
	Mon, 24 Jul 2023 22:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F5C83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690228935;
	bh=WTZBlqc2ZcO87LtEbEdgMwGeiInXUbSGlZY5+YNwyJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RjEFzoN4PEmKybVm6W/vfjw/VzxQIc9h7i0/RowJiLrCNOqKf13Q3QhCaEkL6hAL6
	 8sItASA1hs5212/3jLHRu+kJVPKMoUyXLhKs/rKBDFGjto1qKcubKgYCs1bLJbd/sz
	 TKWPfpNg74zLCvYwGFjvbJf/YleRE98oAsVmRK7Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 993C2F801F5; Mon, 24 Jul 2023 22:01:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6FFF801F5;
	Mon, 24 Jul 2023 22:01:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0F6EF802E8; Mon, 24 Jul 2023 22:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 341F0F800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 22:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341F0F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hEPlxVCI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D36E61342;
	Mon, 24 Jul 2023 20:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA6BC433C7;
	Mon, 24 Jul 2023 20:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690228815;
	bh=WTZBlqc2ZcO87LtEbEdgMwGeiInXUbSGlZY5+YNwyJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hEPlxVCInMg2i0rpUO/Mm7EnW+wHQQjk/WxcEaH9GIrLnP7ffcdPpP2utf2CxqewJ
	 1s1EbI1hoPzVN+KSoMUnbmHD38sl5vbq+tduPefQaLRMP9eVoCp9374lzakokcbUum
	 GRIJHx+WNdKpIMMkMFIP1tP4iIWBDTCalFXOKsZ104W6+U9V3lVS9y89eHmgQKuGLX
	 VOm6bm/9xFW9ZiGa2zuswjki4TUzA0KAiGnzLxPsNn/B1OJ2p2DCzCdJgO0WaI7dk4
	 s6Vh8b7rKWdhLQDkDDJHzAjA3yHxcrcXLqe8rcdWgIJ/r18arBkj4bsjcEzMPPAbOI
	 r8jHAe4chP+FA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Cc: perex@perex.cz, tiwai@suse.com, wtli@nuvoton.com,
 u.kleine-koenig@pengutronix.de, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230719200241.4865-1-edson.drosdeck@gmail.com>
References: <20230719200241.4865-1-edson.drosdeck@gmail.com>
Subject: Re: [PATCH] ASoC: nau8821: Add DMI quirk mechanism for active-high
 jack-detect
Message-Id: <169022881228.1309709.2767178684192633298.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 21:00:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: AP6DOZ77OGFXKR5TI4OEVBM2YEFPB7XZ
X-Message-ID-Hash: AP6DOZ77OGFXKR5TI4OEVBM2YEFPB7XZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AP6DOZ77OGFXKR5TI4OEVBM2YEFPB7XZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 17:02:41 -0300, Edson Juliano Drosdeck wrote:
> Add a quirk mechanism to allow specifying that active-high jack-detection
> should be used on platforms where this info is not available in devicetree.
> 
> And add an entry for the Positivo CW14Q01P-V2 to the DMI table, so that
> jack-detection will work properly on this laptop.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8821: Add DMI quirk mechanism for active-high jack-detect
      commit: 1bc40efdaf4a0ccfdb10a1c8e4b458f4764e8e5f

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

