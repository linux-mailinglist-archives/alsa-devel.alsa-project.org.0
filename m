Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C026C8BD907
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 03:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DEAC74C;
	Tue,  7 May 2024 03:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DEAC74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715045813;
	bh=scqSW2Anwhvts9TAPdy3z3Adauarm0lADgbT3agoOes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ih3iB3VG9QppHMj2i0K9BBQuwlF165UtBIh442L6p2p0fG43ajludqyztu3G4c/YQ
	 s6iyRVuvc3HlZoMve1tAdXPByL2FT/qLXPy9DbziXpwfUhoRfvxFDwi+HZwE9oGXQT
	 H/oEk53ffO8Aj6k9y6VbYBdZlfZj0cCFHwi/asoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24EEAF805CB; Tue,  7 May 2024 03:36:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E71F805C8;
	Tue,  7 May 2024 03:36:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29E26F8049C; Tue,  7 May 2024 03:35:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DE2FF80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 03:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DE2FF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YoeMWsDM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D176614C5;
	Tue,  7 May 2024 01:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10FEC3277B;
	Tue,  7 May 2024 01:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715045743;
	bh=scqSW2Anwhvts9TAPdy3z3Adauarm0lADgbT3agoOes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YoeMWsDM1yBk0/AqLbXOJ5jlN6Nm6Hcp7983s020I7liphxhh9Df8CTaRv7JIY6Xi
	 qBMunpRIoXS/1zuGc3T8mOAvNeF3bPOHnvkCCsCjDQ86Nf30u8ryyZMgZCjAeoYT4g
	 chCZkFkW9ciWoF4RoiZFwOdtEExISuF/OtrNw5AyJ80cCCJOQfzOhf4IqLuUsSkxjR
	 4DgbCsPs5J/GG/Kvfo1I42Ks+zBscn9MlOjE35jGOQoP9hSGqGh0oZ5x8+4Wg7Mpt4
	 xBKlkgbXsRsn50ESNLPeqW9nfxZ7SidK8JdJZMYDtvaSeMeX5PrQ+IXn/diOU3a3Iq
	 E+hV4chOcrEqw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: SOF: Intel: remove circular dependency for
 SoundWire BPT
Message-Id: <171504574287.1980570.11050044716970904039.b4-ty@kernel.org>
Date: Tue, 07 May 2024 10:35:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: PUZQYJ4Z37DR62UEFDLCEPXYJBLJ2TQ2
X-Message-ID-Hash: PUZQYJ4Z37DR62UEFDLCEPXYJBLJ2TQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUZQYJ4Z37DR62UEFDLCEPXYJBLJ2TQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 03 May 2024 08:52:14 -0500, Pierre-Louis Bossart wrote:
> The SoundWire BPT support will rely on the HDaudio DMA. This exposes a
> circular dependency module dependency which has to be resolved by
> splitting common parts used by HDaudio and SoundWire parts, and
> 'generic' parts used by HDaudio only.
> 
> This patchset does not change any functionality, it just moves code
> around, exposes symbols that are used in the new module. The code has
> been in use for more than one kernel cycle already so it really
> shouldn't break any existing platforms.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: SOF: Intel: hda-stream: export stream_get_position() helper
      commit: 9e7fd21ab03e6fadc4856f4c06e642daa9ccf7c6
[2/7] ASoC: SOF: Intel: regroup all SoundWire/Intel functions in hda.c
      commit: e4c6eba86d9618d99ba9892bc5d6e47715038530
[3/7] ASoC: SOF: Intel: start splitting top-level from common parts
      commit: 456644cbeab14394fff1308ffdaf87d4e0e6fb01
[4/7] ASoC: SOF: Intel: move common code from hda.c
      commit: 0bfbe91a2dbba31d41add146ab173721dee85ab3
[5/7] ASoC: SOF: Intel: move tracepoint creation
      commit: 136b37369cc4f044139b886133f3b9a721ecacd1
[6/7] ASoC: SOF: Intel: remove circular dependency on hda_sdw_process_wakeen()
      commit: 3b7bd0c139849e95981961525b7f6dd20097a563
[7/7] ASoC: SOF: Intel: move hda.c to different module
      commit: 6fe61f31eab1ec84c385786cd052415d966e5235

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

