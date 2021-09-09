Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34241405A4A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 17:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2D416AB;
	Thu,  9 Sep 2021 17:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2D416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631202076;
	bh=T/mw/UbjbrrOlnUVot7WIwHPaeG3mY6jLafZbnQXNto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ciAd25b1yD5BOmcIUTLk3L1t+QXLg91vrhOsSlY/YMomja9FgptuX/MidhxldLVh9
	 QMSYE9E9DH3pmqJsGua87KsBOZT9e06t4Q9hgzefNpNF31JZhqc/S42KmiYDMqcRFA
	 OfMKUUnuun3c8AOXlQ7fY2lhIzzGiN1bSGsLBjzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D99F80224;
	Thu,  9 Sep 2021 17:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA0A2F80224; Thu,  9 Sep 2021 17:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 458F1F80224
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 17:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 458F1F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i8P0a3DY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BD1C61101;
 Thu,  9 Sep 2021 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631201973;
 bh=T/mw/UbjbrrOlnUVot7WIwHPaeG3mY6jLafZbnQXNto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i8P0a3DYUqvolCsgpd39ALimrV04sYugsuGLc5z5sEQyVPkWyJFfAxH7cg9M1R2z5
 R/MKKdhX6Q7jDQZ7CZI/XES508M3xPOjd2XQuoSAilrOegH5H66zULlkHCLu0SFYJG
 DjLdUAQ8UPe5bXX2KeP3Q/qK0WC46Mb32vGS7fSBdcLt8MKvNiLCHRgEHg7CVBrlvH
 GiwtibH8jKOviM/abCb6w4QW1kXZRdpuONi+172Esj+bnZTO6ogtN+SF/yEYr0zjl/
 yGOvVIO5gTOh4eNh5pILwXnsMvc6/jxgChwt9ygrGCtKOrIw9u1L95SbNUDk9qtME7
 iUj+hTgHtlBTA==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: fix update references to stm32 audio bindings
Date: Thu,  9 Sep 2021 16:38:51 +0100
Message-Id: <163120168200.50116.15964820004324884962.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909145449.24388-1-arnaud.pouliquen@foss.st.com>
References: <20210909145449.24388-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
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

On Thu, 9 Sep 2021 16:54:49 +0200, Arnaud Pouliquen wrote:
> The 00d38fd8d2524 ("MAINTAINERS: update references to stm32 audio bindings")
> commit update the bindings reference, by
> removing bindings/sound/st,stm32-adfsdm.txt, to set the
> new reference to bindings/iio/adc/st,stm32-*.yaml.
> 
> This leads to "get_maintainer finds" the match for the
> Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml,
> but also to the IIO bindings
> Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: fix update references to stm32 audio bindings
      commit: 26be23af1866eead5a29f8501f9d774ac277d0bd

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
