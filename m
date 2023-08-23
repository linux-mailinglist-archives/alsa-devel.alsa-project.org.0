Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE778610D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 21:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677D3839;
	Wed, 23 Aug 2023 21:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677D3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692820506;
	bh=6IGO6QfWfBgIUY1P9eOVpyHPznn8Wy0rIYK+n5IYryM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c4z/T+zM639m+O6xf9+k70BPSsqMRE5/LutOlmJMRFuD2/BEKN2wNGEMjPaVbWgzm
	 KgqV0IEg1onIbCybjs93NVmYpRvYgjgu6c6TOyg7816U9YI3QTNVlXORBq7QG6APGT
	 3p2iax8sJ+9Xb+vmDeDn/h18PSdsiL6VxUoBBA3w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFE44F80537; Wed, 23 Aug 2023 21:54:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E21FF80158;
	Wed, 23 Aug 2023 21:54:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D0AF80158; Wed, 23 Aug 2023 21:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1521F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 21:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1521F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mKnvUfzx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 41A2B66407;
	Wed, 23 Aug 2023 19:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD20C433CA;
	Wed, 23 Aug 2023 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692820445;
	bh=6IGO6QfWfBgIUY1P9eOVpyHPznn8Wy0rIYK+n5IYryM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mKnvUfzxyWXYQcvyr499ECNAFjRG61ov2PTeEKum9oMVfyc6t7pPVfJtSDl8H9L6b
	 9CcjNb1iLMQrAsAMjoRqFowYtJr9RlmorQ+RakPSM6w/ItemUB0bsuUth84vzbtuTJ
	 AkYDZiPqbZZffoVJOFfRBQyl4pdx0De/E6SElOBUPcTwyMg292ex92yOh8BqQbHfQa
	 kPdbaz7XfRYPek+NfwXDONuIa0nJEOhXNr0J4XyiUX+sySachg0UNU8x//OdQfQoB/
	 CItqL2Uo+7wALohVK2jlU2SThBZCh1BLR6i+ttZYCnZeA7gSAQl1Ne5nr5lCzUVHa3
	 25NAOTOIgwn+A==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: rsnd: tidyup ADG
Message-Id: <169282044401.176026.17200274191018506062.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 20:54:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: V45XKGMJS7EJ2CUXIN6TPGPUXKPKSQUF
X-Message-ID-Hash: V45XKGMJS7EJ2CUXIN6TPGPUXKPKSQUF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V45XKGMJS7EJ2CUXIN6TPGPUXKPKSQUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 22 Aug 2023 23:50:10 +0000, Kuninori Morimoto wrote:
> Kuninori Morimoto (5):
>   ASoC: rsnd: enable clk_i approximate rate usage
>   ASoC: rsnd: setup clock-out only when all conditions are right
>   ASoC: rsnd: tidyup brga/brgb default value
>   ASoC: rsnd: remove default division of clock out
>   ASoC: rsnd: setup BRGCKR/BRRA/BRRB on rsnd_adg_clk_control()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rsnd: enable clk_i approximate rate usage
      commit: bd4cee2fdf69b56c2bf3e7ec7c2e12b81e08005c
[2/5] ASoC: rsnd: setup clock-out only when all conditions are right
      commit: d059cd40aea6deae716bc6588f24e7b6b421f822
[3/5] ASoC: rsnd: tidyup brga/brgb default value
      commit: 80d4984f38631b1157dd51214ccd3d2fc6d56fbb
[4/5] ASoC: rsnd: remove default division of clock out
      commit: ab0233747f9cf6ba6c6d0c60c1e0e2533db00302
[5/5] ASoC: rsnd: setup BRGCKR/BRRA/BRRB on rsnd_adg_clk_control()
      commit: 4acdf9aedd5624aae9335d70a9324d5aaec4034d

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

