Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBDC7FF1A3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 15:20:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88DA0DEC;
	Thu, 30 Nov 2023 15:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88DA0DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701354040;
	bh=LZrrb0dSxcKPDCoczLls1B8hAHeLjnKbhR6+KrSQFGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZYK2FbJyNhqtQGuNXmLgj6DG8WpSYCGxXNSOKb60VbCEUxiK3SoUEvK5akN+vwAci
	 PaU6fBCG3t2z0BuYlho4NR4S0Wj1QWDDu/oMvraRLjS6nlMl3oJltc/EfHlAHWezo7
	 PaZvuTF2/z4BmvDvYMhS84YZFqaLb8vvtvTzEAC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D951AF8057E; Thu, 30 Nov 2023 15:20:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E5E4F80578;
	Thu, 30 Nov 2023 15:20:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85111F8016E; Thu, 30 Nov 2023 15:20:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86F95F8007E
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 15:19:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F95F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nwK9XLtP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 347C561EB8;
	Thu, 30 Nov 2023 14:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7130AC433C7;
	Thu, 30 Nov 2023 14:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353989;
	bh=LZrrb0dSxcKPDCoczLls1B8hAHeLjnKbhR6+KrSQFGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nwK9XLtPOrsXulwkIaIy8cdaHVrX14gqAOWVMC1Y3UK6i8TTKR+MuF11pPEzQlhhv
	 GJ41S3c52aYfq2EK++b0FCr6I0OjNLddOKfP7ufwh5CBzJnyTgfsVi37dIJRLCQawi
	 cxi/dkov1/Uu6CNkvbxtdnlxwHNIzcP5vCt6Pc4ga1gVl4sz8LY7Nq7tkakk94evqR
	 ncrSu/eulLg6zedL6lRI5/b3W1kRJ/r56x322vqBuo5/c7HGDK/ldIWHPXaOxFoGqw
	 lpT/klSjAnXB29t7CD2LZPy9+L4ehdcQmjY2Jr797YsbdYhiEIN16YfkYijg3T5vXy
	 VHcnpfjQ7Ymmg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 00/13] ASoC: SOF: IPC path handling and fallback
 support
Message-Id: <170135398817.77760.17003442252565744150.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 14:19:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 5VMJ6XNOPYZOIZRRNNG6NHUMVVMFQURB
X-Message-ID-Hash: 5VMJ6XNOPYZOIZRRNNG6NHUMVVMFQURB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VMJ6XNOPYZOIZRRNNG6NHUMVVMFQURB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Nov 2023 14:53:14 +0200, Peter Ujfalusi wrote:
> The main aim of the series is to provide a mechanism to fallback to 'older' IPC
> versions in case the desired one is missing either a firmware or topology file.
> It is going to make the life of users and distributions if we are going to
> start transition existing IPC3 platforms to IPC4 (CAVS2.5) and we might have
> missed some topology file to convert for example.
> In that case the kernel will fallback to IPC3 without audio regression.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from sof-audio.c
        commit: 014fdeb0d747304111cfecf93df4407c1a0c80db
[02/13] ASoC: SOF: Move sof_machine_* functions from sof-audio.c to core.c
        commit: 3bc3477915587440035f192c89a1bf9a4360abb3
[03/13] ASoC: SOF: Add placeholder for platform IPC type and path overrides
        commit: 1162d267eabd6392d0d07bc88b75056e88042fc0
[04/13] ASoC: SOF: sof-acpi-dev: Save the default IPC type and path overrides
        commit: a07625dcaf994ab3c5a6a456624719df05ed8ad6
[05/13] ASoC: SOF: sof-of-dev: Save the default IPC type and path overrides
        commit: 396016d56da4ad30fe9ff736e44d9e1457484805
[06/13] ASoC: SOF: sof-pci-dev: Save the default IPC type and path overrides
        commit: 59ddeae037b81303063bcf62b70fb33841b3f89e
[07/13] ASoC: SOF: core: Implement firmware, topology path setup in core
        commit: b1a4ee9fd5a2dfb0f23abe58377f816915ec14ba
[08/13] ASoC: SOF: sof-acpi-dev: Rely on core to create the file paths
        commit: b2b0bba36f0a81743e7143a8801ca75d2238bdac
[09/13] ASoC: SOF: sof-of-dev: Rely on core to create the file paths
        commit: 8616168928f278723fdc3f4d7cd3d611dcdae8f8
[10/13] ASoC: SOF: sof-pci-dev: Rely on core to create the file paths
        commit: 8a83f180abb5b95f524fc9b5eb2291f0e39bed30
[11/13] ASoC: SOF: core: Add helper for initialization of paths, ops
        commit: a5a65437b02df8b842c4620b0b776bcd91ce200a
[12/13] ASoC: SOF: Intel: Do not use resource managed allocation for ipc4_data
        commit: 9b6896538ea71b7c24da1ecb38738a311176f6a8
[13/13] ASoC: SOF: core: Implement IPC version fallback if firmware files are missing
        commit: 6c393ebbd74ad341bcfb4e2d0091b2655fad45d0

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

