Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42E8B8B6E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 15:44:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00F5E80;
	Wed,  1 May 2024 15:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00F5E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714571054;
	bh=z2VFJH9/TTaHh5ejO6dlfSh3KL6ufSg57ZzswSlInCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=os7YEaDWuZEDEE2IYo1KnLYA5ROjQ6dZhGyeur3Z/gZywFFy4w/pLwWrKuHUgFNpX
	 GPO7uGI4riirkVMgwGFe1rzXGynxJJZdR70GEBu8DXo+E7oTWJ1x4i0e7DDvgPdPuv
	 W1vdZO/TriBs6sW4DyV7iVPQE/3p3rUAN5SJNtxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6758F8057F; Wed,  1 May 2024 15:43:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D46D7F805AC;
	Wed,  1 May 2024 15:43:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F4BF80579; Wed,  1 May 2024 15:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E721F80266
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 15:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E721F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MdCJnQdv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F5DF6179D;
	Wed,  1 May 2024 13:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D20C4AF18;
	Wed,  1 May 2024 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571004;
	bh=z2VFJH9/TTaHh5ejO6dlfSh3KL6ufSg57ZzswSlInCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MdCJnQdv/gUcZN1c5Yyf/QFREAwgMxKWcx/RZBt/53Gv87EGHiRpZwKLIYVTDEyQK
	 PVae/futdrj/8WA1LpqUiViYnBPJj1ibq6tllvIGAPd1d3j+rblbxnBbazeKemOdAn
	 ZoKDy/GWqVGqW16FAa9XEuKpqfcRATcwxYu0Wmh/XEaXH/QQ0REKIW+3pDoXN0QhbC
	 OmUIQ08CpkeQDpabv4IWnRMKbq18tEWLQDzcoxg6ZcDgNP0YkAo6Uu59pY1dA9R5di
	 ZlF6KwU/yJuB3TWgkesra5mCtWRKYSnVnCRLZd4vhV4AQpUOWZvCF8W6cDOboWp0A/
	 GrZF6bFJA57tQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de
In-Reply-To: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
References: <20240426153902.39560-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/5] ASoc: SOF: misc updates for 6.10
Message-Id: <171457100276.1888704.18305360939038421630.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: QHJGNLINGRGYX72UH7SK2FEWJLKDHFA3
X-Message-ID-Hash: QHJGNLINGRGYX72UH7SK2FEWJLKDHFA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHJGNLINGRGYX72UH7SK2FEWJLKDHFA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 26 Apr 2024 10:38:57 -0500, Pierre-Louis Bossart wrote:
> Fixes when fw_lib_prefix is not set, updated error messages, improved
> dmesg logs to SoundWire configurations not supported by ACPI
> tables/topology and support for IEC61937 passthrough.
> 
> Peter Ujfalusi (2):
>   ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
>   ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using
>     ChainDMA)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: SOF: debug: Handle cases when fw_lib_prefix is not set, NULL
      commit: b32487ca7b51ce430f15ec785269f11c25a6a560
[2/5] ASoC: SOF: topology: remove incorrect widget id in error message
      commit: 490e6c9b81e0c22087d250246717aee26ac5002e
[3/5] ASoC: SOF: Intel: hda: simplify and reduce indentation for hda_sdw_machine_select()
      commit: 5d4788b2647fabeaeeaf331e53451e0ed6241252
[4/5] ASoC: SOF: Intel: hda: list SoundWire peripherals on mismatch
      commit: 7ff01ca730f240811c13d9c3f8f8030211b3c911
[5/5] ASoC: SOF: ipc4-topology: Advertise passthrough capable PCMs (using ChainDMA)
      commit: eed4872a4220f30de37aeca695d2881630410b66

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

