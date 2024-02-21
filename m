Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F95D85D881
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 13:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D332832;
	Wed, 21 Feb 2024 13:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D332832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708520327;
	bh=0l94LClWCS65r5oy7U7YKWgl/b0d8KFwWoVT4NfHAWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PE4JyE9ho3AHMHi2rl89S7eqp6Ap6/6THsTfhnPJhBxAm+iKHsyNrE+2zkK/+6YTI
	 EdTU6UPFghCKHqorXSs57aUsFSUrZf65jCvJNtx5mLvRpDcKMizjKViLy609QBK3gr
	 CagTNT89veK1VTL9VJtZ4KLYaHjHX8xZO6pG3Af4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951C7F805AF; Wed, 21 Feb 2024 13:58:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB062F80496;
	Wed, 21 Feb 2024 13:58:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09DF3F80496; Wed, 21 Feb 2024 13:58:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C905EF800ED
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 13:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C905EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ap5NNRvj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51BDC614E1;
	Wed, 21 Feb 2024 12:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E99DC433F1;
	Wed, 21 Feb 2024 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708520279;
	bh=0l94LClWCS65r5oy7U7YKWgl/b0d8KFwWoVT4NfHAWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ap5NNRvjrM0zMKqMHhSPK0SHQA4HfvJ7FXDP8s+NDfl/QYpy4BvErlw+FmLAd/E0N
	 FFcj/wLGzd9k448GiqxLGbPjtoEJyLzvjHWHtBGMPMYDhUDIHDFS0Iny9SgXazgHh0
	 zAKgqMEHPTLtaivN2ANlgBgsJtaDJs3QcRRQHX9drrZ/Z5zJw5YNwZxA3UZ4ZTeomx
	 YS8eD61ZItQqiBeufG8PIjurKUbAEiXUJjpt2a8rRO2p0xX3Y7EiJYst3q19DfP85n
	 toqg1STBMPvxFqbPughiTMyQqIN3xuQQJ440pGAZG7yvtbMYQ9cYuewtB/2C7wfdPs
	 oQCieRqc0/Pvw==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/10] ASoC: Intel: avs: Fixes and new platforms
 support
Message-Id: <170852027811.29200.13690058951183581212.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 12:57:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: TQL7FFD6NYT2WJHODLMJ5YA44BCBH6TN
X-Message-ID-Hash: TQL7FFD6NYT2WJHODLMJ5YA44BCBH6TN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQL7FFD6NYT2WJHODLMJ5YA44BCBH6TN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 20 Feb 2024 12:50:25 +0100, Cezary Rojewski wrote:
> The avs-driver continues to be utilized on more recent Intel machines.
> As TGL-based (cAVS 2.5) e.g.: RPL, inherit most of the functionality
> from previous platforms:
> 
> SKL <- APL <- CNL <- ICL <- TGL
> 
> rather than putting everything into a single file, the platform-specific
> bits are split into cnl/icl/tgl.c files instead. Makes the division clear
> and code easier to maintain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: Intel: avs: L1SEN reference counted
        commit: 1b72943ab1159ad27c11a302644fabb8bc2881bb
[02/10] ASoC: Intel: avs: Fix sound clipping in single capture scenario
        commit: e1a0cbae52d0bf3cb350eba5c95c46c14a5bcda4
[03/10] ASoC: Intel: avs: Prefix SKL/APL-specific members
        commit: a8f858d98f016a0209edaf1518fd45a5e5c62d47
[04/10] ASoC: Intel: avs: Abstract IPC handling
        commit: 7576e2f4d99df6efabb77f52b9539fd345233aee
[05/10] ASoC: Intel: avs: Abstract IRQ handling
        commit: 97bd565ff5a2fc89d302f9919fde37fadf51b645
[06/10] ASoC: Intel: avs: CNL-based platforms support
        commit: 8a6502ade116bc4b8293f094f8d74059c67c3f27
[07/10] ASoC: Intel: avs: ICL-based platforms support
        commit: 275b583d047a23c48d01b0c45fb5d95618c1da2d
[08/10] ASoC: Intel: avs: TGL-based platforms support
        commit: 5acb19ecd1982bd1578912473b33df75a23fefc2
[09/10] ASoC: Intel: avs: ICCMAX recommendations for ICL+ platforms
        commit: 36478a74c7ddaf58d80da5cef9c5ddb5beed5a2e
[10/10] ASoC: Intel: avs: Populate board selection with new I2S entries
        commit: 5b417fe0cded0b5917683398e6519aae8045cd40

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

