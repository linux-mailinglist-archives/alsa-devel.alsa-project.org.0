Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84877991430
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2024 05:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8208684D;
	Sat,  5 Oct 2024 05:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8208684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728100329;
	bh=LwpJjL/sAZamAjbREfwblRFe/pUWGWf4oudQBiz54rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e5C2Rkta1JWU/6DMURQS8hNCXlWBjNcj1ZxTVKdw1xt50m0hSp3axb0VE8yOSGih5
	 bjibxjRPRWIFHU8ZTl+z0eg7oyQaADKcSqYDOEjZNJ8rmm0+Y8T5M6vkZKXmpd3s2z
	 z5eo5o57LVhs2xw4oGIAdXUoCIPjX4oFwnAt4/WI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C2DBF805BB; Sat,  5 Oct 2024 05:51:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2662BF805AB;
	Sat,  5 Oct 2024 05:51:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B4D6F80517; Sat,  5 Oct 2024 05:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3B7CF8001E
	for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2024 05:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B7CF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Pb/Ik5ac
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33563A443E6;
	Sat,  5 Oct 2024 03:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB33CC4CEC2;
	Sat,  5 Oct 2024 03:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728100279;
	bh=LwpJjL/sAZamAjbREfwblRFe/pUWGWf4oudQBiz54rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pb/Ik5ac1zGRheA15syfndYOOvy73c90bPQPVxm871bmWsMbGYDrjomhqi2AtbxIE
	 3nsrYWCJn7l+VIKNngJ0bxbREgXEv5BuJ2Q5z4y6hba1GWlTElttgb6nwxfmi8uZuc
	 SIVoAWPjaF8jE70V4EX/Fbiqoo5LUO+BX+EIBZn5CxRfI10qQQKL6OAZ4AmBfXg35H
	 Wp49z25WRy/1b95jcLtLvq3YcFA2IARpS/KtMzoUcBtw6K51CODQQcXDIGF+213Zwj
	 qUpf67QGvVTeO5mCeUKV1Ww5FyjrIozk/Cv38jTo5T02w033VxkIZ/EbLWN+iZuWdp
	 Fh4SjQetlVBlA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241003122015.677681-1-herve.codina@bootlin.com>
References: <20241003122015.677681-1-herve.codina@bootlin.com>
Subject: Re: [PATCH] ASoC: fsl: fsl_qmc_audio: Remove the logging when
 parsing channels
Message-Id: <172810027430.832098.16999500333273178564.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 04:51:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: Q3FX4E46HA4MXJZHQQZOPRG7BN7NXTOA
X-Message-ID-Hash: Q3FX4E46HA4MXJZHQQZOPRG7BN7NXTOA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3FX4E46HA4MXJZHQQZOPRG7BN7NXTOA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 03 Oct 2024 14:20:15 +0200, Herve Codina wrote:
> On each channel parsing, a log message is issued. This log message is
> not needed and become annoying when many channels are used (up to 64
> channel supported).
> 
> Simply remove this unneeded log message.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Remove the logging when parsing channels
      commit: c6e86e19e778553dbedab617aafb25b6bbaf4cd9

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

