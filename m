Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994F646066
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 18:38:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C75617ED;
	Wed,  7 Dec 2022 18:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C75617ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670434718;
	bh=7B5VsOljHqgBrU+kRYb2/nbcsr33LBoV691ew3Srrig=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5Xvr6A2yl/qyKfBcrh1S4DbhK7roNZu6qgTlAhwIpfchAJoVy1dhmErYmGPgO2X8
	 ecqadpCjR9MVY52hKHfWg5Ps59d9ogPqx5K6hF4dJ/S6du2mvuhuLNGqguzrfmIFdR
	 /MtLtL6rL7+VOPq9zS4BQALafmLegdv3ardpY80k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBBFF80424;
	Wed,  7 Dec 2022 18:37:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88B37F80121; Wed,  7 Dec 2022 18:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D5E7F80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 18:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D5E7F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kP8NZq3j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57A51B81FE9;
 Wed,  7 Dec 2022 17:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F34C433C1;
 Wed,  7 Dec 2022 17:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670434655;
 bh=7B5VsOljHqgBrU+kRYb2/nbcsr33LBoV691ew3Srrig=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kP8NZq3jnfFlu70ltKgK0+SUnZx9e7o4md0RdVFfjIcGtFTf4BdlZDuvI7kKNvs7F
 T5GphVDbaykYOjggEE/y4MV5kZu/SIWhz7xGTFjUOovAS2+Lwz4hXZCqTKOacjXL5l
 yJHAHvYBh9Dd74l76tJRIuzvqnxZVlb5JR58p2danKYUh5fqotUx9KoJvAMiZoCbN0
 EmBf6vvAikJJiR4Yw/s0uNtA1QlEl6YwzRqHctzRE2naO7BdctaZFiDSKlk/b3WxyU
 0mS55uGqTlhhcstoHtai7F+Rx63IVLcuSjyKpDwYa8LmbYB0c7ZLIn5Hyh8b76nV28
 eCulRNyJGlNXg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
References: <20221206212507.359993-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: boards: updates for SOF boards
Message-Id: <167043465356.393374.5451642549404876215.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
Cc: tiwai@suse.de
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

On Tue, 06 Dec 2022 15:25:04 -0600, Pierre-Louis Bossart wrote:
> One new JasperLake configuration, core refactoring between RT1316 and
> RT1318 and a minor uninitialized variable corner case.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_realtek_common: set ret = 0 as initial value
> 
> Brent Lu (1):
>   ASoC: Intel: sof_rt5682: add jsl_rt5682 board config
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: sof_rt5682: add jsl_rt5682 board config
      commit: c0660fce5e0672b9fcffaae02184d58c8ed2aec1
[2/3] ASoC: Intel: sof_sdw: use common helpers for all Realtek amps
      commit: 5c10da436ebd93f9bfa244ea933773d14b566499
[3/3] ASoC: Intel: sof_realtek_common: set ret = 0 as initial value
      commit: 47d2b66fec133cb27da3a551334686e465d19469

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
