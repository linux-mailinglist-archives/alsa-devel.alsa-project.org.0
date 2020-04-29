Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9838A1BE3D5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:28:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384AF845;
	Wed, 29 Apr 2020 18:27:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384AF845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588177729;
	bh=33oKVqnVVSWcPuaIyCjKz2vV+qGee0QU5lzC5qxpjZ0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RguaHnUyEK2RrfCMxaBFJUlKVKEI8rDQwfcK9Xn8l+L978ALw8gl8lmpHQMPl1283
	 UBtIGyclKcvdPzRKkd2cRfpgcdjUcLbmrumZ3kggU+ZOsvx00dEDD4iqvXHoOWCd7z
	 Bbi5Pck8vRaXadV8FYHKAJE84VfK1kKYzbB9BaYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D26F80247;
	Wed, 29 Apr 2020 18:26:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F036F8022B; Wed, 29 Apr 2020 18:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA3DFF80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA3DFF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sCVPwvP0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 992892076B;
 Wed, 29 Apr 2020 16:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588177575;
 bh=33oKVqnVVSWcPuaIyCjKz2vV+qGee0QU5lzC5qxpjZ0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sCVPwvP0tWgHHy/E27fudChYtQK4UQQxo9v1bQYKiAgPGsOHKXUWRpwM6CJO59Kdk
 16QPw4Vi5mL13byrj32MHTVDjSq16dmvs+AAZ2OKZpKL3a4q9tlvz/vyW0VCaAbDog
 vjcozreqTCK2o0RkTC8u/UYzi8l2ADJJlohaPxNM=
Date: Wed, 29 Apr 2020 17:26:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Timur Tabi <timur@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <20200428212847.2926376-1-arnd@arndb.de>
References: <20200428212847.2926376-1-arnd@arndb.de>
Subject: Re: [PATCH] ASoC: fsl_easrc: mark PM functions __maybe_unused
Message-Id: <158817756638.27768.13822948104457299760.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
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

On Tue, 28 Apr 2020 23:28:08 +0200, Arnd Bergmann wrote:
> ifdefs are hard, and in this driver the suspend/resume functions are
> the only callers of some other helpers that trigger a harmless warning
> when CONFIG_PM is disabled:
> 
> sound/soc/fsl/fsl_easrc.c:1807:12: warning: 'fsl_easrc_get_firmware' defined but not used [-Wunused-function]
>  1807 | static int fsl_easrc_get_firmware(struct fsl_asrc *easrc)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> sound/soc/fsl/fsl_easrc.c:303:12: warning: 'fsl_easrc_resampler_config' defined but not used [-Wunused-function]
>   303 | static int fsl_easrc_resampler_config(struct fsl_asrc *easrc)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_easrc: mark PM functions __maybe_unused
      commit: 087e3900a060cfc8516e02ea83fe6122da490d23

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
