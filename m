Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C5E703178
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73DDE826;
	Mon, 15 May 2023 17:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73DDE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684164237;
	bh=MYDbs4+4clL9FvPeTESjQM1g1GiCdyfhTwd2ljb8P58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=li6Rm11EjgGDtwxOig3T6nupfyxfe3Ls21+j0TuXg8+EHXV8Nr4iH+redgesvDrra
	 DldGH93/ft3xhuhR6OxgR7z7H2SJ8GWt/yr3ATGN+NAnvTQ8bfplHpe0PyTrOa5lS2
	 Lr1R2lGh3tdAHrIEiBeveEVU5ToST6rpGKiuXy0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D462F8057B; Mon, 15 May 2023 17:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A220F80568;
	Mon, 15 May 2023 17:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C545F8053D; Mon, 15 May 2023 17:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D19CF8025A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D19CF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bLqj7AiO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25F2962634;
	Mon, 15 May 2023 15:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A791BC433A1;
	Mon, 15 May 2023 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684164121;
	bh=MYDbs4+4clL9FvPeTESjQM1g1GiCdyfhTwd2ljb8P58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bLqj7AiOKTU44of8ZZ0+mQToue9R0mhCFxnvbMjlp9FafwVkTZkUroUgb9CqXEhMj
	 y7ZGHlMBJvD+qopmAenKJANUfQxIfa8dkc1uUeJ67b6iR6Er/69qCgz6SZQJ1lQTXX
	 WvknvimRfF1N3RM4lOdVeWvw3J0dw9HTISHNtoQO+NHzMuAuzO1tJWc/yjxtWBrVlZ
	 66NM4Y7yKtUY7DWca+nltwmnZDeQ1i3OO4m4OsjsI2bnz7ne1dEt2wv485hd2YoX5x
	 pbbBvm16n1puy++ZsFNee9yjPMbA8r+negVrg+K1G/fnlrvpFZboLxClUxehaKGAeF
	 bZ38syKc+qybg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de
In-Reply-To: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
References: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: Intel: machine driver updates
Message-Id: <168416412046.413889.8136844461819465224.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:22:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: S7YPIFPLT57QOTVEOEPW3LSO52UENC2Z
X-Message-ID-Hash: S7YPIFPLT57QOTVEOEPW3LSO52UENC2Z
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7YPIFPLT57QOTVEOEPW3LSO52UENC2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 12:32:57 -0500, Pierre-Louis Bossart wrote:
> Several updates for RPL/MTL/LNL, and one fix for SoundWire TGL device.
> 
> Bard Liao (3):
>   ASoC: Intel: sof_sdw: remove SOF_SDW_TGL_HDMI for MeteorLake devices
>   ASoC: Intel: sof_sdw: add quirk for MTL RVP
>   ASoC: Intel: sof_sdw: start set codec init function with an adr index
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: Intel: Add rpl_max98373_8825 driver
      commit: 8899672f8847f1ac7767b1431266c01741047e37
[2/8] ASoC: Intel: sof_sdw: remove SOF_SDW_TGL_HDMI for MeteorLake devices
      commit: 0db94947c9d3da16aa31d152b7d26fab78b02cb9
[3/8] ASoC: Intel: sof_sdw: add quirk for MTL RVP
      commit: 289e1df00e49a229a1c924c059242e759a552f01
[4/8] ASoC: Intel: soc-acpi: add support for MTL SDCA boards
      commit: b06e33aa0ad46bb1cc68c0cec61f86a183f8dd43
[5/8] ASoC: Intel: sof_sdw: start set codec init function with an adr index
      commit: f0c8d83ab1a3532ebeb1a89acb649be01657aed8
[6/8] ASoC: Intel: sof_sdw: add new mapping for HP Spectre x360
      commit: 49d1f3ccc876eec87be41b5ee816d723b9a53ae2
[7/8] ASoC: Intel: soc-acpi: add tables for LunarLake
      commit: bf10d002b69da64001a22763ba46ccc1405de8ba
[8/8] ASoC: Intel: sof_sdw: add quirk for LNL RVP
      commit: dfe25fea968dc4884e12d471c8263f0f611b380a

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

