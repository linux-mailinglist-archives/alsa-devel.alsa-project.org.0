Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B733170F0
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6446A16D7;
	Wed, 10 Feb 2021 21:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6446A16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988053;
	bh=legv85L9BeD8k/5bfUXE36He7OpHk4dozEpujnu4mUs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZjHHUGo2y/8eR7q4ziz2fc13HJiYeu1vZG+niVFgLtG7F/k+QpNBqR+D7iZjPdIwG
	 9Il8fAgFmuBa22oVY71t5+gk8S9rzCHPFOC5B589edu/KtfHvCyMo5/UjEsvRWKqWy
	 9DH50QjrOYQo130qvWBMYng3jF/6bfB1wfbDLE9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACB08F80169;
	Wed, 10 Feb 2021 21:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A08AEF8022B; Wed, 10 Feb 2021 21:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63F39F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63F39F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vMz29qoB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AD4E64E35;
 Wed, 10 Feb 2021 20:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612987948;
 bh=legv85L9BeD8k/5bfUXE36He7OpHk4dozEpujnu4mUs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vMz29qoB1UYmDZCSbaLpabECsvBWkrIUJa1PtorIN2NOuUEhRginDM2AEy9QIElrO
 chEiLlkLNuZkzo4SrH5RpkgjCbkyGnaGVGemjuiuewDYxiTfsT98spnpKkZzAzi+3+
 pfO1zgf/xqmG9U4sSnzJWUcN42w0mWcSVS3v1jA54GuOvUGoaaDy4yLxlo90v9FJPh
 TTFkI9DhNyWjjkXHn8tzbdFVqX4/wPO1qYcjyZMtjXMfsYpNsAbAvyg7KtX4ZlZsd/
 D1HMe+HoG7vurDlz2fdbVsiMJkVnPruEg2z53S1QQeZQdh3sA2ziG8zLXKXXEF7Dmr
 gYr1S0Admz6dA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
References: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 00/11] ASoC: SOF/Intel/SoundWire: add missing quirks
 and DMIC support
Message-Id: <161298789618.5497.9445247068272286223.b4-ty@kernel.org>
Date: Wed, 10 Feb 2021 20:11:36 +0000
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

On Mon, 8 Feb 2021 17:33:25 -0600, Pierre-Louis Bossart wrote:
> HP Spectre x360 convertible devices rely on a mixed SoundWire+DMIC
> configuration which wasn't well supported. This lead to the discovery
> that we missed the TGL_HDMI quirk on a number of Dell devices, the
> addition of DMIC autodetection (based on NHLT tables), the addition of
> new component strings needed by UCM, and work-arounds due to
> problematic DSDT tables.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: Intel: sof_sdw: reorganize quirks by generation
        commit: 3d09cf8d0d791a41a75123e135f604d59f4aa870
[02/11] ASoC: Intel: sof-sdw: indent and add quirks consistently
        commit: 8caf37e2be761688c396c609880936a807af490f
[03/11] ASoC: Intel: sof_sdw: add quirk for HP Spectre x360 convertible
        commit: d92e279dee56b4b65c1af21f972413f172a9734a
[04/11] ASoC: Intel: sof_sdw: add mic:dmic and cfg-mics component strings
        commit: 209b0b0d8d5a469a2892ad51cb448811d00b4ff4
[05/11] ASoC: Intel: sof_sdw: detect DMIC number based on mach params
        commit: f88dcb9b98d3f86ead04d2453475267910448bb8
[06/11] ASoC: intel: sof_sdw: add trace for dai links
        commit: 3827b7ca399245e609b3ca717550b0638d1f69cd
[07/11] ASoC: Intel: soc-acpi: add ACPI matching table for HP Spectre x360
        commit: 717a8fdd150c495cc202880cf6955294c7acae4f
[08/11] ASoC: SOF: Intel: SoundWire: refine ACPI match
        commit: 6f5d506d7ff1d9b1ffac0130f2958b9da41175f4
[09/11] ASoC: SOF: Intel: detect DMIC number in SoundWire mixed config
        commit: 7aecf59770920cce5ff6e94b3809574364178126
[10/11] ASoC: SOF: Intel: HDA: don't keep a temporary variable
        commit: b9088535e1021f11500f8417598b6af1f381f7dc
[11/11] ASoC: SOF: Intel: hda: add dev_dbg() when DMIC number is overridden
        commit: 026370cb5bd7ef7999bc4379ab89ffd7a73874f2

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
