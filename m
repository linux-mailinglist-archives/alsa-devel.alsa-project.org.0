Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A47605064
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 21:29:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9322A94FD;
	Wed, 19 Oct 2022 21:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9322A94FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666207760;
	bh=syB2i6cH+0+QkWFn3wVdBPZxzg/GbjAmxDeXWkUQIkg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vL3jtQh7vrS3tzEl19DzaXTo//UzzXrjWToEble9LqW/Tl9Ua186s4YlGuNEwLwgX
	 bwLrQ3AhapPPv+B9now81bW/ogAomloI0JiiDnNLx4p4sJ83OBNsGQUT78r/CAvjU3
	 sG5oktSadt0wesRmmErSErUrvYa+8ATYFnksH4Tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91213F80517;
	Wed, 19 Oct 2022 21:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D61F804CC; Wed, 19 Oct 2022 21:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B3D1F80166
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 21:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3D1F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GFQQLKos"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 915BBB82551;
 Wed, 19 Oct 2022 19:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2491BC433C1;
 Wed, 19 Oct 2022 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666207671;
 bh=syB2i6cH+0+QkWFn3wVdBPZxzg/GbjAmxDeXWkUQIkg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GFQQLKoshWwfMrOt0gyroqkmUDILDn44Wtx0eAoA2umICklYKWX4mAL2ErjT6PXgw
 gJiKPCYCU+HvdqoF8C183W8Er9PkbPaB/OPBedNFCaJ634SRKfsPCyLnmvIyAfFyRz
 CFVjoZW7F+Mp0rx3yVHEzKxQusNYZaVI0vlK8NbrRAm4DQqAzVZlEROAoZJRFShuPT
 RgcfLoxd9Tz5Mx2Y5jOEpPQdjzDnQ1w/ohlSVVZpfOknC90OUej2ZfsFN1ssgDsNmv
 QYck284LaoAi5MNCjEV8fl8HA51XNbvHvoh+RZZJtiIRuT8vPzsvkxlPfvzjzitpXX
 XgaUrgcgm2qhQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221019154926.163539-1-pierre-louis.bossart@linux.intel.com>
References: <20221019154926.163539-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
Message-Id: <166620766987.1753821.16296563857149944013.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 20:27:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Chao Song <chao.song@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Wed, 19 Oct 2022 10:49:26 -0500, Pierre-Louis Bossart wrote:
> ADL-N uses a different signing key, which means we can't reuse the
> regular ADL descriptor used for ADL-P/M/S.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: pci-tgl: fix ADL-N descriptor
      commit: 05de5cf6fb7d73d2bf0a0c882433f31db5c93f63

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
