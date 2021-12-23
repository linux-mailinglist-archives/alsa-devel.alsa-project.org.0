Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1A647E6CF
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 18:18:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4177518C0;
	Thu, 23 Dec 2021 18:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4177518C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640279934;
	bh=hHQknPuicKJvBqSHW3E8clobKgNap3tRvdRIIef0jsg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z7aJITfmtUCaUCephJ4ySRdkORcRDfevhWDmGyDb+rO31LPhaAnC9JTqzAIBwFu2s
	 k+Y9ib26l1bl1IoPxsi2toyDxA3iiTIqW2RTISQkdXWOLOBZ/ecfklrqmscn14/KPN
	 g5nIm6BZ97bYLXWW6vHvbPQHGHJ062s7rmfhlkc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A24B6F8011C;
	Thu, 23 Dec 2021 18:17:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88BC9F80115; Thu, 23 Dec 2021 18:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6F7F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 18:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6F7F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dSjdxNZx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9571E61F14;
 Thu, 23 Dec 2021 17:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBD5C36AE9;
 Thu, 23 Dec 2021 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640279860;
 bh=hHQknPuicKJvBqSHW3E8clobKgNap3tRvdRIIef0jsg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dSjdxNZx0Rgj0b/ehNm7s6TTXsWhXUq2JXrciJZx3Phr30r1IyUVdXgbMfyaoGvkE
 xotx/A3fqlzLXKEqLuo2zE0dqspY+L9OlXS3zVl0ANTOYwybpezwQNvR3PRAxeKN8q
 kbqM3xVcped70N3g3EzQUsWCsM+uPPlhn1UFVJ3TJjZZ9naI5hRYoWGcG1zqpjeVZz
 a/TN217vh8fVLnAzAVoFoCZmeD9ZPIinG91nFtLqBXv/xvrVzUiyKx0SPGKhzVCnkh
 VKaA9E2os6Y9WEE2wCdrcX4FArGoaPuXiG0zZBNIxnZo859Wr4kIOR3v3GFM5Z63t2
 j9qRfupHeys+A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20211223082212.3342184-1-yangyingliang@huawei.com>
References: <20211223082212.3342184-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: codec: tlv320adc3xxx: Fix missing
 clk_disable_unprepare() on error in adc3xxx_i2c_probe()
Message-Id: <164027985889.1292681.3234889694372986764.b4-ty@kernel.org>
Date: Thu, 23 Dec 2021 17:17:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: ricardw@axis.com
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

On Thu, 23 Dec 2021 16:22:12 +0800, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from adc3xxx_i2c_probe() in the error handling case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: tlv320adc3xxx: Fix missing clk_disable_unprepare() on error in adc3xxx_i2c_probe()
      commit: 8a2d8e4fed6d5829ec3681af313d63e02bc22dad

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
