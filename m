Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 412E726044B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 20:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B550017F0;
	Mon,  7 Sep 2020 20:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B550017F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599502221;
	bh=sNUUOGd+zmw4ssO5Tsq9VNd3B6I/l3WoE9Y4I1kNoGE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fZCF78ydpLiYt+vEHZC6d5HlJEDl7VV9pdahfONg2o4URIijk8PguNsy/ycXt9J50
	 /h6pobGCUqOzmVkh+JeZOYuDy6f5MVGO4f5W4umHRTSZ528DbvSirNWrDLYwx5FGVF
	 F5zfGXeIHjSYESk06OkgDS3dGRihDtWXuQ3Z8wqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE335F802EB;
	Mon,  7 Sep 2020 20:06:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 494AFF802EA; Mon,  7 Sep 2020 20:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4823F802E2
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 20:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4823F802E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nZYioife"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B994A208C7;
 Mon,  7 Sep 2020 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599501987;
 bh=sNUUOGd+zmw4ssO5Tsq9VNd3B6I/l3WoE9Y4I1kNoGE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nZYioifeQakWCas9N4J/sLJK5DhXwtkJBaeEjG2GsDaYRM2i5awiiAGT7a0efSpwm
 4BZxrWI1tBpbWcVEKU9GIWFuMoULj4n2bkPHkQZ0rxb3ytSYdOgjYinXnqZQuGSzCp
 L5dBjA4ZJWCJkg5XIawmg/HP7q2MmcDSyn9FGC4E=
Date: Mon, 07 Sep 2020 19:05:43 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 vkoul@kernel.org
In-Reply-To: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
References: <20200904182854.3944-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v3 0/3] ASoC: Add sdw stream operations to dailink ops.
Message-Id: <159950192275.52707.7554622112953148730.b4-ty@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 mengdong.lin@intel.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, gregkh@linuxfoundation.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On Sat, 5 Sep 2020 02:28:51 +0800, Bard Liao wrote:
> Sdw stream operation APIs can be called once per stream. Move these
> operations to dailink ops. The linked series is "soundwire: Remove sdw
> stream operations from Intel soundwire dai".
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
> Changes in v3:
>  - s/ASOC/ASoC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: soc-dai: clarify return value for get_sdw_stream()
      commit: d20e834e13ce349c9b901b9dd8b7013e255083e8
[2/3] ASoC: Intel: sof_sdw: add dailink .trigger callback
      commit: ae3a3918edf57bde7651964be04d0807cccae8f2
[3/3] ASoC: Intel: sof_sdw: add dailink .prepare and .hw_free callback
      commit: 06998d49bcac8a9df3341db99c5f81ae4ef51c84

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
