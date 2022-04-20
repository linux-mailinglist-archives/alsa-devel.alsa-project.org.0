Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D3509249
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:44:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D9A91DE3;
	Wed, 20 Apr 2022 23:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D9A91DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650491068;
	bh=F8AeT1gPh9EBU1TCJSOcCs0CcyJJkegE+/aoO8QW668=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fhd6yw5LAr06911saAtGyjLZsx5ilwqbHm7KcnhAht8IPrMARkswj2whDgmjfJAI1
	 0RTLE40BsANLaUv97ZEBfKZvopfKxFU6oUq4lJBg/CRU8hLFyInumjFqr+dkCSLuoS
	 rFe0pmLfYpkQL5OA9QkuCZr5INkd4CPhxb+btocY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D374F80551;
	Wed, 20 Apr 2022 23:41:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFBDBF80544; Wed, 20 Apr 2022 23:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43DD2F80536;
 Wed, 20 Apr 2022 23:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DD2F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X7pEUC2W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8302C61972;
 Wed, 20 Apr 2022 21:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77EEC385A0;
 Wed, 20 Apr 2022 21:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490864;
 bh=F8AeT1gPh9EBU1TCJSOcCs0CcyJJkegE+/aoO8QW668=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=X7pEUC2WxvodOpeK94bF0YdDjxehU8afHnEejPFz2CKDsmdIPM4c/cLT+Ot4czbQE
 B+iO17j3/0Mz5KxTeonal+AzYI3xwI5DOJYb3qdJTQBjHEykYeHLVp/1IeBp3FDSuG
 tEMgOoXsydeBS/spPk8xFLXZnMHDL/FMQ6Oe9oqTNZMq0vL6WZBzNoTEqJPa3AKJXw
 D8l1VSUEwMQkLenMSVl9ALZtKhgrA8noBy0qgSKDVYfFc0Tw5GKrzFmvX7S7qPSBLg
 QMRMYSOYTsFrcDC1+reR5M3mtcOW5B/HUnxA7J8/KM2BabcmLdzRV92Sar+QdYrW6F
 xJJfkRnFqHgjA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, cgel.zte@gmail.com
In-Reply-To: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
References: <20220420030315.2575691-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: SOF: using pm_runtime_resume_and_get to simplify
 the code
Message-Id: <165049086153.138067.9717341459328892843.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:41:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, zealci@zte.com.cn,
 ranjani.sridharan@linux.intel.com, chi.minghao@zte.com.cn, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, sound-open-firmware@alsa-project.org
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

On Wed, 20 Apr 2022 03:03:15 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: using pm_runtime_resume_and_get to simplify the code
      commit: b3598fe6d009b2f2144115dfc381615c8b534aec

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
