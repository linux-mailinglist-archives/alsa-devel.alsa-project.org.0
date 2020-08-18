Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8D5248C58
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:02:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1845817A6;
	Tue, 18 Aug 2020 19:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1845817A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770131;
	bh=Lq5bTC7AVJ/pYnGclAdQT8NAAoDP3wzNT792XtYvGt0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MT86CAisnspXuznxZUw38ftDbKBw+UYWleX0+ZVH3m3QZS8GwGVaG8wXjbepieCkm
	 nhrV1CM/WMksBPk6/oh5RXV94jG0YAyPhP0SzQJYKnOmg1gayE5ndzQP2WBTUYwlPs
	 9G6YX1BcB0Bk6EBavejFE3+jbvNhJ0LzfOm/aJyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 995C1F80335;
	Tue, 18 Aug 2020 18:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C5F5F80337; Tue, 18 Aug 2020 18:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B3F2F80332
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B3F2F80332
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h/eLPdVz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 614992080C;
 Tue, 18 Aug 2020 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769705;
 bh=Lq5bTC7AVJ/pYnGclAdQT8NAAoDP3wzNT792XtYvGt0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=h/eLPdVztqPYvz3i0FiVZLoQieZTQHUlSF5VBt31kdMLlPUsF0foMPJT+pW3mciwv
 iwjaa5lUSNBU0N618cwC1CROiRlDQw/zR7cPf2xd6V8KIjbRB3JSOlzoSTB923xYVR
 LlyexTLnrCIyyz3L5u1utaL16rFXugaXP/Xm3GlM=
Date: Tue, 18 Aug 2020 17:54:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200811103452.20448-1-srinivas.kandagatla@linaro.org>
References: <20200811103452.20448-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: msm8916-wcd-analog: fix register Interrupt offset
Message-Id: <159776961933.56094.9052363191985703080.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 john.stultz@linaro.org, tiwai@suse.com, lgirdwood@gmail.com
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

On Tue, 11 Aug 2020 11:34:52 +0100, Srinivas Kandagatla wrote:
> For some reason interrupt set and clear register offsets are
> not set correctly.
> This patch corrects them!

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: msm8916-wcd-analog: fix register Interrupt offset
      commit: ff69c97ef84c9f7795adb49e9f07c9adcdd0c288

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
