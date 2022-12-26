Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C779656613
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 00:35:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7E465BE;
	Tue, 27 Dec 2022 00:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7E465BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672097749;
	bh=cx2UV/XZSUwl0u2PvYhFJExdluhmE61BWnOpv7ZABhE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OgzFVGAxhed3TdovcCETCiNE2oLi16BXaVrMYOWJBtHYnzNm8pwqhV7HG5SL+wxOG
	 Ef57pEAqdm0P/1RwqaMP4pzmR57GGbqzSEJUefcj7J0UJkD0KaAx3Zirm241q8ST8B
	 JXna4RyWXD8uw5y7qnBb1HbVfSCrimUxUBMy7Lm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ADDCF80535;
	Tue, 27 Dec 2022 00:34:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C08DF804D6; Tue, 27 Dec 2022 00:34:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CBA0F8042F
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 00:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBA0F8042F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mLy/XBMy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1BB7CCE0EDA;
 Mon, 26 Dec 2022 23:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83DE1C433F0;
 Mon, 26 Dec 2022 23:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672097639;
 bh=cx2UV/XZSUwl0u2PvYhFJExdluhmE61BWnOpv7ZABhE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mLy/XBMywYSr9ZHF43thfnROkic5Ai7ApzlfYn6YChs6ih7Gl2U1QfJQ1+tVO9Rkc
 zaWIhjUItUBzL17RJvrYwqn1xTBXVSWd/Y1FN2rJbfN0xUvGhHdyF0QVqoMK4ImlBj
 0/DMirhlVpG9gEBXBLz3nQ+OxW0kqcw1jaqXDUrpBPlx8Cnz25dl3Ad9WdieWBnFQ6
 CH/bLvksgG49ubvwIVzuU7c9gq2OCoiVA5fsHE58T6HeFA1KcVE5A8O4hwTLkhgc1r
 Z0u4xfS77iMEpAxduEtAsiAGRC4gV3Rto/Wu5TOOOdGY+7Gyg2yF1VhUE4ISVFQEt3
 duIWgTEvkz82g==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Message-Id: <167209763526.330820.3472409126479136319.b4-ty@kernel.org>
Date: Mon, 26 Dec 2022 23:33:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 David Lin <CTLIN0@nuvoton.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 16 Dec 2022 23:49:38 +0800, Ajye Huang wrote:
> This patch adds the driver data for two nau8318 speaker amplifiers on
> SSP1 and nau8825 on SSP0 for ADL platform.
> 
> The nau8315 and nau8318 are both Nuvoton Amp chips. They use the same
> Amp driver nau8315.c. The acpi_device_id for nau8315 is "NVTN2010",
> for nau8318 is "NVTN2012".
> The nau8825 is one of Nuvoton headset codec, and its acpi_device_id is
> "10508825".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_nau8825: add variant with nau8318 amplifier.
      commit: ba7523bb0f494fc440d3a9bb0b665cfcaa192d0c

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
