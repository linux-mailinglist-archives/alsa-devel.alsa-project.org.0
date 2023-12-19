Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C7818F4B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 19:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BF67EB6;
	Tue, 19 Dec 2023 19:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BF67EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703009302;
	bh=BkdpxdriLwhZmETXOsh3mZuFvfKehA1ZY7LfarcI37A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=adI9BpB2D8/89jAP+cfkNFXbJ/46Svq9Hw+KZvukeMZOPaO9eXzToJFlIcG9AWrWm
	 OCZTx0PVN/Qycj9mhSGxHg9r1zBj2DFSVM4xnx9Zhi3juvz6xAuiXv77g6kVnesKmX
	 zYVhq9IteFA/M8epIR8uZITjWkmXGy6soTL5NgJ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD91F8060C; Tue, 19 Dec 2023 19:07:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B13BFF80604;
	Tue, 19 Dec 2023 19:07:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79497F805B4; Tue, 19 Dec 2023 19:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC9C2F80431
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 19:07:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC9C2F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NJrIVF9Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E3801B81A38;
	Tue, 19 Dec 2023 18:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA3EC433CA;
	Tue, 19 Dec 2023 18:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009219;
	bh=BkdpxdriLwhZmETXOsh3mZuFvfKehA1ZY7LfarcI37A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NJrIVF9QxPBuJo7WsIDB/Es3w/CKkCO53d9JLL2vnVmlRCH/AVE0hAuVRF2oE+pMb
	 jznN1ipl2rc2xkpAzRW7b7bK8zbCLtT+CEL9jkvGwWaZgns89xK34qq8dqhcSwqxKu
	 9TiZ8F+NPN4yOT1WkLXBcVca3Zxm9OTAiElpMkEq6ZUOQ2IAqNoGhCASYkMxqOmOwp
	 uevAVwQaVUjpYiwjFEsnjtjAlBfeB3O7EZbV4qxrmblH+BrtKxcpOjgf9wXiCuk8YW
	 lRw+mOlfnaUePE4HLQICVfIPVDUhobQnN2eA2TH04QXIJ2z+CbfhAMsUucUYzF55wD
	 ED7XiSTv5LHsA==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
In-Reply-To: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
References: <878r5q93sq.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/5] ASoC: don't use original dummy dlc
Message-Id: <170300921524.125466.13853663973005425398.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: NSWO65GJC443MLAUAO63CQFRGTEO5AME
X-Message-ID-Hash: NSWO65GJC443MLAUAO63CQFRGTEO5AME
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSWO65GJC443MLAUAO63CQFRGTEO5AME/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Dec 2023 05:09:25 +0000, Kuninori Morimoto wrote:
> This v2 patch-set try to not use original dummy dlc.
> 
> "Empty" dlc might be used on Platform, but "dummy" dlc is not needed
> for it. [PATCH 1/5][PATCH 2/5] removes "dummy" dlc from Platform.
> 
> Now ASoC have common dummy dlc (= snd_soc_dummy_dlc).
> [PATCH 3/5][PATCH 4/5] will use it instead of original dummy dlc.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl: fsl-asoc-card: don't need DUMMY Platform
      commit: 7465582e0b18859d3681192ec2ccf22a81370040
[2/5] ASoC: samsung: odroid: don't need DUMMY Platform
      commit: 56558d6ab8c09c416bdb6d72b7e02894539a882a
[3/5] ASoC: intel: hdaudio.c: use snd_soc_dummy_dlc
      commit: c2dfe29f30d8850af324449f416491b171af19aa
[4/5] ASoC: sof: use snd_soc_dummy_dlc
      commit: e8776ff9ce9f5a8a9d8294101fd2924cebdd2da1
[5/5] ASoC: soc.h: don't create dummy Component via COMP_DUMMY()
      commit: 13f58267cda3d6946c8f4de368ad5d4a003baa61

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

