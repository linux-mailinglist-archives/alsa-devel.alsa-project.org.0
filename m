Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E197B2FDDB6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E2E18B9;
	Thu, 21 Jan 2021 01:12:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E2E18B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187974;
	bh=CH+pY4Va0MCe0xn1lwnpTiAE17DBzHissyzpbhiBDas=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8kwGi9xAB90oqWMSIdBloztChjr086yL0IpQ09GB7ZN1+Uk79Gw/bplB+LcAU8UP
	 4+aaVHIPEPCLdBopHy+ACi5JBylmzCdku88M63pZcAxIIF7eaj87M27c9/hrKUzIim
	 vIDPAJqjHW9Io6Q+Z0cmfgHRXB8Vh+iblfR259Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD2D5F80524;
	Thu, 21 Jan 2021 01:07:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94FF1F80524; Thu, 21 Jan 2021 01:07:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A68F8051C
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A68F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B2H7uQ1h"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF17A2376E;
 Thu, 21 Jan 2021 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187659;
 bh=CH+pY4Va0MCe0xn1lwnpTiAE17DBzHissyzpbhiBDas=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=B2H7uQ1hy70q5VBD1FFs9Kd2OcC9mMirzzcZXEIlbQF9KYC+LHcy3LDGcjxOsUqBh
 2DbgEol8O/6Tmt/ovCq2L9u7Z2bHRsVP1LZablVtalkxtOIwO6odtUiPgBZTswIhaJ
 mTSNs/gWJpqMmW6u1DPFSqr7Q43NpKmGbjXEHWze4dlFN1NpujNXTbJh1bf9sFyR8H
 sx5U4JJIVmF9O2eFGjfiJs4TQ33u/eQXS/kjAJLQzApckDanGwAHFGyyZoQVZhCUjn
 Ialwe8lJUKk/ZAsM62gNiKAmKoMkIplzMi2ZfZ4H0WNz7dbf5d+E6PIytYbQzwfJKs
 Y+Z7oBgQ16pXA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <YAf+8QZoOv+ct526@mwanda>
References: <YAf+8QZoOv+ct526@mwanda>
Subject: Re: [PATCH] ASoC: topology: Fix memory corruption in
 soc_tplg_denum_create_values()
Message-Id: <161118753484.45718.1419483152294927470.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

On Wed, 20 Jan 2021 12:59:13 +0300, Dan Carpenter wrote:
> The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
> so it leads to memory corruption later in the function when the data is
> initialized.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
      commit: 543466ef3571069b8eb13a8ff7c7cfc8d8a75c43

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
