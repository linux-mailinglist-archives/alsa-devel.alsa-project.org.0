Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A190892451
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 20:31:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA3A72CD0;
	Fri, 29 Mar 2024 20:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA3A72CD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711740681;
	bh=kASKGM3dFtExpzEE03kTs35TIgPe+csliIufLHzIK04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RQCN7jAP8TZqumSN1hJaZmRMPX1PXiauqa6UN2chFINZzjiEkyri5YnIykWHduhD/
	 AMTT+PagJcKWcXwP7bENOPK1V+NgBC8yWhriL/B7uLmpYvtsbnzM1J3dumkwdes66i
	 C3YDpt9m+64L8AeFTbpvAWI98dzXtFgsl3x9bumg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5768CF805AE; Fri, 29 Mar 2024 20:30:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA36EF805A0;
	Fri, 29 Mar 2024 20:30:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7542F8025F; Fri, 29 Mar 2024 20:30:44 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A391EF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 20:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A391EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IVV3npmS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC73F619E6;
	Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 293A4C43390;
	Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711740633;
	bh=kASKGM3dFtExpzEE03kTs35TIgPe+csliIufLHzIK04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IVV3npmSePL8advnxP77niTJn9r5VWn3Rp+dlR8NGJ9lX2oLIqkoGV+xDPWNxKxDQ
	 Vy1L2g8YCGgRSXrLc/sQkv/2M4J9jxdAA8SAbhGR8ajFTlmfsqHLf0fvOTAPm2dcKv
	 R1fVsKFXQ0PjDCVdjZFjTagXNRerIfdbo2okMOvrjklmOXE9qqZC9SCAN3EPi44fip
	 ZCq07ahttvJ9JoOo07ITMoNBIgDCC6Y+Xv77EcLFfSARbiSqQFxIHg2hw6SwpkmRbP
	 ts7yiXSanAtz/RnbfgXbCMeoFa7uggmPCtKepIwsnK9u0syfJQLIrvmxPSuoFye3BV
	 B+EvADBhn/jTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0FC90D2D0EE;
	Fri, 29 Mar 2024 19:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/9] enabled -Wformat-truncation for clang
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171174063305.18563.745216419087873927.git-patchwork-notify@kernel.org>
Date: Fri, 29 Mar 2024 19:30:33 +0000
References: <20240326223825.4084412-1-arnd@kernel.org>
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, arnd@arndb.de, dmitry.torokhov@gmail.com,
 claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, kuba@kernel.org,
 saeedm@nvidia.com, leon@kernel.org, aelior@marvell.com, manishc@marvell.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, luzmaximilian@gmail.com,
 hare@kernel.org, martin.petersen@oracle.com, deller@gmx.de,
 masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 johannes@sipsolutions.net, perex@perex.cz, tiwai@suse.com,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Message-ID-Hash: 72RGR72GDYTWIPSMBFXNF5J3RTEHNIIH
X-Message-ID-Hash: 72RGR72GDYTWIPSMBFXNF5J3RTEHNIIH
X-MailFrom: patchwork-bot+netdevbpf@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCTGHLBDLXDEDWQGYHC6PY7LVOPBEUTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 26 Mar 2024 23:37:59 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With randconfig build testing, I found only eight files that produce
> warnings with clang when -Wformat-truncation is enabled. This means
> we can just turn it on by default rather than only enabling it for
> "make W=1".
> 
> [...]

Here is the summary with links:
  - [2/9] enetc: avoid truncating error message
    https://git.kernel.org/netdev/net-next/c/9046d581ed58
  - [3/9] qed: avoid truncating work queue length
    https://git.kernel.org/netdev/net-next/c/954fd908f177
  - [4/9] mlx5: avoid truncating error message
    https://git.kernel.org/netdev/net-next/c/b324a960354b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


