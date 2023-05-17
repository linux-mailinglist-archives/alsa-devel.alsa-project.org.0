Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94E706B7F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DE5204;
	Wed, 17 May 2023 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DE5204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684334709;
	bh=Gd1J584vmP39A3tV/FU9gv4hQNH+NXQWlWPp70Q5c6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ubGI3imGB+VqddiSVRjowMeL6V9w4D3LDC3keOqx2O+cVrM3FIbO/2y3eGH/aVVIt
	 PAMPIJGbZFmidj8TeW/pjnHemO2BOSEinqqylrWPwSV+Ba/iFn+77OeDlNKrvWYkWk
	 bpEtREtQasvePfRnZpMWTYoDjZUxJpCRI3UVwtzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9529F80557; Wed, 17 May 2023 16:43:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82CDFF80551;
	Wed, 17 May 2023 16:43:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1089F80552; Wed, 17 May 2023 16:43:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8C29F80542
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8C29F80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hUleB3LM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97AF160CF4;
	Wed, 17 May 2023 14:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1F0C433EF;
	Wed, 17 May 2023 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684334625;
	bh=Gd1J584vmP39A3tV/FU9gv4hQNH+NXQWlWPp70Q5c6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hUleB3LMN5tBgPX4QC2951kHh3lUULWGPNxw4Ye5eItYgJSgYKC6zbbsR3Ygqf2io
	 lU/NYubNY2ifDfKEsQAZhaBnMCKM0jSrgT79wRCBsWYHnPoOSaM4fb07+umBQv2r59
	 5waep6MZFzaJkXe6rz2SXPgKjGuh+98qX3ZFM0xrmsE+4FLVC069eyhnDtFOsrrrPq
	 DYkgeeIrawIM/7uYNnAoWePkOxvLjyGaIgLTeruVnNKdvCDIR1ntVqcWKuf9wDkOtC
	 yebb5ZpBmfkJIOJ4TM+sX/GbYN+CVPrshPpxjdtYxN9rkRNl4CbvRsq/sni5x4mY5F
	 yyoeOsrzk0pzw==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org
In-Reply-To: <20230514225243.777504-1-marex@denx.de>
References: <20230514225243.777504-1-marex@denx.de>
Subject: Re: [PATCH] ASoC: dt-bindings: ssm2518: Convert to dtschema
Message-Id: <168433462278.451534.14591729096601815671.b4-ty@kernel.org>
Date: Wed, 17 May 2023 23:43:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: Y3JCPXKRLVHHNMBTBB4QA4Y43DPVGHEB
X-Message-ID-Hash: Y3JCPXKRLVHHNMBTBB4QA4Y43DPVGHEB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y3JCPXKRLVHHNMBTBB4QA4Y43DPVGHEB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 May 2023 00:52:43 +0200, Marek Vasut wrote:
> Convert the ADI SSM2518 audio CODEC bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ssm2518: Convert to dtschema
      commit: 20ef7f2139ab81c9163addb2da08f2630fdc34db

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

