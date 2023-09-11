Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9D79A28C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 06:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2A0D6C1;
	Mon, 11 Sep 2023 06:36:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2A0D6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694407010;
	bh=HeAxVqUDbuPU8OlsjqH69CvpFFmY4UWq7/M/U9Q7wfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n5eUDqkyg66FXX/BLdCl81ELyLh5rbKBX4tWG0WLwhB/625EgzEi3QHifezWUiwRl
	 OpuwAAFvK5RnA6FiAC4PuQgZTpuAAIASie8nAhIpaiDmTMRaD3pUuse03+gOGyUxtN
	 glPqN41NtY8l/ELzIrgHqftfWjePAPvA/LhThT2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7FB6F80425; Mon, 11 Sep 2023 06:35:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 653B0F80425;
	Mon, 11 Sep 2023 06:35:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 097B2F80425; Mon, 11 Sep 2023 06:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6864EF800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 06:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6864EF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G85zgQQv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2E3960EFA;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21BFEC433C9;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694406700;
	bh=HeAxVqUDbuPU8OlsjqH69CvpFFmY4UWq7/M/U9Q7wfg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G85zgQQvJZg1Y5x8UnCyix+l2Yfn+Rogh9QvzeRm5oKG7U7YkZgrNdt1C3AgCbeIM
	 amofs9m/cffOZH9wjwwpOTybDZQoulvVrk94Nr5MH4SxlxbPPM70twdmGJ6kdEdzhs
	 k6WNSoqBV8upYywO+aAzkbPpmAnX2Rl84Y2IEbEyDo5lA3w0qTuvwNUESUvO7dcALV
	 XFFWvb/BnzKJj6gWPjOKY4MrxcSqPBDAZCwcOnS4PypiYAY8rhtUBZXmyHUw7q6VFX
	 KFKgpwDyWVJq3EX5QmmGA+GkOmL+KczLnAkLKnVQ987HqV1sDhgfou/6d7fGRPn6ng
	 FkWiamQUpTQRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 03727E1F67E;
	Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mfd: Explicitly include correct DT includes
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169440670000.22573.14595180245385997034.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:31:40 +0000
References: <20230714174731.4059811-1-robh@kernel.org>
In-Reply-To: <20230714174731.4059811-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linus.walleij@linaro.org, lee@kernel.org, thor.thayer@linux.intel.com,
 mani@kernel.org, cristian.ciocaltea@gmail.com, bleung@chromium.org,
 groeck@chromium.org, support.opensource@diasemi.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 cw00.choi@samsung.com, krzysztof.kozlowski@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 tony@atomide.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mazziesaccount@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-mtd@lists.infradead.org
Message-ID-Hash: VZE6TPAT2YS6FR7FUTDHAQQSMMKCPXAB
X-Message-ID-Hash: VZE6TPAT2YS6FR7FUTDHAQQSMMKCPXAB
X-MailFrom: patchwork-bot+chrome-platform@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3V36I3OWLETGK36A4PFWLLG2SV56ZIK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Lee Jones <lee@kernel.org>:

On Fri, 14 Jul 2023 11:47:27 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - mfd: Explicitly include correct DT includes
    https://git.kernel.org/chrome-platform/c/dc0c386e09a7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


