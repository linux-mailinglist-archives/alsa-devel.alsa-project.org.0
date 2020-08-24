Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E318B24FF00
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 15:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892481676;
	Mon, 24 Aug 2020 15:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892481676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598276089;
	bh=rzlPdiXrRzYi1XgOVr+vkYavLps2Su7hULtV6kn91GA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZO8Pkxwm2QNq+H9ROtxAT+a97lrt9tot96M88PiSD1g/U7AqisVCGUG/Po1WS+2ll
	 qrMvLnEiD5e1uAHykKx6yl162gBm16I2np7NsB6XhM/0VuZmHb/+CluH+eOv0ZLYyw
	 EchV8pBan5Ca4y1eZy08XBxRWZac8ul/S3q8C6ME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E37F8025E;
	Mon, 24 Aug 2020 15:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FBD3F8020C; Mon, 24 Aug 2020 15:32:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30F4DF8013D
 for <alsa-devel@alsa-project.org>; Mon, 24 Aug 2020 15:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F4DF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1RdQ0oiT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6349C207CD;
 Mon, 24 Aug 2020 13:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598275925;
 bh=rzlPdiXrRzYi1XgOVr+vkYavLps2Su7hULtV6kn91GA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1RdQ0oiT++7vdL6q8hk/qu/qQOKCTREt2oLWgqHrmn8DpyfnZ+pcX5Jusys7kZja6
 jGOEtshYZMYZestY8/+iQHc8lbE5G+VQclUG4y0ENlbE0/ToTkc/MmQRnkcBH5nRa5
 IvdIqQ8YQEMVHysNvY+dIq0n5oSsChXsCm0U8JD4=
Date: Mon, 24 Aug 2020 14:31:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel: machine driver updates for 5.10
Message-Id: <159827589161.47809.3170755839429146024.b4-ty@kernel.org>
Cc: tiwai@suse.de, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Fri, 21 Aug 2020 14:55:47 -0500, Pierre-Louis Bossart wrote:
> This series updates the tables used to select SoundWire configurations
> for CometLake and TigerLake, and adds support for SDCA (SoundWire
> Device Class for Audio) codecs in the common machine driver. These
> codec drivers are still being tested on early silicon/boards and will
> be contributed at a later time.
> 
> For TigerLake Chromebooks a new DMI quirk is added, as well as a means
> to override the topology names. A pm_runtime fix is also provided to
> deal with playback/capture dependencies with an amplifier w/
> feedback. I also included a minor codec correction for the TGL
> amplifier.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: Intel: modify SoundWire version id in acpi match table
        commit: 69a785da525e8bdfaa8a9c000fb3af714f0d719b
[02/14] ASoC: Intel: soc-acpi: cnl: add support for rt5682 on SoundWire link2
        commit: 6f7cf9125ed43daaf4c5dd34ebcd96c978fcd2b2
[03/14] ASoC: Intel: sof-soundwire: add support for rt5682 on link2
        commit: b161a12192f4b88cede8a563a6ebd2336d905d18
[04/14] ASoC: Intel: soc-acpi: mirror CML and TGL configurations
        commit: 6cb8bd60ba5ca9eb8f05f3f8351bbbcb6b92c525
[05/14] ASoC: Intel: soc-acpi: add support for SDCA boards
        commit: 44751fc5f0de07b0a1ab57e9beab9789638d76d2
[06/14] ASoC: Intel: tgl_max98373: fix a runtime pm issue in multi-thread case
        commit: e300486ad94d2608ebc3aaed4e03e86eeeb97084
[07/14] ASoC: codecs: max98373-sdw: add missing test on resume
        commit: 65fae64d79d2cbad43819c1ab83390594fac7fcb
[08/14] ASoC: Intel: sof_sdw: check SoundWire version when matching codec
        commit: 2e2d287bbe613be4848e83be9aa8e99e8b9f7dc0
[09/14] ASoC: Intel: sof_sdw: rename id as part_id
        commit: 535df653f75583a25c6bbb2eaaa0b121b47460c4
[10/14] SoC: Intel: sof_sdw: Add support for product Ripto
        commit: 626200df2498ff3044170d0f02b463ac0ec899c5
[11/14] ASoC: Intel: sof_rt5682: override quirk data for tgl_max98373_rt5682
        commit: 3e1734b64ce786c54dc98adcfe67941e6011d735
[12/14] ASoC: SOF: Add topology filename override based on dmi data match
        commit: 5253a73d567dcd75e62834ff5f502ea9470e5722
[13/14] ASoC: intel: sof_sdw: add rt711 rt1316 rt714 SDCA codec support.
        commit: b75bea4b8834c1253b00d5f8df2dd3ce09d2e305
[14/14] ASoC: Intel: sof_sdw: clean-up inclusion of header files
        commit: 3f2c656491af6698cb3f18d5bd34afa1b54096d2

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
