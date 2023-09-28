Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 604007B215C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 17:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E224826;
	Thu, 28 Sep 2023 17:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E224826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695915114;
	bh=y+XzefTDuzOGmnvWULOFTtScjrjmZPiE+7bhlENCgY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hOayrPt+QuxJf5RONm1Cfv5ePVmp0V+kxXyZhqqHGdawyK+c8+dwEtNaXVXW+e9H0
	 ti6UDnzIESX/D4uApSCHVZKeAMXZSt4xzRF+R2WEU2DCaFe7WCLRB9MLPwoRVdP2zP
	 KdEha/2dUoPyZ/etEE19ugV+eLQL7+2kxixWuybU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A2B1F8016A; Thu, 28 Sep 2023 17:30:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 339A0F8016A;
	Thu, 28 Sep 2023 17:30:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DCBDF801D5; Thu, 28 Sep 2023 17:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDB45F8007C
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 17:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB45F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ez4MRi+d
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0F9ACE2251;
	Thu, 28 Sep 2023 15:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2548C433CC;
	Thu, 28 Sep 2023 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695915041;
	bh=y+XzefTDuzOGmnvWULOFTtScjrjmZPiE+7bhlENCgY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ez4MRi+dzkya4gPApf6IYhxpuRe/C7//ZXslrvvu3sVwJGUjzYQHw7HIL1Ig60FqJ
	 homOB0FtSYVotZN2u7Ps1pG9v0mvl/R9ITXTu2xyWwRrCX3hAepsxlyp1LL92WC1qS
	 ODpjWlU5kMfgUQk+XPafhRxVeE7hrbPNWakPYdraj6CWvNIPQHSqg3aTDB7zULrLiM
	 nZS7//oHX5ZlZlleWMGbZnY4iTvLaRe00Z1hHzGkdY9qf6d6X1IHOh/5v/VnmGVgRE
	 XCD6D7h5uVstxAgfim/zNC0FL0wcpf5Hq/WB9PoYZ53ASx09nwY8bmV/DHQFSRaVXO
	 DlBH56ZFTYKNA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20230928134706.662947-1-amadeuszx.slawinski@linux.intel.com>
References: <20230928134706.662947-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: doc: Update codec to codec examples
Message-Id: <169591504194.2784036.18160613305252062828.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 17:30:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: T6SOPEQ3FZDFJWF4GLNGZ4NGEOGVQEPU
X-Message-ID-Hash: T6SOPEQ3FZDFJWF4GLNGZ4NGEOGVQEPU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6SOPEQ3FZDFJWF4GLNGZ4NGEOGVQEPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Sep 2023 15:47:06 +0200, Amadeusz Sławiński wrote:
> There are examples in documentation for codec to codec connection.
> However they show method before recent series of patches which renamed
> the fields. Update documentation accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: doc: Update codec to codec examples
      commit: b5d5c87986d5bfb72320170e76d94eae48635fc1

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

