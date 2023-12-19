Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24099818CAF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 17:45:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1BF7857;
	Tue, 19 Dec 2023 17:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1BF7857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703004353;
	bh=Ghx71bROc6fu886X5uqaeBYzUHSm6JygoJVtGTyZCJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=azEjZhmfybII4QJaNDGBsGUnuxMsvpjg3H35onlYoXREasOEaUnc8ZHt1N2LtHA4Y
	 CMhsuLD1lZJvsIsU8g9BA2oIm2IjsaNmhLgSdZEa5u5DJNfoimaA5xWwiSL+xK4EXA
	 8xnXpFLH4j+SbXcNHSBt00m/8XUDzWVktSkZKjV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EEE3F80571; Tue, 19 Dec 2023 17:45:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C4A0F8057A;
	Tue, 19 Dec 2023 17:45:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BB3F80431; Tue, 19 Dec 2023 17:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2233CF8016E;
	Tue, 19 Dec 2023 17:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2233CF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bgoRzOOo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 22B71B80E69;
	Tue, 19 Dec 2023 16:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5EFC433C7;
	Tue, 19 Dec 2023 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703004300;
	bh=Ghx71bROc6fu886X5uqaeBYzUHSm6JygoJVtGTyZCJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bgoRzOOoWfw1cESntV9UlskeW7XD1Czov9dsg9QwhLH0tNGH8dJ9gIJd3v0rEiy+x
	 hR7KwecPe0DL41PHcZLyWp4aKOb2b7U+mir7SO3WFbWB98aotxiHbRF3AF7jp+vqkZ
	 v1J7b5wuID+2jL+eu6/SgfTIZQb77DkCQPnxAB2fPgX9UJlEey7+qhT/wQNoUGAkEt
	 8id/HUZe3FKPXvc+PvdAzYfC6RxLgrJSJDC+xXIR4QN1UnRautngwUy2g4v/Jw6yBK
	 dAy5vTD6mmJAkcC9R3NA7VS9W5xRry+jgxhgtPLbpICt29Me/ojNhmtnoWuDklmmZZ
	 ahp/UUp4c4bXg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 cristian.ciocaltea@collabora.com, emil.velikov@collabora.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, Paul Olaru <paul.olaru@nxp.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Mastan Katragadda <Mastan.Katragadda@amd.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
References: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/5] ASoC: SOF: amd: Refactor
 spinlock_irq(&sdev->ipc_lock) sequence in irq_handler
Message-Id: <170300429567.102048.6886729222618655061.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 16:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: MLF7RJ65OBZZJFFQHD2UEBL2TPPYJ7GG
X-Message-ID-Hash: MLF7RJ65OBZZJFFQHD2UEBL2TPPYJ7GG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLF7RJ65OBZZJFFQHD2UEBL2TPPYJ7GG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Dec 2023 16:54:09 +0530, Venkata Prasad Potturu wrote:
> Refactor spinlock_irq(&sdev->ipc_lock) sequence in irq_handler
> to avoid race conditions for acquiring hw_semaphore.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: amd: Refactor spinlock_irq(&sdev->ipc_lock) sequence in irq_handler
      commit: 802134c8c2c8889f7cc504ab1ba6ada9816ca969
[2/5] ASoC: SOF: Refactor sof_i2s_tokens reading to update acpbt dai
      commit: 3953de2dbdcd0592aa7f877b67135a51e18f006a
[3/5] ASoC: SOF: Add i2s bt dai configuration support for AMD platforms
      commit: de111c9b521ddea4c7609155a617b5a0e93ad833
[4/5] ASoC: SOF: Rename amd_bt sof_dai_type
      commit: ced7151b9b0c74af1bc05ac4ad93648900709bb0
[5/5] ASoC: SOF: amd: Add acp-psp mailbox interface for iram-dram fence register modification
      commit: 55d7bbe433467a64ac82c41b4efd425aa24acdce

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

