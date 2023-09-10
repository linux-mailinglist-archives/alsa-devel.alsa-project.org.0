Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11051799F47
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Sep 2023 20:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6184983A;
	Sun, 10 Sep 2023 20:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6184983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694368894;
	bh=7pMVydPneVg3URKXwfaH+adzpHN2LLjVZsTSGuRN/Dc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JMz6SdkAt3m9/TPSlvVKDYNhTtAoFEL4PBQKFJ0+Kk9wnVAwtah6S+16O+z9PlhA9
	 FZq++jwja08dBIihhPCN4w9LQ/444v1BF1PFo6mP1nN+nByULkPxzIrTqgNx7QWaps
	 hvwFow4jfbzgmc0wZkJ0Zbir0DdSaHi7sbZ8cZzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1044F80537; Sun, 10 Sep 2023 20:00:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8ABF80246;
	Sun, 10 Sep 2023 20:00:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E51F80425; Sun, 10 Sep 2023 20:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9D94F801F5
	for <alsa-devel@alsa-project.org>; Sun, 10 Sep 2023 20:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D94F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WNCcNX0j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55F8FB80CA9;
	Sun, 10 Sep 2023 18:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D277FC433C8;
	Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694368821;
	bh=7pMVydPneVg3URKXwfaH+adzpHN2LLjVZsTSGuRN/Dc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WNCcNX0j78tRLBxMWD5xHUNdVWsV4X1c4GJprcT9133xluNlViXTJ+y1MbbMmvw4S
	 9l6p0mwmq1ciXkoHmtsYyK8lFvb1p3EVodnEbrR25eIRn+6jRHWBjTxm2wzjyRS6Mh
	 /jvEouU2JwW8Gm/EnKA/L+ncaZS7ANxE1SqxSdP9VAlRZQQbAQGSZNr44Pfjzomk2O
	 YmugA3EJ+2/4ZTwGg7O1MhyTBgt+SEpxLAiqRaqU5NrZ9WSluxkkNsOvrlaLWdV7jR
	 voEyBX1vKb3bWRjPhlJDd4v26hqNBBRPVghPsTewXgHu/u+K2aUEWjjrhAgY/J0FrG
	 nZp7NWsEXqO2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B8F74F1D6A8;
	Sun, 10 Sep 2023 18:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/11] add missing of_node_put
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169436882175.20878.16500068409286410519.git-patchwork-notify@kernel.org>
Date: Sun, 10 Sep 2023 18:00:21 +0000
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
In-Reply-To: <20230907095521.14053-1-Julia.Lawall@inria.fr>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 rui.zhang@intel.com, amitk@kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, linux-mmc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org
Message-ID-Hash: 5IOH5U2EHUAG6DJCWHDJGTLITKAF5VGC
X-Message-ID-Hash: 5IOH5U2EHUAG6DJCWHDJGTLITKAF5VGC
X-MailFrom: patchwork-bot+netdevbpf@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XMV3HLG7OD5HCBY2QYQFNEOQYQZBPOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu,  7 Sep 2023 11:55:10 +0200 you wrote:
> Add of_node_put on a break out of an of_node loop.
> 
> ---
> 
>  arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
>  arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
>  arch/powerpc/platforms/powermac/smp.c                |    4 +++-
>  drivers/bus/arm-cci.c                                |    4 +++-
>  drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
>  drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
>  drivers/soc/dove/pmu.c                               |    5 ++++-
>  drivers/thermal/thermal_of.c                         |    8 ++++++--
>  sound/soc/sh/rcar/core.c                             |    1 +
>  13 files changed, 46 insertions(+), 14 deletions(-)

Here is the summary with links:
  - [02/11] net: bcmasp: add missing of_node_put
    https://git.kernel.org/netdev/net/c/e73d1ab6cd7e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


