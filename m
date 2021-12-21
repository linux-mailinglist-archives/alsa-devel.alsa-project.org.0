Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01847B89B
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F9C9173E;
	Tue, 21 Dec 2021 03:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F9C9173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055242;
	bh=4kirLb6cOsVO8KPJBPaXeZYabCSuBuDo4945kcSie0E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qN597SbE7i+dnD5PJMJ13n7wF23FNyW3TNDYbZYhvey3iQOqDb4IrNFbBZdhx6Bi8
	 ql1HQ4+h8EHaeoiw42hqe6hMC8jmUH8lHXgbhUCdTy92Z4q8fKgSQbI8Z5AYAV6fkx
	 XW7okDa0m76I6ke+NxgO0oAWsrUy7oMiTdbm46mI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 216ACF80527;
	Tue, 21 Dec 2021 03:51:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA60BF8051A; Tue, 21 Dec 2021 03:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D588F80517
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D588F80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DvX53i3u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0945161314;
 Tue, 21 Dec 2021 02:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC24BC36AE8;
 Tue, 21 Dec 2021 02:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055052;
 bh=4kirLb6cOsVO8KPJBPaXeZYabCSuBuDo4945kcSie0E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DvX53i3u52JYDsHwbAoAnmILt3hJK7K25ObeVzabRsEgg2t6MeJpjN30KFDh7QAkL
 3fRJWemExHkxy1W7hw6LoH54P2WqgOtlAyMRB9hjYSNlc2HE2yIk4DbjSZb+sIZUEl
 WdJHQRPAeKkpOLGoVfsTq9LOz2hQZ3YGKsdFqOYTcdYiDOA+Lep+2FpnCxh3kZFmwL
 0hs4xSQrzlyfewqwX/bVTjp7RuWoWwAnWa8yMnMKzMX6qbom2ZvBqIj2FOiY+ibObe
 fflY1LYVYRn4oOfVCVUBxTWeTqkJCJIr76MI/Pgu06mUVt22G9395DyeRH+imBydFq
 LUc9EUszNqcxg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211216115743.2130622-1-cezary.rojewski@intel.com>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
Subject: Re: (subset) [PATCH 0/5] ASoC: Intel: catpt: Dma-transfer fix and
 couple
Message-Id: <164005505149.2647792.1278814749965974230.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com
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

On Thu, 16 Dec 2021 12:57:38 +0100, Cezary Rojewski wrote:
> Set is made of one fix for dma-transfer so that result of
> dmaengine_submit() is tested before moving on, and few cleanups:
> 
> - two non-impactful, where catpt_component_open() layout gets improved
>   slightly as well as relocation of couple of locals found in
>   PCM-functions so that they look more cohesive
> - no need to expose catpt-driver board-matching information globally.
>   Most fields are not by it and it's the sole user of haswell_machines
>   table. By having them locally it is clear what is actually being used
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: catpt: Test dmaengine_submit() result before moving on
      commit: 2a9a72e290d4a4741e673f86b9fba9bfb319786d
[2/5] ASoC: Intel: catpt: Reduce size of catpt_component_open()
      commit: dad492cfd24caf1b62d598555cde279bcca4755e
[3/5] ASoC: Intel: catpt: Streamline locals declaration for PCM-functions
      commit: a62a02986d3990f4b55c2d75610f8fb2074b0870

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
