Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8F79A2A2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 06:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E48B1E0;
	Mon, 11 Sep 2023 06:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E48B1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694407807;
	bh=jRbGX37pKE/flPAVK4KmRTNNYn+YjmtCaP+B5V/gVX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RdjDHpTheSoYVIgsrTyAISpPsHzYdrpvmmoxT1JA4DDABMiaamd5FJFWYRmocMCO+
	 kyxmgk7HXHUeoE8TceSYvc8MlteRLgFzhP9BRnbcTzr+CpW8nQfkzR0AMRXbzduwV5
	 4kIsgdV7hPoKc1hbKN6+hBN6n8z4ntR1S2+1V7p4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90E33F80246; Mon, 11 Sep 2023 06:49:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B63F80246;
	Mon, 11 Sep 2023 06:49:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCDFEF80425; Mon, 11 Sep 2023 06:49:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DDF6F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 06:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DDF6F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hRTK/O7z
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 12C0FCE0F28;
	Mon, 11 Sep 2023 04:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E1D7C433C8;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694407740;
	bh=jRbGX37pKE/flPAVK4KmRTNNYn+YjmtCaP+B5V/gVX0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hRTK/O7zd2EVcyRIHv/i0CAjz9UpjidahDXSIXk4ACb38jZ+6K0Q30pzOqZOLqypY
	 C75nnrtT8Yv6GiMTvD61pKvkFLRfhtUBVWtZcBLARUs5c+zflqjKF2vVtznLpozQoM
	 GCNDa18FhndrrkuE6m/0q7HCv7yOAC6mlWVm+BRnredL6UXg7U1td5nMObALXI8tDQ
	 4sZzvZ12uCsLziIZXf9AsxgF8FMszCNitekMmUlSZhzGlOAtLbZ6bAuUGQovA8xlPE
	 s6xIC6qIfoHYkDG9jnYDNje1UTc0fpBvjr9tsdVWGYlC4/aJBTcr3g4fKbEVro77gN
	 eo2XoPvZ0aheA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 122E7E1F67E;
	Mon, 11 Sep 2023 04:49:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mfd: Explicitly include correct DT includes
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <169440774007.22573.6670993122914766002.git-patchwork-notify@kernel.org>
Date: Mon, 11 Sep 2023 04:49:00 +0000
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
Message-ID-Hash: SIBUFZMAQKIBNSNESI2OZHBTHN6OWZHY
X-Message-ID-Hash: SIBUFZMAQKIBNSNESI2OZHBTHN6OWZHY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7IQKKNMKWFSK2YBZUKN5AUDLFPFGFT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
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


