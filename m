Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C01CB663
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 19:54:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 376FB839;
	Fri,  8 May 2020 19:53:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 376FB839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588960453;
	bh=EDs/lYMTR6duIghKPZbNYHj/6gUoXDqvRRCEyYxbEkI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WgQHngOIm5y5NUCMIu76jBMopaS89aK3yNplG5PnXZC1RiPl00s3Vx3ZRYnvMP3oa
	 Lhi+Djq4RqQ3gS5HMHLoTAQk8+YClD07qjsdAqnI0Sr6VM5PbYlgk6KEnBJRdsCdIl
	 D3MuMMVD53elxyTygFVTKPgNgnAVKzozaL7Qbp6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 473DFF80249;
	Fri,  8 May 2020 19:52:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C4B5F8023E; Fri,  8 May 2020 19:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E642F800F6
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 19:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E642F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xtFHQ65M"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01225214D8;
 Fri,  8 May 2020 17:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588960341;
 bh=EDs/lYMTR6duIghKPZbNYHj/6gUoXDqvRRCEyYxbEkI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xtFHQ65M8//3Kdj9pvdEYPBRc65XqqD98KyVRpHIl5iSz5KGl1sXzJuONIQKV7kCh
 xaPdSp4CQ5M6gseF88Y8cuya23MlgOMfVkFjj9tlpVWh5/Q1wo+SNF4KLhkTdk5fsR
 JoMPvJrGnsLwtGyBYtp3OkLUkmK9ZBUaYWA1aDgc=
Date: Fri, 08 May 2020 18:52:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Cheng-Yi Chiang <cychiang@chromium.org>
In-Reply-To: <20200507213405.1869430-1-arnd@arndb.de>
References: <20200507213405.1869430-1-arnd@arndb.de>
Subject: Re: [PATCH] ASoC: cros_ec_codec: allocate shash_desc dynamically
Message-Id: <158896033901.2700.3513138380933416589.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 7 May 2020 23:33:51 +0200, Arnd Bergmann wrote:
> The wov_hotword_model_put() function has multiple large variables on
> its stack, the largest of which is the result of SHASH_DESC_ON_STACK().
> In total, this exceeds the warning limit for 32-bit architectures:
> 
> sound/soc/codecs/cros_ec_codec.c:776:12: error: stack frame size of 1152 bytes in function 'wov_hotword_model_put' [-Werror,-Wframe-larger-than=]
> 
> The function already has a dynamic crypto_alloc_shash() allocation, so
> using kmalloc() for the descriptor is correct as well and does not
> introduce any additional failure scenarios. With this, the stack usage
> of wov_hotword_model_put() gets reduced to 480 bytes in my test
> configuration.

Applied to

   local tree asoc/for-5.7

Thanks!

[1/1] ASoC: cros_ec_codec: allocate shash_desc dynamically
      (no commit info)

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
