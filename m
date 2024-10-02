Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC9998E1B9
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 19:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6558850;
	Wed,  2 Oct 2024 19:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6558850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727890716;
	bh=Is+UGbRCPtv4WjnRWip81uNy+MDLQxFdDtBuMKE/U+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IkaFt/bTgWZiGtILMv+uH3CiPXb4JfTJVYswdXVIGz5lUyYXYHVDDi8/F5Az7hjpP
	 zqs5SU1tNscGeCPxtAxxquO1yq2MzLVlib8gGkLQdSjLpfobrpoMlp5VE1yfW5XO5h
	 Yzi9w8sq6Z7vfrRzDxGAeZEY6GAd5byJOBh6Q+C8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5156F805AF; Wed,  2 Oct 2024 19:38:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E74F805AA;
	Wed,  2 Oct 2024 19:38:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6CBF80517; Wed,  2 Oct 2024 19:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7385FF80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 19:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7385FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MJJ+I6Be
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A34E65C1071;
	Wed,  2 Oct 2024 17:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56861C4CEC2;
	Wed,  2 Oct 2024 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727890673;
	bh=Is+UGbRCPtv4WjnRWip81uNy+MDLQxFdDtBuMKE/U+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MJJ+I6Be7MOG+JiYyakCjiecIE38iB3GwnXnr68osl1Y3qItMkHDVH4LLnMuGmBPd
	 pcZaFIGYQQYkUwNV8OMqJQ+Xuvih6Xk1WlzMTVgbttAFDFUc+vbaeKf12/cLi9YtpX
	 Cm7tyA/GPu8Y5XPkHo73IG4RTuchiauB2Hdj/CDydle7Fxw57qzDjNKWhwz9l/0Wb2
	 2ovuibX/3e5uJLLUBj4ipGRotkLRHQrOdg0b7K71SqAWESlBXm1NbN3yH4rAj9GUxD
	 KSdBbalVnvnTZOg8P8oIUnvKe262W22Hg6hCAeOTeFlOoXtLSdtiDo5/o8B/0EA7P9
	 m8umRK3ydwehg==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jayesh Choudhary <j-choudhary@ti.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241001204749.390054-1-miquel.raynal@bootlin.com>
References: <20241001204749.390054-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] ASoC: dt-bindings: davinci-mcasp: Fix interrupts
 property
Message-Id: <172789067103.163279.11797735685119883296.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 18:37:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
Message-ID-Hash: T7BDCFQT2JPBSZN6GMJQYVWQCGYDNUEW
X-Message-ID-Hash: T7BDCFQT2JPBSZN6GMJQYVWQCGYDNUEW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7BDCFQT2JPBSZN6GMJQYVWQCGYDNUEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 01 Oct 2024 22:47:49 +0200, Miquel Raynal wrote:
> My understanding of the interrupts property is that it can either be:
> 1/ - TX
> 2/ - TX
>    - RX
> 3/ - Common/combined.
> 
> There are very little chances that either:
>    - TX
>    - Common/combined
> or even
>    - TX
>    - RX
>    - Common/combined
> could be a thing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
      commit: 17d8adc4cd5181c13c1041b197b76efc09eaf8a8

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

