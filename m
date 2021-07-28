Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313C3D9971
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 01:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E247B1F5D;
	Thu, 29 Jul 2021 01:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E247B1F5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627515021;
	bh=O+//6IJ/VPQ62CUgWxVD82JUZheq3ea8zHr1YC2khU4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtofhLLHhrxQ1DjlWWKdtG5y6rI7XR3LiitQ4aCE1tmE2NSnuLAAxp9Xq9kGBvGQ1
	 xyKcZXsniROYyescVZi8uS3Wp+dqIJHnTeghHTNeppYWaBSMwL8sQsMPMQWvm8H2N4
	 XjG/DnWzy9vMRge0lwIW79daDJNfFgwlu18NtweM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26F56F8049E;
	Thu, 29 Jul 2021 01:28:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CBCEF802A9; Thu, 29 Jul 2021 01:28:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A29D8F80127
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 01:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A29D8F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JQRw58bj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 040DF6101B;
 Wed, 28 Jul 2021 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627514898;
 bh=O+//6IJ/VPQ62CUgWxVD82JUZheq3ea8zHr1YC2khU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JQRw58bjtYCNMizbYEe/o+pyprfdExpIxGQFN8yiWlY/viVeE9z5mPuo7P9AbOf12
 DmSP8aCGhgGnPH97bGg58DnLnLoTJbMRDyYomYKzdqbdHZp6d5jGwyLCILSYTPpJlu
 5haPpcGiN60gzdNNgqJmLvTpfkFiXVk0LZQxflLDdLhKbXKrck5aZTa+0nIeZfP91H
 Nkcdy9QrP/WQw+eYNC7rj5MOSrvUWKwegmGcywAf54m3brX0L8Ad08OPNU8p4mZhKj
 fMTJrID7/Lvu3Ki+RYc2ly7qnbfLdBliMEpe3fdMVEm97IVcp95vGjoXuW2XbAJxPv
 YgovX1W/vvg0A==
From: Mark Brown <broonie@kernel.org>
To: Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Colin King <colin.king@canonical.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: Intel: Fix spelling contraction "cant" -> "can't"
Date: Thu, 29 Jul 2021 00:27:55 +0100
Message-Id: <162751391069.10122.6012833198246486438.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728103602.171817-1-colin.king@canonical.com>
References: <20210728103602.171817-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Wed, 28 Jul 2021 11:36:02 +0100, Colin King wrote:
> There is a spelling mistake in a dev_err message. Fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Fix spelling contraction "cant" -> "can't"
      commit: 0f6b04adb58d80e7fb5f8d9229ad22c9931c3bd1

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
