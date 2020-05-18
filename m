Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 131211D7EFF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:45:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48F91727;
	Mon, 18 May 2020 18:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48F91727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820338;
	bh=l4OKSpQb7xCEPsp2YagYvuWupUCN1pS/UdfClZttRgs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEjHMUHYFhP557W2LkikEnspWjnKuxzFuiFii650L7iOs3my2i/6eQW0fS5907i3V
	 RMX6ubkA7H/GmH2QZCqJC7Z2KBWL7J4KuzFtbb+Eh8J/UgiSFcyepixJSihqk26NRN
	 iW8DYnFW8bSiLP0Hj4QhEu5rszsj1K0Nt+Acr8Mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EEF3F8029B;
	Mon, 18 May 2020 18:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B98B7F802A8; Mon, 18 May 2020 18:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B34F8029B
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B34F8029B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VVYUxCnv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C9DA207D8;
 Mon, 18 May 2020 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589820090;
 bh=l4OKSpQb7xCEPsp2YagYvuWupUCN1pS/UdfClZttRgs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VVYUxCnvNuGjTe/K/9RKDzSX19HReSwm5EnLARdFb6d46jsXVop1hldKsi4yp8+Kv
 1O/nkv5EDOxQNkJJMixHYYgc7IWfKdggRvNBznMseYaO+3gshk1H2mOKk4QabD1t/a
 kQHKGZaGPRmPmdrSajdGjDz2p8jADyowt827G4QQ=
Date: Mon, 18 May 2020 17:41:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>, perex@perex.cz, timur@kernel.org,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com
In-Reply-To: <20200518110040.18036-1-tangbin@cmss.chinamobile.com>
References: <20200518110040.18036-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Fix unused assignment in
 fsl_set_clock_params()
Message-Id: <158982005877.28736.11025452668323550718.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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

On Mon, 18 May 2020 19:00:40 +0800, Tang Bin wrote:
> Delete unused initialized value of 'ret', because it will
> be assigned by the function fsl_micfil_set_mclk_rate().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_micfil: Fix unused assignment in fsl_set_clock_params()
      commit: 15b5c496ff99ce99ab3c5e98e96981d015b3168a

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
