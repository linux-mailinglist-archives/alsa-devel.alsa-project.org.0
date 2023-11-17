Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C247EF66A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 17:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC8A4DF9;
	Fri, 17 Nov 2023 17:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC8A4DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700239465;
	bh=AKSfLOlfcLc2baSDoxZreUCl/cMyMPiua8siyDJo9uQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SKT+smEBcUHMgUqJ7lFzbfuQGffzySNf58pGGCp0ickyI4YvreewMgZppcgiQ7lpw
	 BQvmYbEDHzVG05tX9ardJN//kjHSypF+eR6rqPKnjvNU1uIiYzbDvsazfkqKNTbgHs
	 RQ9K+UjltGS7HnLA2LmK+4kpLFB7getZvTqBWPj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DA2BF8057A; Fri, 17 Nov 2023 17:42:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EDE2F80571;
	Fri, 17 Nov 2023 17:42:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A80CF801D5; Fri, 17 Nov 2023 17:42:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71CA6F80093
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 17:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CA6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yy0TjjCq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE6B361DCB;
	Fri, 17 Nov 2023 16:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B3CC433CA;
	Fri, 17 Nov 2023 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700239354;
	bh=AKSfLOlfcLc2baSDoxZreUCl/cMyMPiua8siyDJo9uQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yy0TjjCqjOGZ5XSTrsZMUxV9QfXgP30PO30Sw7bmUilV7CbvO++cFxNNCMQ6hRfNn
	 3J6tIHokOY/Y0puVN4w4fgPUyrPv1JMmU+3OBv2CWklnPavp3SCecZTTg/AeRTgUsd
	 IFlWA+JJ/pLM+jT5J3RLiWGRamb9t2itT+v8pTMMTYcEZ+Usgoutri6LqivirXKpaw
	 pDi1wIyTT8mz/nOlgZRydJWUd6nlv9DXxdL14MJChUnetk+7fjIrj7wGOXdLb2NWNt
	 yep2/peb4TZUbymqEzATJeWsQxGSCdzsl8f56Ggem4GN/8xvPxl/c+d/lNkhW3fZtJ
	 1faOgnNW4YVaA==
From: Mark Brown <broonie@kernel.org>
To: Kamil Duljas <kamil.duljas@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116224112.2209-2-kamil.duljas@gmail.com>
References: <20231116224112.2209-2-kamil.duljas@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: mem leak in skl register
 function
Message-Id: <170023935261.1567036.18201018889140734844.b4-ty@kernel.org>
Date: Fri, 17 Nov 2023 16:42:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 4DF26E5RNYNTDCY2CTHVNDTVJUYFR6H4
X-Message-ID-Hash: 4DF26E5RNYNTDCY2CTHVNDTVJUYFR6H4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DF26E5RNYNTDCY2CTHVNDTVJUYFR6H4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Nov 2023 23:41:13 +0100, Kamil Duljas wrote:
> skl_platform_register() uses krealloc. When krealloc is fail,
> then previous memory is not freed. The leak is also when soc
> component registration failed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: mem leak in skl register function
      commit: f8ba14b780273fd290ddf7ee0d7d7decb44cc365

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

