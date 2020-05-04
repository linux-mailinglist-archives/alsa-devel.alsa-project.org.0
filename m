Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E0A1C395C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 14:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489011711;
	Mon,  4 May 2020 14:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489011711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588595403;
	bh=cjKeUkNJg34S6QW7rmS197l3ot8CB4nkPmP3R9c1MLs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K5VTXdkkHgdqEWE3i10NJvRMqwWMKBiPcowSa6aU0pHKyN2PcEl9e8GnVzh5xKlkD
	 EJWNnr3NweqDnVjBKAYPk5saIcWvULz6zHHUibVlcx0yRXBqSFiJ5pN/mfGfkhg+Pp
	 s7rqY8b4vTW7mxF/IrpPtODOnQmdw2HQAlmtSQQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BCFF8026F;
	Mon,  4 May 2020 14:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E64C6F800E5; Mon,  4 May 2020 14:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9161FF800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 14:27:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9161FF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0KviBMSM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 906B62073B;
 Mon,  4 May 2020 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588595243;
 bh=cjKeUkNJg34S6QW7rmS197l3ot8CB4nkPmP3R9c1MLs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0KviBMSMVVy6T2EK5YQFekA39KkrCS8CsDXPvItnftqh7ALnGACBPlz8HqCi6duO7
 ZUJcJZwSw+HWtsTPS0N8f42Btk+WFsvLANPTgK3XMbC+ubrudHMMbbwOPGAdFtWa3E
 mTmnKZ3IUeCUKHqFy9hCqzrNmQZbEOCn/vc1HUDE=
Date: Mon, 04 May 2020 13:27:20 +0100
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, Yong Zhi <yong.zhi@intel.com>
In-Reply-To: <1588376661-29799-1-git-send-email-yong.zhi@intel.com>
References: <1588376661-29799-1-git-send-email-yong.zhi@intel.com>
Subject: Re: [PATCH] ASoC: max98373: reorder max98373_reset() in resume
Message-Id: <158859522870.21499.18432499116385944812.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org
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

On Fri, 1 May 2020 18:44:21 -0500, Yong Zhi wrote:
> During S3 test, the following error was observed:
> 
> [ 726.174237] i2c_designware i2c_designware.0: platform_pm_resume+0x0/0x3d returned 0 after 0 usecs
> [ 726.184187] max98373 i2c-MX98373:00: calling max98373_resume+0x0/0x30 [snd_soc_max98373] @ 12698, parent: i2c-11
> [ 726.195589] max98373 i2c-MX98373:00: Reset command failed. (ret:-16)
> 
> When calling regmap_update_bits(), since map->reg_update_bits is NULL,
> _regmap_read() is entered with the following logic:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: max98373: reorder max98373_reset() in resume
      commit: 1a446873d7dd3a450f685928ce7f1907bde4583d

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
