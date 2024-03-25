Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0C88AF2A
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 20:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E70214EA;
	Mon, 25 Mar 2024 20:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E70214EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711393257;
	bh=3phOsfj299vReX13jBEsAZUiG0U9Ij11nDe4fUf1txA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BruDfI1hHf4GrbeESoEnHanQxbRzGZ6+VU4wFrOzbIH0HWm4WTOHToWwnzUz99BsE
	 BpV+V+tEsoy8kSnDvZ72eVRr1psAmtqnaw4Nct7op+Q9Zt9+66fjsZ8W+RvgDU3t5J
	 b2vJzPxQOcYEaTG8gcWeO9Wv2OYktLs/MGK8fad4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AE81F806E3; Mon, 25 Mar 2024 18:44:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10D0FF806DE;
	Mon, 25 Mar 2024 18:44:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0474F80682; Mon, 25 Mar 2024 18:44:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A96DEF80682
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 18:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A96DEF80682
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uleASsOJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E203CE1C13;
	Mon, 25 Mar 2024 17:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80035C433C7;
	Mon, 25 Mar 2024 17:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711388660;
	bh=3phOsfj299vReX13jBEsAZUiG0U9Ij11nDe4fUf1txA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uleASsOJVKH6GH5mbWkE7YCmO5mRO3FV8rlVA/9sTcBM5MnphiVvP8xSo0Wgt+yjk
	 I4U/dnEpppcmTx5bkfN/HCSsafZL/4i6/PmGAzTyf2IEe81kEJhD5lH10cQ0mTAyKh
	 4/Pd4vY1zFMrdyfTnIRCfQ63cqEIRmLJ10uRyKV3G1S8z7rNqAteLIwEa6ckQjjRAF
	 cFfpJspRAWTHzAESj5+y77LbMD4bOS561sIneCO6H3pVzvaRm7EqgMInepw7cYCHES
	 9jhE6Rm2TC3HBL5pZdTtv4ZLrs3XhM0pWPKdDngUp3UIaiJCXoUd1ep36evAdQ9iQN
	 731RjYgye/JlA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, arnd@arndb.de,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20240322112018.3063344-1-Vijendar.Mukunda@amd.com>
References: <20240322112018.3063344-1-Vijendar.Mukunda@amd.com>
Subject: Re: [RESEND] ASoC: amd: simplify soundwire dependencies for legacy
 stack
Message-Id: <171138865825.327140.9353092446072557708.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 17:44:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: OIESMANBYJ4BEJM3K2JHFOHUHBF2MSQL
X-Message-ID-Hash: OIESMANBYJ4BEJM3K2JHFOHUHBF2MSQL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIESMANBYJ4BEJM3K2JHFOHUHBF2MSQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Mar 2024 16:50:15 +0530, Vijendar Mukunda wrote:
> The CONFIG_SOUNDWIRE_AMD is a user-visible option, it should be never
> selected by another driver.
> So replace the extra complexity with a normal Kconfig dependency in
> SND_SOC_AMD_SOUNDWIRE.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: simplify soundwire dependencies for legacy stack
      commit: a806793f231e390510343837668d8f0eade75a72

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

