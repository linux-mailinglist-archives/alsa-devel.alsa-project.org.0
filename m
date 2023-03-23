Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63BE6C6AEA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 15:27:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11FDCED3;
	Thu, 23 Mar 2023 15:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11FDCED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679581673;
	bh=BxUWwP+iAOQ+SG6kJMMOZXbIrO91BZemv4CMzp97bBY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O+fI4GnhGFc1lEYLDTi/cW2wBfj01nBw1DYpv/U/Py/N6tkDeU75KyHLk3wXi9dj4
	 5DIAvRwzGeo6zC1nHFJAF143pcFf4COXsudNnqwxgjb2rdAH2KgzYQZtOuAgbdP/nA
	 zK7cRO5p+fqPLFV+riAcQGbbXmfjNDI79aqtfIfU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D99FAF80533;
	Thu, 23 Mar 2023 15:26:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9896F80529; Thu, 23 Mar 2023 15:26:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A527F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 15:26:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A527F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EBJPfNeb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 27798CE222E;
	Thu, 23 Mar 2023 14:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EB9C433EF;
	Thu, 23 Mar 2023 14:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581562;
	bh=BxUWwP+iAOQ+SG6kJMMOZXbIrO91BZemv4CMzp97bBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EBJPfNebcNG1SWw2N37+UOwOGfeZwbuaR4LEdY2XXc20KCOFInxQigG9GThtjqdAc
	 V/1YSwRLvIbZd8o3rBKH8Rv/AcZJkriOJJmH/YgqLPJtIyyHYvf4rt1TXvBAzItBz6
	 rhO+O6ZJChcTLUa+FWQdwc08PraEJeu/6CPGPlv5GQqB5vegaplnnP1Gohen749GK0
	 funKXHdr9mjMdD5TdB9liAG5EZzj3IT7VP820u7KhzRe5tlqkFxa1UONz9J77YJD37
	 JFXBTXENwtFH9JMuub2RGt/Sd/dyDPg5PdJOUk2+jM3da1scblGDQ6JRE5usrR7Zzm
	 VgQO5iZN0ULQQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322193541.827291-1-krzysztof.kozlowski@linaro.org>
References: <20230322193541.827291-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH v2] ASoC: dt-bindings: wlf,wm8994: Convert to
 dtschema
Message-Id: <167958156079.49176.4063439994475887186.b4-ty@kernel.org>
Date: Thu, 23 Mar 2023 14:26:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: C3ZMM7WE7A4YDYRN4LJOKWGXY6JWO6TW
X-Message-ID-Hash: C3ZMM7WE7A4YDYRN4LJOKWGXY6JWO6TW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3ZMM7WE7A4YDYRN4LJOKWGXY6JWO6TW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 20:35:41 +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM1811/WM8994/WM8958 audio codecs bindings to DT
> schema.
> 
> Changes against original binding:
> 1. Add missing LDO1VDD-supply and LDO2VDD-supply.
> 2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
>    gpiolib already looks for both variants).
> 3. Do not require AVDD1-supply and DCVDD-supply, because at least on
>    Arndale board with Exynos5250 these are being supplied by internal
>    LDOs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
      commit: 80404e4e13882cf3037577e4a3451a61d54f58db

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

