Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1748AAC67
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 12:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6223E843;
	Fri, 19 Apr 2024 12:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6223E843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713521089;
	bh=Y+l/5wzPKHUbS5RS+cGf0Dhxvzxyf8nHK5sorhrqVPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vlw3Z8zIVZzpHpMQ4a/vePYRJpHnrNgqVZypErGM0ZkXZZHuRzsad+m9fbW1WvtdL
	 9P1vcLtpyTS429Xb0+GknFqmeVV7wMeGfGP+07sCXia1Wo1nBMvvgF5zINjpI7S6pV
	 JVcCPWufxzYY6eNHisCm5iis7EmpWufKl6MBHGsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 159E1F80580; Fri, 19 Apr 2024 12:04:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D811DF805A0;
	Fri, 19 Apr 2024 12:04:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F37ACF8025A; Fri, 19 Apr 2024 12:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69555F8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 12:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69555F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qNp4CEeH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27F1861771;
	Fri, 19 Apr 2024 10:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F597C072AA;
	Fri, 19 Apr 2024 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713521019;
	bh=Y+l/5wzPKHUbS5RS+cGf0Dhxvzxyf8nHK5sorhrqVPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qNp4CEeH/RtTaj6c0/jyji1DErFEvmLvA92sY4so1y3KYC/ks7SaahgVq73vRFfyC
	 721AQNRNvig2459UGf0y2hfBSiI8S4ZTmo0TFB3FPM1YXjF0yPIre5DIcPdG1CYM6T
	 qjW/w/UfrCQ0cIqi0SB/B0BrNySAkVpRI5zIC0mJ521c4v2z89/mulx2bQlvKzpx90
	 n8XT6DHr8MlWaTGFXevMdeE0iFjSWWbIWxrS8fHQxJ4i/gOpDBVQhEzrGiF/0iBdpB
	 tuhx4c9SXceMAev1iGFrAd5kHh/e4NvtB5GwdNeIhZ11qwgiKcxe8S0Mruu2+Y13BP
	 Gi5DtPBR0WmGQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Jai Luthra <j-luthra@ti.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
In-Reply-To: <20240417184138.1104774-1-jpaulo.silvagoncalves@gmail.com>
References: <20240417184138.1104774-1-jpaulo.silvagoncalves@gmail.com>
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: Fix race condition during
 probe
Message-Id: <171352101774.1723702.5403683019757123784.b4-ty@kernel.org>
Date: Fri, 19 Apr 2024 19:03:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: IBYMKGZLFZJFWRB3XMLENYSHXMKXXCUU
X-Message-ID-Hash: IBYMKGZLFZJFWRB3XMLENYSHXMKXXCUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBYMKGZLFZJFWRB3XMLENYSHXMKXXCUU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Apr 2024 15:41:38 -0300, Joao Paulo Goncalves wrote:
> When using davinci-mcasp as CPU DAI with simple-card, there are some
> conditions that cause simple-card to finish registering a sound card before
> davinci-mcasp finishes registering all sound components. This creates a
> non-working sound card from userspace with no problem indication apart
> from not being able to play/record audio on a PCM stream. The issue
> arises during simultaneous probe execution of both drivers. Specifically,
> the simple-card driver, awaiting a CPU DAI, proceeds as soon as
> davinci-mcasp registers its DAI. However, this process can lead to the
> client mutex lock (client_mutex in soc-core.c) being held or davinci-mcasp
> being preempted before PCM DMA registration on davinci-mcasp finishes.
> This situation occurs when the probes of both drivers run concurrently.
> Below is the code path for this condition. To solve the issue, defer
> davinci-mcasp CPU DAI registration to the last step in the audio part of
> it. This way, simple-card CPU DAI parsing will be deferred until all
> audio components are registered.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-mcasp: Fix race condition during probe
      commit: d18ca8635db2f88c17acbdf6412f26d4f6aff414

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

