Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F225E249DA4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 14:18:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8846017EC;
	Wed, 19 Aug 2020 14:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8846017EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597839528;
	bh=e3//5jLYyOdAucfDVpg7OaqnlQybesK1u4gs0MpfG9g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMoLJlx7wty9srY0vEzxMaTdMhjwp0NaKiiWbPf/AqWl1bgTghtGE/nRia9bse24/
	 YhAEM/HGT7HCi0bloxj7mWHZEMjrK9P2eE+K2MWzPXz3Cb+q/FEuW1M6ydPjh2/B1S
	 G8ssrBGRBwgSR+5gsGc6aPN2NhN1mKlqT5dZ8VH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC791F802C2;
	Wed, 19 Aug 2020 14:16:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B813F802A9; Wed, 19 Aug 2020 14:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1300EF8028F
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 14:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1300EF8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pbeP+JiH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 319432086A;
 Wed, 19 Aug 2020 12:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597839376;
 bh=e3//5jLYyOdAucfDVpg7OaqnlQybesK1u4gs0MpfG9g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pbeP+JiHkMSlMLWBjG54RQSsGOrzsCwdubkbPsgO9YCIqVDYwN+d4Ct+cIKA2ozHt
 C2g3EmIlZxs4mLy3Rk4ZpaqZzUpzApLrNJBZvTJ/CUwfPVaeYI4tEE5EJEhM9PUHvG
 AWiS0YcbGV0nxd9TElIj6UmdzSieNdm8zC6PGQPQ=
Date: Wed, 19 Aug 2020 13:15:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de
In-Reply-To: <20200818141435.29205-1-yung-chuan.liao@linux.intel.com>
References: <20200818141435.29205-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: rt*-sdw: use SDW_SLAVE_ENTRY_EXT
Message-Id: <159783932454.55025.10240765394369017052.b4-ty@kernel.org>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

On Tue, 18 Aug 2020 22:14:35 +0800, Bard Liao wrote:
> Add version and class information explicitly to prepare for support
> for new devices.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt*-sdw: use SDW_SLAVE_ENTRY_EXT
      commit: 9e4730586e0b3ca423e7147104790908a1adb1ba

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
