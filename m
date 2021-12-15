Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CC94750B6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 03:05:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE181FBB;
	Wed, 15 Dec 2021 03:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE181FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639533952;
	bh=IWMYBLB6oHRGoxE2RfsNrXH5WTs9ttS/9AQJni+86hM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6yENxdIEzm3WFqe9SCvSErgLAvAlMl5+MCly+4qXZ/UH2al9slYCj1yfUGzXmho+
	 u7xPqBvVoXBnaVQEthRQab/JnnrGO+ZSQLGtqp/3hOj5Yhl55zTrUMgZ2xPYdmZEA1
	 h2IvYvL4ytsrKweK7Pdr0Fb4pCyiKFLivfOlCOfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D247F8050F;
	Wed, 15 Dec 2021 03:04:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05F40F804F2; Wed, 15 Dec 2021 03:04:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85E9BF80249
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 03:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85E9BF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UkeJK+3I"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26238B81E02;
 Wed, 15 Dec 2021 02:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B723C34605;
 Wed, 15 Dec 2021 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639533845;
 bh=IWMYBLB6oHRGoxE2RfsNrXH5WTs9ttS/9AQJni+86hM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UkeJK+3ITlTp/bUTmZ6vJeVXFz0gnCoPyPL1FKhAsJGVrdAmDfGkWeSrzsCaeyyzw
 00z0KkfglsBuV+tJ5Ij8DWdFFzzvvBBstj0M/+p8eGlo4vjsiiObv/JHJj8FYuqxI9
 82MhBYVueq4ZeP6XTmSK8YPjxQsS7KHkw5fuY9/WE81xNVQtRHMBnHVkvgyn1zYiUI
 +rrxAhqoATlM3ARuR40wvdGeylIAOjREytNZXKxiUvRw2ozQQXn8WGDCHxbStJvizN
 JJtjBNb10sMs73xKkNOa+dVqCWdSoCayZFdppw2+BbN+4lNk5KF0AfgaGIaiQ25af/
 KB/EaE4686kUA==
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20211211065840.1221-1-linmq006@gmail.com>
References: <20211211065840.1221-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: qdsp6: Fix an IS_ERR() vs NULL bug
Message-Id: <163953384289.1515253.11852619993223419677.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 02:04:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On Sat, 11 Dec 2021 06:58:29 +0000, Miaoqian Lin wrote:
> The function gpr_alloc_port return ERR_PTR on errors, it doesn't return
> null.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qdsp6: Fix an IS_ERR() vs NULL bug
      commit: 59716aa3f9764144cdd558c64f04cb83001b71ac

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
