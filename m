Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A571935760C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45CE61661;
	Wed,  7 Apr 2021 22:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45CE61661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827417;
	bh=DvPseTA2nNwkcXahjlzJqf/ekh9oy+oo2/k2AN6CVoM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdgjVaanx+Q7kQoBaA9f7rFhjERnUa2k6Qev4FamnOtPo62kH+4KVlwFvZqULH8P/
	 4a8yHWqXBXnutPg7u7JN9ZfiRgvxik5hy0K+HA6n4zFNmAMsV9TClie3E7vW3Tp4II
	 7QOlTHKaGilAQf2VBqX81uWRpFs9oxwwUhiypwJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A90E4F80162;
	Wed,  7 Apr 2021 22:27:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05800F804B0; Wed,  7 Apr 2021 22:27:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B14FCF80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B14FCF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q+hAG4wf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84D846124B;
 Wed,  7 Apr 2021 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617827217;
 bh=DvPseTA2nNwkcXahjlzJqf/ekh9oy+oo2/k2AN6CVoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q+hAG4wfVimr7lOub2pzjmGjSWLJQAGtSu8DAg7dRdxsJZk4XhHkvggqHrykqnRad
 N65r+UmT7Qo99dmhnoP3dQ7YeimT04XlWFgnxiQ0tJUFXuIwrgQ4vSjX3TfvlULvaY
 mvR4FspuSxDEPi+/t9p+bn/2yPTgoMKeLs9KIAJpVAnj6coz9QwQDFXsUUvY/BBev6
 Q8FAaENkv6QAu/zruUUx8w6BbR6oxOeUDXhq/TkAkEk2bCq4rd1IzNCFAwci1mVeQO
 FsSeQFvpKW/xEgy4Q/nhZ5whcsg8sB3oVZG4Pj+8LvXaFrFdHXZ12Zo5yTiSJ/wlk2
 6le6Ff5lWP8Xg==
From: Mark Brown <broonie@kernel.org>
To: Jiri Prchal <jiri.prchal@aksignal.cz>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/4] Adds SPI support
Date: Wed,  7 Apr 2021 21:26:23 +0100
Message-Id: <161782703229.42756.9968738031336574135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
References: <20210406142439.102396-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
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

On Tue, 6 Apr 2021 16:24:35 +0200, Jiri Prchal wrote:
> Moved I2C stuff to separated file, shered thingk to header file.
> Added SPI in separeted file.
> 
> Jiri Prchal (4):
>   ASoC: codecs: tlv320aic3x: move model definitions
>   ASoC: codecs: tlv320aic3x: rename probe function
>   ASoC: codecs: tlv320aic3x: move I2C to separated file
>   ASoC: codecs: tlv320aic3x: add SPI support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: tlv320aic3x: move model definitions
      commit: 73a4808892b83c8336c3d913d44b8de68d881369
[2/4] ASoC: codecs: tlv320aic3x: rename probe function
      commit: b015df6ac03ee81b259dcb2f1a6faf4cf04ace5a
[3/4] ASoC: codecs: tlv320aic3x: move I2C to separated file
      commit: a96d2ba2d8248d5e8170f2f44f98d4a33329b08a
[4/4] ASoC: codecs: tlv320aic3x: add SPI support
      commit: fd4daab3b139a24e71cae5de4f0ca715dbb6634a

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
