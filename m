Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B04664A5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 14:42:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDAB426DB;
	Thu,  2 Dec 2021 14:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDAB426DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638452552;
	bh=pH97v051HvG4h6WMvqgYLd5t3vBlmZgGJRunP35hJzM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VQV0eYRujCw19OoHJCdjyvcjgXvG8LgGVOPrGZR7axHJ/ztjo7D3rq1lNitKA3ybi
	 MyyEbeyScVxHV/VdYZm3/XIREcQV0+b++pM186vX8c6orhFZvnCOWL34FwMpxL0w+R
	 qdRR6N4oUlkamrWBBL4+a1wKxbtwybfrwYbKItKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B34E9F80301;
	Thu,  2 Dec 2021 14:40:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19FEEF802E0; Thu,  2 Dec 2021 14:40:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74F3DF800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 14:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74F3DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L2RvWu7B"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C274ACE2199;
 Thu,  2 Dec 2021 13:40:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30603C00446;
 Thu,  2 Dec 2021 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638452439;
 bh=pH97v051HvG4h6WMvqgYLd5t3vBlmZgGJRunP35hJzM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L2RvWu7B0nCxt6PntpOYr06NKE0+WNt/+u75bs3J9GGWHHI5c4ivGCbhd+uHI1xoh
 mYjm26Khz/PspJ+Bke9ARshu3DLAyHwGtZk62dRNLhVBc4h2Qe0LbpT2wTfig0hfhK
 KRKExuWQc2q/rlvDD8l6PiBwyuUWiolLIPEu2K7Qdvvn+QU+ED0Anr2T+A7ew4SZTt
 3YpN2xkWcAvMDIeVS2Y679/DnTlfS8++NJFJic7NgS4VxbZQVo2GLmZBZfisho389A
 kYUq/fYwADtycCRXjhmsGIMoTzXp8YyvSuCMDHip0Qro044ard/Awbcez8wCYFbut3
 bsmJOBLsmHnMA==
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20211201174307.1399625-1-tanureal@opensource.cirrus.com>
References: <20211201174307.1399625-1-tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: amd: Fix dependency for SPI master
Message-Id: <163845243689.1057742.11633823789626663814.b4-ty@kernel.org>
Date: Thu, 02 Dec 2021 13:40:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
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

On Wed, 1 Dec 2021 17:43:06 +0000, Lucas Tanure wrote:
> Select SPI_MASTER as is using CS35L41 SPI driver
> 
> Fixes: 96792fdd77cd1 ("ASoC: amd: enable vangogh platform machine driver build")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: amd: Fix dependency for SPI master
      commit: 19a628d8f1a6c16263d8037a918427207c8a95a0
[2/2] ASoC: cs35l41: Fix undefined reference to core functions
      commit: 0695ad92fe1a0bb7697eb92c6a145a73c5ab0e24

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
