Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A9429EC06
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 13:42:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4831654;
	Thu, 29 Oct 2020 13:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4831654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603975329;
	bh=fPrirToVDeWiBXGhzdGLCnc48Zdw7+8TGyRC7szzpq0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSpGziEgchhYaTHuQp2ApRE9oirRFcY96pzIfoP46r4KVFxxcIKH4YxHYeU8YsBvE
	 DIEvVgPLoHLOfGqM6sl4AbGGrfqcdMROyWJtnhnfXmKU85OeY7iuTUKJYAhBbbCC5O
	 1dgJVL6iBSUH5FAM0EfjlWEAeAKB+nKWTy/bNDNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8519CF801D8;
	Thu, 29 Oct 2020 13:40:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A842FF80240; Thu, 29 Oct 2020 13:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16824F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 13:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16824F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k7uitV9J"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DD0C20809;
 Thu, 29 Oct 2020 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603975221;
 bh=fPrirToVDeWiBXGhzdGLCnc48Zdw7+8TGyRC7szzpq0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=k7uitV9Jro8A3P74bQTJwyhnCaOrWxBlJPgEUuca3JVgkj96SXM3vCAw59a4tQTsO
 /LAaZ3UWyZuVQHLanIa32IH57Ss2OhsvbAjlQ50YVT7owWKidgLvlhLJ0XkuWhLx5E
 pOPho6XxMs7ioKmgYG6gMW/9rhHyuJWo7Q4orL+0=
Date: Thu, 29 Oct 2020 12:40:15 +0000
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, perex@perex.cz, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 srinivas.kandagatla@linaro.org, agross@kernel.org, plai@codeaurora.org,
 linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com, bgoswami@codeaurora.org,
 tiwai@suse.com, bjorn.andersson@linaro.org, alsa-devel@alsa-project.org
In-Reply-To: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
References: <1603098363-9251-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-cpu: Fix clock disable failure
Message-Id: <160397520897.55401.4677277662633686101.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

On Mon, 19 Oct 2020 14:36:03 +0530, Srinivasa Rao Mandadapu wrote:
> Disable MI2S bit clock from PAUSE/STOP/SUSPEND usecase instead of
> shutdown time. Acheive this by invoking clk_disable API from
> cpu daiops trigger instead of cpu daiops shutdown.
> Change non-atomic API "clk_prepare_enable" to atomic API
> "clk_enable" in trigger, as trigger is being called from atomic context.
> 
> Fixes: commit 7e6799d8f87d ("ASoC: qcom: lpass-cpu: Enable MI2S BCLK and LRCLK together")

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: Fix clock disable failure
      commit: 6ec6c3693a389841d8ca952072aea8020da54ef4

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
