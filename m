Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67128E75D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 21:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC6C1769;
	Wed, 14 Oct 2020 21:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC6C1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602704033;
	bh=m8krfssaoa1Dyev11HhVwDEX6zmV4xOIYL1164NENfI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHdfTqlPNDgRBbMO26oUXVGTcJOj/8Q8HzjL3NhwlQnAR7tazhxlGV9rRYa5jLJPw
	 jugxIaw0AWkXRMC274BoUR9olnzPihuiDHrAvlP5bYac4u+iZ6OrvcFSc4wzZ93xWk
	 vNN0ZyxvgZVMnhImPoWaQNU32B6adM0aYMDefc8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1108CF8026A;
	Wed, 14 Oct 2020 21:31:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C53A9F8026A; Wed, 14 Oct 2020 21:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64514F80268
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 21:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64514F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gZ5KsbUy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC8C32222C;
 Wed, 14 Oct 2020 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602703891;
 bh=m8krfssaoa1Dyev11HhVwDEX6zmV4xOIYL1164NENfI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=gZ5KsbUyGbqqNp7XJsHqTn71OqOx9hv4ecJVLUvkXHbeGzUN/13IbUDmSWjsfSOHR
 rzzF0H8YYvChjHzMklH+ofMdxzos+kMcZqBbRni+pNkFr17N7wypcp+svKsE1a6YA3
 W5HbpECfJY2gUJhtjgieonKJWhRLcSUzm96CO5Ag=
Date: Wed, 14 Oct 2020 20:31:25 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Tomasz Figa <tfiga@chromium.org>
In-Reply-To: <20201014141624.4143453-1-tfiga@chromium.org>
References: <20201014141624.4143453-1-tfiga@chromium.org>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Fix kabylake_ssp_fixup
 function
Message-Id: <160270387383.42239.730752498420639696.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Łukasz Majczak <lmajczak@google.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, cujomalainey@chromium.org
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

On Wed, 14 Oct 2020 14:16:24 +0000, Tomasz Figa wrote:
> This is a copy of commit 5c5f1baee85a ("ASoC: Intel:
> kbl_rt5663_rt5514_max98927: Fix kabylake_ssp_fixup function") applied to
> the kbl_rt5663_max98927 board file.
> 
> Original explanation of the change:
> 
> kabylake_ssp_fixup function uses snd_soc_dpcm to identify the
> codecs DAIs. The HW parameters are changed based on the codec DAI of the
> stream. The earlier approach to get snd_soc_dpcm was using container_of()
> macro on snd_pcm_hw_params.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: kbl_rt5663_max98927: Fix kabylake_ssp_fixup function
      commit: 9fe9efd6924c9a62ebb759025bb8927e398f51f7

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
