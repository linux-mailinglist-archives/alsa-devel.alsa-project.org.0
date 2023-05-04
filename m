Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D926F650A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 08:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B2771860;
	Thu,  4 May 2023 08:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B2771860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683181847;
	bh=b54NE5I89A3lhMM6mWdX+VclYU5RjljTIR3b1SP852c=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iKXmHl/aM7iOxIip9JeGYcBgn3hBukr/r6ywt0E2j6OKBiE2f633EeRmwGLM5oiSZ
	 8Iuw5qQG0zrH1DadkVpNH2BgM6R4BvxnQuGKRKg8inPqBUvKVOLohDlzAbSr2dtGrB
	 Ej+6/hN8jn0bxFM3xya7Pp65dvYPQqpO9/Ay9tnI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E49F8052E;
	Thu,  4 May 2023 08:29:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45145F804B1; Thu,  4 May 2023 05:20:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FROM_ADDR_WS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4684F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 05:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4684F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dyyhnuLU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C4E761011;
	Thu,  4 May 2023 03:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79DFEC433EF;
	Thu,  4 May 2023 03:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683170428;
	bh=b54NE5I89A3lhMM6mWdX+VclYU5RjljTIR3b1SP852c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dyyhnuLU7pFJ1XVdfpjlzBM5Mxtq8K7PoXCGz7pojsdFtzzh6balilcfPSkYHYDAZ
	 DVfX6AT7NAs/3cKkn40orwrXy45FWa7DFZlIrZt8vSJgLKol2Nraoz8ew/UgVyqIYe
	 JFFc9vhKWSVu02EONECZcqVfDlZRcJpmphT7AnLaI3tWDCtDCgYTB3HR2mn4xdidTh
	 Xa8+ebcMPELlInXcTJtRjSQ88ueaS6vASJjKN4BmeS8k++UmhSDOOE7Um+22AzCTa5
	 rDiEgxqUUrMjsafYjobA1nN1KcRtqEA1RFc+2ubIOBDB8Y0W37mYpjQnCqidjZo53l
	 gSDi4i3z6k9Kg==
From: Mark@alsa-project.org, Brown@alsa-project.org,
	broonie@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Andrey Rakhmatullin <wrar@wrar.name>
In-Reply-To: <20230501185134.34591-1-wrar@wrar.name>
References: <20230501185134.34591-1-wrar@wrar.name>
Subject: Re: [PATCH] ASoC: amd: yc: Add Asus VivoBook Pro 14 OLED M6400RC
 to the quirks list for acp6x
Message-Id: <168317042537.151112.11044312649660889161.b4-ty@kernel.org>
Date: Thu, 04 May 2023 12:20:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J7PZERA3AFWA3N3CIFVC6G7BHYG7LCZO
X-Message-ID-Hash: J7PZERA3AFWA3N3CIFVC6G7BHYG7LCZO
X-Mailman-Approved-At: Thu, 04 May 2023 06:29:39 +0000
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7PZERA3AFWA3N3CIFVC6G7BHYG7LCZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 May 2023 22:51:34 +0400, Andrey Rakhmatullin wrote:
> This is needed (and enough) to get the internal mic visible and working.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add Asus VivoBook Pro 14 OLED M6400RC to the quirks list for acp6x
      commit: 4a1b5bc73e9ce8373d50fdb8f74badd2b4bf324e

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

