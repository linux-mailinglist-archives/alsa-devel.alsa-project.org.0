Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F488445BA
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 18:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09FA3950;
	Wed, 31 Jan 2024 18:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09FA3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706721171;
	bh=Uycvovr5UzCYBERc9LtfXtIEMJqSspY0/niHJLHXjPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=azXb8R5GyYKAXdihk5eR0Dml5Im85iNG45ucEsvGZenANCTjUbUP67qhw1pgRnLgv
	 Xa6s/5RDpllWI/QBD5gAagX11AKaU+V/Z/dOJQ28Tfuvu49ODvOrhQJ8Xiim6S8lHJ
	 lJdb374rk0tLxpZ3XbGDWphyFnhV9e5BbL7gRc/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 423CBF80580; Wed, 31 Jan 2024 18:12:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9299F805A0;
	Wed, 31 Jan 2024 18:12:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2EC6F8055C; Wed, 31 Jan 2024 18:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF705F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 18:11:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF705F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r0GRUKXf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EE909CE1E4D;
	Wed, 31 Jan 2024 17:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC7AC433F1;
	Wed, 31 Jan 2024 17:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706721109;
	bh=Uycvovr5UzCYBERc9LtfXtIEMJqSspY0/niHJLHXjPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r0GRUKXfsBXw25oTwVQ0ClgjQeE1JTo3LzIWdgpTPQhWfmvPvbQWGiLvrjxFXBVOr
	 H8TxEIVI6wYqaTt2Wce7uc7IOrRdzTS7VZA4vHNzIo0PrQxem91t73FaNzIKRO6kDU
	 JZr1MpWhNlucBgo5XT/xKqq6arOec6PKCtxXmC9MaYgR3tuwwGbBrvyb1soug92BJX
	 DPG1ys5GhNT3lDHLrdW8J6LERxFwIVBVtY/B59QamV8Z3tdHreM2kqHEh+1n4h0ML0
	 Ev8jh+iu+7sbBzLQgZcsoooDGHQW49ZYpKg+W1Fn4Oiuu2py6Cv1QMDiKuEjfPdrab
	 x93Un2IFQUkrA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Vinod Koul <vkoul@kernel.org>
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface
 support for AMD SOF stack
Message-Id: <170672110716.41940.5719661789164483084.b4-ty@kernel.org>
Date: Wed, 31 Jan 2024 17:11:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: TWF2VMP6CLEAHMQJG64CKHUIJNY5V3IW
X-Message-ID-Hash: TWF2VMP6CLEAHMQJG64CKHUIJNY5V3IW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWF2VMP6CLEAHMQJG64CKHUIJNY5V3IW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jan 2024 11:21:34 +0530, Vijendar Mukunda wrote:
> This patch series is to redesign existing platform device creation logic
> for SoundWire managers and Implement generic functions for SoundWire
> manager probe, start and exit sequence which are common for both Legacy
> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
> AMD SOF stack (ACP 6.3 based platform).
> 
> Below patch series is reviewed in
> https://github.com/thesofproject/linux/pull/4699
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC/soundwire: implement generic api for scanning amd soundwire controller
        commit: ed0ef85795b58134172e8c82ab2f1b869cd501a6
[02/13] soundwire: amd: update license
        commit: a47746428cf5762290d0c55f6ef82067af04d165
[03/13] soundwire: amd: refactor amd soundwire manager device node creation
        commit: ed5e8741b8db908d51a26e368c18573ee1b9e208
[04/13] soundwire: amd: implement function to extract slave information
        commit: aff9d088a306541117e420d96ed6b6f1215a7e2d
[05/13] soundwire: amd: refactor soundwire pads enable
        commit: cf0ddbc29dfaacb26d58a594619e42ced286ff29
[06/13] soundwire: amd: refactor register mask structure
        commit: c1263c75294cc8178ca964e0220b35518d6fb38d
[07/13] ASoC: SOF: amd: add code for invoking soundwire manager helper functions
        commit: d948218424bf9194860fcc10259ff42487cf4bd9
[08/13] ASoC: SOF: amd: add interrupt handling for SoundWire manager devices
        commit: 96eb818510120a869711876026ca7c0aa2b4171e
[09/13] ASoC: SOF: amd: Add Soundwire DAI configuration support for AMD platforms
        commit: 14d89e55dec9c4e49d196b9d5d659d02dcc8252b
[10/13] ASoC: SOF: amd: add machine select logic for soundwire based platforms
        commit: 5f97c59a77421a5e8aa3b5c4cbdda66a3c956e44
[11/13] ASoC: SOF: amd: update descriptor fields for acp6.3 based platform
        commit: 8af5c7e9cc89ebc6427ef8fde1de77e88ddd3e05
[12/13] ASoC: SOF: amd: select soundwire dependency flag for acp6.3 based platform
        commit: 2188c2cfaa4f431c1d537bb029a6e9b0810b7e7f
[13/13] ASoC: SOF: amd: refactor acp driver pm ops
        commit: 260b08aed4a770335ece16781d8023e9ff488ae0

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

