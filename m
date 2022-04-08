Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D14F93F8
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A07193D;
	Fri,  8 Apr 2022 13:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A07193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417160;
	bh=8ar2IE7U2OBV0yRQQxBe+rTaTCjfYbb87WhMyA2tAE0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K43R58qBlfMGTimxX4KMa7rq1UY7XAibk23igpEeW6hNPs51WldJzraDn6PGUYNkr
	 12KAXaRL/UK2+KYbhPixHoJiXfXEa+yhLB00D+RNUHwN8nMXLSEGREXoReVOhXMO97
	 QOub+KB7UDPlnqdJG0qvEJzfyuHm9J4/PFYK7Nuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC148F80516;
	Fri,  8 Apr 2022 13:24:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 695E9F804CC; Fri,  8 Apr 2022 13:24:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67D6EF804B1
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67D6EF804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lTMBAPEO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1B3F61FB6;
 Fri,  8 Apr 2022 11:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C13C385A1;
 Fri,  8 Apr 2022 11:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649417055;
 bh=8ar2IE7U2OBV0yRQQxBe+rTaTCjfYbb87WhMyA2tAE0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lTMBAPEOSvUG10LrIcBdDDSZeOaHwTeWslLiWKyC3awhCb6fVzqJwqI39ms0qUoCb
 eGEa4BowvpbheCFeB67OVBdyBDNGs2v0FapP2xQPDZUI5j5CzDnS8fdY24iT+unDuG
 YQt6dmX7x38BM1OKWHaAtAMtzIfcr90Wd+IqoniHq8YFUwFOufp6YIsGWIWKoivj7k
 b8BmtYGgRLPPRY8CS3DK6uL8mHxBVq31LnD/PQM2+omdcOnAS3H5ck8C0EPH/mM09T
 jnz4F447UEGKbQQ1gLzXBvD7rjbnRSQRV9wY3McvOX8lLd+zGeKGwhiE7j7Rh56lCO
 5zJwXy3oSLWIw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
References: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: SOF: AMD/Mediatek updates
Message-Id: <164941705399.1295287.2437326201795619166.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 12:24:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

On Wed, 6 Apr 2022 14:40:44 -0500, Pierre-Louis Bossart wrote:
> Hardware/IPC updates for AMD and shutdown support for Mediatek.
> 
> Ajit Kumar Pandey (2):
>   ASoC: SOF: amd: Add psp_mbox_ready() and psp_send_cmd() callback
>   ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP communication
> 
> YC Hung (2):
>   ASoC: SOF: OF: Add shutdown callback for SOF OF device
>   ASoC: SOF: mediatek: mt8195 add shutdown callback
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: OF: Add shutdown callback for SOF OF device
      commit: fe70300c70baa82fd3024af9a1d2838610a35005
[2/4] ASoC: SOF: mediatek: mt8195 add shutdown callback
      commit: 5cfe477f6a3f9a4d9b2906d442964f2115b0403f
[3/4] ASoC: SOF: amd: Add psp_mbox_ready() and psp_send_cmd() callback
      (no commit info)
[4/4] ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP communication
      (no commit info)

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
