Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14660764077
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 22:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B9FE844;
	Wed, 26 Jul 2023 22:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B9FE844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690403158;
	bh=aLXUCgzmdbz5Uh/9NSOALUTpFEZu0cFA7fY6IgsRn0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xchs/rv4c/uN7641nFlhcwXhSntM/UUWTfVhoo0FWBBdPM2azk3adsL9sBy4L8a2h
	 ZYmN/NH5W3NnQeUPQjpfMe4AqaqUnu71gRqypkXsn2oGW4F+i7jZGIFthE7K+pvhPX
	 y6Ks016Iyrk21FkuQjIObwY3xtqjUOOuc3GOCGzo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8481F80544; Wed, 26 Jul 2023 22:24:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDAFCF80153;
	Wed, 26 Jul 2023 22:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7DF1F8019B; Wed, 26 Jul 2023 22:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E18BF80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 22:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E18BF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uwKJCO0E
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADF3161C39;
	Wed, 26 Jul 2023 20:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B937C433C7;
	Wed, 26 Jul 2023 20:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690403062;
	bh=aLXUCgzmdbz5Uh/9NSOALUTpFEZu0cFA7fY6IgsRn0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uwKJCO0EIijbinn/BW6Tuzp3Sb6UfSdMayIFex70PvuIrVYBqscKeX3A+9El2i2WM
	 rSLJs+hHUpXWlVVfA/oJwcyImAvUr7EgY8wseBov85LCS7CQ7HDZh3hYsP/K1v0hJi
	 R3GvIaft2KY4ENiulOBLZqOlLraoKloXGSEfihneXgEJ0fJ/MZG2ErIL9hO2gcwYXW
	 h6KKlwudgVdSRoitBdyZxWbwKEngJkcD4XIYt79MPzRVEGPdcZTlmen+l2/FwkHEpP
	 KXY6nAOAvjRKneEwsPp3sE7VAV4SM6yzBkfEGSqcJ4v5dVgo8AMK+H+qnvwBkOwRGt
	 3jSgox/lZ3PoQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20230726161620.495298-1-herve.codina@bootlin.com>
References: <20230726161620.495298-1-herve.codina@bootlin.com>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t
 values handling
Message-Id: <169040305934.140086.11999495195860520544.b4-ty@kernel.org>
Date: Wed, 26 Jul 2023 21:24:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: FJD3NI6RQYJLTHTOVUH2DPPJWZZ7GZD4
X-Message-ID-Hash: FJD3NI6RQYJLTHTOVUH2DPPJWZZ7GZD4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJD3NI6RQYJLTHTOVUH2DPPJWZZ7GZD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Jul 2023 18:16:20 +0200, Herve Codina wrote:
> Running sparse on fsl_qmc_audio (make C=1) raises the following warnings:
>  fsl_qmc_audio.c:387:26: warning: restricted snd_pcm_format_t degrades to integer
>  fsl_qmc_audio.c:389:59: warning: incorrect type in argument 1 (different base types)
>  fsl_qmc_audio.c:389:59:    expected restricted snd_pcm_format_t [usertype] format
>  fsl_qmc_audio.c:389:59:    got unsigned int [assigned] i
>  fsl_qmc_audio.c:564:26: warning: restricted snd_pcm_format_t degrades to integer
>  fsl_qmc_audio.c:569:50: warning: incorrect type in argument 1 (different base types)
>  fsl_qmc_audio.c:569:50:    expected restricted snd_pcm_format_t [usertype] format
>  fsl_qmc_audio.c:569:50:    got int [assigned] i
>  fsl_qmc_audio.c:573:62: warning: incorrect type in argument 1 (different base types)
>  fsl_qmc_audio.c:573:62:    expected restricted snd_pcm_format_t [usertype] format
>  fsl_qmc_audio.c:573:62:    got int [assigned] i
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: fsl_qmc_audio: Fix snd_pcm_format_t values handling
      commit: 5befe22b3eebd07b334b2917f6d14ce7ee4c8404

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

