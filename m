Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7427B6F4A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 19:10:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0623DA4B;
	Tue,  3 Oct 2023 19:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0623DA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696353032;
	bh=kBYAiYxCZBMuNQp6t0UViUuBF5g4qPZxoWT5u3Qpvd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aSW4YvYstWniwXcGGtdsILuQtV8bWNiky0mv7cW28EcSl7UgG+N4ILAAfiXPezGKN
	 dK+y1cBjOAmxJoQLts89XWsUwhtxd9FIXOIAnT1oMuXUJMfgCUns1AzTEnrqzzuRRl
	 diAs0Yi2swez6fPSBdTatd0vu5i/xMtif2V9vraQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A485AF80567; Tue,  3 Oct 2023 19:08:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F95AF8055B;
	Tue,  3 Oct 2023 19:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7F4AF80549; Tue,  3 Oct 2023 19:08:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E87A3F80130
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 19:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E87A3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Efqav5Nh
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 67170B81A40;
	Tue,  3 Oct 2023 17:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05099C433C7;
	Tue,  3 Oct 2023 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696352919;
	bh=kBYAiYxCZBMuNQp6t0UViUuBF5g4qPZxoWT5u3Qpvd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Efqav5Nhw1v8H5daBY3EBv2WnSNt3YVcM0EK9r5hgI75lA+I9WakzLVSSG92btlMh
	 GvsApHqbd+enECQNbzlBMy9gmL+HqTxGzByAVgVoGuH5Bso4ReRbNaIhx2mDorfAwD
	 xq1xpu0EesldtYNUIifikkXN7maUJgw3OaW0z3QrEurxG2wJ4h/q0/lVIJbrcOwHL3
	 SJSbFll5inBoxMxcn6C1Qf0HXrJved4adQcBPkIM9Szp4atpgoXDHxFkYE+UrFWshO
	 quOjqLdYiExAW46OxLaIlPbEQmbiv87n/XSRLaIlnqYQmNXhYXNkvBQnV8vSmrPU4U
	 YJWe/l7dk3LTA==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Simon Trimmer <simont@opensource.cirrus.com>
In-Reply-To: <20231003093418.21600-1-rf@opensource.cirrus.com>
References: <20231003093418.21600-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Remove unused hibernate wake constants
Message-Id: <169635291773.42044.3364380749891490318.b4-ty@kernel.org>
Date: Tue, 03 Oct 2023 18:08:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: WJXLBG2TR6Y7K2AXI4ITWGHEEGQI5UT6
X-Message-ID-Hash: WJXLBG2TR6Y7K2AXI4ITWGHEEGQI5UT6
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 03 Oct 2023 10:34:18 +0100, Richard Fitzgerald wrote:
> The two CS35L56_HIBERNATE_WAKE_* constants in cs35l56.h aren't used by
> any of the driver code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Remove unused hibernate wake constants
      commit: d4e1417bb9e675ea2e4d4a6f993e3a9ae8118ac8

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

