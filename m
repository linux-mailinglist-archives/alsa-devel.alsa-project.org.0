Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24DE54DFD8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 13:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 668621AE0;
	Thu, 16 Jun 2022 13:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 668621AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655378184;
	bh=tKlEDA1EasKYeVLhTpK38Q4V6iDP/hsRbWMhaW6i57c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNuqyUuTACbjrT2sPBj27DOmN3kotaYfsRJx2UYmiMcGn4liq3gLl8ZtRGhxCNz4O
	 3ZVQq1q9zKvgiv+zbFUTU2o54tQwYC0vdp/jj/wKtxQvrdM9HE0NEqJ36qJU8iqlXT
	 adAom/MVQmtvI8R55fOllMQk07RNDioK7loFo4to=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDCA8F804D0;
	Thu, 16 Jun 2022 13:15:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE174F80423; Thu, 16 Jun 2022 13:15:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 252FBF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 13:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 252FBF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GiVwek66"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 81F03CE2481;
 Thu, 16 Jun 2022 11:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61BCC34114;
 Thu, 16 Jun 2022 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655378113;
 bh=tKlEDA1EasKYeVLhTpK38Q4V6iDP/hsRbWMhaW6i57c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GiVwek66noUKCP/MpxO6ww/WST+HByktPkLVJ3P54zuvLopaypPwCcIRx6ezoLG6q
 DaTjS/OJP3HgmoY3ECFRd3v5mqu2c8izuJGFmHBOq5sZee2Cmnswv4AO6UtmhB5/MB
 lpBLKrBNQ6bBuUrJVioxOsPFAp6mkL5snuBCHfDDOS9LDTDc6LnEdEZp9aHLUeUhsl
 zlKmjr+I+FbwBpd2/JB8khbW2xiM1KPpz3pE4W3+gUEs70G4yT/7r0RpHzMu5R50kJ
 f4JVA8CLTwFTHArpp4C6Ms1vtz1nyC1LPxVwKD4YS1Ieuw/zKnzP1DA4mDw8wXfxd0
 fnv/8qawZzlKg==
From: Mark Brown <broonie@kernel.org>
To: yung-chuan.liao@linux.intel.com, Colin Ian King <colin.king@intel.com>,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, liam.r.girdwood@linux.intel.com,
 kai.vehmanen@linux.intel.com
In-Reply-To: <20220614183809.163531-1-colin.i.king@gmail.com>
References: <20220614183809.163531-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: remove redundant re-assignments to
 pointer array
Message-Id: <165537811030.677284.4884559545577351783.b4-ty@kernel.org>
Date: Thu, 16 Jun 2022 12:15:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 14 Jun 2022 19:38:09 +0100, Colin Ian King wrote:
> There are two occurrences where the pointer array is being assigned a value
> that is never read, the pointer gets updated in the next iteration of a
> loop. These assignments are redundant and can be removed.
> 
> Cleans up clang scan-build warnings:
> sound/soc/intel/skylake/skl-topology.c:2953:3: warning: Value stored to
> 'array' is never read [deadcode.DeadStores]
> sound/soc/intel/skylake/skl-topology.c:3602:3: warning: Value stored to
> 'array' is never read [deadcode.DeadStores]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: remove redundant re-assignments to pointer array
      commit: 1ec0c91f6d6b21703c17d5e89f32d52feac5887e

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
