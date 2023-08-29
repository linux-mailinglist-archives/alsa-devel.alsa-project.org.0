Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB8878CCBD
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 21:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7332DDED;
	Tue, 29 Aug 2023 21:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7332DDED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693336470;
	bh=nKFWWSD6tkdLWsvN0IJ+6k1X0di+ynGgA5GvfxyERBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9lpEWIt7g9aLu4uy2ylkQKwOnqKyyN8krXBli65UsxseBq0ZeTMzsgsw2t0iMMFU
	 RDeInoc36zWHou67lzWR0s6xtjCq+5D1mD7342ge8qkEMlH1kN4uqhYoMAsXpSrGAe
	 NNMagU4/LjHqL9Tf62lHbSQDGbHbNrlBk6tdWqkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0AD0F8057D; Tue, 29 Aug 2023 21:12:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7428BF80578;
	Tue, 29 Aug 2023 21:12:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37AB1F80579; Tue, 29 Aug 2023 21:12:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3A53F80568
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 21:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A53F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IgAwv+9v
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A75A562BA2;
	Tue, 29 Aug 2023 19:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975DEC433C8;
	Tue, 29 Aug 2023 19:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693336355;
	bh=nKFWWSD6tkdLWsvN0IJ+6k1X0di+ynGgA5GvfxyERBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IgAwv+9vS+xmhm9d8GUXeCVq8QacgbDEUEYlrTHiF6jE5IkxTx3MHTZl8PO5TlyP5
	 dMnezpq0CHLKn+mMyR+my7QsvL76iPsNBkAjGgpfKd2um+wYEw2HDvIOWaoKbgJsS+
	 BdeEOVFpMsqiYFj7/TSOxeyX1sZaHcAsr2l0EUXBwnoM38Gow9LMIRo0BhZiEANLy5
	 iIK9NuWKqWX634jXNONaefqXpfgTjYzTdNtEv6BCzNNb+7PH0Jg7ibiXuGeCu7rVCi
	 vbiUbMVELU0RTkiEJJtd6Zg4/PSrNTB3409G6xjnc/6NalAV8wcHF3bFX/8U2DRY0K
	 Q855C388rWe9g==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 RicardoRivera-Matosricardo.rivera-matos@cirrus.com
In-Reply-To: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 1/7] ASoC: cs35l45: Add support for Chip ID
 0x35A460
Message-Id: <169333634962.3145573.7194230299890982862.b4-ty@kernel.org>
Date: Tue, 29 Aug 2023 20:12:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: YBTGIRAFBOOV5JO2W6LZFX7NFH5M7EYC
X-Message-ID-Hash: YBTGIRAFBOOV5JO2W6LZFX7NFH5M7EYC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBTGIRAFBOOV5JO2W6LZFX7NFH5M7EYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 12:05:19 -0500, Vlad Karpovich wrote:
> The 0x35A460 chip is a different variant of the cs35l45.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: cs35l45: Add support for Chip ID 0x35A460
      commit: bfd73b601ac880d7cfbafbb770c3d6195e73add3
[2/7] ASoC: cs35l45: Fix "Dead assigment" warning
      commit: a47f7bf97c9836ff312b421fe392f13401c60c7b
[5/7] ASoC: cs35l45: Rename DACPCM1 Source control
      commit: e041b85006f40a4f9799c385ec1a7fb8bdb0c228

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

