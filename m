Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229161BF9C7
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 15:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2AC51680;
	Thu, 30 Apr 2020 15:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2AC51680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588254186;
	bh=YO+95TA89MZmyMTBCQUMNXZu+Fba0x0owMeC+5CqMKc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=niudL0y6y3dK2j6QB2VBMw87zzBu7Q9Gnpw8wSMtjrezVxMYa88zB7dRoFAYf9zR8
	 GLhNbossg5de0X+SvH5mFlXPtS35Cw203uz1L0Ik+BQ75YxzSiKo1AuOof68LGqt0u
	 qGzdRaLzgcEwRnqPZlTnNPbezjZbf5nNYyseKe3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4851CF80291;
	Thu, 30 Apr 2020 15:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB14EF8024A; Thu, 30 Apr 2020 15:40:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05E04F801EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:40:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05E04F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b8JJzZY6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED9BA2076D;
 Thu, 30 Apr 2020 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588254009;
 bh=YO+95TA89MZmyMTBCQUMNXZu+Fba0x0owMeC+5CqMKc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=b8JJzZY6esb4O5LbxlEfiZ2m67zCAtj42SLykn9SK/6uWak57miYLH6IqIxo7349G
 xBMyn4FdsNg32NBbuKT8Vv5oqbHLfgytbcMBLrZMgF3OPlfVHRlfZ/6zAta0pvbMxw
 Ht65uTH5XeDKglqWuK30bcyDlFwCGBRyzb6LpXEE=
Date: Thu, 30 Apr 2020 14:40:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200430082231.151127-1-tzungbi@google.com>
References: <20200430082231.151127-1-tzungbi@google.com>
Subject: Re: [PATCH 0/6] ASoC: rt5682: apply some refactors
Message-Id: <158825399443.18388.8084026122456851168.b4-ty@kernel.org>
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

On Thu, 30 Apr 2020 16:22:25 +0800, Tzung-Bi Shih wrote:
> The series tries to refactor the coding style to follow most conventions.
> 
> The 4th patch converts pr_() to dev_().
> (https://mailman.alsa-project.org/pipermail/alsa-devel/2020-March/164849.html)
> 
> The 6th patch changes the behavior a bit to restore its original intent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/6] ASoC: rt5682: simplify assertions
      commit: 38c2e325a66b1c4d694d2a15b5efa81e5ae38872
[2/6] ASoC: rt5682: fix space issues
      commit: 5b8e09091b6092296a209a940e192ed2cc891efe
[3/6] ASoC: rt5682: remove empty default case
      commit: 70255cf6917828a2caf93f79f15a09bd71803e61
[4/6] ASoC: rt5682: replace message printing from pr_() to dev_()
      commit: 9c1cb755b5b325c18551f7d08438ea6896130acd
[5/6] ASoC: rt5682: remove duplicate rt5682_reset() calls
      commit: 2317e84979fb80821c0d3ef909f1a2b68ace37f9
[6/6] ASoC: rt5682: remove unwanted btn_type assignment
      commit: 4642126b852f46d5d6a16bc60d50fbe4920c2710

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
