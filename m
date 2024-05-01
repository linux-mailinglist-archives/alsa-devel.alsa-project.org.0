Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF88B8B6F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887F2EB6;
	Wed,  1 May 2024 15:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887F2EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714571065;
	bh=DdmaAL72NIA/h0L7GanbdzpHoFrQQ/7SR3lk+7msWSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pou7QppzPn5LSksztlwZRfufHj2XBBUDSDpVcB95Kh97gIiLBLCzFVIT2LHWnHMVt
	 E6LNmT7dapFoQ5+uxH1mJVj6AUeDXRazcFgjGWI8Mww11Ue1kWKpBYjgB3xasklEsX
	 fWnHAHKPF+WwcWZVIj0l2O36QqUWNvJD5BQbz52s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5DFCF805AC; Wed,  1 May 2024 15:43:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B94EF805D4;
	Wed,  1 May 2024 15:43:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66390F8059F; Wed,  1 May 2024 15:43:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9724DF8023A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9724DF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MQLpGkhG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 924FECE12FB;
	Wed,  1 May 2024 13:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5670CC113CC;
	Wed,  1 May 2024 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571000;
	bh=DdmaAL72NIA/h0L7GanbdzpHoFrQQ/7SR3lk+7msWSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MQLpGkhG1JuRdCgLR33W/+2gEZwsIYqoQcLs4ea0fFWBCk0c4T5gNZELBlbfgfKfc
	 8+c9fD7pGC5CPgzxitM14pkoK42DPYQcUkIp4vD4Z2v6tjTbR6HfKaIfETh7XDtB0x
	 2YCW62xTvJxMcTqYWjqmob3LY8ATjA51ZVSIfCOkpKkw6yk4lpryu+Ud2TTkxTQ4ZT
	 xXXUIVPpFcbu702XdCSIZHn7zMcQUGwzeNSaG+eUtUiv3K/wE13dAieeSd+XMbP+UM
	 xhK/pELuTyDIPo7s8vvTRjjRExPiVXfPCIliBc7Wx37XEsAdQ1EX6C8ZmpwN6vu066
	 UJXJQD0zLOfGw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/12] ASoC: Intel: updates for 6.10 - part5
Message-Id: <171457099874.1888704.2352818866469804657.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:18 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: QDHP5MUAENWVYLZI26KK4HTFDTLIWP4E
X-Message-ID-Hash: QDHP5MUAENWVYLZI26KK4HTFDTLIWP4E
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDHP5MUAENWVYLZI26KK4HTFDTLIWP4E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 10:21:11 -0500, Pierre-Louis Bossart wrote:
> This patchset corrects a couple of mistakes corrected, improves
> snd_soc_card allocation.  The new functionality is mostly for
> SoundWire platforms, with new SKUs for Dell and Acer, and support for
> the Cirrus Logic bridge/sidecar amplifier topology.
> 
> Bard Liao (1):
>   ASoC: Intel: sof_sdw: add a space before cfg-amp in components
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: Intel: skl_hda_dsp_generic: Allocate snd_soc_card dynamically
        commit: 33e59e50ee7610473c85030edca73ad3df60b5c1
[02/12] ASoC: Intel: skl_hda_dsp_generic: Use devm_kasprintf for the components string
        commit: 69d0f88b9aebb5749ab0dbaead7414d718994380
[03/12] ASoC: Intel: soc-acpi: mtl: add Dell SKU 0C64 and 0CC6
        commit: 02e6f7cb487f18e1171ae6d12ad1066fbd25176d
[04/12] ASoC: Intel: soc-acpi: mtl: add support for Acer Swift Go 14
        commit: 64bfd26d982ec29123c65949229fa12c15f7df8f
[05/12] ASoC: Intel: soc-acpi-intel-lnl-match: adds RT714 and RT1318 support
        commit: 6d339113df3ab510ce075a18ccb10a20cb325d4e
[06/12] ASoC: Intel: sof_sdw: Allocate snd_soc_card dynamically
        commit: 38068d91cf3948ffa220d45f738505cc9f6e13d0
[07/12] ASoC: Intel: sof-sdw: don't set card long_name
        commit: 2086b55fd6ddcaa92e473ba7017f6a986870337e
[08/12] ASoC: Intel: sof_sdw: add a space before cfg-amp in components
        commit: 6be269d274353d2604bf49b92f703610cb4734e9
[09/12] ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk
        commit: 0bab4cfd7c1560095e29919e2ebe01783b9096dc
[10/12] ASoC: Intel: sof_sdw: Delay update of the codec_conf array
        commit: 628cc5d0c4bd6a3f70c793968f8e2546afc8c3a3
[11/12] ASoC: Intel: sof_sdw: Add callbacks to register sidecar devices
        commit: da5244180281a18c4c7859674fec308514aaf629
[12/12] ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps
        commit: b831b4dca48dbe0f1f7705b44460dd9ca7f2f940

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

