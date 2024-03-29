Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AB789191B
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 13:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D852CB5;
	Fri, 29 Mar 2024 13:35:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D852CB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711715727;
	bh=Nb4f6TVGhh/22asBtCA76xr4emI2+oHkh3bnCtobCUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oBV7ceXMwom21YiJpCOJcwUqpvyXeQgWhKgZ7GjuL57QydYDtsSnpvkn9nr3Z5SGu
	 0rqM9TxNVUDoxz1k6fbiD+BMMOe6EEu1efaVhwOdbQ0UUHICMGauzasV9dOnjl8NjW
	 MTeTx8mIpFYe6HD5ws2+GVbvRGVWNGMPunaTiZFk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43275F805E0; Fri, 29 Mar 2024 13:34:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F1A8F805E4;
	Fri, 29 Mar 2024 13:34:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60E1CF805AA; Fri, 29 Mar 2024 13:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEB9AF801EB
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 13:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB9AF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fN+OfN3R
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D906BCE1D5B;
	Fri, 29 Mar 2024 12:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F278C433F1;
	Fri, 29 Mar 2024 12:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715639;
	bh=Nb4f6TVGhh/22asBtCA76xr4emI2+oHkh3bnCtobCUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fN+OfN3RlR8YuEWAIvD1/1UA2w2lw6G4F8uw5EJK5x1dOZHWu89EzUgicvIT9+toj
	 jP3doP3eioNfvJk14M0uKeVnKVTuwlnDhVPUjHtq/w7SReoXJKTWze5vE4qvCCpN9D
	 gU9L2B2zPvg/UTo+JWVZN1gCW3PuvqN6XNG6XyjUt6pBwO6brXp2Txe5hM6CblTm3D
	 yWKKlMMBQV4vT/+zAOBgQPVb2Zf/Y/DCV1bDEuGC3fjuJlqRGEFicOkLBvldP1hQ3o
	 XpHfXmqO/TGs+km/K95lMFYsgPn6lYJ6aJFp0HWfx2q1U2mLK9XHlwf+MLRCv/lxCZ
	 Dl/Ksh0FLh+dQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/18] ASoC: Intel: boards: updates for 6.10 - part3
Message-Id: <171171563805.7557.17331301843824250247.b4-ty@kernel.org>
Date: Fri, 29 Mar 2024 12:33:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: YDHI36IYE6EERLQU5ZPS55TCNICBHR6R
X-Message-ID-Hash: YDHI36IYE6EERLQU5ZPS55TCNICBHR6R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDHI36IYE6EERLQU5ZPS55TCNICBHR6R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Mar 2024 11:23:50 -0500, Pierre-Louis Bossart wrote:
> This last part is the continuation of Brent Lu's cleanups. Multiple
> quirks have been removed to use "default" configurations and
> ACPI-based detection of codecs and selection of topology files.
> 
> This cleanup has been done in multiple steps/phases since Fall 2023,
> thanks Brent for this contribution!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/18] ASoC: Intel: ssp-common: relocate source file
        commit: 94a944a8c4f9e0de87cc9c5bdf8861ae2f64d874
[02/18] ASoC: Intel: ssp-common: relocate header file
        commit: bd1222ad1746ab4325b982c720c7099c78c7b731
[03/18] ASoC: Intel: ssp-common: naming convention change
        commit: a17fea3880aea23fd8821ff0660268a680e0326b
[04/18] ASoC: Intel: ssp-common: module name change
        commit: e1ff45518fbe73c09c3d0dbe8bd5284bb3d25dc3
[05/18] ASoC: Intel: ssp-common: delete module
        commit: fe2365c298b51dd08def916a3339a84ec2a1fd42
[06/18] ASoC: Intel: ssp-common: get codec tplg suffix function
        commit: 2e723a79ec609871116d216309c1b89d2f61b713
[07/18] ASoC: SOF: Intel: support tplg suffix detection
        commit: 1504a768f6045157437693fbfb50ae63ca86ec61
[08/18] ASoC: Intel: sof_nau8825: mach cleanup for adl boards
        commit: 1934906b26bf8d1bd798fa11bf7058bf380101a0
[09/18] ASoC: Intel: sof_nau8825: mach cleanup for rpl boards
        commit: 3822d41469fc20fdff0d83b20324b382ee7bd0e7
[10/18] ASoC: Intel: sof_nau8825: add mtl_nau8825_def for mtl boards
        commit: d5dd7f4fc0b5633fc9fb665803f5e95d564c7331
[11/18] ASoC: Intel: sof_rt5682: mach cleanup for tgl boards
        commit: 4b95706b4a25c239aa7a7d7feb455c364c181db2
[12/18] ASoC: Intel: sof_rt5682: mach cleanup for adl boards
        commit: 34f256537685437122c4d326266739dd3b3678c6
[13/18] ASoC: Intel: sof_rt5682: mach cleanup for rpl boards
        commit: 7b24d86c845ce3b1c7bdd9175cd7c51aefe9ba46
[14/18] ASoC: Intel: sof_rt5682: mach cleanup for mtl boards
        commit: a2e678fe951c3820db705a2cb20ec0a32d752033
[15/18] ASoC: Intel: sof_cs42l42: board id cleanup for adl boards
        commit: 2872f3b5df54ac14adc5ea62241312d66bd001ba
[16/18] ASoC: Intel: sof_cs42l42: mach cleanup for adl boards
        commit: ae33c9134d6e1a88c2e49422aee1474c03a53233
[17/18] ASoC: Intel: sof_cs42l42: add rpl_cs42l42_def for rpl boards
        commit: 6d90e02ae8aa6bedf77110075e7eef3f24f6a8a3
[18/18] ASoC: Intel: sof_cs42l42: add mtl_cs42l42_def for mtl boards
        commit: 57ad033ce09d4d0c866ac558fc3c4cf53cfb2599

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

