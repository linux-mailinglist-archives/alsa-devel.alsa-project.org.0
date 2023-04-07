Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81D6DB52B
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 22:25:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4D074C;
	Fri,  7 Apr 2023 22:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4D074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680899133;
	bh=9FClfZXbfwUUxo9TcUwkqtTlpUt1FbxWRUTVWlO/69Q=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KFyH779acqadI0Q92AuN7iH/dQvlW68rQivHmCommHyKsur5+Ex45FU5V4775U5PT
	 lHDuLwW0vdcQ6P85j7uq4EVkkJq7K8HsebeWkIjeeGFmk+w8VnTz2kJ5C7IiYf2MCZ
	 rhpG0X3Qpug92jZG57W0s58EAcbLOdOY//1MqpiE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04709F80249;
	Fri,  7 Apr 2023 22:24:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216A9F8026A; Fri,  7 Apr 2023 22:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6CBEF800E5
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 22:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CBEF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B2Q37Wjv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 158CD6130C;
	Fri,  7 Apr 2023 20:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B0C9C433D2;
	Fri,  7 Apr 2023 20:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680899068;
	bh=9FClfZXbfwUUxo9TcUwkqtTlpUt1FbxWRUTVWlO/69Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B2Q37Wjv8ILlngp3WFgVVGeICs02Ied7FnifoxQYKAhMiy2A5C/MM9qeCE9JDrvBK
	 vmAfwLFl8oOWftgvIcFbyjz3zQBenFcwYVNLG4BUuNnMCLXYIdJIpRSziCz4gFGR0G
	 enLqpdAmwhy9oQ7ReWeKSxb/C+OtlPOJ7Icca68G9nfOCDqUiVyY3I9mhZ+DFKXtls
	 jsji2YM4Sw6xgqMMGTWvEyy+wb7dcJFqN7PKr6yhxrFMXxPGzovgOLxrk/HBo4cplt
	 qXcPB/GvkwiZSQQ42p+3l55kTWa6Qspw5YhKC4IhRAxSFoMYBhvnMPLsPebtbWor0b
	 A8U9d+LTrr7og==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Saalim Quadri <danascape@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407170032.102412-1-krzysztof.kozlowski@linaro.org>
References: <20230407170032.102412-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: asahi-kasei,ak4458: fix missing
 quotes around hash
Message-Id: <168089906578.185708.11115149871475015227.b4-ty@kernel.org>
Date: Fri, 07 Apr 2023 21:24:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: B4C4CTWS4MOYDVVSW674KRKHZ4CILILQ
X-Message-ID-Hash: B4C4CTWS4MOYDVVSW674KRKHZ4CILILQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4C4CTWS4MOYDVVSW674KRKHZ4CILILQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 07 Apr 2023 19:00:32 +0200, Krzysztof Kozlowski wrote:
> The yamllint expect comments to start with hash and space ('# '), so
> quote the description to fix:
> 
>   asahi-kasei,ak4458.yaml:40:30: [error] missing starting space in comment (comments)
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: asahi-kasei,ak4458: fix missing quotes around hash
      commit: be5418dfc1460e82a005dfb9dd76e4ef846c203d

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

