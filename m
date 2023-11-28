Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8252B7FBBFF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 14:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAB67F8;
	Tue, 28 Nov 2023 14:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAB67F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701179795;
	bh=cs9QA1SQnX47bCmNBLauak7qsq11fSotAyCdi2Xj+Fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YMGtqwmctIUuJrdVkcIGCDLAlhk7E+NYdInKUNwM37xp78ow/RMWrRyZ6EC+NFObq
	 4jWiYk9aNq5xzoumRiCkY/7uX9FqpTqS7dmo3zDf+oPbwSw48FZwQnYxiYQN+WkGMc
	 QXev0SLuYFjWD96vBNyYxmAe0ipBOTTiwj6yy9CM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C3FDF805AD; Tue, 28 Nov 2023 14:55:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FACF80588;
	Tue, 28 Nov 2023 14:55:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F2FCF8016E; Tue, 28 Nov 2023 14:55:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E19AF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 14:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E19AF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s+3xksy5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10E3AB836F9;
	Tue, 28 Nov 2023 13:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB25C433C8;
	Tue, 28 Nov 2023 13:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701179739;
	bh=cs9QA1SQnX47bCmNBLauak7qsq11fSotAyCdi2Xj+Fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s+3xksy5SuL8tQGYiVqr+KcvwY73Jk2/gCJ/SkWei6hhnHHlp65gt2k/L4YQ4UnY4
	 SJ+cD6LojPldWnEhrGG/o9q3eIVXA7IVaGx+QbL+BZsUQVRizBfpNnUiXi04jHIGWL
	 jGo7kT3+hgTcMk58IHGI/BwggnrG9UAWgrmcROikvK6R3FM0YZrCmVyk9PELs7ucg4
	 jN2/USMbvlFM2sLkr4IauhAQl7uhoHwEE76+85//C3qjctXOgKZ8wDv+JVybfOT5ec
	 1bRs5r6ErnDqOMqvOsOP97CLdKsdvjPz9Rgr3r5wf/7VIEa54USorcPS27Ie0XKIrd
	 f6jZjztpHnd3g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/27] ASoC: Intel: Link handling rework and fixes
Message-Id: <170117973693.2717289.9407279589493874219.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 13:55:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 7D5JQQD3SJ66QNGZLMN3BJYHLQNULLKH
X-Message-ID-Hash: 7D5JQQD3SJ66QNGZLMN3BJYHLQNULLKH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7D5JQQD3SJ66QNGZLMN3BJYHLQNULLKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 17:26:27 +0200, Peter Ujfalusi wrote:
> SOF board updates for 6.8 including few small fix and the majority is to add
> generic helpers for codec, amp, BT offload, HDMI-In and DAI link generation
> among various machine drivers.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/27] ASoC: Intel: sof_ssp_amp: remove dead code
        commit: 9425039741e84120fc936fbb5a9a7a1410fd9409
[02/27] ASoC: Intel: sof_maxim_common: add else between 2 if test
        commit: 06dea47be6d3d0ad3ef5f7c9dd0947d1c825e0ff
[03/27] ASoC: Intel: sof_maxim_common: check return value
        commit: 007d9a638b877f71a0ef28a906525904e44f6aa2
[04/27] ASoC: Intel: cht_bsw_rt5672: check return value
        commit: 65b2df10a1e6264dd199c88623a9e4bbf8849c9b
[05/27] ASoC: Intel: ssp-common: get codec name function
        commit: 93f74ebf3d7623b8b647d2ce5f2e23545f9702df
[06/27] ASoC: Intel: board_helpers: support codec link initialization
        commit: e111dece012f29707da634c341d3f3277bd94528
[07/27] ASoC: Intel: sof_cs42l42: use common module for codec link
        commit: f46f07fe264a26daf8d6a5e16535229ee48108a7
[08/27] ASoC: Intel: sof_nau8825: use common module for codec link
        commit: 99f7422805c96d56a093dbe71beca658b793d0cb
[09/27] ASoC: Intel: sof_rt5682: use common module for codec link
        commit: 84c280af16b72fc202fbd9dcecadb6e256956c41
[10/27] ASoC: Intel: board_helpers: support amp link initialization
        commit: ba0c7c328762d78573d3cac4adad9ea9e695f244
[11/27] ASoC: Intel: sof_cs42l42: use common module for amp link
        commit: 8739841805744bd1a1d12e2485dc5d0f1d880f64
[12/27] ASoC: Intel: sof_nau8825: use common module for amp link
        commit: adf711655ba21c5d54d52b79aa8df87fbb39df6b
[13/27] ASoC: Intel: sof_rt5682: use common module for amp link
        commit: e45cd972a50d2212ad232af33de970fb6923aaf6
[14/27] ASoC: Intel: sof_ssp_amp: use common module for amp link
        commit: 5cdc7a82594eaad27e98dcd6fbd72592edbc0f39
[15/27] ASoC: Intel: sof_ssp_amp: rename function parameter
        commit: 823404815fcdf32950b2223ed2c665f077d6b98f
[16/27] ASoC: Intel: board_helpers: support BT offload link initialization
        commit: 53d8df6d3f0a1d6fd520865fb12c11868fe6cf81
[17/27] ASoC: Intel: sof_cs42l42: use common module for BT offload link
        commit: 117445d7655945b0a601a1247842029d0325c7e4
[18/27] ASoC: Intel: sof_nau8825: use common module for BT offload link
        commit: 87ddfdc9dc37032492704b51ab468bda1262d155
[19/27] ASoC: Intel: sof_rt5682: use common module for BT offload link
        commit: 3d5b77b9bee016cd1363f3856a3616eaed9026b8
[20/27] ASoC: Intel: sof_ssp_amp: use common module for BT offload link
        commit: dc3d7dcb04eae6af5b9c882dc30eede75bbd7fe7
[21/27] ASoC: Intel: sof_ssp_amp: simplify HDMI-In quirks
        commit: 9fadbf3f11c378fa307517f20bd793eb9773a15e
[22/27] ASoC: Intel: board_helpers: support HDMI-In link initialization
        commit: f7c015add5b1a6a94fb39420ac0a885c8d7b63ad
[23/27] ASoC: Intel: sof_rt5682: use common module for HDMI-In link
        commit: 426cbd0de2da2553de9c8a2366f956807f94d5b4
[24/27] ASoC: Intel: sof_ssp_amp: use common module for HDMI-In link
        commit: ee2486d5219e9f724372084d5926070697e84836
[25/27] ASoC: Intel: board_helpers: support DAI link array generation
        commit: a6881210f175ae309721b3c76f54eebc8a258339
[26/27] ASoC: Intel: sof_nau8825: use common module for DAI link generation
        commit: 5da85a3523b5acd3a00347cae32ae2ffe4f4ac8a
[27/27] ASoC: Intel: sof_rt5682: use common module for DAI link generation
        commit: 8fa1116e1cae4858ab69d31da36f1fae9113c29d

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

