Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715AE8070B5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 14:15:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E2DD857;
	Wed,  6 Dec 2023 14:15:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E2DD857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701868546;
	bh=EStk6AojKy4VrHDz7eSOQKX/7HbeZy7ZzJ/2crabbHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AKVbmr7r+gqecLb1aYAxjBOCjiAoUbzCgEXTxXH/tvYUkwF7nmCyb/ZXYeVOiUIH1
	 BafJbW1+kI4AZov2goylJfpRrCZycfFlNBwICUAvLLQMyaKtAEbnDJ3jqBR0SxkEVz
	 G5BPkgi5fzJfxkPdB2OyRatFMUXaeywRctGFnhPI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08550F80578; Wed,  6 Dec 2023 14:15:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13DFBF80570;
	Wed,  6 Dec 2023 14:15:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24515F8024E; Wed,  6 Dec 2023 14:13:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57305F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 14:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57305F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pUHMnBj0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10596CE1DF5;
	Wed,  6 Dec 2023 13:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E6FC433C7;
	Wed,  6 Dec 2023 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701868372;
	bh=EStk6AojKy4VrHDz7eSOQKX/7HbeZy7ZzJ/2crabbHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pUHMnBj0fpV+uqC8lC/kqLL2SDwI80ZQvcD8acliYpy+7Mx25yFwsyR8EnLmLATER
	 DJNzK3a6Z8osyx1yUzskQq8PAGIfJQHZqEg4ND/T9pSa4fMwrCj7MKAaWnpAKrnE1s
	 UPHRFLp/CvVHDqYRczUb7LpV5Hw+E/F3MlJ9gp4qmJ9f9BeTly+H68k3m5WnYKqVBb
	 ykdzlvyp/Oig+Mj/ZdrrYgBYjbpkvFSgGvqtE0ypoPsVADMwYAtCZNHPbyXv5TGVZq
	 fj3/ZeUSAb32tMlZ0DuJM3o8I5ghrDV8QYkSVwbz8x5hycvMQ3Mgjei4KI9vs2qQq2
	 ypjE16CzHOXgQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, ranjani.sridharan@linux.intel.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20231205135001.2506070-1-rf@opensource.cirrus.com>
References: <20231205135001.2506070-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw_cs_amp: Connect outputs to a
 speaker widget
Message-Id: <170186836988.22386.11650594415666700683.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 13:12:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: R3VKUDL4V3YIRDTI47GSH5ZL5Z2R64OU
X-Message-ID-Hash: R3VKUDL4V3YIRDTI47GSH5ZL5Z2R64OU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3VKUDL4V3YIRDTI47GSH5ZL5Z2R64OU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Dec 2023 13:50:01 +0000, Richard Fitzgerald wrote:
> Hookup the CS35L56 DAPM_OUTPUT widgets to a DAPM_SPK widget so
> that there is a complete logical path to a speaker.
> 
> There is no particular reason to use multiple speaker widgets.
> The CS35L56 are designed to work together as a set so they have
> all been connected to a single speaker widget.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw_cs_amp: Connect outputs to a speaker widget
      commit: 138a4e2a26ec73197e22fe64ee3957b1594eabb3

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

