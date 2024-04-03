Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED5D897B03
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 23:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373E82C50;
	Wed,  3 Apr 2024 23:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373E82C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712180855;
	bh=6sN5aEJQrMb2UsRjJUwqNYo/m7U4mSwJvDTwGZBrQkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UPPlZESo5XpbGtOGtfCeDkZb/7detFU9eW4NT5PHPCG2MbtTPA4d1bKXACw0CEti8
	 vf6I6gy4c8nK5AsHclD5Wh8JiHTDEjoOkbbAt3bJZfM7WakMisiFnJsDSVaTDa4coJ
	 5XnLdSStnVpp6lhRSx5JGPhYT/UxZ7mwXvlfMqW8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51EC0F8058C; Wed,  3 Apr 2024 23:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6EE9F805A0;
	Wed,  3 Apr 2024 23:47:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A18ABF8020D; Wed,  3 Apr 2024 23:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3D9DF80114
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 23:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D9DF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cV1Inn70
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77C32CE2CF9;
	Wed,  3 Apr 2024 21:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAD0C43390;
	Wed,  3 Apr 2024 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712180803;
	bh=6sN5aEJQrMb2UsRjJUwqNYo/m7U4mSwJvDTwGZBrQkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cV1Inn706cFECsK5JN0H4Si/lBN7ZP6N39OvGwwnfDhiDdHfuWqKuZwsGuEGuVb0K
	 mQe28AHwDrWxeYcYD8fso0FlAZ/1WVN6T9Xo0gqBG6zE0gSAOebK/kgxOOw5RC10rD
	 WJvilJ2QQYoQw2ik++ZM1QQYGOdAquVpNNIt0jHolGdj1IUen9wM/WWEgSSiFPIclL
	 czS08yqN/OGfDfD9tvNI3s4XtUgWaF4/kA7kZ4WrmEcLtlnvT9ymVvpdL+R8o7MDDq
	 +Uyz16/PE3UvZd4UwOANhONdXZfhWZHNHPAGvJ0U1o20BCi1XJb9LShkxsZqrsgcwH
	 PUxofDCB46CCw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240325113127.112783-1-rf@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/5] ALSA: cirrus: Tidy up of firmware control
 read/write
Message-Id: <171218080230.1232330.14409527355047888815.b4-ty@kernel.org>
Date: Wed, 03 Apr 2024 22:46:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: T22Y5GIS2S6MG4WQ56HBSD5NBD2BEVGG
X-Message-ID-Hash: T22Y5GIS2S6MG4WQ56HBSD5NBD2BEVGG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T22Y5GIS2S6MG4WQ56HBSD5NBD2BEVGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 11:31:22 +0000, Richard Fitzgerald wrote:
> This set of patches factors out some repeated code to clean up
> firmware control read/write functions, and removes some redundant
> control notification code.
> 
> Simon Trimmer (5):
>   firmware: cs_dsp: Add locked wrappers for coeff read and write
>   ASoC: wm_adsp: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
>   ALSA: hda: hda_cs_dsp_ctl: Use
>     cs_dsp_coeff_lock_and_[read|write]_ctrl()
>   ASoC: wm_adsp: Remove notification of driver write
>   ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver write
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] firmware: cs_dsp: Add locked wrappers for coeff read and write
      commit: 4d0333798ebbfa1683cc3bc056d1b25b8c24344c
[2/5] ASoC: wm_adsp: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
      commit: 3802a9969bd365749f5e34928082cff96ed7769b
[3/5] ALSA: hda: hda_cs_dsp_ctl: Use cs_dsp_coeff_lock_and_[read|write]_ctrl()
      commit: 62daf3df8a6b1920f7613e478935443a8f449708
[4/5] ASoC: wm_adsp: Remove notification of driver write
      commit: e81f5c9f7d06a69dc505fa6ad351df6cc86a6c2d
[5/5] ALSA: hda: hda_cs_dsp_ctl: Remove notification of driver write
      commit: d641def12ec929af6c4f9b1b28efcd3e5dff21b4

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

