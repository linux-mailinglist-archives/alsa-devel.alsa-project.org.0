Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D47D597127
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 16:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B984B164E;
	Wed, 17 Aug 2022 16:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B984B164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660746725;
	bh=9YvnrLoQeCqNttsLpVzUVSJciSTI41FyiN0F/VdqDIQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezmkRQa5eS6XJzC9G1F/3KYQHhb3AKDnvp3+uM0KUCe9t4h410CTRpCxotWbGop8z
	 DFscyKmiYstZLsUP8q1kzl8KGFZHrZKWdvIL5IPwOkc6ofa++aI+U2VdE0BZdRsQLN
	 zIWSqvXS74aejs0g6t9nJaQVrKA32g0yFn9jgB6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41AE3F8021D;
	Wed, 17 Aug 2022 16:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41E40F80130; Wed, 17 Aug 2022 16:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD789F800E9
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 16:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD789F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="By8RnEIm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 498DC614B6;
 Wed, 17 Aug 2022 14:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C42C433D6;
 Wed, 17 Aug 2022 14:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660746659;
 bh=9YvnrLoQeCqNttsLpVzUVSJciSTI41FyiN0F/VdqDIQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=By8RnEImktZUjLmuk6im4iQqRrkQoDYIdt5dGDioSYKZoHCH2aNBSiUCeyCr/oBMJ
 CxucQ5GsnungRHnUIFP9z4vhNCrFRh9nVGBqODwU4AGs0iRqELUU75s7oCyfo7iWTu
 11kec0Lv88dPOEi8KL0FDsPYpdtwOSbr7RpXYb1XClnpaH5xpiCRHBRy6gHD3TG9GH
 dcxF6GpqiZMJ22R+vzLr5L2r/edp2WFh7AiEGMUCYCOMF5uwe2h4E3zhbsxYz5D/X1
 7CUu47VESvDw6q7z5lWbPefWVkGnc1mt9mVCiBHLP0WyLhQyTvU30wcpr/9WfHZm1T
 JELnN8stiI/PA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220816172129.6661-1-srinivas.kandagatla@linaro.org>
References: <20220816172129.6661-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: core: remove setting platform_max in kcontrol macros
Message-Id: <166074665821.210979.14610893486592798976.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 15:30:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
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

On Tue, 16 Aug 2022 18:21:29 +0100, Srinivas Kandagatla wrote:
> platform_max should not be set by the driver, its intended for machine drivers
> or DT to override the max value for platform specific reasons.
> 
> So remove setting this from Kcontrol macros.
> 
> Setting this to max in these macros would limit the range when min
> value is less then zero.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: remove setting platform_max in kcontrol macros
      commit: 26bdcc4ba12351642cd94339aa6996f96434dd47

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
