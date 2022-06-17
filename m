Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A1D55009A
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 01:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C5E1EF1;
	Sat, 18 Jun 2022 01:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C5E1EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655508077;
	bh=1ZQAmxpThkE2DLyss9Wc6dIO9PFD69OSF6CfY8xWydE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqQQQM+1HSbkbji2DJzycSkLo+diqTe2r9IRaSDeoG5snuaXncKNSdh0MBm18pEHl
	 ospEHy8LmXdCAaQKNjQU6VQMH61TOOdt5gPUWTk+//tLWPXGz/il34m9bbP4MYIVju
	 ca4rJTZqavvwPBOja3dMNvZzHt3UTwp0WCL2vYs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D15BF80535;
	Sat, 18 Jun 2022 01:19:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 325E5F80534; Sat, 18 Jun 2022 01:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA45AF804BC
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 01:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA45AF804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pk/mbNWt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5BEF6139D;
 Fri, 17 Jun 2022 23:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE71C3411E;
 Fri, 17 Jun 2022 23:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655507987;
 bh=1ZQAmxpThkE2DLyss9Wc6dIO9PFD69OSF6CfY8xWydE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pk/mbNWthNkCEDjD0aDVFlePtSIelO8IwNo1zp+ymn6vxb6jwtPjiTcQHjhxEnKxU
 JxTBSgjXTPWMnhMlT1XdJdAzLpManKtq9/bIJpIvguJNtpwreUEhMTL4KubdOiyutq
 fZ7qTTBmuGX+Vrj9r9Dr2cpDa+uoTrshQNvfc5RfmkpopGqoV35m7aQI1pN6rCZvfg
 aPf09t16WuzEbf3jLneas3RM3Xk0SBWOHXQO0cj1CxC9rIDC2UszxC3wNiiBUDrpSq
 +Fz++F6tVQgbJP1sOu8PxJnBcodeucpFeQDkoee/wDPTRUcc9TyVcJcKUWAMha7Isj
 wuTRSuMrI+hOw==
From: Mark Brown <broonie@kernel.org>
To: sbinding@opensource.cirrus.com, lgirdwood@gmail.com
In-Reply-To: <20220617153606.2619457-1-sbinding@opensource.cirrus.com>
References: <20220617153606.2619457-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ASoC: ops: Fix integer detection for when max possible
 values > 1
Message-Id: <165550798591.994018.15249156290558800333.b4-ty@kernel.org>
Date: Sat, 18 Jun 2022 00:19:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Fri, 17 Jun 2022 16:36:06 +0100, Stefan Binding wrote:
> The standard snd_soc_info_volsw() allows a two value control to be
> defined as an integer control only if the control name ends in
> "Volume". It achieves this by creating a substring if it contains
> " Volume", and ensuring this exists at the end of the name. The
> volume substring is then used to decide whether the type is a
> SNDRV_CTL_ELEM_TYPE_INTEGER or SNDRV_CTL_ELEM_TYPE_BOOLEAN.
> However this volume substring is only computed for a two value
> control.
> This means for controls where there are more than two possible
> values, the substring is never created, so in this case the
> substring remains NULL, and the condition yields
> SNDRV_CTL_ELEM_TYPE_BOOLEAN, even though there are more than 2
> possible values.
> If there are more than 2 possible values for the control,
> then it should always be an integer control.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Fix integer detection for when max possible values > 1
      commit: 442302003bd2b151e12d52b0af9a7dac131bf931

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
