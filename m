Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90120446981
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 21:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F81F1685;
	Fri,  5 Nov 2021 21:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F81F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636143342;
	bh=LSAMD4csi9LYb+2Qq3f88TWLgN3S61nRAGU8TYjsLjM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkeVE3woN+11zRxr10w5YGaU/0vr9g3pVIvdFTBnK1AlpOn1bo6JZ5IjyxJ+4Xzk+
	 w0M3SCnqxp0L3oVpX7yT9CWsxjYJjaMwTpG0XIFhOF7BVvfBbqdeQvFHdnFROdFngD
	 MOADBQWLONEaYA0TcsVnDEXe++52Tv0ZlV0jV0RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 641EBF80148;
	Fri,  5 Nov 2021 21:14:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FDCAF80279; Fri,  5 Nov 2021 21:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 862B3F80224
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 21:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 862B3F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hUHYVV8k"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17CEC61183;
 Fri,  5 Nov 2021 20:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636143255;
 bh=LSAMD4csi9LYb+2Qq3f88TWLgN3S61nRAGU8TYjsLjM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hUHYVV8kqKPAb/85qkCgZqkzvHDOVfURm3L/Ef+hGYJnQ6wBBAhdy37CPwEhswmYZ
 zm6cNHaozYk6RPaG0aUZOoEbMzipDXBiBQdYCUA52rNNyBtoaTWoO5vBEJro4yBlQo
 W1G7g+yZpalD3G7yAkLDM0WFsrKtmGUM4LC6KfU49/o4ldNJ5cxAsVCHtFsMYUS8fe
 cw/Y1Xe9Vh33UxejeeWRtofruW5l8gTXmOgQVGcAzS9y8tQ+M1y74MTLgEZheyLvt3
 Aof2znEUZKxYe0ueRv475Xwb7z1jysWUJnWveAc//qYbrmhunIasxEiRniarvC/k0b
 W4+qUqTGlZMoA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20211105022646.26305-1-yung-chuan.liao@linux.intel.com>
References: <20211105022646.26305-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: Ietel: Add Dell ADL products support
Message-Id: <163614325381.3446536.13120847316924354587.b4-ty@kernel.org>
Date: Fri, 05 Nov 2021 20:14:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 5 Nov 2021 10:26:37 +0800, Bard Liao wrote:
> This series adds configurations for Dell ADL products.
> 
> Gongjun Song (9):
>   ASoC: Intel: sof_sdw: Add support for SKU 0AF3 product
>   ASoC: Intel: soc-acpi: add SKU 0AF3 SoundWire configuration
>   ASoC: Intel: sof_sdw: Add support for SKU 0B00 and 0B01 products
>   ASoC: Intel: sof_sdw: Add support for SKU 0B11 product
>   ASoC: Intel: sof_sdw: Add support for SKU 0B13 product
>   ASoC: Intel: soc-acpi: add SKU 0B13 SoundWire configuration
>   ASoC: Intel: sof_sdw: Add support for SKU 0B29 product
>   ASoC: Intel: soc-acpi: add SKU 0B29 SoundWire configuration
>   ASoC: Intel: sof_sdw: Add support for SKU 0B12 product
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/9] ASoC: Intel: sof_sdw: Add support for SKU 0AF3 product
      commit: 8f4fa45982b3f2daf5b3626ca0f12bde735f31ff
[2/9] ASoC: Intel: soc-acpi: add SKU 0AF3 SoundWire configuration
      commit: a1797d61cb35848432867a5bc294ce43058b5ead
[3/9] ASoC: Intel: sof_sdw: Add support for SKU 0B00 and 0B01 products
      commit: cf304329e4afb97ffabce232eadaba94f025641d
[4/9] ASoC: Intel: sof_sdw: Add support for SKU 0B11 product
      commit: 6fef4c2f458680399b7c512cb810c1e1784d7444
[5/9] ASoC: Intel: sof_sdw: Add support for SKU 0B13 product
      commit: 6448d0596e48dbc16a910f04ffc248c3f3c0a65c
[6/9] ASoC: Intel: soc-acpi: add SKU 0B13 SoundWire configuration
      commit: 11e18f582c14fdf08f52d99d439d2b82d98ac37d
[7/9] ASoC: Intel: sof_sdw: Add support for SKU 0B29 product
      commit: 0c2ed4f03f0bfe2be34efbabbebe9875c3aa9ca9
[8/9] ASoC: Intel: soc-acpi: add SKU 0B29 SoundWire configuration
      commit: 359ace2b9a411c3bd4b89fdc56f8b60e0f6696d2
[9/9] ASoC: Intel: sof_sdw: Add support for SKU 0B12 product
      commit: f55af7055cd465f6b767a0c1126977d4529c63c8

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
