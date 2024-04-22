Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C201E8AC667
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 10:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAF8BE0D;
	Mon, 22 Apr 2024 10:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAF8BE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713773515;
	bh=lrAtAACNMRKkPVl9BmgLOc7v8tggNspHY9s2WWLZpRc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/NWAKM+HAXMKD9s/DidAuyZXUkkDUrmmsv3C49bsIa5/LNj3I8e45z1+/UHOhNtZ
	 We5AbqLM+hqaTAKz+BPz2PbbsgU2EWxHqCKpfdAwAR01WKOGEWdpv1kFds4UMA+faL
	 nVEqywCcQLpawMuYA0gLmPpR5uZuyAUcbYD6NzO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96E5CF805AB; Mon, 22 Apr 2024 10:11:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1CCAF805A8;
	Mon, 22 Apr 2024 10:11:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0936F80423; Mon, 22 Apr 2024 10:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EEA7F8003A
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 10:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EEA7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rK/qq5vb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1B3F8CE0A4D;
	Mon, 22 Apr 2024 08:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F09C32782;
	Mon, 22 Apr 2024 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713773356;
	bh=lrAtAACNMRKkPVl9BmgLOc7v8tggNspHY9s2WWLZpRc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rK/qq5vbzE6YvdpbLr0+h98Gn4+fgRViM07W9nW0ift0iRF3HXn+4281wnYI5N/5d
	 b8Q39bOySrS1oC1EoBJuOyxnALVuxMXGmAA3YI9StNnzj4JBivuZrpGhKWcQE1pTqh
	 r6TA6UfuzQFscpNiikKuSc3t/X9aIP0dXKmyIJc4ltbIP9qwi9eyvgDh4G9e3HZXsN
	 Z5nDpViHP0hy+kVzxMWhB7Fmx7K749dIj81sMELMe30nP9Z8jCSZYc8gfAu0ttWtsD
	 pQM2DKUtGg+Tod6FSxjfdExLpIf5I/VHCREKp9814wVE52g1JYsaniQ6nmzr/kGBu0
	 sHNsgGpydNDcA==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
 edson.drosdeck@gmail.com, u.kleine-koenig@pengutronix.de,
 YHCHuang@nuvoton.com, KCHSU0@nuvoton.com, CTLIN0@nuvoton.com,
 SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
 dardar923@gmail.com
In-Reply-To: <20240415070649.3496487-1-wtli@nuvoton.com>
References: <20240415070649.3496487-1-wtli@nuvoton.com>
Subject: Re: [PATCH v2 0/3] ASoC: nau8821: Add delay control for ADC
Message-Id: <171377335152.1755143.9849585932457146523.b4-ty@kernel.org>
Date: Mon, 22 Apr 2024 17:09:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: JT6LRD7NISUY4624KMBWCRRCOBCTEWL5
X-Message-ID-Hash: JT6LRD7NISUY4624KMBWCRRCOBCTEWL5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JT6LRD7NISUY4624KMBWCRRCOBCTEWL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Apr 2024 15:06:46 +0800, Seven Lee wrote:
> Change the original fixed delay to the assignment from the property. It
> will make it more flexible to different platforms to avoid pop noise at
> the beginning of recording.
> 
> Change:
> V1 -> V2:
> - Revise adc-delay-ms properties description.
> - Fix examples of bugs found by bots.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: nau8821: Add delay control for ADC
      commit: 467d2528d64e8fcf784850ac94f665efae2af149
[2/3] ASoC: nau8821: Add delay control for ADC
      commit: bd74e9c31f0d1880ff4482f1a7ce33a006d870ed
[3/3] ASoC: nau8821: Remove redundant ADC controls
      commit: ad8ba241bc93536a2c8af150b237c5be8fafe942

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

