Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B584D0DE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 19:12:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB2E868;
	Wed,  7 Feb 2024 19:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB2E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707329576;
	bh=YmZrsexK4Bjd9O/ZPQMxONpH+oVHxFDMDjM8ZyE4w9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QyAAsJ84dz5v2mrG/PEKWwwQuUBU2/1I3ERkOERMoHtHR6Ozf8bYhHxNO18x6BNgJ
	 lh5XF1zDUhsAHKBp5/1uxOwUBWfp4oh7FxWwBCPBA3K/V9dRFchOXddlLPn0JW08WP
	 YzoInaHsGueO7l1tnFZlm2aq5I/gyzUrCLIuo+Yo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BC2F805A8; Wed,  7 Feb 2024 19:12:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFAE5F805A0;
	Wed,  7 Feb 2024 19:12:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CF9CF801D5; Wed,  7 Feb 2024 19:12:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F356CF800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 19:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F356CF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CXqVcjou
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 526ABCE19F8;
	Wed,  7 Feb 2024 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757DBC433F1;
	Wed,  7 Feb 2024 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707329532;
	bh=YmZrsexK4Bjd9O/ZPQMxONpH+oVHxFDMDjM8ZyE4w9c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CXqVcjouyYiy4OwXn14wwdZPKH1X603iKq4XoMmOtioHGIeByIXHySydXKwwwD8oy
	 3652tnGyf6K0ulK2wQKEaq+BAwoboFC071dLN910WlLY9vcOzejhdD74ugM85BDOm7
	 NUEE95QAjBZdESrzOQlZEQ4OmoQ4HvDrXxqiwhQDE4bh9w+MORPv3kCPwnTp4azSOS
	 ukpTiZIVkQ7FWwnj16qFg9d/7VGa5RXULrkAsMxwLhUSIROXSWi9fYELO1pGG02kih
	 B85Jhis/tnw1VUr7j7g3rUmYe0yGejiqzXnWYJD5SIagCcKiykwjAwPoqNaSHuRy+g
	 IUz0zXC2KhGGA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240207122509.2222214-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207122509.2222214-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Expose FW version with sysfs
Message-Id: <170732952961.1093000.3665274145143025130.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 18:12:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: TYSNIZ756DE2PBBTQLPWPERMV523XB36
X-Message-ID-Hash: TYSNIZ756DE2PBBTQLPWPERMV523XB36
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYSNIZ756DE2PBBTQLPWPERMV523XB36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Feb 2024 13:25:09 +0100, Amadeusz Sławiński wrote:
> Add functionality to read version of loaded FW from sysfs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Expose FW version with sysfs
      commit: 148b93a5062d3738348fab813930615700a266c3

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

