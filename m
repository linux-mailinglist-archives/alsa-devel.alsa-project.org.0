Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99290524FAD
	for <lists+alsa-devel@lfdr.de>; Thu, 12 May 2022 16:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E3E1AD2;
	Thu, 12 May 2022 16:14:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E3E1AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652364941;
	bh=68GFkRgsrtca9GWvE/A57OESbgWrNobjqyS8pJVM7kA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+M4twjbAJXYZSgNd02VWtmVgG9qkZrdebqUHlVnSv4YG2ADkawOCMdFzR8s9P5q+
	 HUcWeggQQWM4V767ARb9kj8az2M3/aUchQXAJL+IoLFDk2fSGKwoeTN2whP/nG3oiZ
	 YQ9CkQUbP3oD1UeXVjyGNdOQZGMYKg+Y0DAsE2pM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29260F8053A;
	Thu, 12 May 2022 16:13:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25B62F8053A; Thu, 12 May 2022 16:13:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A503DF80538
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 16:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A503DF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mztajfli"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 088B161A4F;
 Thu, 12 May 2022 14:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB3CC34117;
 Thu, 12 May 2022 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652364780;
 bh=68GFkRgsrtca9GWvE/A57OESbgWrNobjqyS8pJVM7kA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mztajfliKVo8agx+Q0g9wLIjqs8vonKuc7nEbgPpRWPEKw/8YEk4ud55fybgtQedV
 9kAacqe3ZgYgyDbON5D4W6DLTYQHYPAeJR5aPIVe4dKGy+ccVFrmBl/Tm9Yms3EfYZ
 ViF1hq0qz6lLvWA1xjLa6pLLm/JEzq2dDcOq61LRZZ1WCNVTND6s+K9CRIt2EB73KE
 tEdf93K62NPXKJxmPcPABkUL7hMYo8XO2nbQrdJT5uyJdgFKf5WuR4tF/5LT0IHbgQ
 icBKcm5YJcG3YmiNybUEDUtRwXya7MCm0pGL+F3fi/Px8/7YgxgiZbcc9gYfUCRmC/
 BAg2Nu9akh7EQ==
From: Mark Brown <broonie@kernel.org>
To: tanghui20@huawei.com, lgirdwood@gmail.com
In-Reply-To: <20220512074640.75550-1-tanghui20@huawei.com>
References: <20220512074640.75550-1-tanghui20@huawei.com>
Subject: Re: [PATCH -next v2 0/2] ASoC: codecs: Fix build error
Message-Id: <165236477836.1016627.1128343126631448820.b4-ty@kernel.org>
Date: Thu, 12 May 2022 15:12:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, steve@sk2.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, ricardw@axis.com, ryan.lee.analog@gmail.com
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

On Thu, 12 May 2022 15:46:38 +0800, Hui Tang wrote:
> Fix two build error, as follows:
> 
> Changes in v2:
>  * Add missing header files instead of adding dependencies.
> 
> Hui Tang (2):
>   ASoC: max98396: Fix build error for implicit function declaration
>   ASoC: tlv320adc3xxx: Fix build error for implicit function declaration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98396: Fix build error for implicit function declaration
      (no commit info)
[2/2] ASoC: tlv320adc3xxx: Fix build error for implicit function declaration
      commit: 19c5bda74dc45fee598a57600b550c9ea7662f10

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
