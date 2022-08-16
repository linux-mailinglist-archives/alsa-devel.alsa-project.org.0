Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C2859605F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 18:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7816E1669;
	Tue, 16 Aug 2022 18:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7816E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660667724;
	bh=HAxjE4Qm+gGyoJH0YXfx2+dWGhLkay3AhR29x0Bw+do=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rv3Fj07nZ7/fGMPTZad0tCZCdF0M5+sH0F4XvRAkjVFLO52MZm0i2nPDvFWGnhGdw
	 BHqzv5snzkPcj6HBmSsjzajcnL1yzl63vozuQ8fUBopBXC2Mmos4SZv8F/XFycwfbw
	 Kki8tVHewKdMJfWprg6YvMfDuvXe7V9yo8hdB9Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76556F8051D;
	Tue, 16 Aug 2022 18:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E393F80424; Tue, 16 Aug 2022 18:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A6B8F80238
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 18:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A6B8F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f942AeQk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5CA6AB81A64;
 Tue, 16 Aug 2022 16:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478F0C433D6;
 Tue, 16 Aug 2022 16:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660667628;
 bh=HAxjE4Qm+gGyoJH0YXfx2+dWGhLkay3AhR29x0Bw+do=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=f942AeQkLJxqKwVa9niMNKCZNYE2Q1vt12X6Q0kRs7TPU6M/Ky5rQVmnEff2lenjk
 ShJsOScr7asnfRo7JoPn9bSCOugdMM2d6/QcLOWjOkkycWGTiMVPyG7H1yT/6LKqjr
 1gI1IT20SMlzISMDpDGkv291LRa2NEWZMQPOyvC+/VG0jYBKfkcdNELSB1O14uhtRT
 4R9bKVbZC3BEqXIcFQXAhda0EikOQX3C+YYlYYYNu2C76kn4QwaQL2bvO++AkZB42G
 7T3EjtZJbmGdc/1IGvqSq10axiWA46kOSmHnPURhK+HdDsV+UtL80//4f1qDgHN/0A
 MoivBh16Iz+TA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20220816130510.190427-1-kai.vehmanen@linux.intel.com>
References: <20220816130510.190427-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: Intel: common: add ACPI matching tables for
 Raptor Lake
Message-Id: <166066762601.1463673.13258172807799167172.b4-ty@kernel.org>
Date: Tue, 16 Aug 2022 17:33:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Gopal Vamshi Krishna <vamshi.krishna.gopal@intel.com>
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

On Tue, 16 Aug 2022 16:05:09 +0300, Kai Vehmanen wrote:
> Initial support for RPL w/ RT711
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: common: add ACPI matching tables for Raptor Lake
      commit: 5f3db54cfbc21772d984372fdcc5bb17b57f425f
[2/2] ASoC: SOF: Intel: pci-tgl: use RPL specific firmware definitions
      commit: 63d375b9f2a99bb111e3fb5f3e2442a391988949

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
