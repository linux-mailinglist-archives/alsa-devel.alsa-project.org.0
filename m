Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBEF90B801
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 19:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA6FE67;
	Mon, 17 Jun 2024 19:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA6FE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718645251;
	bh=Galb2R72ZDFbuADAfagUUEATITsEl3obGN2wKJQfpbA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l97i1NT4ibNyA5ppEsGgjJMpwn20pX1Clj7Ko9RV2DAT9P2gJz1QWRqa8edEw9+VX
	 cSR9hyndIax3j99I1BjaEJrqTbm/XPoUuBPg29l+idIvrGFHgPnNtxSwebIIxMPVt0
	 AP2ylibgxSX1rHjVJqL2/dTBHn9PK4xqqyEorMrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA6FF805C8; Mon, 17 Jun 2024 19:27:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB97F805C4;
	Mon, 17 Jun 2024 19:27:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A3DBF805A0; Mon, 17 Jun 2024 19:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A07B5F805B6
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 19:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A07B5F805B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U/lBgC7H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CCB95CE12DC;
	Mon, 17 Jun 2024 17:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156BCC2BD10;
	Mon, 17 Jun 2024 17:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718645212;
	bh=Galb2R72ZDFbuADAfagUUEATITsEl3obGN2wKJQfpbA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U/lBgC7HYfa3awbsv922WQIlVSDWV3Q3dloiCvdd3uo/pZ0H4OXjwohO/1mh2E813
	 8rQ+v0SPPSgq2OTPU/oYCMFCEgsNfxhNQodh3UkfTW2mPRSCOlUe9FVEGP300ZTCZ3
	 ApmRUOHkhWwpqBVCzRN9ZjZ+JbAjvZfAv3JW2EBm8BG7ga/UNGMoC8AqGtLh2z/0Ld
	 2vNnxs7BWXWMMKjXUFbq+hkwyGqYnUwKn/3Sdqpe4Xwg8lHfe7ULtOlacAK0ydg3PE
	 U5mayLHmuAIU5ptRTZ/zq0PnDHFi+GLm66rG21G7zDbZ6dSmg5CGBskdcCWDmYI/03
	 lZ72PQevA5hVw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240616-md-arm-sound-soc-fsl-v2-1-228772e81a54@quicinc.com>
References: <20240616-md-arm-sound-soc-fsl-v2-1-228772e81a54@quicinc.com>
Subject: Re: [PATCH v2] ASoC: fsl: imx-pcm-fiq: add missing
 MODULE_DESCRIPTION() macro
Message-Id: <171864520667.209755.6049429279245584956.b4-ty@kernel.org>
Date: Mon, 17 Jun 2024 18:26:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 6DZ4KG46VVWICXFITRTK4NX3T62CC7TG
X-Message-ID-Hash: 6DZ4KG46VVWICXFITRTK4NX3T62CC7TG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DZ4KG46VVWICXFITRTK4NX3T62CC7TG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 16 Jun 2024 20:52:26 -0700, Jeff Johnson wrote:
> With ARCH=arm, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-fiq.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: imx-pcm-fiq: add missing MODULE_DESCRIPTION() macro
      commit: 39eab0148752055928c4c54db12d6cf89881e6cd

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

