Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 470196FBF6C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9601161;
	Tue,  9 May 2023 08:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9601161
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683614504;
	bh=YgR5gthn/7Amv3cH003JLPMWgQs5SKsPVqLbkaAxcDo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bFw2Aid7UVlJLEfN429KSDtckF6tUtJf/0MWvfqzj13P2ifsRCb4InvY4cwDi6BER
	 TF6uK96gV/Q+jf/bdtLbJrgovlG/7Upf6RyWEjgUFqo7/4eedAoC3gITuTkCXvMEG/
	 D/pnGeyfP2oD0huVSaLhRIyVNVrZafrglGR6xOB4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83417F8057E;
	Tue,  9 May 2023 08:39:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00421F8057A; Tue,  9 May 2023 08:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 527EFF80568
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:39:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 527EFF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z9/UC3n6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2165D6164F;
	Tue,  9 May 2023 06:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A212DC4339B;
	Tue,  9 May 2023 06:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614344;
	bh=YgR5gthn/7Amv3cH003JLPMWgQs5SKsPVqLbkaAxcDo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Z9/UC3n6pY4XVT4CTaIkUIIzFuxrmzj/nq7QD3yO0hxehH7B+ErA0vZBrpOCZAo7v
	 ZhLROItSmj10A8edWjK6dgFKoeAtfChWz1q592KCGo+vSb79/66s/Gz0Q6NiIKEAhC
	 nmWaNeGgpJ7ZUGuB7KHrItGvfc+HVD8VlQ6LUpq8Fe1IbSvGMrG+sBfN5X4Qiy7ABc
	 HH4YSMrKqbFVf6rtZ6QlNsij7jeodbipG9ExULX/96jZXuuHxsNXpOWOUl8DPyv8IQ
	 jxtg7H5YI3b73J79QQ66PppAXXu3qB3Fhwmxya7wF7bGCaVfNwQJydA/5VU5CMitx6
	 ojubw7W1wwiAg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230507174543.264987-1-krzysztof.kozlowski@linaro.org>
References: <20230507174543.264987-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: google,sc7180-trogdor: allow up to
 four codec DAIs
Message-Id: <168361433934.303059.8293357053687076617.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: FCLOIDEY3XPKAHAUPGZJEPJCDI4AE4O6
X-Message-ID-Hash: FCLOIDEY3XPKAHAUPGZJEPJCDI4AE4O6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCLOIDEY3XPKAHAUPGZJEPJCDI4AE4O6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 07 May 2023 19:45:43 +0200, Krzysztof Kozlowski wrote:
> SC7180 Trogdor sound cards come with multiple audio amplifiers, so allow
> up to four of them to fix dtbs_check warnings like:
> 
>   sc7180-trogdor-homestar-r3.dtb: sound: dai-link@1:codec:sound-dai: [[275], [276], [277], [278]] is too long
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: google,sc7180-trogdor: allow up to four codec DAIs
      commit: 853a954bf506c42c91b2d2b0d57be891a659ee5a

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

