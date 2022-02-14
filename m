Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7144B50BC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 13:56:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A301767;
	Mon, 14 Feb 2022 13:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A301767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644843394;
	bh=r7IKb+9DggDhLCpCMSDE8pe/YCI7ZnVvJgsKsInBzVw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mR0pvdrr/ny2lTxgm8jXn7ddB1ZH4CmDhdmvENmUHkmClUvcFybfp/N/n3El44Zuq
	 uQMfCOPzCdXRz8j0pU3vfVpb9fMxfnCxIQyTYOtxbPdtG4L6dYGU1yoAD/5rFXnRoV
	 MRFPW7su+F7zjTUx2uPhQ6d4Y0kMhSP53UR78u7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84A39F804CF;
	Mon, 14 Feb 2022 13:55:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F76AF80310; Mon, 14 Feb 2022 13:54:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBA3DF800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 13:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBA3DF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mCVGimMa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED908B80B77;
 Mon, 14 Feb 2022 12:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF1EC340E9;
 Mon, 14 Feb 2022 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644843286;
 bh=r7IKb+9DggDhLCpCMSDE8pe/YCI7ZnVvJgsKsInBzVw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mCVGimMag96xNclq+j7E0EsD4ZpiDxyO3y5NoNua3NiNEa+QrmFIGzcgzcKj9x12S
 775RaIrQN/aHejUFADEdR2SBysAJW5H10XNpr+hGflR3j9ZPjmQ/siQwE2MwMH4qDO
 6fZMib83HiI5Jxgp+CpWr7w+wf44UoTY8D2/m1LtiJ+mKV5qHPIFEzsteNWAyR1XOS
 A9YRvyU4GEmUDCRZ9yARV3tHO7D3ZM0oqYFYvK2CM5/xi50IjEp+y8DyRj6Wfvv++K
 brmPnfjgg1rxHtELt5q+qZBRDgxj/eClFlN+oxpiEoTVrfiqbGvfSt6RYBGgcwEmQj
 C8C0Yhtodp1Jg==
From: Mark Brown <broonie@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-scsi@vger.kernel.org
In-Reply-To: <20220210204223.104181-1-Julia.Lawall@inria.fr>
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 0/9] use GFP_KERNEL
Message-Id: <164484328403.12994.4553763831627919088.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 12:54:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org
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

On Thu, 10 Feb 2022 21:42:14 +0100, Julia Lawall wrote:
> Platform_driver and pci_driver probe functions aren't called with
> locks held and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
> 
> All changes have been compile-tested.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/9] ASoC: Intel: bytcr_wm5102: use GFP_KERNEL
      commit: 695c105933cfa04ccf84088342193ae43e37e0f5

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
