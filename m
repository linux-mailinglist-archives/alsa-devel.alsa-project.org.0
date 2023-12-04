Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877238032E6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 13:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFFBA868;
	Mon,  4 Dec 2023 13:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFFBA868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701693290;
	bh=xjF1df6ovG/OTfgvFzXwNPGyC0cT4fferGhCudAzLk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=db+4jp6Fw4X3sHVpE3lGULW4Rs4ic1jcTq35mwcujQ3fvNMEsf8m7gpoampf1JSWb
	 Q5/+J3G+iDRFuuO5KObhbzr8bVWWjZaMD//iI1xPzZleenTC2I3I0ekwWZrNbbijpx
	 LhW2wa2RCdIc9lZ/We8iJhEKjM7nTR3aFxwrx0sQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD35F8055C; Mon,  4 Dec 2023 13:34:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33ED8F80578;
	Mon,  4 Dec 2023 13:34:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C8E1F8024E; Mon,  4 Dec 2023 13:34:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4484F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 13:33:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4484F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cgduqM7R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A060FCE0FA0;
	Mon,  4 Dec 2023 12:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C817BC433C8;
	Mon,  4 Dec 2023 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701693232;
	bh=xjF1df6ovG/OTfgvFzXwNPGyC0cT4fferGhCudAzLk4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cgduqM7R/5ZMJ228FT9mToDk5GazV1XuPieHuOcOYA5/HWeVwSZbiUnzoru8OWe2x
	 G+gqQ0lTAN6KhiyH7DUsY1YfiilKk6Le/hDBLlCBnaE64D7iXSoNXi+qMH1sIktqGa
	 4TAPyMCykFAMS/YWHmuaGKeMPYk/Hh6b1pMTRj5CcBzw0rpaqBT2TfNO/42XqrS+Z7
	 h+7vLyUw1TT+s2brQHdh5h5ImIRkdMngT4sEj2gU+MCCoVp8IEZjM1/tv9TZar1drv
	 7xWY6/qu96AJblVoN/hBqE3iOk7ErOifz5Lpht2XXv1JC3ZeSsxlk/Y9QQ5PylxeRd
	 r8wEWG9+RYxoQ==
From: Mark Brown <broonie@kernel.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
References: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
Subject: Re: [PATCH v2 00/10] ASoC: Convert Cirrus codecs to GPIO
 descriptors
Message-Id: <170169322951.40199.8768531493970964376.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 12:33:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: HQZPQE5FGCVDWKZTOGW5SXVDMVGHGJV2
X-Message-ID-Hash: HQZPQE5FGCVDWKZTOGW5SXVDMVGHGJV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQZPQE5FGCVDWKZTOGW5SXVDMVGHGJV2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Dec 2023 14:20:29 +0100, Linus Walleij wrote:
> This series walks over the Cirrus Logic ASoC drivers and
> clean out the use of legacy GPIO numbers and legacy
> GPIO APIs.
> 
> The CS4271 affects an ASoC driver for EP93xx which Nikita is
> actively working on moving over to device tree, so I don't
> know about that patch specifically, but I think the collision
> would be max "the file was deleted".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: cs35l32: Drop legacy include
        commit: f8dd1f89bd5ecbfcc547ee5b222a4b9ddb0a0160
[02/10] ASoC: cs35l33: Fix GPIO name and drop legacy include
        commit: 50678d339d670a92658e5538ebee30447c88ccb3
[03/10] ASoC: cs35l34: Fix GPIO name and drop legacy include
        commit: a6122b0b4211d132934ef99e7b737910e6d54d2f
[04/10] ASoC: cs35l35: Drop legacy includes
        commit: 490d2d9f190a9a6125495ac4d833fa0af41763d0
[05/10] ASoC: cs35l36: Drop legacy includes
        commit: 194ef700d4e255686173a03b65e15cac637cc15a
[06/10] ASoC: cs4271: Convert to GPIO descriptors
        commit: 42d1178d223ba9498c1ed40a5fc243a43d35ec97
[07/10] ASoC: cirrus: edb93xx: Drop legacy include
        commit: b191a524b225a3acd7528c3fa8ebeb15302c979b
[08/10] ASoC: cs42l42: Drop legacy include
        commit: 0ec65e8e2219a91987cbb041387d94d40cab38b2
[09/10] ASoC: cs43130: Drop legacy includes
        commit: c6324cafd8370c2254f90a33b7327c45e7a58bbd
[10/10] ASoC: cs4349: Drop legacy include
        commit: 9c16cfe42d9fbfd258a3928b4a054d6b3ef932b0

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

