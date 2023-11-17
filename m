Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074C7EF669
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 17:44:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43DC5DEF;
	Fri, 17 Nov 2023 17:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43DC5DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700239461;
	bh=gvJ81MvIpofL5H/zrzey3dRIS2kxO6OQQG4fitsei+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ugO+NWFi/Se5pxoYpt09mOlrvsW44Kryc6bBDaD/4HqKY9dHXpya4rZZaZUgeMsIQ
	 rXV0cXsSkJTb/tlwILOu8u6HfQm3cn+9Uuly2hNgJedcnChs8L7z1HGLWHKVbG2vDW
	 3UU7hnwXLCOE0ZdcZWTSFLHwRLdcFE4RUlYGLiAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1B61F80567; Fri, 17 Nov 2023 17:42:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53FB2F8055B;
	Fri, 17 Nov 2023 17:42:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB867F801D5; Fri, 17 Nov 2023 17:42:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 111F5F80152
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 17:42:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 111F5F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pNZbRl4U
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1F3C61DBE;
	Fri, 17 Nov 2023 16:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB21C433C9;
	Fri, 17 Nov 2023 16:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700239352;
	bh=gvJ81MvIpofL5H/zrzey3dRIS2kxO6OQQG4fitsei+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pNZbRl4UhAhvUKyP1eQt6PtXJUe7hzwXgLhAhEo9pDRJxa6fT0fIdfRvRmAcDz6Id
	 3JU8Hflm7ZYwpq7hk2+10/lFEM7QUyqfYR6+n4IvQMJF08QE92G51zIHqSiklfqmli
	 Z5CcXxaUI6XD9qqzJsBlIs2FM6HVx0VADn7OjPIM0awGGbv7DyM3gv5KUDOy6cdL1e
	 C+D/Op3DsQwk/IAjxtrpWru8YsBdDNkzPcycZoVOwq3AScMZmzX+kXsmhuy3tnTC4z
	 ioR0yJuxeN2Mmnl3LzLBshd2CjVcwfKwwJ6ICQwBgkOScVx64vdYshVyPDWgIqZWKX
	 Bbxx4IhC85N0Q==
From: Mark Brown <broonie@kernel.org>
To: Kamil Duljas <kamil.duljas@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116213926.2034-2-kamil.duljas@gmail.com>
References: <20231116213926.2034-2-kamil.duljas@gmail.com>
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
Message-Id: <170023935005.1567036.14058330217835865666.b4-ty@kernel.org>
Date: Fri, 17 Nov 2023 16:42:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: OZU6TXEFLJZK5HH2TXORLCVZIWVTKWLY
X-Message-ID-Hash: OZU6TXEFLJZK5HH2TXORLCVZIWVTKWLY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZU6TXEFLJZK5HH2TXORLCVZIWVTKWLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Nov 2023 22:39:17 +0100, Kamil Duljas wrote:
> The function has multiple return points at which it is not released
> previously allocated memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
      commit: 31e721fbd194d5723722eaa21df1d14cee7e12b5

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

