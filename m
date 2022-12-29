Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646E4659131
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 20:25:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07480857;
	Thu, 29 Dec 2022 20:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07480857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672341906;
	bh=QfEfCXuB3KnMw1xvHWaFThHQXYDT3cNkR3iYoi0JilI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/n1NHCSUroYniiLipT9wLz+ND3Q356yEQiMDL8PYJbAk7w5mixMCcnHrGvjX7NQJ
	 u15nhV198IcJQke4smZhLwLcRWPEAU3bXHztWMPrPK7vZViPMuJrQ6os6PrQuMwVf6
	 MeI0s7EDTJbazjo6fw3tL5FzUn415oMus5h2RPNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B04F804F1;
	Thu, 29 Dec 2022 20:24:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E060F804E4; Thu, 29 Dec 2022 20:24:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02894F802A0
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 20:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02894F802A0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SYAi5U2n
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1FB7618C4;
 Thu, 29 Dec 2022 19:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42338C433EF;
 Thu, 29 Dec 2022 19:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672341847;
 bh=QfEfCXuB3KnMw1xvHWaFThHQXYDT3cNkR3iYoi0JilI=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=SYAi5U2nAYUqRLRbDWTxgSBv1EBNXajIW3Je8zYc8NUwBmCIT9kPyu8Ku7EayImIm
 sPcidnghjju/wb0cWS51lXSRr4a0aWEz4n1sJH4mG9olD18AwOHGKI4IQLoOMuqZln
 07efZuVqvlOl3QTe61JdrZ95O3Wgvy8jIMuX5TTNToLxwHv+7bwYVlPDES6UJZLqPl
 +KDgWwA81V3MI7JzoWFcytkUNnOS7GIzKD04ssT73+ybbpjVo6exlrZbQt9S+FVnoo
 knGv1BrSG7zWeJ2vsbAS1IhZ2UHERBOhHwAWQ12GUG0ICL30tMk/CcgKHxS/w/vDKe
 yA0UWZR7OcI3w==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221224154210.43356-1-krzysztof.kozlowski@linaro.org>
References: <20221224154210.43356-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs35l41: add interrupts
Message-Id: <167234184391.14869.3164540842887983898.b4-ty@kernel.org>
Date: Thu, 29 Dec 2022 19:24:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 24 Dec 2022 16:42:09 +0100, Krzysztof Kozlowski wrote:
> Both DTS (SM8250 and SM8350 based Sony Xperia boards) and Linux driver
> mention interrupt, so allow it to fix:
> 
>   sm8350-sony-xperia-sagami-pdx215.dtb: cs35l41@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: cirrus,cs35l41: add interrupts
      commit: 642e4f9bdac8d42d5047312e76bab7ceaf4c131e
[2/2] ASoC: dt-bindings: cirrus,cs35l41: cleanup $ref and example
      commit: c1b9c2f02ed796a6cbbfceacb14f7c5f5c7ac94f

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
