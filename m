Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FC0754EAE
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 14:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2843E75;
	Sun, 16 Jul 2023 14:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2843E75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512004;
	bh=XqQsD/jyEYXRxRj2JCNHaHmg2K9MPOUoFp5MhDfXGrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q/N4Yrk0O1EbhnHpeXDNehLsqp+Yl7Zv5WVXJZFH8Exvm84JTgrHjpssb/tik4SuI
	 4o5h7f2/nE04VLQkTrMIAs6PXNSQ2lvt/8bNEpXRhi975hhrR/9TBzaADttBNQ41Xw
	 sudD2c1w41b7s8c9hxmECLlCA7FQzzDMESx2MiuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F11EAF80589; Sun, 16 Jul 2023 14:51:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D912F80580;
	Sun, 16 Jul 2023 14:51:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD988F8056F; Sun, 16 Jul 2023 14:51:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55464F80552
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 14:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55464F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IbWAbqRr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8EA8F60D42;
	Sun, 16 Jul 2023 12:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FBBC433CB;
	Sun, 16 Jul 2023 12:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689511886;
	bh=XqQsD/jyEYXRxRj2JCNHaHmg2K9MPOUoFp5MhDfXGrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IbWAbqRrP1KvSI/oYlnOR04pFbJd2Ioj1RTnXizHiTHKD0wfkfUiNRPBO386OpVc9
	 3tt1EuYQ53HstMuPFLBJ11nfSo4XFQzKJGPCkK7F2u6SxN1rk/2fDCOJ0Fv7tmURQ4
	 p60+SZwqvKTquCrLMDCJyn21EM5a/iNP4hvd3Jpm2kec03UopYB/yPUun02y9filLq
	 bGJiV8LqQj5OLlgHi9dQB78AmojQdzeA4j+3bExoj8ngsQ/SkjnZR+FbdavhAxX4OH
	 IMZ7P8ItXsiCzv5LaBKHaH7KcBbiUOc3TuiVXtSRIVT+rpq7tm5GgEbbnkWswNe3p9
	 pgUSOulbW2fqQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?q?Amadeusz_S=C5=82aw_i=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH v2 00/15] ASoC: add multi Component support
Message-Id: <168951188561.111741.13518304398769198151.b4-ty@kernel.org>
Date: Sun, 16 Jul 2023 13:51:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: N3XUX2IADXWJYFVSPGWQS7HMW5FSRELH
X-Message-ID-Hash: N3XUX2IADXWJYFVSPGWQS7HMW5FSRELH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3XUX2IADXWJYFVSPGWQS7HMW5FSRELH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jul 2023 10:19:04 +0900, Kuninori Morimoto wrote:
> These are v2 of multi Component support.
> 
> On below HW case, we would like to use it as "2 Cards",
> but unfortunately it is impossible in intuitive way,
> or possible but not intuitive way.
> In reality, it is handled as "1 big Card" today.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: soc-core: protect dlc->of_node under mutex
        commit: 065aa861b1243704b329a6d8407d8399614df6bd
[02/15] ASoC: soc-core.c: initialize dlc on snd_soc_get_dai_id()
        commit: 521d675d2497f890e881dc48e954a1559460e97c
[03/15] ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()
        commit: 0e66a2c694096abc54ed58b3be654103f155ea43
[04/15] ASoC: soc-dai.c: add DAI get/match functions
        (no commit info)
[05/15] ASoC: soc-core.c: enable multi Component
        (no commit info)
[06/15] ASoC: soc-core.c: add snd_soc_get_dai_via_args()
        (no commit info)
[07/15] ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
        (no commit info)
[08/15] ASoC: soc-core.c: add snd_soc_copy_dai_args()
        (no commit info)
[09/15] ASoC: simple-card-utils.c: enable multi Component support
        (no commit info)
[10/15] ASoC: simple-card.c: enable multi Component support
        (no commit info)

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

