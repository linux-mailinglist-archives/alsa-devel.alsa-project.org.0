Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FCF1EE659
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 16:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38E43166C;
	Thu,  4 Jun 2020 16:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38E43166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591279731;
	bh=tIx6WDY628i3sbqZbB1BH8QLISVpJLqNaOfUTgByqC0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tsWwVh101aRiSgnIo0g8GL4UaF9S0zANFoE8gMv7rtIY7SeRFBDZ7rXbNM76zHZgX
	 s+MHi7Lv3tL2nOKv5VZLRJqo2xT6nggv8K9Ld9rqQHBLqnfHHvJVo5j784eeHf0lgH
	 0XFtw9Wr/xcfl39TY2AtVMcpCNC2g9TS6b9vD87Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C5B8F8026F;
	Thu,  4 Jun 2020 16:07:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC91DF80260; Thu,  4 Jun 2020 16:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32008F8023F
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 16:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32008F8023F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kKoy+jEq"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32AC8207D8;
 Thu,  4 Jun 2020 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591279657;
 bh=tIx6WDY628i3sbqZbB1BH8QLISVpJLqNaOfUTgByqC0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=kKoy+jEqxsQ9VGNmgiEAe9cOAs4WNNbqCMFh5MWpLGukZOKOqjAgeYQKHSOea9NPG
 ApIGZIgBr9WDnToGyzHEY0uN7GZzrkq+4TK3n5/Qi6B+DrZOep1nh1ljIRUEx79RAW
 CW08w7xq6scgAYW8WEL15oMFcVe2IxSLf7/HgbWQ=
Date: Thu, 04 Jun 2020 15:07:35 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 Steve Lee <steves.lee@maximintegrated.com>, nuno.sa@analog.com,
 rf@opensource.wolfsonmicro.com, geert@linux-m68k.org, shumingf@realtek.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, krzk@kernel.org,
 jack.yu@realtek.com, dmurphy@ti.com, lgirdwood@gmail.com,
 srinivas.kandagatla@linaro.org
In-Reply-To: <20200604054731.21140-1-steves.lee@maximintegrated.com>
References: <20200604054731.21140-1-steves.lee@maximintegrated.com>
Subject: Re: [v2 PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Message-Id: <159127965569.55652.8183322346754988005.b4-ty@kernel.org>
Cc: ryan.lee.maxim@gmail.com, ryans.lee@maximintegrated.com,
 steves.lee.maxim@gmail.com
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

On Thu, 4 Jun 2020 14:47:31 +0900, Steve Lee wrote:
>  malformed firmware file can cause out-of-bound access and crash
>  during dsm_param bin loading.
>   - add MIN/MAX param size to avoid out-of-bound access.
>   - read start addr and size of param and check bound.
>   - add condition that fw->size > param_size + _PAYLOAD_OFFSET
>     to confirm enough data.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98390: Fix potential crash during param fw loading
      commit: 97ed3e509ee6d098730d137759c627a8d674cf55

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
