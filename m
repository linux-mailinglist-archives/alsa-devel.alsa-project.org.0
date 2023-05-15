Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C0B702B2C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57C75857;
	Mon, 15 May 2023 13:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57C75857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149123;
	bh=KEaOEqbRtYhzunYdC2/oNS4bINLreQCjokum/W9ombs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f5CTuBsPFu+/JqZYQqiiL2ba7yaNLQhZa2CyKqVocIk4Kvi5Raavnd5FWuMNhKuUJ
	 0e+5Q8nJyDVISU+mnD2cwr9T84dlBzCv9d3xac0wVKrXGnmVK5ls9Kwohg6IwFztUb
	 3QKmUkGY7oRQFsXquTouHb4dZHha72tavlcjA7rM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63D72F805AA; Mon, 15 May 2023 13:09:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93340F80588;
	Mon, 15 May 2023 13:09:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 670C0F8055A; Mon, 15 May 2023 13:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4DB5F8025A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:09:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4DB5F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I8kWKmCN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5FB6615FE;
	Mon, 15 May 2023 11:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A94DC4339B;
	Mon, 15 May 2023 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684148985;
	bh=KEaOEqbRtYhzunYdC2/oNS4bINLreQCjokum/W9ombs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I8kWKmCNSXJxEyQqVg5SyQHpH0m6kt/oPeTkr5WHFdQibKL4IrlR3tVsoEkyccdS9
	 8nrWB5hkWxU88g7ywkEs0FmweXvOOmYIrxmKx0nFNmwOmrGWISiXh4EWzwz/faVwZN
	 8Bcu2ODWp6SpfNfFz9zecTt9GpgH4UsaeCfnPELleQ6vxk6U1USEF2iyPONES74/H4
	 wGyixTNp+Qw561VRilHClaTznFAI7OnuwH6kKJpgsy0pNkR7ooAUHK3knKZuizycvL
	 m2JM3R6KYK7mbf49YcYkNa1pgwjp7HKnNMin0wMojjXsIUxDcgv+q8clEc5dCZ4k9F
	 ddeTkSqy3XADA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunxu Li <chunxu.li@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
In-Reply-To: 
 <20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid>
References: 
 <20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix use-after-free in driver
 remove path
Message-Id: <168414898289.394037.12962945078412931473.b4-ty@kernel.org>
Date: Mon, 15 May 2023 20:09:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: SCVBMXN5SCDS2OGVFMMSHC6Q4T5OLTTJ
X-Message-ID-Hash: SCVBMXN5SCDS2OGVFMMSHC6Q4T5OLTTJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCVBMXN5SCDS2OGVFMMSHC6Q4T5OLTTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 May 2023 09:25:12 -0700, Douglas Anderson wrote:
> When devm runs function in the "remove" path for a device it runs them
> in the reverse order. That means that if you have parts of your driver
> that aren't using devm or are using "roll your own" devm w/
> devm_add_action_or_reset() you need to keep that in mind.
> 
> The mt8186 audio driver didn't quite get this right. Specifically, in
> mt8186_init_clock() it called mt8186_audsys_clk_register() and then
> went on to call a bunch of other devm function. The caller of
> mt8186_init_clock() used devm_add_action_or_reset() to call
> mt8186_deinit_clock() but, because of the intervening devm functions,
> the order was wrong.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Fix use-after-free in driver remove path
      commit: a93d2afd3f77a7331271a0f25c6a11003db69b3c

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

