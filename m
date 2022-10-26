Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06960E842
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E86C3965;
	Wed, 26 Oct 2022 21:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E86C3965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666811128;
	bh=uJtTtpoiBN5iTgfYyKWpifkKFSt8w5XWH1aAFRE93A4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tROZd3u5dlidN2za5LZfMiva5TKILFq3ND1GLPhN1ZiEoHaBffB95CR01mWdupG6z
	 0wEtqUVZAu3We0qzzobxA01v9kBPzaXAKiNwkmOCXrJr3yReJ2dbPbfv0Ewqfnf/st
	 D4qIVGFmufhWeoX9VOYYgNFUsAc6HB9HSD3I6BE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A436CF803DC;
	Wed, 26 Oct 2022 21:04:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D68FCF800BB; Wed, 26 Oct 2022 21:04:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59D71F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D71F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WV3Mjx5P"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1142B61DB5;
 Wed, 26 Oct 2022 19:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AEBC433D7;
 Wed, 26 Oct 2022 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666811065;
 bh=uJtTtpoiBN5iTgfYyKWpifkKFSt8w5XWH1aAFRE93A4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WV3Mjx5Pcu3CqLEKSpVcbf8SbagNTbKdOakg1L9jMh3VcMbwFv82STsqlfj00DIkk
 iR7MeRNrQwP3IVOnWm5KhX6f66piHpQilpzm74Ys80eermnIRW1NicygcyPtfjyij+
 4LhSBtwYGty+rIyM4k1d+Dc30NcEdeeFibn3KAAVk1mlj5HDqZ0xxa323Gxcs8m/gp
 uN1zDYa7wYHEDUbHnXdeHccyv/LDIo+L+gQJX6hhReKM4AgdsFAv7u6AX3HOI70/Jz
 WunURF4gKKi+auf4En0ozz5BefbxRuwhI3YycIJcp3FIu9QqrIJF60dbVIpt4obvhD
 lmWcE6Fxpr8Ww==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221024190841.31572-1-amadeuszx.slawinski@linux.intel.com>
References: <20221024190841.31572-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: Fix typo in comments
Message-Id: <166681106325.960840.17674204318457690724.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 24 Oct 2022 21:08:39 +0200, Amadeusz Sławiński wrote:
> There is a typo which keeps propagating through existing Intel machine
> boards fix it with hope that fix stops it from appearing in new boards.
> 
> Amadeusz Sławiński (2):
>   ASoC: Intel: boards: Fix typo in comments
>   ASoC: Intel: avs: boards: Fix typo in comments
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: boards: Fix typo in comments
      commit: 4088355afac9d36bc0c27c34d34b74091e5a7c7e
[2/2] ASoC: Intel: avs: boards: Fix typo in comments
      commit: 0d527a99229b65c781acd747c111e41626e9f041

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
