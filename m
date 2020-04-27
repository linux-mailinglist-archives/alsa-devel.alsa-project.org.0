Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F11BA459
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:14:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B501690;
	Mon, 27 Apr 2020 15:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B501690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587993260;
	bh=uUImpmvEx491O9ztYoJkf0f+0HuJG0KG4PbPfXnRmi4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5K2NeTuj7oIepULOV5IKEAynJNzj7EQ0hOD1jTvpQUiMYba2ioNduJB2N6oHRldJ
	 4OpmfOa181l/Duvsup0vjM3cTkoCeB1lpKTAb9ii6bF1DwX+yZv4ghQyF9YpbG1KAJ
	 wL66oJgVEfSmLmX3wJna+xKkC291FYxFe0lTf1WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B985DF8029B;
	Mon, 27 Apr 2020 15:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8179F8022B; Mon, 27 Apr 2020 15:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C43AF80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C43AF80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xoIA2sNe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 297D520775;
 Mon, 27 Apr 2020 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587992965;
 bh=uUImpmvEx491O9ztYoJkf0f+0HuJG0KG4PbPfXnRmi4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xoIA2sNepM5pdACYDbTVdBPPnjWOfPu9z8vuKssI6nAKxpX2oS7RW3HW61zf5Z//p
 FQv33tczriYeH9bqz4+w5lzySf3c8tyt7Y8WecEnrRh/l90tP7F/YjCDiTH9d8J6tU
 fO1MgDlWltbMMTNm0bkkv0H1xX0qrI3WZGEsT2po=
Date: Mon, 27 Apr 2020 14:09:23 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20200419183509.4134-1-yung-chuan.liao@linux.intel.com>
References: <20200419183509.4134-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: add amp number in components string
 for ucm
Message-Id: <158799293954.30174.17553763332925149533.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

On Mon, 20 Apr 2020 02:35:09 +0800, Bard Liao wrote:
> From: randerwang <rander.wang@linux.intel.com>
> 
> The number of speaker amplifiers may vary between platforms. UCM
> needs to check amp number to include different configuration files.
> This patch keeps track of the number of speaker amplifiers and
> stores it in components string of the card.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: Intel: sof_sdw: add amp number in components string for ucm
      commit: b1ca2f63e20b471e8f86e35b4b5f9407f8cb3021

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
