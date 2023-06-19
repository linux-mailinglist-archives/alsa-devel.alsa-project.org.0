Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5E0735FDA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 00:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C605823;
	Tue, 20 Jun 2023 00:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C605823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687213814;
	bh=YXJ61me7K+x9sP0uCefqeG8uX/uP+3oCIzWR3bO4M+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RC5KS+Yv1AGiJHGFpjQeZ651CEKgPAQ/52uin4uscF/gMkdz6dDmSGYDJf7VNcMYN
	 EvWr56m60noOjftkljNAwn2IVOjg8tzkxQsGTKd+IxaMXY+kQS35nxyo9XQ21YglKI
	 ep2p1UBByCrGZWX/T/GYnPiD2hxcmCam7FJgtNx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ACD6F80535; Tue, 20 Jun 2023 00:29:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DACFF80132;
	Tue, 20 Jun 2023 00:29:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D48DEF801D5; Tue, 20 Jun 2023 00:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99294F80093
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 00:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99294F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=prI8iaz2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B442560EF6;
	Mon, 19 Jun 2023 22:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 611AFC433C8;
	Mon, 19 Jun 2023 22:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687213744;
	bh=YXJ61me7K+x9sP0uCefqeG8uX/uP+3oCIzWR3bO4M+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=prI8iaz2st4ffDfPL7/IxYI7KFilgfyGOYbOmX0ABtzoIUYrgLlzvae9SWg+6Jnvy
	 TvtXWqAhO1g/KZ0kjYf1gR4qoNENaIfFhXculJyI6AoP1IHqEf04AYVcV1Rqdu3Kz1
	 FUJcxrwihrMKZUm5cFaGm51+e63nJBUCBUrgsV9e/F+xk4+fi0GU7JVqXVB6XSwww+
	 gF2Hg7P3CogfqVnaswBy5Ht1rQDfhacj13WG6sCd4WuTEGZHCxdcVTFBWt+WUut07n
	 2VPgecc34zGlwU9x4+PyxZuguze/T6gCaqn3aA9akNEuQno1zXaJ9zleJ0V+2rv4FD
	 E8A76MuDcE7UA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230609-asoc-mx98363-volatile-v1-1-7acad55f5dd6@kernel.org>
References: <20230609-asoc-mx98363-volatile-v1-1-7acad55f5dd6@kernel.org>
Subject: Re: [PATCH] ASoC: max98363: Remove cache defaults for volatile
 registers
Message-Id: <168721374307.200161.4850410936519906259.b4-ty@kernel.org>
Date: Mon, 19 Jun 2023 23:29:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: HFED5X2D3RKUD5JHLPNIIDXKQHZG5OB6
X-Message-ID-Hash: HFED5X2D3RKUD5JHLPNIIDXKQHZG5OB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFED5X2D3RKUD5JHLPNIIDXKQHZG5OB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 10 Jun 2023 00:58:44 +0100, Mark Brown wrote:
> The max98363 driver provides cache defaults for a number of volatile
> registers. This is not meaningful, the cache values will never be used so
> at best they will just consume memory and at worst they will be used in
> preference to real values from the device, remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98363: Remove cache defaults for volatile registers
      commit: 997905d523fb85ba1a45159cbb9ae3910275bada

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

