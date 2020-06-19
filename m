Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 851A6200A1F
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 15:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D64E6167C;
	Fri, 19 Jun 2020 15:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D64E6167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592573365;
	bh=LesmmGjwNyruZz2lXKjFL5SydTkXOhMREE472owY8hw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2DmeBrCZk4rsiGNfjxmzrQVZTGhhBQvY11gXUUZteU6sf3fnkO3exRLIGgQAzBTU
	 wASS/7nsvGjg0ba1eYvOGPEejP86RRhvIP7d7NcSLpkSJ2AcwsxvbDm8mzWCiJwwBk
	 1KGDA41JHQhFhI4/88eiQuVJmlvquXsisgfyCsgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01C3FF80245;
	Fri, 19 Jun 2020 15:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E3BCF80252; Fri, 19 Jun 2020 15:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F204FF800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 15:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F204FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cE5Y6mgF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11E0C20771;
 Fri, 19 Jun 2020 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592573257;
 bh=LesmmGjwNyruZz2lXKjFL5SydTkXOhMREE472owY8hw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cE5Y6mgFKG9RWrq/3D58egK36HL8+Y2NKAaAwB0w3Q1SX+jbwm+U4wWqVDOwWGfMe
 wHJenbY0Intxm+EYD6ydqu5QPxjiAh1nHlCCojps/BhKVr6CkOA33m6YnjFZ/HzMiG
 LcEtR4fd61D1SOP5b+kZZH97duXCK/H9NTjsrMZM=
Date: Fri, 19 Jun 2020 14:27:35 +0100
From: Mark Brown <broonie@kernel.org>
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
In-Reply-To: <20200619031407.116140-1-john.stultz@linaro.org>
References: <20200619031407.116140-1-john.stultz@linaro.org>
Subject: Re: [PATCH v3] ASoC: qcom: Kconfig: Tweak dependencies on
 SND_SOC_SDM845
Message-Id: <159257325526.5735.5370337418723229662.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>
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

On Fri, 19 Jun 2020 03:14:07 +0000, John Stultz wrote:
> CROS_EC isn't strictly required for audio to work
> on other SDM845 platforms (like the Dragonboard 845c).
> 
> So lets remove the dependency and select the related
> CROS_EC options via imply.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Kconfig: Tweak dependencies on SND_SOC_SDM845
      commit: 3bd057c8219d4006f2b436cea2ae5ac723067a51

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
