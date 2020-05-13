Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72D1D1263
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 14:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAD31665;
	Wed, 13 May 2020 14:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAD31665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589371963;
	bh=y4c8k8sIHtDvVeycegIP+HQkIua+/Rw4sNa/whQ2JOY=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbQsTP0rtXsu+kG+rBHOdsygFl9lu05jjNGykUPPHmqMQgivzvyNw0aOhKcrw53Oz
	 a5Rt/VInTfYDoyt4ZNVcVY8heEV6rSXhFJ0v/Qr5mvJ0kw6FUB48UrLSEpHAXRVCbO
	 g0tmv0uP179V030uEuTQQLj20s9MZ9/WloThX1zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0D8F80253;
	Wed, 13 May 2020 14:11:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF4F5F80247; Wed, 13 May 2020 14:10:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 605E1F800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 14:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 605E1F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iOfUFBJp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DE3720740;
 Wed, 13 May 2020 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589371841;
 bh=y4c8k8sIHtDvVeycegIP+HQkIua+/Rw4sNa/whQ2JOY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=iOfUFBJpkZp+XrNKpQsewM6MDkaZZPJ/BHVjes9LpstYaEC08/9ZgvcYRNHmQmOaK
 +wp26bxtPkq1roUIdClQa2kawhHigfMThRHka0cWXRIriCs6bENj44Va8zIM0K6aHN
 nMoA3HxR4XA6eWBP/V0M+sMMTzR9TGKU5lIE5X5Y=
Date: Wed, 13 May 2020 13:10:38 +0100
From: Mark Brown <broonie@kernel.org>
To: tglx@linutronix.de, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, info@metux.net, lgirdwood@gmail.com,
 patches@opensource.cirrus.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 allison@lohutok.net, perex@perex.cz
In-Reply-To: <1589347835-20554-1-git-send-email-shengjiu.wang@nxp.com>
References: <1589347835-20554-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8962: Use force clear for WM8962_SYSCLK_ENA after
 reset
Message-Id: <158937183894.38875.12948868475258654279.b4-ty@kernel.org>
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

On Wed, 13 May 2020 13:30:35 +0800, Shengjiu Wang wrote:
> When CLOCKING2 is non-volatile register, we need force clear
> the WM8962_SYSCLK_ENA bit after reset, for the value in cache
> maybe 0 but in hardware it is 1. Otherwise there will issue
> as below statement in driver.
> 
> /* SYSCLK defaults to on; make sure it is off so we can safely
>  * write to registers if the device is declocked.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: wm8962: Use force clear for WM8962_SYSCLK_ENA after reset
      commit: 65e412a01bc0161175a962abd5a7fef6a62d5c8e

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
