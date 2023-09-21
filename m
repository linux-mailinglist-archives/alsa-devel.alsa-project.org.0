Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545D47A95C1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 18:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98F91AE9;
	Thu, 21 Sep 2023 18:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98F91AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695313995;
	bh=qWPFMLFVEGIMCxbPPxnVC3lrckrj+Dp8mEfTPqVrRdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XujT7qoFqz2hQDlMdInKIzYW834cSJQFBbMUuKb7qd2ul3fY9R6JuJJ0R4NHVz3J6
	 wz5QW0VyKlGreJjq78bCNUFAO7ic+E+TwsJXcX7jnhmWtw3aftQy4gk6mSbKBVGrQD
	 OxsmXI4yS9QdCb6RBHLsAsIG6i8o1cd+ASQ16jD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 433C6F805E2; Thu, 21 Sep 2023 18:30:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACA9BF805E2;
	Thu, 21 Sep 2023 18:30:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 843FBF805B4; Thu, 21 Sep 2023 18:30:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8CEEF801F5
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 18:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8CEEF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KhQKn3V9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E44461ADA;
	Thu, 21 Sep 2023 16:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F77C611A3;
	Thu, 21 Sep 2023 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695313822;
	bh=qWPFMLFVEGIMCxbPPxnVC3lrckrj+Dp8mEfTPqVrRdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KhQKn3V9g5BW/9Qhj8g3nQutYyZtf0oDqr2EChiXQHNOgmBqLGSDzRlv9BkbSE2pd
	 xu4NamnCoNh5ilhn4Fci3On1MbP4Rztvf0Imr3ay2F0dnzFfikPVdEUtkNVQWXz2a/
	 qMaFQxSbd+wVLomHSN0u/dWQp3Dy6Fjl3cU5lOR8iG4yo6AeMNaZ1qIujnLpos32ba
	 3uqdVzEW1nZqEaoJBGFimrm0M9Z/MajLGpHpt73CMLRL6sbnnOmXOavkdpcLxCnYk4
	 On7oul8niR17ROzZA3z1FOszGHhWjhmMsjCt507SSAZALEoDyHFDEjaoCusjoweE3s
	 ErbHu6jBacTkQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, guennadi.liakhovetski@linux.intel.com
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: ipc4/Intel: Support for firmware
 exception handling
Message-Id: <169531382089.61074.2227011623338990885.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 17:30:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 3BYV436D23DWENPMNBYTGHVVFSPCUAV4
X-Message-ID-Hash: 3BYV436D23DWENPMNBYTGHVVFSPCUAV4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BYV436D23DWENPMNBYTGHVVFSPCUAV4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 19 Sep 2023 12:24:07 +0300, Peter Ujfalusi wrote:
> When a firmware crashes it creats a panic information into a telemetry slot.
> The panic format is defined by Zephyr, includes stack and additional information
> to help to identify the reason for the crash.
> Part of the firmware exception handling the firmware also sends an
> EXCEPTION_CAUGHT notification.
> 
> This series implements the kernel side handling of the exception:
> print information into the kernel log
> export the whole telemetry slot to user space for tools extract additional
> information from the panic dump.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: Xtensa: dump ar registers to restore call stack
      commit: 58bb5081cba130f12c26d8e4d5e9416a0272f07e
[2/9] ASoC: SOF: ipc4-mtrace: move debug slot related definitions to header.h
      commit: 4287205065f244f4d40ae6aa7875b3ebffedcf8d
[3/9] ASoC: SOF: ipc4: add a helper function to search debug slot
      commit: a397899f81d52202265d4977a99085f53e426826
[4/9] ASoC: SOF: ipc4: add definition of telemetry slot for exception handling
      commit: ab05061d25806515358d184eb4d305f7f12befdc
[5/9] ASoC: SOF: ipc4: add exception node in sof debugfs directory
      commit: 80b567f8995757d36008f835853cea8d2f7c34c0
[6/9] ASoC: SOF: Intel: add telemetry retrieval support on Intel platforms
      commit: c8b54a2f7af41740b5faad2f6846d927b14369ca
[7/9] ASoC: SOF: Intel: mtl: dump dsp stack
      commit: e449b18ff03c2f90430d00486fd713854b28c077
[8/9] ASoC: SOF: Intel: hda: add ipc4 FW panic support on CAVS 2.5+ platforms
      commit: eb6e5dab11401c64f5d5576c71e5fc0a4c7b321a
[9/9] ASoC: SOF: ipc4: handle EXCEPTION_CAUGHT notification from firmware
      commit: c1c48fd6bbe788458e3685fea74bdb3cb148ff93

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

