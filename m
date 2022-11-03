Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FE6184C9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 17:35:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22DE31622;
	Thu,  3 Nov 2022 17:35:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22DE31622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667493359;
	bh=/ccW2ZLYtie//iuE3Z0X9cbimEJCwup/DH2xpMNHLnI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bw7FYpZp8a+IuLFKsxfOQYTsKhbC8PEvpSpvEodKx+4i9+7EFp6YBhBrPL6U0AVy+
	 FdLwbf/W7+lr89pKShW2n/p4cAA9NjlqFG3R/A+QJhzAOZWPg2dJ7s6PU7Tg9ZKUZp
	 gV/XaODg8Tq67Puo0/GCIraMekvH3uvyloK4/bPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67003F80155;
	Thu,  3 Nov 2022 17:35:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 977E8F8051E; Thu,  3 Nov 2022 17:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5032F80155
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 17:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5032F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UWukCzRG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D60761F65;
 Thu,  3 Nov 2022 16:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8E7C433D6;
 Thu,  3 Nov 2022 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667493294;
 bh=/ccW2ZLYtie//iuE3Z0X9cbimEJCwup/DH2xpMNHLnI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UWukCzRGudBv919/sH+I74MEzypxqLqYpIvPo+K0bDcfXWiWyDMyD6iMuQPIhOtL0
 j4uh5dfTRvuifo39nRCKLeELXdhbUdvDqp21GVSiXdyeYPTq93n+WF0rgsyWbgCfXD
 SBXLEtYj4br6ie5vVw7sXYuK7VX9ER1WKdtTmoHv4fjpuDQft3x17gxRFgbtk+xi0b
 Im+Y5+cO63sgDPY0pjSa3QvILW1IVRqPFAI4hfcCI4+l3d9bGe8h6OEh4OomJuuWoJ
 JRp0TswL+av9oAc+vtrBb0x1OV0OrmhaqdYrH7EPDTDMHp8DMNF8tXUaLv/Ia2g7IF
 sH9N9pR0bXD3A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221103120624.72583-1-colin.i.king@gmail.com>
References: <20221103120624.72583-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: cirrus-common: Make const array uid_strings
 static
Message-Id: <166749329166.480833.13410330883416925257.b4-ty@kernel.org>
Date: Thu, 03 Nov 2022 16:34:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 3 Nov 2022 12:06:24 +0000, Colin Ian King wrote:
> Don't populate the read-only const array uid_strings on the stack but
> instead make it static. Also makes the object code a little smaller.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: cirrus-common: Make const array uid_strings static
      commit: b43d0c0a42b2c44da824b3de0364d73be722a8c7

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
