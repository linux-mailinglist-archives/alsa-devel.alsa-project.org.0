Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF794C6BB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:07:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B37E80;
	Fri,  9 Aug 2024 00:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B37E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723154857;
	bh=4qDVAjJfZJck66hTltxpHpYd6rfa84s00JWu0atPoDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C4m1sKhZZERNpX4jJGJ5IiiKvocsbOdBL3n1HjRdaIBNUaCYgROCpc3zEpJ1j6VRz
	 euhd3NcFta2A2PwpWSGuTs+r5Okn1Izcb4+jSXziJZBbnbGVB7adEVqsbtjf8es8xP
	 Fa+4W0hNq0l1rhOyh4Lin4M5sF6UkABKRPU1QS7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12A52F805E6; Fri,  9 Aug 2024 00:06:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E514F805BD;
	Fri,  9 Aug 2024 00:06:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F935F8047C; Thu,  8 Aug 2024 23:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28322F8023A
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 23:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28322F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XnDsAlGR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 267C0CE1669;
	Thu,  8 Aug 2024 21:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62D5C4AF0C;
	Thu,  8 Aug 2024 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153621;
	bh=4qDVAjJfZJck66hTltxpHpYd6rfa84s00JWu0atPoDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XnDsAlGRPM/2ZTTer/eUU69MDS2XWj6RVEI/S2Q5jVPCjGHSADI7izX3KPyJrLWPf
	 nd5QNC2584o8dsyCcGgRkam5I67qT6G2zO4qE4BwNfa1/lyeGvA+jz14R2QGR/GTaJ
	 M0GoOrne1v5aDNz3YZzz8tKt9MOyBQ+HxhUKcI1cbwIG3jxQfZmVfVZhe4pk+zGcGj
	 Et88J0b1EsujTi4sDFvKoLWV+1UaV7LLKrz3qvHuZckWLGKKH8mGerXntDmbUhxRVT
	 nGsCbGcI8ENlfRl2bx0l64ZtJVad85d2R8SvT6EBqvM0TdU2zGyh3fdyws44iHV7OC
	 /9+0fKuTDjpkA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset
 GPIO polarity in example
Message-Id: <172315361817.480667.1573735001583504478.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:46:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: F73DES4OXZELU6H7OUGGNJMSJTGHC25R
X-Message-ID-Hash: F73DES4OXZELU6H7OUGGNJMSJTGHC25R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F73DES4OXZELU6H7OUGGNJMSJTGHC25R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Aug 2024 13:49:28 +0200, Krzysztof Kozlowski wrote:
> The reset GPIO of WCD9370/WCD9375 is active low and that's how it is
> routed on typical boards, so correct the example DTS to use expected
> polarity.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset GPIO polarity in example
      commit: 2f3e2c9eaafc272266344d777f8de44f8632e247
[2/4] ASoC: dt-bindings: qcom,wcd934x: Correct reset GPIO polarity in example
      commit: 55922275702e112652d314a9b6a6ca31d4b7252e
[3/4] ASoC: dt-bindings: qcom,wcd938x: Correct reset GPIO polarity in example
      commit: 871f1a16fa3506487de24b05d68be45e9185e77a
[4/4] ASoC: dt-bindings: qcom,wcd939x: Correct reset GPIO polarity in example
      commit: 81f88fddef9cddae6b4e5d9359022c7a2a3e3b6a

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

