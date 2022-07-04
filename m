Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBB0565A86
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 17:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A35E172C;
	Mon,  4 Jul 2022 17:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A35E172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656950398;
	bh=sJPtODs8e7CE/TqDOZ/dlaycf1N0uI8bA5H6NOBLPgI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPbqaRjTIAJvEyoP/rc8K2P2/2TnGsmvjXd3/vTMj5c1D9mgvA5Ok97Vss2UxIQaO
	 OzQ9eA77y9kI1yzz9qLYw+y/OYxFnPQnyO32lsYuPQaDnk9GZ5BGaVnTgU9BKcVsMW
	 wVpEDsvuvppWL+3f/I0Tzez4XzlRmKgsf5nlIiLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B833EF8054A;
	Mon,  4 Jul 2022 17:57:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BFB3F8053E; Mon,  4 Jul 2022 17:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F87F80538
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 17:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F87F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H6wQDXAm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3836460EB9;
 Mon,  4 Jul 2022 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CDFC3411E;
 Mon,  4 Jul 2022 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656950270;
 bh=sJPtODs8e7CE/TqDOZ/dlaycf1N0uI8bA5H6NOBLPgI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H6wQDXAmT/dhA4lSI0BSUuKRFfhRch+HRrK/Dx1890QxbpNkEUHnsy9KBRDoqzuFW
 6yhk5QYcDcvx7f3I+2o66CFZmwLUROy6+X3t/Go6lEOt6uXortfNjm/mphQiFLI2M6
 sFlM7osS2yPqynx8lyvdcyXkwHxaGvgihcAZC1HAapUjEPvl3MBRQYEjomHI0eMQu0
 UhmpQvQN2El2iu451knYLxICLUHWApF9NixKEdchj/RDfDa6leDl0Kv4o53jsUs30R
 BgpVHgMyUqSEIv7smYO5hr0IUkxwLp7c5vHmds/CvXg4Phm8Vhbm1b4CgdlAMGlA+y
 HwBDJCIDAZYmA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, yangyingliang@huawei.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20220704075134.26230-1-yangyingliang@huawei.com>
References: <20220704075134.26230-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: fsl: pcm030-audio-fabric: use
 platform_device_unregsiter()
Message-Id: <165695026945.481068.10391765558423256612.b4-ty@kernel.org>
Date: Mon, 04 Jul 2022 16:57:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com
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

On Mon, 4 Jul 2022 15:51:34 +0800, Yang Yingliang wrote:
> Replace platform_device_del/put() with platform_device_unregsiter()
> to simplify code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: pcm030-audio-fabric: use platform_device_unregsiter()
      commit: 679139ea62e3e78542cd409c2437ac1da9f31026

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
