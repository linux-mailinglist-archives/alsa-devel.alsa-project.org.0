Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B854B2B8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 16:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E31188F;
	Tue, 14 Jun 2022 16:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E31188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655215483;
	bh=/ffEiP0xs7MwdGc1VI1y8CIL8nmMLhWVmUxwimTCyFM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O68aFvIY5lGya00jkszAbqmjJL/Ng3aExTmgZrz89clZ/8n58QoWaR1rHqAJ8kI8K
	 44Kf07okcQBkIAP1aU97sRYWn0oj1HtBzquNmQu0T/eNPhIpe0K1H7tY0LTzk6L4EN
	 jkHr+O3juB2b9UEUqrnX/9QFO1rvwfwEP8SwQBoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E055F80246;
	Tue, 14 Jun 2022 16:03:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C45F80217; Tue, 14 Jun 2022 16:03:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31E28F800D8
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 16:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31E28F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LgjnlzNz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C095361730;
 Tue, 14 Jun 2022 14:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DDEC3411C;
 Tue, 14 Jun 2022 14:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655215376;
 bh=/ffEiP0xs7MwdGc1VI1y8CIL8nmMLhWVmUxwimTCyFM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LgjnlzNzcVUJqe83z5Xc7Z+GyncVeWsmBNmZB9DpjbfFS9OlUs3X/wBF7WmPtEvDH
 YYgzvobKy0R/bcx6NuH32pgLfDQrorvR83VzdTuNFyOFRma/h9/sNZM3Vwg06cJevd
 Rd2itPpmCh0k0STjsotC1wDmRwy1NKXO0TKvAYDMM/WVpa7bNhYwX/806DhNECit+P
 xIQExltzYtZrdQi1+2EF01fvsRpW1RIkCaZbMLbkA71B0FZtzScFVx82yT4aq19tqB
 KaYFC1y46YHFhx8hUUaZA2WphTyYTMmvi0aEXO8KHXefvqG/gjN/sIDmbgKpuXOV/e
 5rPSMQmI8cJug==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, broonie@kernel.org
In-Reply-To: <20220603112508.3856519-1-broonie@kernel.org>
References: <20220603112508.3856519-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Don't modify the driver's plaform_max when
 reading state
Message-Id: <165521537518.2978151.14708293181618983939.b4-ty@kernel.org>
Date: Tue, 14 Jun 2022 15:02:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 3 Jun 2022 13:25:08 +0200, Mark Brown wrote:
> Currently snd_soc_info_volsw() will set a platform_max based on the limit
> the control has if one is not already set. This isn't really great, we
> shouldn't be modifying the passed in driver data especially in a path like
> this which may not ever be executed or where we may execute other callbacks
> before this one. Instead make this function leave the data unchanged, and
> clarify things a bit by referring to max rather than platform_max within
> the function. platform_max is now applied as a limit after working out the
> natural maximum value for the control.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Don't modify the driver's plaform_max when reading state
      commit: 30ac49841386f933339817771ec315a34a4c0edd

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
