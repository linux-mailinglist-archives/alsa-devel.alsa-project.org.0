Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C729F6EAEAF
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7353E92;
	Fri, 21 Apr 2023 18:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7353E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093250;
	bh=FlXQm1fEN9u6O75yHHsPFV53qh0Uo1ZA/Wi9tm+vaxk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vPs64qdqUm86u+j4a3Gq7QQb2HqtzPqkX8Af4tN4IqTSsa3JTSl9iAJJHOvO8OqwY
	 +SungugRFNgOvJ4L6sGkS//fjKjQ9ypzKwXkmPbHyRIyd3fexetky8CoaiB4p2kDxO
	 P8sLzXn8JsW2P1TFvQ4av/xeVNSSH2+N0yI9i3T4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E53A3F804FC;
	Fri, 21 Apr 2023 18:06:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C59F804FC; Fri, 21 Apr 2023 18:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 062A6F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 062A6F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=on7TqySd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 973B261B50;
	Fri, 21 Apr 2023 16:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597D4C433D2;
	Fri, 21 Apr 2023 16:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093189;
	bh=FlXQm1fEN9u6O75yHHsPFV53qh0Uo1ZA/Wi9tm+vaxk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=on7TqySd6y0eNPxikOPCVRzHL/Q0To1x8Gc41EPhxcmS1vdhZwGGPQ/9BJCBAt66j
	 fxAS/qA2KbQLa6wgfIlwvcM+xyV3+ERyLYLKyFVhy9ay0PHaq+PmzK+uLPEOJ5UHHY
	 r/DE/uT1+FfNXy9sEjCwslywlsWor++8vBKdOUrVoyXPdfK3bXrtrY9+ykb9JPvZO7
	 ni3354WexkyPFnfO8C7siWub6qu+bF9aix+gQagtrZ73c/lR6+t+iqkkCK2ytedEhI
	 lox1DbHEHOHrqSBfNzDdIDpLAMdN2QtPFHiDqCJNuAcwEcqlwBdk1MOoLT/MIyPpUf
	 Pp3ALgjfYMnFA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
References: <20230406155026.18723-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: add no_reply IPC calls
Message-Id: <168209318805.108546.5968350444019472099.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: WNRSKGAZKKV4VZYSDQ7GN3QMFLMMZ323
X-Message-ID-Hash: WNRSKGAZKKV4VZYSDQ7GN3QMFLMMZ323
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNRSKGAZKKV4VZYSDQ7GN3QMFLMMZ323/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Apr 2023 10:50:24 -0500, Pierre-Louis Bossart wrote:
> Simplify IPC messages to avoid passing a reply structure that is not
> used later.
> 
> Curtis Malainey (2):
>   ASoC: SOF: ipc: Add no reply inline calls
>   ASoC: SOF: Use no_reply calls for TX
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: ipc: Add no reply inline calls
      commit: ccb541a00b5bf87f1b7b9301373bf88a3257c688
[2/2] ASoC: SOF: Use no_reply calls for TX
      commit: 367fd6ffa294ca3346902aa0814fac31bb5a6059

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

