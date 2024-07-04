Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C98927979
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 17:04:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D2B414F2;
	Thu,  4 Jul 2024 17:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D2B414F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720105444;
	bh=sqDTlozgNMJSM0AHPdm7EUAIVn2oDHK0DdTYht4ikvI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y1rMd7yfP32AEjZjc66BkDumFCgcvJRGrOulR0HaIOLilCW+df9XSfu60cQm/1+6D
	 z2645vvoCGLQbS+2s+OCjiAFSxPHWxz7YL+/3VSbDz+DwcZ40TlQ+eNpyCqk7YgXJJ
	 KHDiBrhKp/tkOOyXzALmUJ2s0a10Zx8M1vnbzZ/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B230F805B0; Thu,  4 Jul 2024 17:03:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DBBF805A0;
	Thu,  4 Jul 2024 17:03:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1453BF8025E; Thu,  4 Jul 2024 17:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DFE7F800FA
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 17:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DFE7F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mSjmkrk6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D1F5CE3817;
	Thu,  4 Jul 2024 15:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FA2C3277B;
	Thu,  4 Jul 2024 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720105315;
	bh=sqDTlozgNMJSM0AHPdm7EUAIVn2oDHK0DdTYht4ikvI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mSjmkrk69vAiaxLyBPnptZ+Mxbi5naIja3zHNiCL6rBjv41RSqo2XFj64EHc6yQ2t
	 0w+e/ryR7TrUfc27azlfQ0gJWNUZ8nVrQNJgKRmFUxJkpm6lU6jmoRQbysNLY0xuS8
	 nCyDPG33sow9PQgK2M1N7wndKf85bjhhrd/JV/LsWPPJjNSYQpAuVih8imr8Sr01hB
	 s84kUqvpAnsD9bojjf62QJ11Ohn6g9UW1XediS5G45SIRhR8fNYh2mzwQDjibNJZqB
	 zeB/yWd2YtgaF6nhfA4wO1/MAiGuaQS4QyOFnYa/AoIqCarcgS03Qdk9PxXvL8ZSZd
	 mTmHJ52GiIkRw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20240704085944.371450-1-pierre-louis.bossart@linux.intel.com>
References: <20240704085944.371450-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Use single token list for
 the copiers
Message-Id: <172010531424.64240.8468418054807775164.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 16:01:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: OBBUECAYATL3TJSULZN5XU2CMWYYCSC2
X-Message-ID-Hash: OBBUECAYATL3TJSULZN5XU2CMWYYCSC2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OBBUECAYATL3TJSULZN5XU2CMWYYCSC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Jul 2024 10:59:44 +0200, Pierre-Louis Bossart wrote:
> There is no need to keep separate token list for dai and 'common' copier
> token list when the 'common' list is actually the aif list, the
> SOF_COPIER_DEEP_BUFFER_TOKENS are not applicable for buffers.
> 
> We could have separate lists for all types but it is probably simpler to
> just use a single list for all types of copiers. Function specific tokens
> will be only parsed by function specific code anyways.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: Use single token list for the copiers
      commit: 6558e8737af2067763e115ce3759372cd068b897

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

