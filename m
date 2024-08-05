Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85C94824D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 21:28:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A80F5998;
	Mon,  5 Aug 2024 21:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A80F5998
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722886075;
	bh=90UvNn9K0mZ6VrUXGfzqNLue5sPsRmDgWkhqlksvKHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imgmYs6wFBRYryjB1hTDroGEFAug9cNSAvAnYuGHBEbqQjMIB67VoY/kZ1pPS6xOj
	 vVK9n8QYDylXMclK7hT6BFXAEDeVK7SLJQyFCtnq0TqqPqnztF74m52kp27Ya2nfdc
	 SzJYaxU/tbpid6tLA99nI/wi7bY8dOjrdldS8Icw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 013A9F800E3; Mon,  5 Aug 2024 21:27:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59730F805AF;
	Mon,  5 Aug 2024 21:27:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D15E4F802DB; Mon,  5 Aug 2024 21:27:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59D61F800E3
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 21:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D61F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pQ4xXIkX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56C35CE0B6F;
	Mon,  5 Aug 2024 19:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416FAC32782;
	Mon,  5 Aug 2024 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722886031;
	bh=90UvNn9K0mZ6VrUXGfzqNLue5sPsRmDgWkhqlksvKHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pQ4xXIkXzdww4DSnoBtUXTP2AgYpid/Rv4LvFJEs1ZEUcUj92JsyVM8l8Zkxyamh7
	 2K2iF3O3Al/2zB2gQdl5dDk+xKm928QHeqWIYfP8GQzBKTsVHbrb3CmuB5+7YTdqov
	 UywWvzSaTcdldKe/xGKlr69a1yc8ZfL+PiTORqX6IEc3PdahXNz+rtD68aG5aHosC+
	 /MclcdPlCuVGZ7v5YQ+E6/68n2lntkyghABGyXE17Was3kh0/lygbpLowac25Hbwk9
	 pxf7kLQap9nHV7gDJoE6htfXy/cGQOQMFawLvZSyMU8TKS4RslBzhzuGsGZYcPZVXz
	 FPA+zP0dCDZuQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
In-Reply-To: <20240729131351.27886-1-johan+linaro@kernel.org>
References: <20240729131351.27886-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: fix missing codec version
Message-Id: <172288602778.71820.9069423638402649413.b4-ty@kernel.org>
Date: Mon, 05 Aug 2024 20:27:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: Q6PDL33STKABOTVCBT3XNF2HAXVPXQMY
X-Message-ID-Hash: Q6PDL33STKABOTVCBT3XNF2HAXVPXQMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6PDL33STKABOTVCBT3XNF2HAXVPXQMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jul 2024 15:13:51 +0200, Johan Hovold wrote:
> Recent changes that started checking the codec version broke audio on
> the Lenovo ThinkPad X13s:
> 
> 	wsa_macro 3240000.codec: Unsupported Codec version (0)
> 	wsa_macro 3240000.codec: probe with driver wsa_macro failed with error -22
> 	rx_macro 3200000.rxmacro: Unsupported Codec version (0)
> 	rx_macro 3200000.rxmacro: probe with driver rx_macro failed with error -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-macro: fix missing codec version
      commit: 9a1af1e218779724ff29ca75f2b9397dc3ed11e7

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

