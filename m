Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF81CA85D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 12:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0203C1866;
	Fri,  8 May 2020 12:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0203C1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588933899;
	bh=y46FFfqka43lOmkCt/b+5w/rxyZk6SrdMTEQ9yjSkX4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A2KS+a+yfAEHo4enY6AiFwbzPYjJTuFvo5r7GL0VPtLLEvTaoWA8LsZnHXhlzOE+K
	 nivl6YmMgcJrNn/tEX+sF0pNIKxj/Ap+EUtRzqrsa1vA7KwRuhM1CD0bY4HHVB1B0i
	 NUBRxMe7LVnRQxgf7Yna2n/0+YE/wNIIgXe3E5YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 575FFF8025F;
	Fri,  8 May 2020 12:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DCBF8023E; Fri,  8 May 2020 12:29:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E4C1F800E7;
 Fri,  8 May 2020 12:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E4C1F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mkRtTBNk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 657CD20708;
 Fri,  8 May 2020 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588933738;
 bh=y46FFfqka43lOmkCt/b+5w/rxyZk6SrdMTEQ9yjSkX4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=mkRtTBNk8qRsDmU3XrxOh7J+KgBGPBp9nNsxYCpdDVMLuLjCdp1ty1yMmV80Ojg4N
 M5Lrws/8wH9M6ySCccn9cJvPRBf2lNkAN8CFamWsrA2A1P10WtiSrl3wXZG/C4Qv5Z
 25vWRQiGJmvL0sa+ZumR0jPFXQYqLAbsQBs33MRs=
Date: Fri, 08 May 2020 11:28:56 +0100
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, YueHaibing <yuehaibing@huawei.com>,
 joe@perches.com, kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, lgirdwood@gmail.com,
 tiwai@suse.com
In-Reply-To: <20200507072735.16588-1-yuehaibing@huawei.com>
References: <20200507031911.38644-1-yuehaibing@huawei.com>
 <20200507072735.16588-1-yuehaibing@huawei.com>
Subject: Re: [PATCH v2 -next] ASoC: SOF: Intel: Fix unused variable warning
Message-Id: <158893373629.42817.5382594504318611584.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

On Thu, 7 May 2020 15:27:35 +0800, YueHaibing wrote:
> When CONFIG_SND_SOC_SOF_BAYTRAIL is not set, gcc warns:
> 
> sound/soc/sof/intel/byt.c:85:41: warning: ‘cht_debugfs’ defined but not used [-Wunused-const-variable=]
>  static const struct snd_sof_debugfs_map cht_debugfs[] = {
>                                          ^~~~~~~~~~~
> Move the variable inside #ifdef
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: SOF: Intel: Fix unused variable warning
      commit: 28d4adc4257cd2e119df17aa7e9d18cdf607f23d

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
