Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B599F602B79
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 603955146;
	Tue, 18 Oct 2022 14:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 603955146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095344;
	bh=loH8bscTnnp22WtnIayDx6s8ChF2+xcx2qq1wi4fE7k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s99Mk3GOI3gcMqJHM4EATtHkb9kharUsDich/u/tmunmfARBfZnP9reLIVObQP9L3
	 fQca+ibj3fKUsnk97FQdwEhBjY5KiwhhhqUOuKGIgIy1HWO5F2vGeJhOo+KWJK7NX5
	 idA8/73ZNgqXIy2MLgVs2D1W7xu0CEJUP8pllW3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEE5AF80580;
	Tue, 18 Oct 2022 14:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19E2CF80579; Tue, 18 Oct 2022 14:13:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C01AF80579
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C01AF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H9YKkqpG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BD4B61536;
 Tue, 18 Oct 2022 12:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB8FC433D7;
 Tue, 18 Oct 2022 12:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666095217;
 bh=loH8bscTnnp22WtnIayDx6s8ChF2+xcx2qq1wi4fE7k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=H9YKkqpGID+1D2QkyMUBmmFD2QFjFfPQXtfBauV6NwRvQo7+0gziDg7Kc3MUu+msA
 2iIUSjsqMtLnj3AL06FsJY3SZmRv27WrzIvKkvi0TlbTrEFLgFU5GHY90OcMEGVb32
 58IrjSfEOgdvUCnHatFuT1LUQ3yDdSZhwlgMr/6d12+itlJgxPS1wGbvVXUHiOR0E1
 7apQkoeChXnM/Q06s2P14eoMFe1bSs2rHhLkNDOqjNnGAUkuncUD7xZL/3memcB5P1
 s9Q5Pk9fsd3nGOaVgBzVYZMri8sK+FUTUCda/1ILcn0JG//apNf90Vd6/+/tBwegBz
 QD7c8TT88djIQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/15] ASoC: Intel: avs: Fixes and new boards support
Message-Id: <166609521598.371929.16651156804710560381.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 13:13:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Mon, 10 Oct 2022 14:19:40 +0200, Cezary Rojewski wrote:
> Two fixes are leading the way - one addresses the incorrect DMA mask
> assignment (typo) at driver probe. The other, fixes a potential buffer
> overflow when copying data received from firmware to kernel buffer.
> However unlikely, the fix should still be there.
> 
> Then a range of patches providing the support for:
> - AML with rt286 (machine board)
> - KBL-R for rt298 (codec)
> - KBL-R with rt298 (machine board)
> - APL/KBL with da7219 (machine board)
> - Addition of all the missing SKL-based PCI ids to core.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: Intel: avs: Fix DMA mask assignment
        commit: 83375566a7a7042cb34b24986d100f46bfa0c1e5
[02/15] ASoC: Intel: avs: Fix potential RX buffer overflow
        commit: 23ae34e033b2c0e5e88237af82b163b296fd6aa9
[03/15] ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
        commit: 953dbd1cef18ce9ac0d69c1bd735b929fe52a17e
[04/15] ASoC: Intel: avs: Add quirk for KBL-R RVP platform
        commit: 9d0737fa0e7530313634c0ecd75f09a95ba8d44a
[05/15] ASoC: Intel: avs: Support AML with rt286 configuration
        commit: 8b2446eaa45a3be5bb5c6fb79cc745d228dac431
[06/15] ASoC: Intel: avs: Support da7219 on both KBL and APL
        commit: fecc00b448a9b89c858468318bfdddbc5bd9dc6d
[07/15] ASoC: Intel: avs: Add missing SKL-based device IDs
        commit: d1356811abf785b995dd74750fc75efffa3d7656
[08/15] ASoC: Intel: avs: Simplify d0ix disabling routine
        commit: e720e68b3fa25268e1df8a6d91d3bdb80f4fc38a
[09/15] ASoC: Intel: avs: Add missing include to HDA board
        commit: e331b534d3b1a5a36a7bc1e7a85e21d2561aa2e6
[10/15] ASoC: Intel: avs: Do not reuse msg between different IPC handlers
        commit: 18a787909ca6bac3a3a3235c08d68a4a9838fe7b
[11/15] ASoC: Intel: avs: Do not treat unsupported IPCs as invalid
        commit: 2d27a1caf8ef0c443486b18de2fada3120e3fbe1
[12/15] ASoC: Intel: avs: Do not print IPC error message twice
        commit: 65edda6015682a31d82111b7a417eaa8232547f8
[13/15] ASoC: Intel: avs: Simplify ignore_fw_version description
        commit: 263e3e2dfef7a9d39c91bbd2ff61bd0619c68e3b
[14/15] ASoC: Intel: avs: Simplify log control for SKL
        commit: bfced33e1eb868b1085c7cfadfb71e6e497059cb
[15/15] ASoC: codecs: hda: Fix spelling error in log message
        commit: 62d0cee4e6f592a8c6da9e969f404e907ae65d88

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
