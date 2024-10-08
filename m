Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91B994C45
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 14:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA9B851;
	Tue,  8 Oct 2024 14:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA9B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728391962;
	bh=5N3muN/1X4NiCe63rOjxyZnAnkXxwydb5VUOMPid/n0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EeXUSnoSFDXVcqw+Lds+hYxYNwa8Y0ZPVbB/w7tbtRxd93ySIlLMY0rdf1JI5AQqq
	 RnzMcr1/v+4TvcfvlxgC5bnuJ0CitvGryrrkQDe1kp9koKJjdog/f5oltCLx7nVNyC
	 fB2nFC9WITt0JZB+aqm5F9aEDDzeupmDV95mZ0zc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AF3DF805BA; Tue,  8 Oct 2024 14:52:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F81F805B0;
	Tue,  8 Oct 2024 14:52:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83CAAF80528; Tue,  8 Oct 2024 14:52:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28B23F8001E;
	Tue,  8 Oct 2024 14:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B23F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mu80MhJo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 215A8A4178C;
	Tue,  8 Oct 2024 12:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1762C4CECD;
	Tue,  8 Oct 2024 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728391918;
	bh=5N3muN/1X4NiCe63rOjxyZnAnkXxwydb5VUOMPid/n0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Mu80MhJoe9qMwu8J2hT65rA7oA1hQzk2s0M1A9DU3IGOapdOpid/afEY98/2yI7u4
	 6aDS5VBc5OvlI3EozDJiutUw0V26R48corLYlpmNpqaPaSvdkL8IekibsJ8mQsDL1b
	 zHu31sUtDMFeRC0/idGcNjF44+EfBsQfd14iGQcOKokk/Nk124kg/Q8IO92pAEjskR
	 ghaZ8jIIerROwTYutrSAvoZMAnT9Oj1ATOIJ02FCN6tJUHBvfQxsdK1llGJ5roo+f0
	 Ja16ZPEZtXB0HBkjrpjCvT6POwdQ4EVTuUguxko97qUxjym9Mw/SHdpgh7ZjQvpJL8
	 svpRbSviCGYMA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20241008091347.594378-1-venkataprasad.potturu@amd.com>
References: <20241008091347.594378-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: Add error log for DSP firmware
 validation failure
Message-Id: <172839191267.2607981.16181271445711989031.b4-ty@kernel.org>
Date: Tue, 08 Oct 2024 13:51:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 6LZ5KGYSJTADRWDKA5TX64RRJJ2KYSNU
X-Message-ID-Hash: 6LZ5KGYSJTADRWDKA5TX64RRJJ2KYSNU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LZ5KGYSJTADRWDKA5TX64RRJJ2KYSNU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Oct 2024 14:43:44 +0530, Venkata Prasad Potturu wrote:
> Add dev_err to print ACP_SHA_DSP_FW_QUALIFIER and ACP_SHA_PSP_ACK
> register values for PSP firmware validation failure case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: amd: Add error log for DSP firmware validation failure
      commit: 0a5c40393b123f3f08e428143985ab0c5ddb4d28
[2/2] ASoC: SOF: amd: Fix for ACP SRAM addr for acp7.0 platform
      commit: 494ddacd4a2ae5fd1c46ea49364eaab4fc1e5461

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

