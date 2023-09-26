Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B661C7AE707
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 09:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E266BC0;
	Tue, 26 Sep 2023 09:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E266BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695713972;
	bh=lAxQ/0UTOT6och3JNE/pLFZ/B7SYTjvg5W8X6grQGBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=unvR4EhFdRMe/mDzVt2Nk/dclr9vU0S3gT/aK5S5zPB9jY5bO2TjgFpnoDk7Uv0F4
	 o561SE810aDKcqUxQGlIpxS/QR5W6pGnHB7/GGX7vXEJnK4isgbx7w7gajSbhpAI11
	 Dct5vSKP6ohi8PBx00sDiJvliAtPhVuUKT/m3JsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E51F80166; Tue, 26 Sep 2023 09:38:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C3CF80166;
	Tue, 26 Sep 2023 09:38:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 610F3F8016A; Tue, 26 Sep 2023 09:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54B97F80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 09:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B97F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D/eiAEd9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC908611CF;
	Tue, 26 Sep 2023 07:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CE8C433C8;
	Tue, 26 Sep 2023 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695713903;
	bh=lAxQ/0UTOT6och3JNE/pLFZ/B7SYTjvg5W8X6grQGBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=D/eiAEd9O7qxPjQYtvyYsV5HfDWJqAGs+tQOLry/aU2hDtmR/zW5+YU1KtmydfsHp
	 C0J3CsoFZNG1AhbK+0Y6yhj0gsdTfd2g4w1YZhozlLPUtQkOFTTLVf11CgzofhXV8p
	 n4CwZWGDfuF0AjEyIuEsEnyohJZ2jUi8LY/CglKKJI3JhFj5iy0oTeeCzKliDrb27p
	 igIL6E9l4L+/aLKYxmaP///lzIu9Zqz1g3/wE6cU83jGpdxq5kixEpxnK+hTuvRd6D
	 KoLDpLPDCNSIGSmSBpQD+4m4p5essANZndQBCmB3f5ySBvnUyVh/63ndLohSJroQ/a
	 bMb+lPS3CIYRQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Manuel Lauss <manuel.lauss@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: alsa-devel@alsa-project.org, linux-sh@vger.kernel.org,
 kernel test robot <lkp@intel.com>
In-Reply-To: <20230925125646.3681807-1-geert+renesas@glider.be>
References: <20230925125646.3681807-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: sh: dma-sh7760: Use %pad and %zu to format
 dma_addr_t and size_t
Message-Id: <169571390161.2496919.5867587395937945663.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 09:38:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 34KHS24INDAR5GVESSIF44NKNI5ZVS5R
X-Message-ID-Hash: 34KHS24INDAR5GVESSIF44NKNI5ZVS5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34KHS24INDAR5GVESSIF44NKNI5ZVS5R/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Sep 2023 14:56:46 +0200, Geert Uytterhoeven wrote:
> sound/soc/sh/dma-sh7760.c: In function ‘camelot_prepare’:
> ./include/linux/kern_levels.h:5:25: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘unsigned int’ [-Wformat=]
>     5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
> sound/soc/sh/dma-sh7760.c:198:9: note: in expansion of macro ‘pr_debug’
>   198 |         pr_debug("PCM data: addr 0x%08lx len %d\n",
>       |         ^~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: dma-sh7760: Use %pad and %zu to format dma_addr_t and size_t
      commit: 1056063756d7bbd5e49532278448cd28ecb8f359

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

