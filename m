Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF6281D73
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 23:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E7321ACA;
	Fri,  2 Oct 2020 23:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E7321ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601672956;
	bh=NKFI118U37/X9R8l+JOxUct5ebC+vaZYVVVjk9c/ckI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uIyUpydtEZMHtQ/kp2e6+bjh4js5EAhJiW96j1E6zEcYnNwnp7PWIhSx9kUEUri7w
	 vdbzHWbMIX8/Ax4rkPsM2/8p2+0DpyyxJR+h6Ds9bzstjLSSExYDJnqAcDc9cGv1zD
	 Qx9SZsIZqVF3Gc+SD5vtdLeEK28yqpuBW50a3ghI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CC2F80228;
	Fri,  2 Oct 2020 23:07:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C4EF801F9; Fri,  2 Oct 2020 23:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B96EF800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 23:07:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B96EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bjTGLVDn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC27E206C9;
 Fri,  2 Oct 2020 21:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601672848;
 bh=NKFI118U37/X9R8l+JOxUct5ebC+vaZYVVVjk9c/ckI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bjTGLVDn6xhBExBz4e3JQS6szJkptVXkmfG99KJoRX2A+3KYBSVsCJZYg43Kc8YdC
 e9X8qfN8/C2DsntJOkmS/QTU4CUFrGdzSxb9IZB1kihoIZmQHqhqE7BeHte7TaOpDO
 EDdeEdBelu1SlJPDfJL75b5mFbJJ3Apu9NmD2yXY=
Date: Fri, 02 Oct 2020 22:06:28 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Brent Lu <brent.lu@intel.com>
In-Reply-To: <1594818110-786-1-git-send-email-brent.lu@intel.com>
References: <1594818110-786-1-git-send-email-brent.lu@intel.com>
Subject: Re: [PATCH] ASoC: hdac_hdmi: remove cancel_work_sync in runtime
 suspend
Message-Id: <160167211500.21762.13369928255363041989.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: =?utf-8?q?-louis=2Ebossart=40linux=2Eintel=2Ecom=3E=2C_Takashi_Iwai_=3Ctiwa?=@alsa-project.org,
 =?utf-8?q?hmanen=40linux=2Eintel=2Ecom=3E=2C_Pierre-Louis_Bossart_=3Cpierre?=@alsa-project.org,
 =?utf-8?q?i=40suse=2Ecom=3E=2C_Guennadi_Liakhovetski_=3Cguennadi=2Eliakhove?=@alsa-project.org,
 =?utf-8?q?il=2Ecom=3E=2C_Amadeusz_S=C5=82awi=C5=84ski_=3Camadeuszx=2Eslawin?=@alsa-project.org,
 =?utf-8?q?linux-kernel=40vger=2Ekernel=2Eorg=2C_Kai_Vehmanen_=3Ckai=2Eve?=@alsa-project.org,
 =?utf-8?q?tski=40linux=2Eintel=2Ecom=3E=2C_Liam_Girdwood_=3Clgirdwood=40gma?=@alsa-project.org,
 =?utf-8?q?ski=40linux=2Eintel=2Ecom=3E?=@alsa-project.org
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

On Wed, 15 Jul 2020 21:01:50 +0800, Brent Lu wrote:
> A deadlock is identified when there are three contexts running at the
> same time:
> - a HDMI jack work which is calling snd_soc_dapm_sync().
> - user space is calling snd_pcm_release() to close pcm device.
> - pm is calling runtime suspend function of HDMI codec driver.
> 
> By removing the clear_dapm_works() invocation in the
> hdac_hdmi_runtime_suspend() function, the snd_pcm_release() could
> always returns from dapm_power_widgets() function call without
> blocking the hdac_hdmi_jack_dapm_work() work thread or being blocked
> by the hdac_hdmi_runtime_suspend() function. The purpose of the jack
> work is to enable/disable the dapm jack pin so it's not necessary to
> cancel the work in runtime suspend function which is usually called
> when pcm device is closed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hdmi: remove cancel_work_sync in runtime suspend
      commit: cec6e41ce094affad3b5f9f5e5aa1f81c66ce682

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
