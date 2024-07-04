Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EC927D35
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 20:36:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AD414DC;
	Thu,  4 Jul 2024 20:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AD414DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720118190;
	bh=x3m9D/QtwKRfrkMQATybZBTtL+idcV8O373Ppn4287Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VZ+6YDAI7/xX1RIJn+meTfosuphFoQOy33RClcyo73ackBf1YGubgvOrn4I9Uxk1V
	 ZT7+A3o26CdzMoBUbvRe4HLbD763ir6e+9HIoafZCFEu3LffLnFrnz1aTNbX2lz1s+
	 pflBffXUo5vSGf3axZnB19SJP7K4iVwp8vgziGwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FECBF805B6; Thu,  4 Jul 2024 20:35:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D3EF805AE;
	Thu,  4 Jul 2024 20:35:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B3EDF80272; Thu,  4 Jul 2024 20:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A370F800FA
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 20:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A370F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z7O6TYn9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EBC25CE385D;
	Thu,  4 Jul 2024 18:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D540C3277B;
	Thu,  4 Jul 2024 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720118141;
	bh=x3m9D/QtwKRfrkMQATybZBTtL+idcV8O373Ppn4287Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z7O6TYn9rH9U9DNLwoH+7LVOv1bT0wKHvm3jZsMwLwm0xQauZ5yqUfUICRZUaoqlq
	 uJOlm13ATmnokGbIaQS4Pqr8dQQLEw3sWGMj72OdlQxqk9QeMxj6eqQPbT0438060X
	 87MlttsNAmfJmWtgzDVyygHVih2fXs8IowOGn9NI+Q7HftzvIQSHZvS8fz8e/MpkyW
	 QBwuoEHCmbPlSvmhqy5LRSgg8L9iQ25LBZ0zbkOm5XRnxTtdc1RRmCNoXUN0620yJ4
	 uuGWj3Ebawe/NqmPrN4E+9iWGuywmvsf8voA1gEiNJ2ou78kI3UfLuwmlhaldRCK8Y
	 yxCgW+NAB73KA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
Subject: Re: [PATCH v3 0/6] ASoC: codecs: lpass-rx-macro: Few code cleanups
Message-Id: <172011813890.108577.12531319893239383182.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 19:35:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: E7DWBLBSF2WMDKKSPXO6GAS3CKHSXSJ2
X-Message-ID-Hash: E7DWBLBSF2WMDKKSPXO6GAS3CKHSXSJ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7DWBLBSF2WMDKKSPXO6GAS3CKHSXSJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Jul 2024 09:39:32 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - New patch #1 to fix clang jump warning ("ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm")
> - Link to v2: https://lore.kernel.org/r/20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org
> 
> Changes in v2:
> - Use cleanup.h instead of devm(), therefore not adding Dmitry's review.
> - New patch #5.
> - Link to v1: https://lore.kernel.org/r/20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm
      commit: 891168dc4a6c637ca76c64e7bde6917b96b9cd54
[2/6] ASoC: codecs: lpass-rx-macro: Simplify with cleanup.h
      commit: ee5e13b2c92324938c2bffc44b36b5a29fc28087
[3/6] ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      commit: 0c02cacf62fd90bf9f0c6c33e9a4862cfc50aab4
[4/6] ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      commit: bf95919fe1917efa8f5da83057ff9fc11130aa55
[5/6] ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets
      commit: c72585d79249fb07ca3e3c91022e312d21f20f40
[6/6] ASoC: codecs: lpass-wsa-macro: Simplify with cleanup.h
      commit: 67820eb9f4895791da46df42ff7942dfc1353bb2

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

