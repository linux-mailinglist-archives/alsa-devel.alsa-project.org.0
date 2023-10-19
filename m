Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146F07D0358
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 22:49:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32C8AA4D;
	Thu, 19 Oct 2023 22:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32C8AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697748586;
	bh=kpsx5tSDWRuw47adDIPps9apfMJxwEuzmiEQHQlJ1gU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZH1h+FSt1cBiKf2FmmeIiYBQ5Iv7vJou75MZJ/aYR2qTYq9ijKTflFh7KN+Cd+D2
	 83LH0Ui1fnTUmwVUFNjaTcsOVCxpy8AJ2ygJJjJ0c+ebVJzHPj1IfP+lfUrWvBJXb5
	 gz/nuWC+YyVsqn1HOfg4ov8/b9Zqa8meM5lsmbZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEF09F80578; Thu, 19 Oct 2023 22:48:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A0EF80571;
	Thu, 19 Oct 2023 22:48:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55741F80536; Thu, 19 Oct 2023 22:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E80EF8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 22:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E80EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X+JX1x+H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A965C61D24;
	Thu, 19 Oct 2023 20:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFF0C433C7;
	Thu, 19 Oct 2023 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697748472;
	bh=kpsx5tSDWRuw47adDIPps9apfMJxwEuzmiEQHQlJ1gU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X+JX1x+H86pTTC/YJ6Gyp+l9uBiMVWLWpwarsKqTjngeQ8ijkPpj8SLwuNQgBVxet
	 i1OFoMKGmNpHnyL1Adag1tJjGE0K2+vebhA8YYucKpuWdmK4XS0M/l17I3Q39cnLTR
	 kXzqGM/kA7/v7/i+p87D+kNXn+6NyErjgNfpsSBTm/e3wQa7jS4CkKhxu2j+pp+11m
	 JYZjQkju7kR0Ty2jAyaBiLGi2bQOVXwQBN2YgTcmT4PgZivYCD/2NOQVuZ/zjDdsEi
	 uske/zVndyqV/jsMlvZ15f/NyGKemci3Z3g36zMe8Gi2E/hvXq1/keL2KzqJpCGbpm
	 obqC9+MsFKKIA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: more machine driver updates for 6.7
Message-Id: <169774847134.93224.994210355321592593.b4-ty@kernel.org>
Date: Thu, 19 Oct 2023 21:47:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 3CT3FATFAFT7FAT6L4HT6DGVPNGRSEZT
X-Message-ID-Hash: 3CT3FATFAFT7FAT6L4HT6DGVPNGRSEZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CT3FATFAFT7FAT6L4HT6DGVPNGRSEZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 12:34:01 -0500, Pierre-Louis Bossart wrote:
> Two nice cleanups from Brent Lu and Charles Keepax, and one RaptorLake
> update.
> 
> Brent Lu (5):
>   ASoC: Intel: board_helpers: support dmic link initialization
>   ASoC: Intel: sof_cs42l42: use common module for DMIC links
>   ASoC: Intel: sof_nau8825: use common module for DMIC links
>   ASoC: Intel: sof_rt5682: use common module for DMIC links
>   ASoC: Intel: sof_ssp_amp: use common module for DMIC links
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: intel: sof_sdw: Stop processing CODECs when enough are found
        commit: 28809aaeabdf2c01ffe597553146527d1fba3589
[02/10] ASoC: intel: sof_sdw_cs42l43: Some trivial formatting clean ups
        commit: a92ccd574390149d3d64488ec5fe1e9b80e5f74c
[03/10] ASoC: intel: sof_sdw_cs42l43: Create separate jacks for hp and mic
        commit: d74bad3b74524e4f34c97903ad170d9061bcfbd9
[04/10] ASoC: intel: sof_sdw: Move the builtin microphones to dataport 1
        commit: 10626812b5987b3a05adf6b4f4417e7398b7047c
[05/10] ASoC: Intel: sof_nau8825: add RPL support for MAX98360A amp
        commit: 5c072ca8e1b7545b280d5416ecef77e3b0891a2c
[06/10] ASoC: Intel: board_helpers: support dmic link initialization
        commit: 7fce91bab644f13e8a861ebf9c4c98a8072b6abc
[07/10] ASoC: Intel: sof_cs42l42: use common module for DMIC links
        commit: a1360c45a445f0824d4723136a9e993c94b77be8
[08/10] ASoC: Intel: sof_nau8825: use common module for DMIC links
        commit: f56daafc94ec4c46349ced8d2b91873b98dd5482
[09/10] ASoC: Intel: sof_rt5682: use common module for DMIC links
        commit: c51fc25db18fe49e357455da726dd0ca98a43534
[10/10] ASoC: Intel: sof_ssp_amp: use common module for DMIC links
        commit: f6b415faf6796963a56117f851378afe0ac33699

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

