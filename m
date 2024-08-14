Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7901C95249F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 23:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B7CD2B9E;
	Wed, 14 Aug 2024 23:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B7CD2B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723670396;
	bh=blgdQlkf3GLwlN79fbBjwIn4l+vvJrKlr81ymos7zqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bl9f+miHSwBO/Rm/3WIK5BYjYuHIkZq/iqbDWcTS5NW32Y3A5peUBWRn+ViWkI041
	 jZFkoLAOzMkSCj0PVf59gCj2zPylPyahc4b7cVzSw8t4aN78JWcpvfmdhGj+yoKz7R
	 exBZXC4BVpZ8yCIoLMl8XFaK+O3aT0EWiOYoHsx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3501F80579; Wed, 14 Aug 2024 23:19:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AD23F80423;
	Wed, 14 Aug 2024 23:19:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4246F80423; Wed, 14 Aug 2024 23:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6995CF800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 23:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6995CF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YTyiky4H
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C958261731;
	Wed, 14 Aug 2024 21:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FBDC116B1;
	Wed, 14 Aug 2024 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723670350;
	bh=blgdQlkf3GLwlN79fbBjwIn4l+vvJrKlr81ymos7zqU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YTyiky4H/nbqfbWAmG1CiNbtepHlCLGEdYMgNzRW8NVH9xBn/yF/AI739qEOb6ndv
	 nxLfoojK+rjEbAa5+73nbTjVjlC3fLIVo54AwzzKAnZgODiUDXx58zd1gzilje/0El
	 939t5ndbKYLKQpVUJoL174TwqENBKJxyO8aMfJpae7E2gI494Qph2A7OtNSMCF1G72
	 juGK26zW1x4IEzinOSKGDQux0iup8Q0ifb7QXafdxDkgvOoxBFnKdn22THLc8ALBRV
	 K5o42TZRLgHsoggb0eHwtgyMuqvnE8kaBvwX824PfrFFwK+zax6nx0Y3tBH92QFexz
	 aWpTPYA3winBg==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: shengjiu.wang@gmail.com, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240808184944.267686-1-festevam@gmail.com>
References: <20240808184944.267686-1-festevam@gmail.com>
Subject: Re: [PATCH 1/7] ASoC: fsl_audmix: Switch to
 RUNTIME/SYSTEM_SLEEP_PM_OPS()
Message-Id: <172367034936.341883.8820042016447898467.b4-ty@kernel.org>
Date: Wed, 14 Aug 2024 22:19:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: C75E4EYW4RCOI6V2JPHF5QRQLKKZDEJW
X-Message-ID-Hash: C75E4EYW4RCOI6V2JPHF5QRQLKKZDEJW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C75E4EYW4RCOI6V2JPHF5QRQLKKZDEJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Aug 2024 15:49:38 -0300, Fabio Estevam wrote:
> Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
> RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: fsl_audmix: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      commit: 73abd9698960c5d097559432cac13bb1f0aaf3df
[2/7] ASoC: fsl_mqs: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      commit: b7e4dd8da05a9de18471868a914d609522d04fdd
[3/7] ASoC: fsl_rpmsg: Switch to RUNTIME_PM_OPS()
      commit: bbc0798c402acb6799a8332fb0a49c05f4a5a414
[4/7] ASoC: fsl_spdif: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      commit: 01661bb9560def44eff0c79ebf14ec7ce0fdffab
[5/7] ASoC: fsl_ssi: Switch to SYSTEM_SLEEP_PM_OPS
      commit: 8ffb2fe2e92c98e5c69e9af9656baed7d298059a
[6/7] ASoC: imx-audmux: Switch to SYSTEM_SLEEP_PM_OPS
      commit: c504885a351b57c26c077992dde6904b8bbbdcd4
[7/7] ASoC: imx-pcm-rpmsg: Switch to RUNTIME/SYSTEM_SLEEP_PM_OPS()
      commit: bcbbf713061c41f696f47baa4bdcb789a59d4f21

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

