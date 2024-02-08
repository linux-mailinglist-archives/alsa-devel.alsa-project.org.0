Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9684E9FA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 21:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B450B850;
	Thu,  8 Feb 2024 21:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B450B850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707425841;
	bh=T8EwgSBfhLdOsFciFuw6X5d9/0+41gQ0AA16Ecb/rcU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gSIgjfWbIIgZDy36AS8IHnL8ampgueF+naOXVhyi3NjfbeFE3DyLRYdM+VXU7uCV2
	 ZGxh1IE6DDj/fBywBc48GCGYz5P0zhnGKprNO3UIMrrGkNVraL8XSUvu821n/oEkYM
	 SGw05p6HXgYJcMfHYiJTXcimHNh5tk0xUC1D23RA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C86DF804E7; Thu,  8 Feb 2024 21:56:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA89BF801D5;
	Thu,  8 Feb 2024 21:56:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A67FBF801EB; Thu,  8 Feb 2024 21:56:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50B18F800E3
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 21:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50B18F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e+3Bx4Xa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C639461F48;
	Thu,  8 Feb 2024 20:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B0D7C433C7;
	Thu,  8 Feb 2024 20:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707425786;
	bh=T8EwgSBfhLdOsFciFuw6X5d9/0+41gQ0AA16Ecb/rcU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e+3Bx4Xa4325tK8mGNO/Jhz450pjYzUveah8U9GEFNEVNETIXzBDCIL0hMqyJRNMp
	 hkMIKP8aTyBdPP6zXFrfShdRBFeVDyoNM/E4fdxxSVpKon/5Gs1K0NWcyqqOMwsjOf
	 l+imnJ7ff+linFqmKB9Hy1V1B1y/kJ2hfwBvv1X9N+Caq/VIxA1e5uRHfCHs+pDDsN
	 Bd+BT4sgZbHkbxypldvwp2Kd4SXmciQ3dT67PqSC31WwgOQhWaFNB0J1A8CPwVSQLg
	 LTZ4RNobnmr70yKt/r30QM4wBiIpWDQ1z7KQ88kBKzPFEs1pHUtHN0J+j87J0EDBDM
	 g4eha5M4qEqWg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240208123742.1278104-1-rf@opensource.cirrus.com>
References: <20240208123742.1278104-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2] ASoC: cs35l56: Fix deadlock in ASP1 mixer register
 initialization
Message-Id: <170742578487.2206785.11509531249240507855.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 20:56:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: SVFB7GZ7VQT7I3XQTSF2PA5LDE4DJM7O
X-Message-ID-Hash: SVFB7GZ7VQT7I3XQTSF2PA5LDE4DJM7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVFB7GZ7VQT7I3XQTSF2PA5LDE4DJM7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Feb 2024 12:37:42 +0000, Richard Fitzgerald wrote:
> Rewrite the handling of ASP1 TX mixer mux initialization to prevent a
> deadlock during component_remove().
> 
> The firmware can overwrite the ASP1 TX mixer registers with
> system-specific settings. This is mainly for hardware that uses the
> ASP as a chip-to-chip link controlled by the firmware. Because of this
> the driver cannot know the starting state of the ASP1 mixer muxes until
> the firmware has been downloaded and rebooted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Fix deadlock in ASP1 mixer register initialization
      commit: c14f09f010cc569ae7e2f6ef02374f6bfef9917e

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

