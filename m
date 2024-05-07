Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D778BD908
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 03:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABE47207;
	Tue,  7 May 2024 03:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABE47207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715045825;
	bh=i4HnHQzydUh3clXw1HQgCDinqsGXvhs5w/dIG4yr6tM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pJfJdUTwhSOkhbHOrFEnabpVzYlnTv7msurIUgk4L/F3M4uFZ7aWiDHB4/B/RPSvb
	 /1gsg4F/ikBNurUnLWDkAui82J4NFXJ5MEBgqrqnJaZj0CNuiouEkatZ9B8NoirgwL
	 zG4/OTRplmLvzmQVWAUYGd1EVTl6eMXGr3CpJmU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE8BEF805F7; Tue,  7 May 2024 03:36:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1045CF805F6;
	Tue,  7 May 2024 03:36:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5167F8057B; Tue,  7 May 2024 03:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1988F8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 03:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1988F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EXUZg10z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53299CE1002;
	Tue,  7 May 2024 01:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58DE3C116B1;
	Tue,  7 May 2024 01:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715045747;
	bh=i4HnHQzydUh3clXw1HQgCDinqsGXvhs5w/dIG4yr6tM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EXUZg10znflx8/JeaPt/Hi9xIRMfdQA2o/GpPOvONurSvlt44sCjhhA7GBU6yH8TL
	 8X+ohJSZUJ7So0gvZS7u1BfjneYH/vnGx0+fJ0+y/nTnuNtCuqE9xC1mXzI79GL/qN
	 br/s0BOPUIxJemHLTER9inlh2hANLtzmh43e+CD9Jm/rGo0PM54tuLryVBbIxuuL2z
	 f446PXieb8lk+1iOc1lPNbrziKr8Ej6P++vNbDMdfxSKWnMCaiHkRoUZ9JAQOR9IJ6
	 RMoWfBSMz5EqCelzMufmSzPxxphU2m+RBaauHHd97v1JRto1dheAEpu0ewtROmNY4c
	 bW7XCUdN0pGfw==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, bard.liao@intel.com,
 yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
 cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
 Baojun.Xu@fpt.com
In-Reply-To: <20240505122346.1326-1-shenghao-ding@ti.com>
References: <20240505122346.1326-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v2] ASoC: tas2781: Fix a warning reported by robot
 kernel test
Message-Id: <171504574426.1980570.10154577788713612869.b4-ty@kernel.org>
Date: Tue, 07 May 2024 10:35:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: CJV352XEBBXLYT253H42D52TEF3KZQQR
X-Message-ID-Hash: CJV352XEBBXLYT253H42D52TEF3KZQQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJV352XEBBXLYT253H42D52TEF3KZQQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 05 May 2024 20:23:45 +0800, Shenghao Ding wrote:
> Fix a warning reported by robot kernel test that 'fw_entry' in function
> 'tas2781_load_calibration' is used uninitialized with compiler
> sh4-linux-gcc (GCC) 13.2.0, an update of copyright and a correction of the
> comments.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Fix a warning reported by robot kernel test
      commit: 1ae14f3520b1a0ad144610a3f592c81a3e81cd1b

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

