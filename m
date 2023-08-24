Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB069787908
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 22:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF3B020C;
	Thu, 24 Aug 2023 22:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF3B020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692907260;
	bh=f35I8Lcz8ZvNMk25B59ccn0rxCT5E2m/l8Z16UXY6VU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lAROcTR5ccNDCCldQ/hjbNDnRvXq1U4hpFT1IVkzt/XEtz/L/zDRwypb/O5OhGllw
	 RzAEILQ8MaiLl6O1EgFTJr1UugCadyAmTEL3A3jhGA/s8LH+zvGFvRIj6gPmB6yO1X
	 fYQ2uz3AP3eWT37JhORDaItMCOsXJ9TSLbuDdRgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 206B1F800F5; Thu, 24 Aug 2023 21:59:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 261EDF800F5;
	Thu, 24 Aug 2023 21:59:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E6EF80158; Thu, 24 Aug 2023 21:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36DD2F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 21:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DD2F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nbU36nyz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5C121670DE;
	Thu, 24 Aug 2023 19:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67FEC433C8;
	Thu, 24 Aug 2023 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692907179;
	bh=f35I8Lcz8ZvNMk25B59ccn0rxCT5E2m/l8Z16UXY6VU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nbU36nyz7ZRtAKM/+Mrl6qdm2MiU3UGQDQB940l3FSltE6Zhuz4UYPfdOceI5EpGL
	 9X5z0d4UJHXQnhUrkV4aDseXB9z5u/9KFBxFLMXezfMb1UkzZEaIZTKnArDPq3BMRe
	 F7WQ+Ld2cSGdsra42CNV0D9ErBhH76M6n6fhEAcKyNUDIPVM0cKxB6d3g4nnzRmb20
	 ulhDU03IxxKkxprNiZyJ1VDPNx2csz7dGkSZbMwlEdHsoXMqwFs9yED7l39eElb4Y3
	 mkckBbCmWoJ/X8qIq+EqOv+YTa1AaaPSFz3b4Dx3Tszu8oymCE1scTmzFBlAA1yB+9
	 Lm5E54WEyaa6w==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 prosenfeld@Yuhsbstudents.org
In-Reply-To: <20230824011149.1395-1-mario.limonciello@amd.com>
References: <20230824011149.1395-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ
Message-Id: <169290717746.2976757.15163430161228318501.b4-ty@kernel.org>
Date: Thu, 24 Aug 2023 20:59:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: RQGW25WD6N4SOZSDPTG5QTTYW5WT7WME
X-Message-ID-Hash: RQGW25WD6N4SOZSDPTG5QTTYW5WT7WME
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQGW25WD6N4SOZSDPTG5QTTYW5WT7WME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 20:11:49 -0500, Mario Limonciello wrote:
> Lenovo 82SJ doesn't have DMIC connected like 82V2 does.  Narrow
> the match down to only cover 82V2.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ
      commit: c008323fe361bd62a43d9fb29737dacd5c067fb7

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

