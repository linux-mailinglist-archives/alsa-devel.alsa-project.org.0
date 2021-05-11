Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0937A23C
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 412591788;
	Tue, 11 May 2021 10:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 412591788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722138;
	bh=iUmfjkKaA68ABg2KhYukkcGdBbrGGjarBpRvMvblEgo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g4WvVorkQInRjbgTEecg6W16QVdrUvWKpvRQ720JJ3rlBiharCS2LoJOow9rnsbWP
	 UeNaklU/Qbbq0gpLZ1VV3HKn0JScoE0LeXIlMrPZIB2P+VfC4ZH9Le44tBso2BPL8C
	 YcikpqzrSXBOwTvt9SBbhOK96NT3fqnJbuhS5tjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 678D8F80535;
	Tue, 11 May 2021 10:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6C90F804DA; Tue, 11 May 2021 10:28:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57E44F8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57E44F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DwagYVBn"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71FC961947;
 Tue, 11 May 2021 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721697;
 bh=iUmfjkKaA68ABg2KhYukkcGdBbrGGjarBpRvMvblEgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DwagYVBnLdk1I+Ud3hdjvhn7l8r9n0eIRRXkk2P+vQfo7+CVQ6zgeB0LO+wabuC5B
 Yv1KDdN+AhAs1LaX/XylrIlAG12tlGH+3XzUlZ22BiAgZsLIpFuw2UiS3bDwUyjjFY
 VlxJPJWUxP2ONcfPNOPtgvN3tsnttKuu6sYw9LRbasD6V1JA2vWvnDwrpqZBN4+SpK
 Z21UQKSjMezS/JULQGDZELUrlG4Wtiv9Zng7fed19ZHIXG8uXGWqLeUyLLeWm3dA13
 zS5NPVEFUBkB7zCa8BTVcfS5EvQyH5XY3HPHvliCxDjbMW1CVJBSeBPzL/FRB8xZr3
 vdl5otGlSkQuw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/13] ASoC: Intel: machine driver updates for 5.14
Date: Tue, 11 May 2021 09:26:01 +0100
Message-Id: <162072058169.33157.3377502226569621272.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Wed, 5 May 2021 11:36:52 -0500, Pierre-Louis Bossart wrote:
> Some of the patches in this series for TigerLake and AlderLake
> SoundWire/Bluetooth support were missed in a previous submission,
> resend them as is, and add new patches for the CS42L42 machine driver.
> 
> Brent Lu (3):
>   ASoC: Intel: maxim-common: support max98357a
>   ASoC: Intel: add sof-cs42l42 machine driver
>   ASoC: Intel: sof_rt5682: code refactor for max98357a
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: Intel: Boards: tgl_max98373: Add BT offload support
        commit: 37897babed2e5ff622d29b61bf27c8567087b516
[02/13] ASoC: Intel: soc-acpi: add entries for i2s machines in ADL match table
        commit: 2a29ff7ae13c9263e88abc22e372ab57fb3ac21c
[03/13] ASoC: Intel: boards: add support for adl boards in sof-rt5682
        commit: 2e4dba57ea56dc04d5c452be37bfb4db7d8229de
[04/13] ASoC: Intel: sof_sdw: add mutual exclusion between PCH DMIC and RT715
        commit: 35564e2bf94611c3eb51d35362addb3cb394ad54
[05/13] ASoC: Intel: boards: handle hda-dsp-common as a module
        commit: f6081af6cf2b4fda929638e8cec4cd2f9487dd9e
[06/13] ASoC: Intel: boards: create sof-maxim-common module
        commit: 9c5046e4b3e736eec5b9a8f1d59c07bb0ed78a7a
[07/13] ASoC: Intel: sof_sdw: add support for Bluetooth offload
        commit: 19f1eace04412a10268532091d5c316a13aab90a
[08/13] ASoC: Intel: boards: remove .nonatomic for BE dailinks
        commit: 3b316e229eb9f1861d14cb788d9b54e9319ff58e
[09/13] ASoC: Intel: sof_rt5682: Enable Bluetooth offload on tgl and adl
        commit: fd2856929fb47b8921942b17a6dfa2757e76144f
[10/13] ASoC: Intel: sof_sdw: add SOF_RT715_DAI_ID_FIX for AlderLake
        commit: 81cd42e5174ba7918edd3d006406ce21ebaa8507
[11/13] ASoC: Intel: maxim-common: support max98357a
        commit: a21515b5aaff57bf2f4160380aa7eedcd0113c96
[12/13] ASoC: Intel: add sof-cs42l42 machine driver
        commit: 5a7f27a624d9e33262767b328aa7a4baf7846c14
[13/13] ASoC: Intel: sof_rt5682: code refactor for max98357a
        commit: b70029abfc90e9d4a62f5dd7e85a59c465acc7b3

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
