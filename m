Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E350EC4A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C72A41888;
	Tue, 26 Apr 2022 00:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C72A41888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650927230;
	bh=Ug92EAPvKpTXZJLuVFX3Rz7ihz5j/5thfewsh0pAmrA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s7x7j4L1x5Eh91xTlP65RxH8xda0wIekd12re3Dt+A3pGeebOEExAPbM4bQmi+qp5
	 We/zjFh4iG1cXM7EWAldOSb9HxAj4sdD36A7FJU3UmVchTVai4c3AIMtPubPg5ARIc
	 vXZFbkkM1jLlIrdM/c+5U9f+rQR2QfVbl94lit/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 189D3F8014B;
	Tue, 26 Apr 2022 00:52:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 056D6F8016A; Tue, 26 Apr 2022 00:52:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E31F8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E31F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kbry3mko"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9AB656157C;
 Mon, 25 Apr 2022 22:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63327C385A4;
 Mon, 25 Apr 2022 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650927163;
 bh=Ug92EAPvKpTXZJLuVFX3Rz7ihz5j/5thfewsh0pAmrA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Kbry3mkoM0HEDSUt0mtgk7IA4bA88bissQmAujkE1GwBrJNw6UAyzB0ubFwluQKfk
 gdpq2c0OzIwRY5Q1JKSWZdKNyPngcbmFD2oJ5U6XFxGsAh+Av/3NJMCFFK+IcXodv2
 I21TK4Lwlg5Vm5+IZFMYs3F0ftowSohuCohW+MHBMTrHALQbOoeKjK7/gM1XZGh4Er
 acloJqPVPkZUCJRnIFpS2Zjo8lpxojTQCtaEKIgHpKMI0FH7prNzxjgVMTFljeSLQZ
 YBmkQbQM2naAUmnbgNp7oPNBs5m0ljrPhvnfLUrPYLc24YKX1d37Zdn/GNEjX3HjDF
 MtTGJho0nGB1g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/14] ASoC: SOF: Intel: improve HDaudio DAI support
Message-Id: <165092716213.13125.1036997938950239120.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 23:52:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 21 Apr 2022 15:31:47 -0500, Pierre-Louis Bossart wrote:
> The SOF CI and daily tests exposed a number of issues with corner
> cases on platforms using the HDaudio DAI, such as UpExtreme boards or
> usual HDaudio+DMIC laptops.
> 
> This patchset provides improvements for pause_push/pause_release,
> suspend-resume, mixing use cases and combinations of all three.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: SOF: remove incorrect clearing of prepared flag
        commit: 8e84b6a4e7f188638748d2ac0455a94799530aa1
[02/14] ASoC: SOF: Intel: Add IPC-specific dai ops for IPC3
        commit: 51ec71dc0cc90e6683ebda7f5ea0ddb71265ab23
[03/14] ASOC: SOF: Intel: hda-dai: consistent naming for HDA DAI and HDA link DMA
        commit: 309e6e557482415c32338b118f0eb17600d98060
[04/14] ASoC: SOF: Intel: hda-dai: simplify hda_dai_widget_update() prototype
        commit: b44c99f11de2c9f01b5526e668c476de976fd14d
[05/14] ASoC: SOF: Intel: hda-dai: use snd_soc_dai_get_widget() helper
        commit: 5ef85c9e42e5fc549e934669fdca352b3da97ec4
[06/14] ASoC: SOF: Intel: hda-dai: split link DMA and dai operations
        commit: f321ffc8d93639181af0512938e2b0630ca28051
[07/14] ASoC: SOF: Intel: hda-dai: regroup dai and link DMA operations
        commit: 9272d6c2af6427df8d7fe665ede6a1bf97d0ca8c
[08/14] ASoC: SOF: sof-audio: flag errors on pipeline teardown
        commit: d1c73a213b462058e91654b5d1d493b3003375cd
[09/14] ASOC: SOF: Intel: hda-dai: add hda_dai_hw_free_ipc() helper
        commit: 81622503229943363858cd7ae1330f49b131dfbc
[10/14] ASoC: SOF: Intel: hda-dai: move code to deal with hda dai/dailink suspend
        commit: f09e92844eabd6a65feab0c548a7cf6741cfa39d
[11/14] ASoC: SOF: Intel: hda-dai: improve suspend case
        commit: 23b1944e46ab4cd7cbd4ef999f814fc6c6f2eb88
[12/14] ASoC: SOF: Intel: hda-dai: reset dma_data and release stream
        commit: 722cbbfaed2a290b1de1fb0ec4ee9a15ec240f7c
[13/14] ASoC: SOF: Intel: add helper for link DMA cleanups
        commit: 880924cad12e96092364467cb7b3ad7a689bec55
[14/14] ASoC: SOF: Intel: hda-dai: protect hw_params against successive calls
        commit: c4eb48f7739fc0dae7e6b8319a77261fc1b61d74

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
