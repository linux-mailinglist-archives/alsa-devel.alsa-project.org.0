Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C542891913
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:35:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90FD2CBB;
	Fri, 29 Mar 2024 13:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90FD2CBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711715707;
	bh=IILtF9tSsWuvGOpEPCx8H2bDnQGM42QHz2TEYyNEtMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tc2BMRl64cTKP0GST/TGQxuaOTLUSp8YahergrsXN8vk9UclfCdk2l4eE7JDCXoXf
	 05Lgsu63B/DfcB95yC1+uZDWQl7RbYa0O+ErV6xHZ2RGDojQ6iSESf7EAt2mtJ2iiD
	 6cAI199BnCVWYK+LWj/ZIEMnkOE9N86QeLIhKO5c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C77CF805C8; Fri, 29 Mar 2024 13:34:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F53AF805D3;
	Fri, 29 Mar 2024 13:34:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58F8DF8055C; Fri, 29 Mar 2024 13:34:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 427FCF8025F
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:34:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 427FCF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sztq18cL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9E946192D;
	Fri, 29 Mar 2024 12:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39541C433F1;
	Fri, 29 Mar 2024 12:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715645;
	bh=IILtF9tSsWuvGOpEPCx8H2bDnQGM42QHz2TEYyNEtMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sztq18cLNMkWSlCr7Tgtuvt2ijOxcVa0KBn9XnbWMmhZbpZpGBO0n2clnMq/+wI/D
	 VZPpkx4ewaXfNtzWS7y4pzccBJIRQzRTf4zuvhjoWiGKdeserypZ+mGNZxZQAoKhKn
	 IiIxlHkabRQeZ7AVww86vGUhjj6DEqy4aeo5cVpaD220EOnS5zSDbMUZVjeZwORcQR
	 b3D6YcVmXmIoxA9jo9bjDWI72LWsbsx0u0ef+DH/xYT3dafi4yi96YhtS6YeJf2dN6
	 ZAUlAp/n8VRxA7Tmn/yQ4et4SK826fapc6XyBiAeS3DlR791XLRudqZf6u52uBuO06
	 SCGbjyXJNuOhg==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
 YHCHuang@nuvoton.com, KCHSU0@nuvoton.com, CTLIN0@nuvoton.com,
 SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
 dardar923@gmail.com
In-Reply-To: <20240327075755.3410381-1-wtli@nuvoton.com>
References: <20240327075755.3410381-1-wtli@nuvoton.com>
Subject: Re: [PATCH v5 0/2] ASoC: nau8325: Modify driver code and dtschema.
Message-Id: <171171564196.7557.2053181572527484871.b4-ty@kernel.org>
Date: Fri, 29 Mar 2024 12:34:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: TIQTOVS6SBAWLEQSHJ5UJFO5V4LR5RUL
X-Message-ID-Hash: TIQTOVS6SBAWLEQSHJ5UJFO5V4LR5RUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIQTOVS6SBAWLEQSHJ5UJFO5V4LR5RUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Mar 2024 15:57:53 +0800, Seven Lee wrote:
> Revise properties description and use standard units in dtschema.
> The unit conversion driver based on the attribute must also be
> changed accordingly.
> 
> Change:
> V1 -> V2:
> - Revise the driver description part for the C++ comment.
> - In the nau8325_clkdet_put function, modify the max variable to hard code.
> - Removed "Clock Detection" switch control.
> - modify the "ALC Enable" switch name.
> - Revise the dtschema for "nuvoton,dac-vref".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
      commit: 2e4c003b3672085267a358ebf82129b4e08dd64f
[2/2] ASoC: nau8325: new driver
      commit: c0a3873b9938bfaa77bd337cad33266a50a6583f

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

