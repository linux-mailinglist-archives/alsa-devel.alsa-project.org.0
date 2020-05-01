Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F11C1AD2
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 18:49:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5418D16C9;
	Fri,  1 May 2020 18:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5418D16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588351749;
	bh=GA+KXGXoObU9YSnCE9hebwVyTOhJGZIl3ym5Rx9Hw/o=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uXas87/L4+NnsiqC+PdqaOZBuw70iFruBGtOxB96gUW2Siv2ZUoE7eULrwpIZaVv3
	 GClmBRw42g7LqkrhWmWPWGixqrU3a3/CDi8ADsSkiA7DWoW8n56UCgc3H3gXWEpU6p
	 /Ap4pFA33PdspxvxrFrYHK+uG1WLv6D7pDOXjftI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41747F80291;
	Fri,  1 May 2020 18:45:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 539F6F80299; Fri,  1 May 2020 18:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC688F80291
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 18:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC688F80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AkwbjJq2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF115206D6;
 Fri,  1 May 2020 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588351552;
 bh=GA+KXGXoObU9YSnCE9hebwVyTOhJGZIl3ym5Rx9Hw/o=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=AkwbjJq27wgL44OWjVR6kZ7gNrtwKzGaCO8zyArS2PGgHuSafJh9AYojz9Eo24/F7
 388tGq9cuZiH/+wMWl17hOG3OuTxDrCMMBsMUNJjQrFdglBBomA2gns9dUgFA5Ksks
 AY3kTgCizOSS9m8tL5Tr4QPIkEV8fWAS8lfW19Ik=
Date: Fri, 01 May 2020 17:45:49 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200501151625.17820-1-pierre-louis.bossart@linux.intel.com>
References: <20200501151625.17820-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: boards: sof-wm8804: support for Hifiberry
 Digiplus boards
Message-Id: <158835153189.13173.14761204750811694322.b4-ty@kernel.org>
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Fri, 1 May 2020 10:16:25 -0500, Pierre-Louis Bossart wrote:
> Add a new machine driver to interface with WM8804. The code is based
> on settings found in sound/soc/bcm/hifiberry-digi.c in the Raspberry
> PI tree.
> 
> Tested on Up2 with Digi+ IO (capture+playback) and Digi+ PRO (playback
> with two local oscillators supported). The codec is clock master in
> both cases.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: Intel: boards: sof-wm8804: support for Hifiberry Digiplus boards
      commit: f139546fb7d436145cbbffa346de7d5353c84fdf

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
