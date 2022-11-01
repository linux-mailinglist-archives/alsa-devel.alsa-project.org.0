Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C4461518E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 19:29:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87E01694;
	Tue,  1 Nov 2022 19:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87E01694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667327374;
	bh=Q/ASLzwOmrV4hjupm9mEgkVuRzO7MvpPOVD1mz30ntI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k15zJjssYWyXZLLWGqZMVI5UtwyC3Oz0TCf3ba+GH4Z9mHGXdAfbONUfLqnQSYw2F
	 Q1fNCwnnFTkMYKrPnYHUa0wSDvnN84iUy1y5YJTIqXHIYoWZEp3d3pB9B+FrNiipH+
	 2XUDAOMh8uSNNQ9xFPm+NPsPLlUFCpmrntFL2PTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56594F80551;
	Tue,  1 Nov 2022 19:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4967BF80155; Tue,  1 Nov 2022 19:28:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5E84F80155
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 19:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E84F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k5gANrV9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6B638615C9;
 Tue,  1 Nov 2022 18:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC667C433C1;
 Tue,  1 Nov 2022 18:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667327283;
 bh=Q/ASLzwOmrV4hjupm9mEgkVuRzO7MvpPOVD1mz30ntI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k5gANrV9k0LA6m1AKq3mQSB5nwbFZGl7JyPUV+EQEpAUhi1nCQ59MgPjnvAywGmIA
 y2fOOHA/5AG6mtHTk/hzrReLchhhPJij+cmAUdOy2p5reWi6VJgz3/1mzFk0XihBzK
 QmvIdxMDC5snY7LkqTLAnGS3F+8IL2hpnIsOfbSpgULwy+p/AIJLDxifnpLylrYe4r
 kwHjJa+vc69csFVJ069VEwKMnDo4geN15+Vqd0H90aMHMk1eJAp5OZeidX2w7kxc0t
 lUp1hJaeT3p+sMaLgAYUb3EzVrgZnXBtGzqzoS5kk5xYwzs5THtdc1zA7LZaz79uZ2
 HVm/yCHZ1J/zw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221031195836.250193-1-pierre-louis.bossart@linux.intel.com>
References: <20221031195836.250193-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: add ES83x6 support to IceLake
Message-Id: <166732728269.298210.14554411001229186520.b4-ty@kernel.org>
Date: Tue, 01 Nov 2022 18:28:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, 31 Oct 2022 15:58:36 -0400, Pierre-Louis Bossart wrote:
> Missing entry to find a machine driver for ES83x6-based platforms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi: add ES83x6 support to IceLake
      commit: 9a1d248bb4beaf1b43d17ba12481ee0629fa29b9

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
