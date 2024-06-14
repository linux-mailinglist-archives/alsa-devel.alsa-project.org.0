Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 130BC9094D8
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2024 01:47:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF5AE72;
	Sat, 15 Jun 2024 01:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF5AE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718408831;
	bh=95jnULNHIyAe8VUlUTuzjPrBvu1cqlweV8jZzxqurCY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QJZbMwUh5zrimYh/X5Wp2QtqRy/ykibKo/8Pq9jaQo/euD5mBiuIEdAR5kc+Z9AqY
	 9e33+KI7T51gPU/+apXY2GE6GCSKufeSt8wTFCUG79BVFKAHO98gGPcv3tp/7cEkCM
	 De7MpKTeh4xLYvcYyOUR27grvZ8A0xQm/dtQQBdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58C7BF805BB; Sat, 15 Jun 2024 01:46:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE350F800D0;
	Sat, 15 Jun 2024 01:46:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3D34F80448; Sat, 15 Jun 2024 01:43:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E4BFF800E9
	for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2024 01:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4BFF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a7JyT5I9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 42CD9CE2BA5;
	Fri, 14 Jun 2024 23:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EC9C3277B;
	Fri, 14 Jun 2024 23:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718408623;
	bh=95jnULNHIyAe8VUlUTuzjPrBvu1cqlweV8jZzxqurCY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a7JyT5I9e6bfXybPWmdE8M6QwyH1I47W6EQ9pZsZXKvLmUwKZpRjgIOyP4VFXmyzP
	 yX9aB2Fb0pw/pZwxZtuf5fW0dUJyrLzEJaP3vd2N+d1tXfPZIP5ZWfz4S2IDlTrU3X
	 nZo5PEFQJ5uD8BLXHQE6eI9A6LnClMSwcTqCjNaAVMIHMznSwwcNwN3CBjoQcdsPu6
	 rqCPeYg4cyZUlEuNDOL1lrdXqZAjVJA31Qe973+84XbC4tIOek4WoQoBRRrnKnRwTL
	 WkNZ0unTfo/Y9hj+MlgEt6aJIFVFOM0L/9Zhc8XwdkPMEFLbZtYH15AkwN9jmXJyyc
	 syMXXvk5EfLug==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240613132527.46537-1-rf@opensource.cirrus.com>
References: <20240613132527.46537-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1
 DAI is hooked up
Message-Id: <171840862302.307440.2310063714501102380.b4-ty@kernel.org>
Date: Sat, 15 Jun 2024 00:43:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: BKTDD5S243JJRD2I44REWX4QTQ6Z3F4H
X-Message-ID-Hash: BKTDD5S243JJRD2I44REWX4QTQ6Z3F4H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKTDD5S243JJRD2I44REWX4QTQ6Z3F4H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jun 2024 14:25:27 +0100, Richard Fitzgerald wrote:
> If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
> sources should be initialized to disconnected. There aren't currently
> any available products using the ASP so this doesn't affect any
> existing systems.
> 
> The cs35l56 does not have any fixed default for the mixer source
> registers. When the cs35l56 boots, its firmware patches these registers
> to setup a system-specific routing; this is so that Windows can use
> generic SDCA drivers instead of needing knowledge of chip-specific
> registers. The setup varies between end-products, which each have
> customized firmware, and so the default register state varies between
> end-products. It can also change if the firmware on an end-product is
> upgraded - for example if a change was needed to the routing for Windows
> use-cases. It must be emphasized that the settings applied by the
> firmware are not internal magic tuning; they are statically implementing
> use-case setup that on Linux would be done via ALSA controls.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI is hooked up
      commit: 8af49868e51ed1ba117b74728af12abe1eda82e5

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

