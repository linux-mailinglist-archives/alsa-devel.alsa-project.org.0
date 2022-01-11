Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768448AF6F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 15:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B43818ED;
	Tue, 11 Jan 2022 15:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B43818ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641910981;
	bh=jiUkjZIvRhFm8pHwwppwGyhpeNFAO7JfTTZCkHmN35s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UiUCAee4T0H1f81vUSuFGc+w5eW/GvxoOffN+yx9SQkX5v/g1iQ/6Yvb8Kl2TxOXI
	 abLfLKOcAmKAATgXWmSzWspPbA2LvlU0lwI55jU1qTj9ZWGWxl5jBJHvtSTxWXDsIk
	 Z5thNOGavHdR0J855u+wE+qS3MGcGgGsNK3KWG+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8123DF80430;
	Tue, 11 Jan 2022 15:21:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F9BF80118; Tue, 11 Jan 2022 15:21:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEF93F80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 15:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF93F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OPgbHrJF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99E0BB818B8;
 Tue, 11 Jan 2022 14:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1D4C36AE3;
 Tue, 11 Jan 2022 14:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641910906;
 bh=jiUkjZIvRhFm8pHwwppwGyhpeNFAO7JfTTZCkHmN35s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OPgbHrJF2sak7gjjMco9H0buFs8udcgvr/u0HQKvPAMviknHSyVRiyGFl+LrIhPT/
 N2XREIKv7nXFiuPjJ0n4PbDB68dVVeu1ItYh9q8kDA3LWAshjX7eenTywCi1xJxRyL
 80EsF0DuacCkZyjoNsY4vz78f2JocWsE9tJkt0UHbZMPjEKiHBs7qiazK0X0PmXsNV
 YRkIqMNxUxDp2mI9MowA2AiPBChU0g3u2J1h6UEG0vLYSCb98gwZ2Msi2x5/xE+HHP
 G+UNhCiU8TqHiwbaExaAogc41IwTNOT6M26nN4JzHtTJkyuyaHAqB8T2S35VIZO9Xv
 iesukpc4dvMyA==
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220107214711.1100162-1-robert.hancock@calian.com>
References: <20220107214711.1100162-1-robert.hancock@calian.com>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: Xilinx fixes
Message-Id: <164191090481.1752423.10373421525300855428.b4-ty@kernel.org>
Date: Tue, 11 Jan 2022 14:21:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kuninori.morimoto.gx@renesas.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com
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

On Fri, 7 Jan 2022 15:47:05 -0600, Robert Hancock wrote:
> There are drivers in mainline for the Xilinx Audio Formatter and Xilinx
> I2S IP cores. However, because of a few issues, these were only really
> usable with Xilinx's xlnx_pl_snd_card top-level driver, which is not in
> mainline (and not suitable for mainline).
> 
> The fixes in this patchset, for the simple-card layer as well as the
> Xilinx drivers, now allow these drivers to be properly used with
> simple-card without any out-of-tree support code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/6] ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period bytes
      commit: e958b5884725dac86d36c1e7afe5a55f31feb0b2
[5/6] ASoC: simple-card: fix probe failure on platform component
      commit: a64067f4cecaaa4deed8e33d3266bc0bcc189142

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
