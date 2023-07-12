Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096475072E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A30084A;
	Wed, 12 Jul 2023 13:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A30084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162799;
	bh=e/KDaaV8Bgr0ZJsoV8u60AYLTtHFFBviGvVQeHhRoaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ERjlXI8cl/67X/FlOlOFcKpmrrw9FgQdztXkoMWC/hZV/b2rnDyO8iQkOabIu4xA4
	 qRexp+xaqWrhaFR6n8vMp1/tX2F0EBS3ZBbq0Rh3OGwumj1/0MpzLrlUkHY1ket9XN
	 0InfYqhNsXDjHyOBIBwIQZiRAsqVfEBreVMx3m8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7295AF80678; Wed, 12 Jul 2023 13:47:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D42E6F80659;
	Wed, 12 Jul 2023 13:47:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0EDDF80638; Wed, 12 Jul 2023 13:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84FA5F80236
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84FA5F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BQ2osNQN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69F37617AB;
	Wed, 12 Jul 2023 11:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDF5C433C7;
	Wed, 12 Jul 2023 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162451;
	bh=e/KDaaV8Bgr0ZJsoV8u60AYLTtHFFBviGvVQeHhRoaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BQ2osNQNhK2n8rwRa8EYInKOKFBlxhwL7Ds+VSp9d5faxD73I62XtUI1UZ/eom9lk
	 n7YhzTvn55GOYZ8TzsZ0zAp9u10YO1KQye+uJwdwXgTmZackWTmwrRpEXgLy/3XCX/
	 +pGi1x9BunCTdC0jKsT60uoEgZft6idykzw1YmOOVPs/G8iMSJrwYcUeAAr4iDMiN/
	 s80B4JdlurFGpePTDJHL0ix7w70ROLTK7fj2eBUHYtkQU76qjdwXVNygDMUQJF4klr
	 Mc8XK9LZC+LlAJYES0sDTtTep25WtZUY94CshOwvwMHxp3nI88UB7s8VRMo7fVrVwB
	 o0jYzwqByMRAg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/14] ASoC: add multi Component support
Message-Id: <168916245090.46574.12575624864426874428.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:47:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: QHXDTV465ZWA5QNGCU3VYXVP3ABSKQBH
X-Message-ID-Hash: QHXDTV465ZWA5QNGCU3VYXVP3ABSKQBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHXDTV465ZWA5QNGCU3VYXVP3ABSKQBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Jun 2023 02:17:53 +0000, Kuninori Morimoto wrote:
> On below HW case, we would like to use it as "2 Cards",
> but unfortunately it is impossible in intuitive way
> or possible but not intuitive way.
> In reality, it is handled as "1 big Card" today.
> 
> 	+-- basic board --------+
> 	|+--------+             |
> 	|| CPU ch0| <--> CodecA |
> 	||     ch1| <-+         |
> 	|+--------+   |         |
> 	+-------------|---------+
> 	+-- expansion board ----+
> 	|             |         |
> 	|             +-> CodecB|
> 	+-----------------------+
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: soc-core.c: initialize dlc on snd_soc_get_dai_id()
        commit: 521d675d2497f890e881dc48e954a1559460e97c
[02/14] ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()
        commit: 0e66a2c694096abc54ed58b3be654103f155ea43
[03/14] ASoC: soc-dai.c: add DAI get/match functions
        (no commit info)
[04/14] ASoC: soc-core.c: enable multi Component
        (no commit info)
[05/14] ASoC: soc-core.c: add snd_soc_get_dai_via_args()
        (no commit info)
[06/14] ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
        (no commit info)
[07/14] ASoC: soc-core.c: add snd_soc_copy_dai_args()
        (no commit info)
[08/14] ASoC: simple-card-utils.c: enable multi Component support
        (no commit info)
[09/14] ASoC: simple-card.c: enable multi Component support
        (no commit info)
[10/14] ASoC: rsnd: use DAI driver ID instead of DAI ID
        (no commit info)
[11/14] ASoC: rsnd: cleanup rsnd_dai_of_node()
        (no commit info)
[12/14] ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2
        (no commit info)
[13/14] ASoC: dt-bindings: renesas,rsnd.yaml: add common port-def
        (no commit info)
[14/14] ASoC: dt-bindings: renesas,rsnd.yaml: enable multi ports for multi Component support
        (no commit info)

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

