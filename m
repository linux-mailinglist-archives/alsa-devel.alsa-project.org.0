Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFC6CC726
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 17:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5FA81EB;
	Tue, 28 Mar 2023 17:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5FA81EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680018807;
	bh=N/0Q2ofWL1px+rKg7cbc8KWr7TkYVLJkqMMOXNaxdNQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iCHxgQEMyCHV1XvnfaxA0RRyPlX7XtZBq98vzKypY/NkRcBKrgZlWmVYCtfZI8hPa
	 jbQ+09Fa2OGJVxQ/SduFn/iPGYT4xu2c5zI2hqiqSK8D6tdE6hsRvJ4UmdspzOEH0Z
	 jG67jdPGWPOI2R/Ap4A0p4aS6XivgKBy9L9Gf+eY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF6D3F8024E;
	Tue, 28 Mar 2023 17:52:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E94A8F80290; Tue, 28 Mar 2023 17:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DF93F80249
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 17:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF93F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rzwSHNXz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A477461871;
	Tue, 28 Mar 2023 15:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E64EC433D2;
	Tue, 28 Mar 2023 15:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680018744;
	bh=N/0Q2ofWL1px+rKg7cbc8KWr7TkYVLJkqMMOXNaxdNQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rzwSHNXzPA7AMhJbSZffuulKOqXtRg4P5Qyv+373duLbJh8qP1hJ1h1akNsErxJ1C
	 drti1Y7AAZAaX91u9xzal5l5yY+2loWagf9IHl60dL2YmF0ubzagpC7Xf2Q+P8Q4OX
	 9bCvOF9D6kLl8VHGGrYlwp7vaahN04AAOwumn32ch9Xqtig3p3T3ZDy9CRTLgHDJBm
	 i6ymSJhMZmWFIVjR91InD6a1Q333mHhPVAtOYUIQR3BptFUeOrtMUwdUFIqKVdxeqd
	 wEA/+TLwDD9ovvWUIRTSL/cf516im5w6illGgjCToc55JBXE6BTRzcb61Sq0ep6Dmu
	 IXaN7fZY1I9Jw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20230328094901.50763-1-cristian.ciocaltea@collabora.com>
References: <20230328094901.50763-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: es8316: Handle optional IRQ assignment
Message-Id: <168001874221.43606.9872298334839661286.b4-ty@kernel.org>
Date: Tue, 28 Mar 2023 16:52:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: NR4B2TXZDFCJV6BLZJEGVDR5SS7F4LLC
X-Message-ID-Hash: NR4B2TXZDFCJV6BLZJEGVDR5SS7F4LLC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NR4B2TXZDFCJV6BLZJEGVDR5SS7F4LLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Mar 2023 12:49:01 +0300, Cristian Ciocaltea wrote:
> The driver is able to work fine without relying on a mandatory interrupt
> being assigned to the I2C device. This is only needed when making use of
> the jack-detect support.
> 
> However, the following warning message is always emitted when there is
> no such interrupt available:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8316: Handle optional IRQ assignment
      commit: 39db65a0a17b54915b269d3685f253a4731f344c

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

