Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E83FB40CA7B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 18:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825AE1811;
	Wed, 15 Sep 2021 18:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825AE1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631723986;
	bh=4Cl/48gLVRD9RL7IVgGCC94BTqjVc+I7CCa1ynd8ltw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jO6YqksEAad39hXa03DsThbV5HKo3OP48UkHOgfswBqO2a001iLl4KtYpxhjNFU+d
	 iEC9ief2BWoLGZZX/D0J4oEwxnqyghCNlaIUFsvjb0jk8qrtpATP2qgA9OjOTG6rLS
	 El57gU1z3w2foppY8QykbiH8/DM89w4oybVLp9uY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BAFF80132;
	Wed, 15 Sep 2021 18:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C8EF802E8; Wed, 15 Sep 2021 18:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DBBBF80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 18:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DBBBF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t6fj1im6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2B356112E;
 Wed, 15 Sep 2021 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631723900;
 bh=4Cl/48gLVRD9RL7IVgGCC94BTqjVc+I7CCa1ynd8ltw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t6fj1im6UqXlTIL0kCtZOu8yUFrv1p52Tj+G3k2d0cav2hDdYntTpSO2AkfmL/6ZN
 3seFCgYw4e7sy9PdDe6ig9wCKlM4FuYR6MN8l4dVpzSgKXNjFmmA1vN4cf5MHsLEbK
 TWP4yjhugfLSGfYHIH5qB0zejR/gyGtd8lbIhCA9bUk25T6W09ZOWqBoyNi3WGnPOg
 rrSsRalvLzRlEyYDvMv20RIh8zIapwOx3gD3HZ4FEJNol/dzV+8LpI7ENPUsD8JH54
 TPeKE97mlI3oQLby2+kzsbtnT/pabPyHTDWKmZNOStIwpNYm8rPkaABjlPVylQ/gKZ
 PVlKRFxdD1cBg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/12] ASoC: SOF: Abstract away the 'bar' usage (mostly)
Date: Wed, 15 Sep 2021 17:37:38 +0100
Message-Id: <163172362147.34846.17955355854539650418.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, daniel.baluta@gmail.com,
 ranjani.sridharan@linux.intel.com, Mark Brown <broonie@kernel.org>
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

On Wed, 15 Sep 2021 15:21:04 +0300, Peter Ujfalusi wrote:
> The direct use of 'bar' as address regions in SOF can limit portability and
> makes assumption that all platforms are using memory mapped regions or BARs
> to communicate with the DSP.
> 
> The core API should not use 'bar' in it's parameter lists or make assumption
> that the platform needs to comply with this system integration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: SOF: Intel: bdw: Set the mailbox offset directly in bdw_probe
        commit: 6375dbdbde67725220f2a07e428259c944d4c42d
[02/12] ASoC: SOF: ipc: Remove snd_sof_dsp_mailbox_init()
        commit: b295818346aa7140dac865054a6c5efe8d4ec3ae
[03/12] ASoC: SOF: imx: Do not initialize the snd_sof_dsp_ops.read64
        commit: 098a68f2c5735b2fa8051ffe854b94b6d5b0a6a8
[04/12] ASoC: SOF: imx: imx8: Bar index is only valid for IRAM and SRAM types
        commit: 10d93a98190aec2c3ff98d9472ab1bf0543aa02c
[05/12] ASoC: SOF: imx: imx8m: Bar index is only valid for IRAM and SRAM types
        commit: d9be4a88c3627c270bbe032b623dc43f3b764565
[06/12] ASoC: SOF: loader: No need to export snd_sof_fw_parse_ext_data()
        commit: 4ff134e2f90ee2816ca5a8069802ff5cb602a2f1
[07/12] ASoC: SOF: core: Do not use 'bar' as parameter for block_read/write
        commit: 4624bb2f03d3c153e00d21c1baa1da34cfc19afd
[08/12] ASoC: SOF: debug: Add generic API and ops for DSP regions
        commit: 07e833b473e417f13c5a62aa6f63dbbd3028d277
[09/12] ASoC: SOF: imx: Provide debugfs_add_region_item ops for core
        commit: ff2f99b078a839c973434bcc9c1094814a38ae76
[10/12] ASoC: SOF: Intel: Provide debugfs_add_region_item ops for core
        commit: fe509b34b745d2284c3026abae8aaf02413a0594
[11/12] ASoC: SOF: loader: Use the generic ops for region debugfs handling
        commit: 55dfc2a74d8e8d34d6f562a1e4173e711bbd916d
[12/12] ASoC: SOF: debug: No need to export the snd_sof_debugfs_io_item()
        commit: bde4f08cff47632f0a52e15a613365e26608d003

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
