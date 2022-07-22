Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E857E790
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 21:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2C118DD;
	Fri, 22 Jul 2022 21:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2C118DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658518873;
	bh=HMkRawVg1v3Lnz/EtuASgrNBKcNpgRvjw4saC+2EsIY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+1l7gG9Ol0RvczwhzfZSxIT0RLre6UIelJ8LiuEcHFG6tBC8fhts96Vm1+PQJAVN
	 7UweNvFI1BndDsP5Y6xJEm8Sjb17vHSuIDRlMllH38Mlp8eziP6nYmDOACQUdRdHAd
	 qE1Bwq0LpeOtcwVQOgW3ndcnVIW/Gu8q9opBjzjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7894AF80538;
	Fri, 22 Jul 2022 21:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3F3EF80246; Fri, 22 Jul 2022 21:39:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E190F8012A
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 21:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E190F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CVjIv3Sg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5FD21CE2AC6;
 Fri, 22 Jul 2022 19:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29A1C341C6;
 Fri, 22 Jul 2022 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658518771;
 bh=HMkRawVg1v3Lnz/EtuASgrNBKcNpgRvjw4saC+2EsIY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CVjIv3SgS3hzCKr211xAM0WjagvfZ6fsUvXwbESRvktcjlMTl0AdUMpe0aJch1aD8
 z8Z1OnUycsdLfYnXARrIRoXUKSX/kCCjhzs4rUNxUMQ+ZNjy7Sjbodqq7DZu2qCouG
 ZKAD79ZX/u/oz5w9FkvnVG5gV5gU1nlAi1DZxBgRFPW8DpwfbLOxihyP4KQxStNmkK
 n9ORYRFlRQurH+jqy8TVF1hAx/pFE6HC0YEbw1qrQlOKwRx5AjHVZU5L2EEx8bEYEH
 FX8e1VYtQHWdL64RNDYyHE1T62OFuCo6WqRHmKlNsnGGDmqbDJgE6LmvojU/eioCnU
 /kr+01FP2AxFw==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220722111959.2588597-1-amadeuszx.slawinski@linux.intel.com>
References: <20220722111959.2588597-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Use lookup table to create modules
Message-Id: <165851876839.1163063.3967103245993487825.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 20:39:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On Fri, 22 Jul 2022 13:19:59 +0200, Amadeusz Sławiński wrote:
> As reported by Nathan, when building avs driver using clang with:
>   CONFIG_COMPILE_TEST=y
>   CONFIG_FORTIFY_SOURCE=y
>   CONFIG_KASAN=y
>   CONFIG_PCI=y
>   CONFIG_SOUND=y
>   CONFIG_SND=y
>   CONFIG_SND_SOC=y
>   CONFIG_SND_SOC_INTEL_AVS=y
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: Use lookup table to create modules
      commit: 1e744351bcb9c4cee81300de5a6097100d835386

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
