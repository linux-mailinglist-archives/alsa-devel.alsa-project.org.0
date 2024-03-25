Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6118588AF29
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 20:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8721919;
	Mon, 25 Mar 2024 20:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8721919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711393257;
	bh=qb0iwJLbOS+LnSN4h1wK8br8fS0Emdh+02cjuu/+jmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=auYz+YuR+ccsx+0LxwAX+XbK52qeGH9nr14UPuU/cb9No3oVcTuL7niQ504suHYDf
	 zUCY9jLs6dl8D46rCcWTu/3P2DKAp6+v0rHhO6v5helNyQVOv80uFgQAFkqdKIO+2N
	 eDHdhiHydZhZKTmVT/y2EECcu7Bh0Ogvfg89v36g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0181AF806A0; Mon, 25 Mar 2024 18:44:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9EC2F806AC;
	Mon, 25 Mar 2024 18:44:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C18B3F80684; Mon, 25 Mar 2024 18:44:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F5A4F805E0
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 18:44:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F5A4F805E0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CM0olkc8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 724FC61012;
	Mon, 25 Mar 2024 17:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF51C433F1;
	Mon, 25 Mar 2024 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711388658;
	bh=qb0iwJLbOS+LnSN4h1wK8br8fS0Emdh+02cjuu/+jmQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CM0olkc8ABVp8KmSIRMh1EoZWuTErWkfpQ+hJU4vDTWnSETmZfbGeyRGVE4x9Nyxa
	 27DwkyOdKYLCruQnOqbQHzR05Rp3BAE2hAyghZiJ8C137RVPkChKjQqD/PQV+L4ejY
	 2reiR8/UxcV8rWkRIj9u0WCdGg5J1pte9EghB0pRGEYPKf2DtOoAsSQ5r4dGkgxqPZ
	 eQTqsvSSW3FZK4OC3sMVhHKGAkLI2w3TT5ACE1yGocgfq9tUuug0T44ZD3bdxHFEZv
	 f/WiEP9nvnZXMqXQbbBQSQZvSGXUeZyebHHHVztGIihBia+vYv1+x4Lhc0CHDh/WRj
	 eV5x9HYl8IfSA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
References: <20240318200804.181516-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ASoC: fsl: imx-es8328: Switch to using gpiod
 API
Message-Id: <171138865464.327140.5568916833564730450.b4-ty@kernel.org>
Date: Mon, 25 Mar 2024 17:44:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: LWIW7ZZZ65ONYFXCAT6R7IFMS6OCTHAJ
X-Message-ID-Hash: LWIW7ZZZ65ONYFXCAT6R7IFMS6OCTHAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWIW7ZZZ65ONYFXCAT6R7IFMS6OCTHAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 18 Mar 2024 22:07:56 +0200, Andy Shevchenko wrote:
> This updates the driver to gpiod API, and removes yet another use of
> of_get_named_gpio().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-es8328: Switch to using gpiod API
      commit: 9855f05e553637f05494cf47a3154cbf9a5cfc67

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

