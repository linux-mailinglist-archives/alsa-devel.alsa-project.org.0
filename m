Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7176009F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 22:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E5E200;
	Mon, 24 Jul 2023 22:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E5E200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690231545;
	bh=p/ap3MKguxPUquRuLWWTllQI9EQQ90lnxeIaQEz5eQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IUEwRp5Ruznh4UD35fbbkMghc+7O4G1smbdzgM4g+ZdDI988UvuxUj/+qsLUMILYe
	 9RwwSh3iudsCFraIWmCfQWS9Fj64cIf5SdKqMIf9BjYRmeoPTPI5dzAP768+aaV4UV
	 uBk8rVAVa8rD3qDmnnoK2lypD2AkNP32W8Sdspyw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4478EF802E8; Mon, 24 Jul 2023 22:44:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1D4CF80163;
	Mon, 24 Jul 2023 22:44:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 692A0F8019B; Mon, 24 Jul 2023 22:44:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3E7CF80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 22:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E7CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hykItMwS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 523BD6138B;
	Mon, 24 Jul 2023 20:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956B2C433C7;
	Mon, 24 Jul 2023 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690231476;
	bh=p/ap3MKguxPUquRuLWWTllQI9EQQ90lnxeIaQEz5eQo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hykItMwSpvKlh/PGGl1YdXEko1WGWeg7Nrw8boEhFwqv2GsqBeDQhJthZeGfHW/Zm
	 2TR25JKs4zDmeavbBmCGmFvKXQfBRBYLwcAo41dwO3zrd+bYQr8mLSOni0BcE6oyoW
	 GeOLWKSRnevvj75NDNTr1EsDq0cEkdgwezQB3QYVceMuQojzJ7Qhi+KFPZwicbZE0L
	 xc7VTKdiK4+Nh1NGnNR3+NOdrDgc7x6jkzJm2onR1Ua3Sl0G2koYRlcdpLl+seeT5Y
	 3t9HpzqpFRfLKyUHlgU6fxRHyS9mLM/pr5ESgTf1G5Nn/85DuRlfzDRP5jVqPwYEdW
	 +HB/AosrIlRWg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
In-Reply-To: 
 <20230723-asoc-fix-wm8904-adc-test-read-v1-1-2cdf2edd83fd@kernel.org>
References: 
 <20230723-asoc-fix-wm8904-adc-test-read-v1-1-2cdf2edd83fd@kernel.org>
Subject: Re: [PATCH] ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0
 register
Message-Id: <169023147532.1355011.6311727659376527126.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 21:44:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: TUFHHBMVMW43JGHSESIPZ4C3SXANJU3F
X-Message-ID-Hash: TUFHHBMVMW43JGHSESIPZ4C3SXANJU3F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUFHHBMVMW43JGHSESIPZ4C3SXANJU3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 23 Jul 2023 00:27:22 +0100, Mark Brown wrote:
> The WM8904_ADC_TEST_0 register is modified as part of updating the OSR
> controls but does not have a cache default, leading to errors when we try
> to modify these controls in cache only mode with no prior read:
> 
> wm8904 3-001a: ASoC: error at snd_soc_component_update_bits on wm8904.3-001a for register: [0x000000c6] -16
> 
> Add a read of the register to probe() to fill the cache and avoid both the
> error messages and the misconfiguration of the chip which will result.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register
      commit: f061e2be8689057cb4ec0dbffa9f03e1a23cdcb2

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

