Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0011E248C1A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D550179A;
	Tue, 18 Aug 2020 18:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D550179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597769766;
	bh=PxM9+n8vVIqpRf0jfe4HVoCR3Hxu6WufuYAJnUBROT4=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLC1FU1PYvm0A3KubgDC9gDlfDYhOyZs3R9bU5TLgX8zcJ+ZukpU5ABtGblwUUVe1
	 a9kirRgfiCx7KBUkiEt/Ai2DUNcj7HBdEmA4HnCIEMlxm9mmHaFAop1ZLn3CD5/mpj
	 tJoeW4Pyewi3YqRQzoZrQp1v7Bwv5Nn/RYpFWnBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E7AF80114;
	Tue, 18 Aug 2020 18:54:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49598F80273; Tue, 18 Aug 2020 18:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 301A6F80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 301A6F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gUYGs4eM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C48A20786;
 Tue, 18 Aug 2020 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769650;
 bh=PxM9+n8vVIqpRf0jfe4HVoCR3Hxu6WufuYAJnUBROT4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gUYGs4eMGo9kZaPbLsgoa9Ac73rnnbET5oal91nJ1x5zii7YwFryJq3BN3ZcuMXb4
 +7MkNCsRLfFlMxKfJH0UR+bn9MXQ798+2obQ7OurbpMjqL7fO4qZuA+LxcrD+EYFGU
 VqKfIY1uCkI02fGwhtF1gilroLiY3RAY5aRrR29U=
Date: Tue, 18 Aug 2020 17:53:39 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com, plai@codeaurora.org,
 Rohit kumar <rohitkr@codeaurora.org>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, agross@kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, perex@perex.cz
In-Reply-To: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
References: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
Subject: Re: [PATCH v6 00/12] ASoC: qcom: Add support for SC7180 lpass variant
Message-Id: <159776961933.56094.17007093151985279828.b4-ty@kernel.org>
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

On Fri, 14 Aug 2020 16:22:56 +0530, Rohit kumar wrote:
> This patch chain add audio support for SC7180 soc by doing the required
> modification in existing common lpass-cpu/lpass-platform driver.
> This also fixes some concurrency issue.
> 
> This patch series is already tested by Srinivas on Dragon Board 410c.
> Changes since v5:
>         - Fixed remove api in lpass-sc7180.c
>         - Addressed comments by Rob in yaml Documentation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: qcom: Add common array to initialize soc based core clocks
        commit: 1220f6a76e77af8ac14fe67a11fcd7806764ea46
[02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
        commit: a503567d70eca91796a4ab23053d4c70df8e1e3e
[03/12] ASoC: qcom: lpass-platform: Replace card->dev with component->dev
        commit: 784771863abae5f8878c62e9c624111c51bebe7c
[04/12] ASoC: qcom: lpass-platform: fix memory leak
        commit: 5fd188215d4eb52703600d8986b22311099a5940
[05/12] ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
        commit: b5022a36d28f6a99c1a57f54246e8b566cf094d5
[06/12] ASoC: qcom: lpass-cpu: fix concurrency issue
        commit: 753a6e17942f6f425ca622e1610625998312ad89
[07/12] ASoC: Add sc7180 lpass cpu node
        commit: 2a7a3797ed2de6a55e1467bd11002fa7b13e12f3
[08/12] ASoC: Add sc7180-lpass bindings header
        commit: 68d8904b25df28821425753eaebc8fe992dde236
[09/12] ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
        commit: 24caf8d9eb108c52e144bcc7af94bb1edcb70700
[10/12] ASoC: qcom: lpass-cpu: Use platform_get_resource
        commit: 93dbbd657167a796583506834cc03950ce25bce1
[11/12] ASoC: qcom: lpass-platform: Use platform_get_irq
        commit: b05372c84d61ad2a905274db7e3d63a65c835463
[12/12] ASoC: lpass-cpu: Move to yaml format
        commit: 4b381d7e86fd0b767456e07c49982fb4896e1166

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
