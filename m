Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 736E52FDDA8
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:09:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1002218AA;
	Thu, 21 Jan 2021 01:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1002218AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187796;
	bh=0b3Izsel90SvJ9GzLBvtBj4diCavE0tP2Bmu5Ek/cpI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZl3AduxT3qIxjifiih8rgbOApEdjcaVrI4OZTKxHQFhTvRXAyIGpuvb2rYZeCPf2
	 yEfxTPOZAv1qbJGL30grHGo6leUqSxBf+XZ3ndg9GCpc9mC6FsPEORmt//WCgVCDxW
	 NDXvDSLpnRUwsQ09uZA6OmEVhhn6YA9oa/Vuikik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD7BF804E5;
	Thu, 21 Jan 2021 01:07:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0932F804E6; Thu, 21 Jan 2021 01:07:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8514DF804E1
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8514DF804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="udZkbwGJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4B8B2371F;
 Thu, 21 Jan 2021 00:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187620;
 bh=0b3Izsel90SvJ9GzLBvtBj4diCavE0tP2Bmu5Ek/cpI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=udZkbwGJjHaM5NHxoULpLByfXo88OjBCkGKL+KazoE35wgOQtSPBOPZNGcniI2o77
 poPVWIc3fUxHu8suAOMyarC2q5HsX05B6Qb/oY+RGn3w9tCZQ+UZwGwqrl1C3iSmeU
 EalYgmTkS+qWAU9e1EASE9hVADlkcjOwwKByFALW9TruDghKnihTJXjnM0u7oYXOuG
 kNZNcDj4O4rPYc3XWiLS66Bjuz828Fp8oHhsC4rNOJiJGTO1jihiuGWTsgrnPJvFK6
 RpwY4sk66awfksnNizCMZFloxDJ1yfLYvCYiDYHzrmSJNMxAOTNjTY/zH784wc/0lx
 86OGOqWHX6ArA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
References: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qcom: Fix broken lpass driver
Message-Id: <161118753482.45718.14536427008782572345.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, lgirdwood@gmail.com, stephan@gerhold.net
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

On Mon, 18 Jan 2021 16:45:07 +0000, Srinivas Kandagatla wrote:
> LPASS driver is partially broken on DragonBoard DB410c on 5.10 and
> its totally broken on other Supported Qualcomm SoCs.
> 
> This was due to DAI ids being over written by the SoC specific header files
> in the dt-bindings.
> 
> Idea of having SoC specific headers is not doable when we are dealing with
> a common driver. So this patchset attempts to fix this properly by creating
> a common dt-bindings header for lpass which can be updated with new entries
> if required. This patchset also add an simple of_xlate function to resolve
> the dai names and different SoCs might not have 1:1 mapping for the
> dai_driver array with dai ids.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: lpass: Fix and common up lpass dai ids
      commit: 09a4f6f5d21cb1f2633f4e8b893336b60eee9a01
[2/2] ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY
      commit: cd3484f7f1386071b1af159023917ed12c182d39

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
