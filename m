Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D726E4F5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B76A916AF;
	Thu, 17 Sep 2020 21:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B76A916AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369424;
	bh=5R9gtjhHhcMCnrJQNNabILcr69G809RQMX4/tJDkkBc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TH1qtz+H6+CFR/iHbY45fhAqb4G57jiC6GoKBoqnpilRj23+o4waqb9J4qb1LW8fy
	 Chp4mFF0FzwVsy4nM79wVLLMPGwX6WJMTEjham5RWF4VTcA5sv6+M43Q3fixlU5vGN
	 3D5SvbTYrtRfSl3bTsRkd6n6TpZYUTRyBAlfNo3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 248A3F80316;
	Thu, 17 Sep 2020 20:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 765ECF80315; Thu, 17 Sep 2020 20:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D766F80306
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D766F80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N2tPqO7U"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD793206A1;
 Thu, 17 Sep 2020 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369103;
 bh=5R9gtjhHhcMCnrJQNNabILcr69G809RQMX4/tJDkkBc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=N2tPqO7UTGYgoShgpBbrS+rSXaIi55gXDoTUtCCq472M8psVK9hQeRBTPUv6sUQJY
 ZfK+vfB3v4VS7jNzElC1Iod2znR1DPQMeS+fTWxJnoTNjA/MrWwQXIzuFK+NlqZths
 RbQbGBEn070sBDdb88V7gapTe4PPRwgivGTILraY=
Date: Thu, 17 Sep 2020 19:57:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
In-Reply-To: <20200916111545.1.I4c3758817d94c433bafeac344a395e21ea6657e3@changeid>
References: <20200916111545.1.I4c3758817d94c433bafeac344a395e21ea6657e3@changeid>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add MODULE_DEVICE_TABLE
Message-Id: <160036900933.20113.7349379554042558829.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Ajit Pandey <ajitp@codeaurora.org>,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org
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

On Wed, 16 Sep 2020 11:15:55 -0700, Douglas Anderson wrote:
> The lpass-sc7180 driver can be built as a module but is lacking a
> MODULE_DEVICE_TABLE.  This means it won't auto-load.  Fix this
> oversight.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Add MODULE_DEVICE_TABLE
      commit: dcde34c47d8f7befc647fda65e8efa8cc0e795ca

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
