Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A687E9E24
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 15:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367C6852;
	Mon, 13 Nov 2023 15:06:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367C6852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699884460;
	bh=BImJbQdyy8K/BwKo67blmm2PDHtl8GBMMx8PUF5IKjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jYHnBxwvXzgunSJhgY0WMEkJa5MLh8+I9qoGUzQJBcNQcVPAESifJp7OCuWHyDsOh
	 omKe6GieLbsHK3I3YdpYfGAhBog9nDC94I4+hHQrmq/vk4fQYyC1sT+BFkFezwP81T
	 5AOMI06esxCAAj/4zkhkC0i2ziu/RVGDBwAVc3Es=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C00BBF80570; Mon, 13 Nov 2023 15:05:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21131F80571;
	Mon, 13 Nov 2023 15:05:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E334AF80249; Mon, 13 Nov 2023 15:05:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A433CF8016E
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 15:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A433CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Drbs0YDG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3130CE14E9;
	Mon, 13 Nov 2023 14:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8CEC433C9;
	Mon, 13 Nov 2023 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884331;
	bh=BImJbQdyy8K/BwKo67blmm2PDHtl8GBMMx8PUF5IKjI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Drbs0YDGgEsOUazwUsnBEIw4aoWbnNZQOWwkHKSyFutPSiDzEvqO+Wqr+EBcEWb90
	 +15VhmbfYsGx/LopTqZg1fRWozFvBr8a0Ex7/WQI0ShRjp682Bm7M39SAcWnCwMSw9
	 504WJ/b4SNY6nE+NTUTBFiRDerz2fxO1/NBf6aWVvUj+PV0Cz4RaZNjO2lAxRKuzjK
	 WtYgtYybkdGkLsQ9dGw2R6048DQFux+DHvW17Y/DSLTCU1MUKGFpnjB51D0pNKIzVl
	 20qyKVlu53f2KIFf16Y6rfJ4viBI+ZwF3JWTWTPcK7B15iCK2z6r6XZPJLILQkcw0k
	 fNsazvLHCl0FQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20231101140923.16344-2-robh@kernel.org>
References: <20231101140923.16344-2-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Simplify port schema
Message-Id: <169988432788.3280890.8324291358177866186.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ASILCELKSKALDRZ63HCLHJJYWIYCPXKE
X-Message-ID-Hash: ASILCELKSKALDRZ63HCLHJJYWIYCPXKE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASILCELKSKALDRZ63HCLHJJYWIYCPXKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 Nov 2023 09:09:22 -0500, Rob Herring wrote:
> The use of 'definitions' is not necessary and also problematic because the
> dtschema tools don't process 'definitions' resulting in this spurious
> warning:
> 
> Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Simplify port schema
      commit: 6d02f355c3d2fe86f503793e4df09898e9f9e703

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

