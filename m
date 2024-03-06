Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FA87366C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 13:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054F3209;
	Wed,  6 Mar 2024 13:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054F3209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709728301;
	bh=Ix+FfAXcBUKh13sk+NOTEZ7IBFQR2jDzOXOAnRx0yKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BblQ9u9/B6JrVn0HBj6sdr2xwSqqnYma1/kKNZenLkMot0+Jmg4RUxNqfllu7use0
	 yDdow8NuXAoG33y3SGpPweC8m1QFg8VnEYAwVMPd7cSo5jIvzTrK8sbrm6zJ6mPJWl
	 i6D4AgF2d+vdd6ABrzEQXRsIaXV8MSld2i7pIka0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DD99F805A9; Wed,  6 Mar 2024 13:30:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95BAAF805CB;
	Wed,  6 Mar 2024 13:30:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 046B7F8024E; Wed,  6 Mar 2024 13:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6FDAF80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 13:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6FDAF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OwHuWyCM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2223DCE1D2D;
	Wed,  6 Mar 2024 12:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB2CC43390;
	Wed,  6 Mar 2024 12:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709728230;
	bh=Ix+FfAXcBUKh13sk+NOTEZ7IBFQR2jDzOXOAnRx0yKw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OwHuWyCMS3P3JaqWLfifteuKfRKiu58aIRAVz3urWEfqyZp0xETWff1hTlUQ+P9QC
	 L86aTv8MtN0CwTPXKER0F7HUZ+FfgHov8V4JT+iTUhPXKQ0GtEzRM95XzV6oUF0o0I
	 a2Erome4ZxFFYfgMTiweRa62mtFrGhMmKM5gKpXjoE3VhFLvLWhdRZeuNZIEZGJWef
	 WlYlWlgpbLW9zqWQjO87vKemv1dqoRI9ZzIXDmaBoTtepD9U8N53tbItgT7p2m0wpE
	 R78FywCN9oCyWl+MayYi+h1XUIBhAyBpc/uE4sy52SMz2+uDJdH72eDHfom425GUsj
	 l3rfN2kXSLz0Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20240305160723.1363534-1-andriy.shevchenko@linux.intel.com>
References: <20240305160723.1363534-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: atom: sst_ipc: Remove unused
 intel-mid.h
Message-Id: <170972822557.17598.8700374385096227275.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:30:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: 6564BW7FYVDQSKBMAVNQHQRQJKZBKMPS
X-Message-ID-Hash: 6564BW7FYVDQSKBMAVNQHQRQJKZBKMPS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6564BW7FYVDQSKBMAVNQHQRQJKZBKMPS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 05 Mar 2024 18:07:22 +0200, Andy Shevchenko wrote:
> intel-mid.h is providing some core parts of the South Complex PM,
> which are usually are not used by individual drivers. In particular,
> this driver doesn't use it, so simply remove the unused header.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: atom: sst_ipc: Remove unused intel-mid.h
      commit: 8fedf4f1d62ed058958e7a46aa62c0cb656dc040

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

