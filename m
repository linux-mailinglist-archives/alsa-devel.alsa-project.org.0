Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2307546D8D5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 17:48:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8499F25F8;
	Wed,  8 Dec 2021 17:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8499F25F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638982114;
	bh=uENSplhFkRT82Pbyo/UMTrFRwRcLICrYkF5lV1BAh0Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=efQPgczch6xFtucBmgr7vWWc1VMbpQd251YPhLmxzKM9jc60Y7u4nY+HvGygMsU96
	 dC2VEijCJG7vdTYdY04o6dQOzi2Gv+eCQoPLhJ6Czx59czMAIrwwytGTTYK62VKJgT
	 woHmWlIkvsd+BVIoPrEghbIFykNqB8iLbz/5uD7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1DCF804FF;
	Wed,  8 Dec 2021 17:46:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0E16F804F3; Wed,  8 Dec 2021 17:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E7DDF80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 17:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E7DDF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FqRzgJVE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32220B82192;
 Wed,  8 Dec 2021 16:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02102C341CA;
 Wed,  8 Dec 2021 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638982005;
 bh=uENSplhFkRT82Pbyo/UMTrFRwRcLICrYkF5lV1BAh0Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FqRzgJVEKpOLiYWHI/tqzUkmUgv9UOXQrBiEqilsFm7ELiTYt8VCNM4FROjZ+uXUf
 EV8MnTnpesFPKJ3SQsM2dG+FaqrmPFxKzlc+tsQbB26dak/V4PeEV+szLdNohPB3+N
 rXRjYfevvGPa6jZc3wF4hLrVIvEoGdIHTPkzMiICqn3rh9niK/YASXopIBEuWLuEbk
 x5gHGTP4JdqDLERYlxNFApPwzDVkYuAZ9zF1r00g4Gnb5ZlMrymKzH6ZC34iZGRbZ3
 TxeTf0Yr/dNSzAKOxDc0+cQSlkjP5CQDHTbMDnwjsGQkGrF8jmRtQ67tFVwwUBVQn6
 bvtNGPbyAAUXg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211207192458.44007-1-pierre-louis.bossart@linux.intel.com>
References: <20211207192458.44007-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_rt5682: Move rt1015 speaker amp to
 common file
Message-Id: <163898200371.3880815.13827114243808569058.b4-ty@kernel.org>
Date: Wed, 08 Dec 2021 16:46:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

On Tue, 7 Dec 2021 13:24:58 -0600, Pierre-Louis Bossart wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> Move rt1015 driver code to common file to be consistent with
> rt1011 and rt1015p.
> 
> No functional change.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Move rt1015 speaker amp to common file
      commit: 77659872be233e56019041d05b44d134022296b7

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
