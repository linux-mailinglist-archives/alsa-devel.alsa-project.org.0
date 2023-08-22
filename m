Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F27847CB
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 18:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9D1857;
	Tue, 22 Aug 2023 18:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9D1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692722139;
	bh=yNKUaFqiWjC0vS8/Nk7KvaD1e3zbikEBwSOWAo1nACM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b1L1gFNjpGbp4YIOvQIqIZeJjsJ8vvwKCLLrttFyz3gG2GYGS96iBHQdMCCcTP+Vs
	 ChR57M2BSINLSABxz0q4M4PQzWUIlW0VYQhOEwiB9/I8NiGNC2rsPOJsmlYXgavNRC
	 rtB6Tr+P3OafX2EjMTkRQyt5a6JmVGmj0VuPg3bo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EFA0F80579; Tue, 22 Aug 2023 18:33:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 935DFF8057A;
	Tue, 22 Aug 2023 18:33:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB4ACF80552; Tue, 22 Aug 2023 18:33:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56E11F800AE;
	Tue, 22 Aug 2023 18:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56E11F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IvulK8lZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44FF36280A;
	Tue, 22 Aug 2023 16:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20691C433C7;
	Tue, 22 Aug 2023 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692722008;
	bh=yNKUaFqiWjC0vS8/Nk7KvaD1e3zbikEBwSOWAo1nACM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IvulK8lZrDRnzWAylOM8y+4SkDj43ORPN0KTjZOQSYykrHVwmM8/ijcWa2fvgQlkR
	 OR4gtYXvJMYpZEPxcibq0Ca0fiScelOVEv+rrU5sbkssqdhKtHHMnkmHcL3et2KtHW
	 Eqyq+Ofa6Hn3ejgFgsizvgPGq6dAyepG45foNpKCoptOPupIobEmCyBLE3tmkx2fsP
	 BQeRbGICNo1eZI18nwMWT/Mhqoj3XjyyAcqB1r1aY8NiFic3C9AyLIP2pLLFa87E8j
	 mk+OO1dnWSfCtCZZdQZtdYxJKcHA9arhnhZWxmOiZ8zwHe4ACCCbfsi/JD4NXbUCXi
	 BIVLOJCPQlGzQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: vsujithkumar.reddy@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, mastan.katragadda@amd.com,
 arungopal.kondaveeti@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>
In-Reply-To: <20230809123534.287707-1-venkataprasad.potturu@amd.com>
References: <20230809123534.287707-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/3] ASoC: SOF: amd: Add sof support for vangogh
 platform
Message-Id: <169272200384.71502.14840159001955531773.b4-ty@kernel.org>
Date: Tue, 22 Aug 2023 17:33:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: P3SYAEW2H2DGXO7S2NAW74OAGTAERNKC
X-Message-ID-Hash: P3SYAEW2H2DGXO7S2NAW74OAGTAERNKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3SYAEW2H2DGXO7S2NAW74OAGTAERNKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 18:05:20 +0530, Venkata Prasad Potturu wrote:
> Add pci driver and platform driver to enable SOF support
> on ACP5x architecture based Vangogh platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: amd: Add sof support for vangogh platform
      commit: d0dab6b76a9f05bd25d7ad957c3275a9dec42a06
[2/3] ASOC: SOF: amd : Add support for signed fw image loading
      commit: 6a69b724b2f82b1c44852b432010fbe25f0e2b75
[3/3] ASoC: SOF: amd: Enable signed firmware image loading for Vangogh platform
      commit: f7da88003c53cf0eedabe609324a047b1921dfcc

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

