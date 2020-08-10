Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD945240D4F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 20:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9758E1664;
	Mon, 10 Aug 2020 20:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9758E1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597085997;
	bh=6m89LwQymWWFKzojkQXn5VU1SIsbMwB2ToiCTgefcOg=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzGw+ctdN4giRfMsPHXwSkF7hcShDz4IgX5wIrTk4miRnyXFWZwy8fwoME30nutBy
	 Dq9e0+XttMi6UjauRHHDwWvYGj5kgJBSvxWLXZG6kqS8km406W+m+jzJPHCK8hpWwH
	 SOX6lZqe+LFs6Ov1hFU+HB/zfQJUihd1/rcndf3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC2DF80085;
	Mon, 10 Aug 2020 20:58:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4523FF8022D; Mon, 10 Aug 2020 20:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB0D8F80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 20:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB0D8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iCRGvQp0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F05B20774;
 Mon, 10 Aug 2020 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597085885;
 bh=6m89LwQymWWFKzojkQXn5VU1SIsbMwB2ToiCTgefcOg=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=iCRGvQp0JpqOcRY8Zbn+14+sbysIa5JFLuj6tIFI91EyDNlHfXrlXjdJnm+ikLMkM
 nxV6TCsTpAXijpwLWlDhJSco5IGw9aHJ0neIwG5zt5gyWQO12ByufFW/iZOYTmf/xO
 WaddxDHTlbY1bnyttvvWkLPV1TlBYOjsdB9WfbM0=
Date: Mon, 10 Aug 2020 19:57:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <20200807161046.17932-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200807161046.17932-1-Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name.
Message-Id: <159708585778.21544.6105226494365103572.b4-ty@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

On Fri, 7 Aug 2020 21:40:17 +0530, Ravulapati Vishnu vardhan rao wrote:
> Replacing string compare with "codec_dai->name" instead of comparing with
> "codec_dai->component->name" in hw_params because,
> Here the component name for codec RT1015 is "i2c-10EC5682:00"
> and will never be "rt1015-aif1" as it is codec-dai->name.
> So, strcmp() always compares and fails to set the
> sysclk,pll,bratio for expected codec-dai="rt1015-aif1".

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Replacing component->name with codec_dai->name.
      commit: ea7dc097826b06a9746a2e74c2d6e78d35c98088

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
