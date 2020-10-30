Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99402A06C0
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 14:49:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB2A1657;
	Fri, 30 Oct 2020 14:49:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB2A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604065796;
	bh=/zAw46nwRVCQQFKx83PnvtPE+6It7h/NHaANT5inn4c=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faXvG6P7VbC0ZFeKD2MQlXr/e3F6qticjz4R7K/LpnF5XsJBRWiOMbvNVxTaYpjWn
	 1AX9w4JNSdLHUSDdZuyxxsAhKFNjpkEPU0nNADNnlXqb733IK+5lIB2TsZCNjj5/qp
	 jUC484b514w08kEzCsc+NpzvpGbgxJFPSJNw1lpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFF1F80249;
	Fri, 30 Oct 2020 14:48:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC98F80212; Fri, 30 Oct 2020 14:48:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC0BAF800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 14:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC0BAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qnoObmgR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2EF92076E;
 Fri, 30 Oct 2020 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604065690;
 bh=/zAw46nwRVCQQFKx83PnvtPE+6It7h/NHaANT5inn4c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qnoObmgRsWBKu459UOzukikK/aIt63Q/aI/WE+chydqAUgy8eGYj1UIAQCjzU3fJQ
 nhm2Md2NASdQLGgzCOb8NHbg3DUB8N6b+IxIX+eJ42X23sJXyqf5EwYhcFStEU8SR2
 dttDCTZS+1jpS46ssOjR+o3ZrLw2XAEaw54cgP48=
Date: Fri, 30 Oct 2020 13:48:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Michał Mirosław <mirq-linux@rere.qmqm.pl>, Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Stephen Warren <swarren@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
In-Reply-To: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
References: <8756eb5aac561173aa222c9cb64dd314ab1b1f9b.1603925200.git.mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v3 1/2] ASoC: tegra20-spdif: remove "default m"
Message-Id: <160406568314.21123.17512576449612587949.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 28 Oct 2020 23:48:05 +0100, Michał Mirosław wrote:
> Make tegra20-spdif default to N as all other drivers do.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra20-spdif: remove "default m"
      commit: ec6869b096f10526df14d9972a60ebffef72f0b9

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
