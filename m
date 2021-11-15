Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140C4514E8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 21:19:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1C0169C;
	Mon, 15 Nov 2021 21:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1C0169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637007589;
	bh=gS4Lb4yzd8XYVvQOzo9haXFgJ/BQV8s+aSTNhI8K/xo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GKssfETCgk2VoLm5dyCB526gN/7X+Mem/3n/UH8+PZvzVZ47VBmFDEQ+mpW1NN3jl
	 rp6NpZ/fmOhtNQ2DKRGSCA6q5tSZZeWbXsxJiT5+JBTQhJ6JqupYAB5Jgz3O101YAI
	 tRj0F1EUITRm4IbzB1z5bSNZo0H6VVoy/CooSwYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA59F80163;
	Mon, 15 Nov 2021 21:18:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E119F8028B; Mon, 15 Nov 2021 21:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 107ECF800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 21:18:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 107ECF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qA2dtKGE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 686D261BF8;
 Mon, 15 Nov 2021 20:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637007504;
 bh=gS4Lb4yzd8XYVvQOzo9haXFgJ/BQV8s+aSTNhI8K/xo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qA2dtKGEs4N0pG1Tee3H0LJIOKQbb2KNV1LQXOj9zoUvDDpN8mC5KjGuXdd8QZoGf
 cToHY5auiOGgeLRJ/RXgnf5d3yuTv+GWOmpAnuxVEC71i2/VQj1fe5WHpsfF17JTnd
 kfUPEUJ5TlnqR0kxQeKt57Z/a0j+pwlHSOBRAbCaYoIQEDhLCM3pLDeHU5RqYMc0m+
 60M1WLUsybvm4WOCaRXaU/7cgNPeQKRfEEpWHdvaTwh1b6VQgv7/IlXAnlHPSmQXo8
 CQ4Zu73bkBihWGzzSAQWRASAyoZUzmu6k2cFXMtZjMSfJISpav0BKaTXMvap3TelCS
 kzP4e1D93IQSQ==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
References: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: Implement support for DMA trace free IPC
 command
Message-Id: <163700750313.2049880.7145686192433609610.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 20:18:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

On Tue, 2 Nov 2021 12:10:16 +0200, Peter Ujfalusi wrote:
> This series adds support for the new DMA_TRACE_FREE IPC message to gracefully
> stop and free the DMA trace related resources on the firmware side.
> 
> Regards,
> Peter
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: IPC: Add new IPC command to free trace DMA
      commit: 168eed447129899611098219b70ef97b605bc6e1
[2/3] ASoC: SOF: IPC: update ipc_log_header()
      commit: b4e2d7ce132bc4337916662f8e699420377132d9
[3/3] ASoC: SOF: trace: send DMA_TRACE_FREE IPC during release
      commit: 48b5b6a56002569881d18be56deaddad045df918

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
