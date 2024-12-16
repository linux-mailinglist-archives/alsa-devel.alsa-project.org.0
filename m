Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA09F3426
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Dec 2024 16:13:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE2A4212;
	Mon, 16 Dec 2024 16:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE2A4212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734361996;
	bh=q7zy400uagPLKS9PRJpxOSiIFghsPRdYPTkFfB41EDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hUctty0yn+3W0UI8PGNAdTbhXe19OiGdIaIDFiYGeaR9VIy4ZD4dQH68ZlOJvbb5N
	 RqCltoUngPyUop9aq2u/0J6oupXe0kptKc23GpwSS8oElYD3DtqTxq0CsnWePN/ZGx
	 Ut4HaP26FgW6+vQTGB7J8L32L0Yd6y1PP8iT5+po=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AEF1F805BE; Mon, 16 Dec 2024 16:12:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A43F805C0;
	Mon, 16 Dec 2024 16:12:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31893F804CC; Mon, 16 Dec 2024 16:12:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55A11F800B5
	for <alsa-devel@alsa-project.org>; Mon, 16 Dec 2024 16:12:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A11F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uCQMQdk1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2D505C4BF8;
	Mon, 16 Dec 2024 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0932C4CED0;
	Mon, 16 Dec 2024 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734361947;
	bh=q7zy400uagPLKS9PRJpxOSiIFghsPRdYPTkFfB41EDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uCQMQdk1SPY1D9l+ivTDmzVk0cAnPmuGO7jH2V2OTCwKCb54sQijkTdGLRzFm89uI
	 F3MMjBPqydYJrrGzDF6yl+Y51xq0fXbTGQRY7DFnKNvISE6hP2BeMZh3sRiGEUkcgV
	 vvs1jhFx8fk8TirQ4PUdTlJ3Glp3KFvK8WzxNS2zJIUVH6zrV7mMtp7aiIaYjWrp9G
	 Q3o/vY5CuhFot7eRryD/i4xizC4LfElzT7rY1QuE/Mt0G3wZcGQUNyPhHawjMNm34y
	 jwjzHCMN1N6kXMuW/Mp7yMyimuFzlfP0wT4J0EnnpbLS+7vBTn80oBvLiVtnbSvOWO
	 3DuCrQ8AUO+sQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, mario.limonciello@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20241213061147.1060451-1-venkataprasad.potturu@amd.com>
References: <20241213061147.1060451-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: ps: Fix for enabling DMIC on acp63 platform
 via _DSD entry
Message-Id: <173436194432.77772.11451411947563731348.b4-ty@kernel.org>
Date: Mon, 16 Dec 2024 15:12:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: XFJ3OTHZVRNAI27AY34R2HU4DIUZYA22
X-Message-ID-Hash: XFJ3OTHZVRNAI27AY34R2HU4DIUZYA22
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFJ3OTHZVRNAI27AY34R2HU4DIUZYA22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Dec 2024 11:41:46 +0530, Venkata Prasad Potturu wrote:
> Add condition check to register ACP PDM sound card by reading
> _WOV acpi entry.
> 
> Fixes: 0386d765f27a ("ASoC: amd: ps: refactor acp device configuration read logic")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: Fix for enabling DMIC on acp63 platform via _DSD entry
      commit: 88438444fdddd0244c8b2697713adcca3e71599e

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

