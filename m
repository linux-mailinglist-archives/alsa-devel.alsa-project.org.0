Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0A8772FF3
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 21:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8894825;
	Mon,  7 Aug 2023 21:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8894825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691438120;
	bh=BJz6MirJZr4GIuALmgQd8ZM1FYtuXj7SXO6/fRuEKwc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n+Y6gIKKjSx4ZR0x4a542/X0QDzHFxw4zMcVx4Lv3eBWrurh2HIdhOoy+9DC8fdi/
	 ADbigSHNjnNbkLRPlQ82ZsUJvPEVGkk2XjY0qT8TTMCMH5Dp/g7ycyum1qWAXIfZE3
	 QKIprTL8WiFWV7EHQvDCDJRix/OFE0crfWBFcYE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5D61F8053B; Mon,  7 Aug 2023 21:54:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E39DF8051E;
	Mon,  7 Aug 2023 21:54:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EAE9F80534; Mon,  7 Aug 2023 21:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACF38F8016B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 21:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF38F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NOQwMSLu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF0BF62186;
	Mon,  7 Aug 2023 19:54:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE523C433C7;
	Mon,  7 Aug 2023 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691438054;
	bh=BJz6MirJZr4GIuALmgQd8ZM1FYtuXj7SXO6/fRuEKwc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=NOQwMSLuGaykZa6XChbrUucGXaE1b3IQozwo0csRfwEVqvjt8Kx+whuxMPf+uz74b
	 gkut8MSqnBkyH1YgK0dVcZPnp/A8j5/0h/0GLfvstdT4lv7vWwtgxhSKNjRwi2f646
	 1iNlv3TOr6Mpgk0N0fYyZZxLy44Ovb3bLfgZDGQfnUTkzQP6oWK6D35YmVZtbKxsNI
	 f2eBflc9a+LkX7EXLHgfBWunmwpo4KJY3vblCLOct2/ssHmjHMZIaWJhinnZpLboV9
	 JLyfBkVAHrWsP1sdySRP78cuxwX1FxAV+dKYVPw/QMmqLFLPw7I8SMMVd7FDEoeBVo
	 UOzjXbj/CBZWQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ryan Lee <ryans.lee@maximintegrated.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
References: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Convert maxim,max98925 to DT
 schema
Message-Id: <169143805139.302632.1243042344493103435.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 20:54:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: S7GQCKWXAKVGXEMHHU6HYC4ILTTRJOPV
X-Message-ID-Hash: S7GQCKWXAKVGXEMHHU6HYC4ILTTRJOPV
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 30 Jul 2023 22:18:24 +0200, Krzysztof Kozlowski wrote:
> Convert the Maxim Integrated MAX98925/MAX98926/MAX98927 speaker
> amplifier bindings to DT schema format.  Changes during conversion:
> 1. Add "sound-dai-cells", already used by DTS.
> 2. Use "maxim,interleave-mode" instead previous "interleave-mode" and
>    undocumented but used interleave_mode.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Convert maxim,max98925 to DT schema
      commit: 7136368a2f3fda492d696bdeddf4d2af71fa8b92
[2/3] ASoC: codecs: max9892x: Unify interleave mode OF property
      commit: ddef7518e76d832ab9f6d0430ad28cc0e04c083a
[3/3] ASoC: codecs: max9892x: Reformat to coding style
      commit: 38b288ab454f9aecf7b717974028f57f5243dc5a

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

