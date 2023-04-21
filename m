Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7746EAEB5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8092414E;
	Fri, 21 Apr 2023 18:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8092414E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682093350;
	bh=Y32G+yW3Q2s8B8anhbO6bamFnw5szz0LPZ38/Bxbi+0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ND1g0GV/UBqv33hZ/GnXHegxcQ8t/9VBLjiTEMM9bRTuMqQNZRAuEG6hUTkuPe4v6
	 bpejb/e85NyJRCr6fUh1HUXePoo8JHUQhhJzO3VATPhRkFWwO2oxfCVnh31IAicrdB
	 7GhfzZi4/7glDlg038enaCtvKKOI65kwwxBoayhM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A3DCF80053;
	Fri, 21 Apr 2023 18:06:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B704CF80553; Fri, 21 Apr 2023 18:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26C72F80149
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26C72F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Wf2if36V
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D015F6518E;
	Fri, 21 Apr 2023 16:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95ECFC433D2;
	Fri, 21 Apr 2023 16:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682093191;
	bh=Y32G+yW3Q2s8B8anhbO6bamFnw5szz0LPZ38/Bxbi+0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wf2if36V8+wbDAqwgqS9oCfAzgkEk76fIg2Kql0tIuHS8zGFP5y2XVdUp7pAfnH3P
	 X4dLrrQQD1RNVtH2gziPw9HZawpJuZJt4la2PqTLb93GnSl/1KOmKzRjycsXBggq/t
	 AQ1jI4LBf2nNJNi+NZ5Z9q9O5dkni7pGs2B8qnMRCazfdmeWHOWv2MDLpAiQZYWlAY
	 npFnAn3pnQL/Ddx3xgwZqFgCd2eQjPkS7NwH767p144KFxf9PQrA2rsloA7SoFH0N9
	 BUdU+qnO23jIvnMcLrYPoRBF8/0ltpdqJYCOTqmfdtcp10gScV5Q1eI7tO6DNLq08+
	 iu3mz4lS0XXTg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Intel: boards: updates for 6.4
Message-Id: <168209319034.108546.6410960708016945151.b4-ty@kernel.org>
Date: Fri, 21 Apr 2023 17:06:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: FUQXNHI2IHMAA6Q2W4LJJCFX2CFX66Q3
X-Message-ID-Hash: FUQXNHI2IHMAA6Q2W4LJJCFX2CFX66Q3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FUQXNHI2IHMAA6Q2W4LJJCFX2CFX66Q3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Apr 2023 14:55:17 -0500, Pierre-Louis Bossart wrote:
> Preparation of ALC712 support with different types of SoundWire
> devices per link, new RaptorLake SoundWire device, better error
> handling for Cirrus devices and cosmetic changes for Max98373.
> 
> Bard Liao (3):
>   ASoC: Intel: sof_sdw: set codec_num = 1 if the device is not
>     aggregated
>   ASoC: Intel: sof_sdw: support different devices on the same sdw link
>   ASoC: Intel: sof_sdw: append codec type to dai link name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Intel: sof_cirrus_common: Guard against missing buses
      commit: 058924644f9596b8c55fc81f01f741d628eed940
[2/7] ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at link 2 in RPL match table
      commit: f5460a155ecb961463f6ff766c7d3092f07e6642
[3/7] ASoC: Intel: sof_sdw: remove late_probe flag in struct sof_sdw_codec_info
      commit: 06b830bd73ec66b9316b899ae37b1d5b83d16a32
[4/7] ASoC: Intel: sof_sdw_max98373: change sof_sdw_mx8373_late_probe to static call
      commit: e9fcbaff5fb871f1a10f09d7d1a4cd13c923e280
[5/7] ASoC: Intel: sof_sdw: set codec_num = 1 if the device is not aggregated
      commit: 16373f30777f45823fa68e850b230fa2ef9d7e92
[6/7] ASoC: Intel: sof_sdw: support different devices on the same sdw link
      commit: c8db7b50128b8cc61a5ca6e4717cf8158fca302a
[7/7] ASoC: Intel: sof_sdw: append codec type to dai link name
      commit: dc5a3e60a4b5974a0cb5bf2c5df70a490dce9df2

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

