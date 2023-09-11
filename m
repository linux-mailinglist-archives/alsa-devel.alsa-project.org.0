Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8DE79B878
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2739105F;
	Tue, 12 Sep 2023 02:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2739105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477310;
	bh=5KdR9Uxjdsqqm9Cq0uLvkPGlOrrGg9FgEKiihbuW1Fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gwUb3g1Gw5wtT4JRxu+NDC/nIlIGmBrVWEe4rC7x22rdpEk5MWJIWUmTCUOa17rfD
	 Y3jLEINWgacTm/LFrrzFaug2+AzxVy6ecOdzGDqSomLMChIMTP1pW5evpwFwV5YspM
	 xhjVe2IFFJJ7Cv+3f2vOVc1AcH0AYiroFVzp4MI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA91BF80671; Tue, 12 Sep 2023 01:58:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8DEDF80671;
	Tue, 12 Sep 2023 01:58:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E094AF8068E; Tue, 12 Sep 2023 01:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF090F805A9
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:58:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF090F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ri9555RZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CEB7661486;
	Mon, 11 Sep 2023 23:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D1CC3277E;
	Mon, 11 Sep 2023 23:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476679;
	bh=5KdR9Uxjdsqqm9Cq0uLvkPGlOrrGg9FgEKiihbuW1Fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ri9555RZ2H4mSY3qKw7BFMeL2NE8xysJ78P8+Z5nDp3fRrd5ZuasZSN/vtne0HiK1
	 mWmbzINwiXRO9KQxm+sgIY6MnVeyO/ar1pYV62LVllZSZsyWuaX9sDWUe8qfoQgqpg
	 6FRzt1qWf4TTjEvsT82PPfuQTldcWEoi/hqo7/W10f8FNKn7t8V51YJqGCzKVStxGd
	 +SS4XBoGMpEwF611islvFyPSJPnDUXvOy94ePlRdg6quuUDi58GZ55PQoVJxgJTG0l
	 ltKmU3oKb74ejTr+2uWsUxi0zwbmOuu+y9izlzxUbzRJU5jOXz00job6JGeyBV159i
	 giBNLbEC73JWw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v2 00/11] Improve CS35l41-based audio codec drivers
Message-Id: <169447667585.2387538.14630945148313901984.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: G2TVN6QGWXSE7V2OFF64PLMQ44YMMO5D
X-Message-ID-Hash: G2TVN6QGWXSE7V2OFF64PLMQ44YMMO5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2TVN6QGWXSE7V2OFF64PLMQ44YMMO5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Sep 2023 20:09:59 +0300, Cristian Ciocaltea wrote:
> This patch series contains several fixes and improvements to drivers
> based on the CS35l41 audio codec.
> 
> It has been verified on Valve's Steam Deck, except the HDA related patches.
> 
> Changes in v2:
>  - Added Acked-by tags from Charles
>  - Reworked the shared boost handling per reviews from Charles and David
>  - Dropped PATCH 5/9 and moved PATCH 6/9 a bit down the list, as it doesn't
>    contain a Fixes tag
>  - Reverted usage of devm_pm_runtime_enable() in PATCH 9/9 and replaced with
>    a proper runtime PM changes undo in PATCH v2 06/11
>  - Added 3 new patches providing some HDA related fixes
>  - v1: https://lore.kernel.org/all/20230902210621.1184693-1-cristian.ciocaltea@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: cs35l41: Handle mdsync_down reg write errors
        commit: a9a3f54a23d844971c274f352500dddeadb4412c
[02/11] ASoC: cs35l41: Handle mdsync_up reg write errors
        commit: 4bb5870ab60abca6ad18196090831b5e4cf82d93
[03/11] ASoC: cs35l41: Initialize completion object before requesting IRQ
        commit: 5ad668a9ce83d819701fb7abc1c2236049ec15c2
[04/11] ASoC: cs35l41: Fix broken shared boost activation
        commit: 77bf613f0bf08c021309cdb5f84b5f630b829261
[05/11] ASoC: cs35l41: Verify PM runtime resume errors in IRQ handler
        commit: 9f8948db9849d202dee3570507d3a0642f92d632
[06/11] ASoC: cs35l41: Undo runtime PM changes at driver exit time
        commit: 2d5661e6008ae1a1cd6df7cc844908fb8b982c58
[07/11] ASoC: cs35l41: Make use of dev_err_probe()
        commit: 3db52739aca981a436536423a36ab59b9f241096
[08/11] ASoC: cs35l41: Use modern pm_ops
        commit: 611b8813a28f49e206e05198dae77c544c72b050
[09/11] ALSA: hda: cs35l41: Fix unbalanced pm_runtime_get()
        commit: 486465508f8a5fe441939a7d97607f4460a60891
[10/11] ALSA: hda: cs35l41: Undo runtime PM changes at driver exit time
        commit: 85a1bf86fac0c195929768b4e92c78cad107523b
[11/11] ALSA: hda: cs35l41: Consistently use dev_err_probe()
        commit: 206b250c3e9be44c096bb9bb1f9d6b7f3440bfbb

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

