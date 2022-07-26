Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 801355811FF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 13:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9B071622;
	Tue, 26 Jul 2022 13:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9B071622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658835150;
	bh=9mBKT4CUztHPbACPtumnHi+2cAODmk8EgE62B/2yFZs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8pvab9fTcGE+Q6b3dLWQtvUXR3iWWudUzsg7gS6UOZH/WVRCktyouXxMV5yMHKyj
	 VTpmLFu3yoxwyRMGxsHaqSpMQv2HdMZeAUVA0Di5kI9NB/HfsNyPGirg8BVHmkhzAq
	 Y+t1IW/jPOuVIwR79sbzhp8lEOX/s87A1Ghd6yC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED4A5F80544;
	Tue, 26 Jul 2022 13:30:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32F02F8025A; Tue, 26 Jul 2022 13:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD37CF80238
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 13:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD37CF80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OMlb1sq1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE6C1B815FB;
 Tue, 26 Jul 2022 11:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E6CC341CE;
 Tue, 26 Jul 2022 11:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658835039;
 bh=9mBKT4CUztHPbACPtumnHi+2cAODmk8EgE62B/2yFZs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OMlb1sq1LbkVeeyDeCZR6hA0fDgaPeGCA67Mw94v8/o5DTwcDYkOx5L5xzj5TEKzn
 dVPRshQ4gesHPJBKot8HXMoEZVgw0CiMkRyLS5tNK4zUoCw62MfNPeTYaae36qFmnW
 nVsMdzZLLJeaSr159y1pyClyzO1GlyY7OnHSTYZ0ZEyTsgviU17f9nxB8z6dWNznx+
 9rg4q4v0odUvJ2G7jEie193EzX/HIBSEyZFYBxOpe+4QnrTcdK9B8W9V0Ot/0cTRTN
 GM29nkUHiH+qsDO+2fEZmyc0LKJR7+hXaXJv1w9xuMp2PPtdPLwdkD94Fyg9nBh2wR
 Wz85iPixf2jdQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: machine driver updates for 5.20
Message-Id: <165883503858.86475.15637772744939881177.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 12:30:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
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

On Mon, 25 Jul 2022 14:48:59 -0500, Pierre-Louis Bossart wrote:
> A couple of minor updates contributed and tested by Intel teams or end-users.
> Ideally these should be applied for 5.20, time-permitting.
> 
> Andrey Turkin (2):
>   ASoC: Intel: sof_es8336: Fix GPIO quirks set via module option
>   ASoC: Intel: sof_es8336: ignore GpioInt when looking for
>     speaker/headset GPIO lines
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: sof_sdw: add support for Dell SKU 0AF0
        commit: 4e68eef41966771d0a109adaab2a632dbca2a983
[02/10] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ADL match table
        commit: 2ec8b081d59f5c39eb262f09ebc9e81178d222be
[03/10] ASoC: Intel: sof_es8336: Fix GPIO quirks set via module option
        commit: 5e60f1cfb830342304200437121f440b72b54f54
[04/10] ASoC: Intel: sof_es8336: ignore GpioInt when looking for speaker/headset GPIO lines
        commit: 751e77011f7a43a204bf2a5d02fbf5f8219bc531
[05/10] ASoC: Intel: sof_es8336: add support for HDMI_In capture
        commit: 86b1959a2ccb1cd3c91f99a6ad06dcd0940a2058
[06/10] ASoC: Intel: sof_es8336: reset the num_links during probe
        commit: fae93e3b952aeb0bad1a3d80ed9592cfc24aa8c6
[07/10] ASoC: Intel: sof_es8336: remove hard-coded SSP selection
        commit: 24913664b5103c3dd454081f79ba663ec18f65a1
[08/10] ASoC: Intel: sof_rt5682: Add support for mtl_mx98357_rt5682
        commit: 1f6645b1ee792fcb5bd621af7845430cc0de1531
[09/10] ASoC: Intel: sof_rt5682: Perform quirk check first in card late probe
        commit: 371a3f01fc1862c23fae35cb2c98ffb2eec143f1
[10/10] ASoC: Intel: sof_nau8825: Move quirk check to the front in late probe
        commit: 5b56db90bbaf9d8581e5e6268727d8ad706555e4

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
