Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D817F1FA4AA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 01:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73C0B1607;
	Tue, 16 Jun 2020 01:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73C0B1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592264592;
	bh=rX1DHAOnhPtnb7erlFKAIOqjfys/6ZA52aiWMCtZo7Y=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5O4EeRLzomeOwAoWvcacw9n/K/5MlKODiiWiJbEQFg+Dhg1NshhocZLhE1OnIh5C
	 U8EE8HENRIugI1OPyvGRROiiQ+2aSvMansRqFBYrxa3mTtdKTRs6z07vZXSgVlFr16
	 8OzxjaIg/sF7wuw/KXabzUH2qZrGhwSeaX3JLSbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B518F802BE;
	Tue, 16 Jun 2020 01:40:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1886FF802A1; Tue, 16 Jun 2020 01:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8768F8013E
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 01:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8768F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FwFV+tA4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C936C207D4;
 Mon, 15 Jun 2020 23:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592264404;
 bh=rX1DHAOnhPtnb7erlFKAIOqjfys/6ZA52aiWMCtZo7Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FwFV+tA4A7kJf7sdhkLV55rcuqeiXqHZVwcYmF4cAIhRt0Kfu+x2/saCCn3WB9xGU
 QyG8nOfMzur/WAPA7hSeOW0URwVB7SIuEb+PnGJgR4WnPNJqq3b+BAa5lrl/ew+H0z
 Uj4+X1can5ZZYawgQ1PAloxnAvFST4rNkCZSojQE=
Date: Tue, 16 Jun 2020 00:40:01 +0100
From: Mark Brown <broonie@kernel.org>
To: kjlu@umn.edu, "wu000273@umn.edu" <wu000273@umn.edu>
In-Reply-To: <20200614033749.2975-1-wu000273@umn.edu>
References: <20200614033749.2975-1-wu000273@umn.edu>
Subject: Re: [PATCH] ASoC: img: Fix a reference count leak in
 img_i2s_in_set_fmt
Message-Id: <159226439190.27409.3717160114611875111.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>
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

On Sat, 13 Jun 2020 22:37:48 -0500, wu000273@umn.edu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code, causing incorrect ref count if
> pm_runtime_put_noidle() is not called in error handling paths.
> Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img: Fix a reference count leak in img_i2s_in_set_fmt
      commit: c4c59b95b7f7d4cef5071b151be2dadb33f3287b

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
