Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF03B1C5FC
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Aug 2025 14:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB7DD60272;
	Wed,  6 Aug 2025 14:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB7DD60272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754483861;
	bh=ugoVhQHbxpxicy+yvfLzFYQthVuUyMFjby3B3/SZtCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mmJ3XdAuQXAywzvlR9u7MOhER6FjzwVgwXc3hfyqjr5hOE03gucFnW1TqVSQ70Qab
	 +KCROd18ViuO8fZgWYsLvafJ7oapYFaZbFkTj2ZUa2bTrPxeS0X4OTGLFfXmTsezZO
	 h1iyU78iskaCLDo40KiLw3Ymgid0LjEZzsOW5s+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34768F805E5; Wed,  6 Aug 2025 14:37:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D749DF805C5;
	Wed,  6 Aug 2025 14:37:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C490FF80423; Wed,  6 Aug 2025 14:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76D92F800F8
	for <alsa-devel@alsa-project.org>; Wed,  6 Aug 2025 14:31:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76D92F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZJ8p1qyK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD9A860200;
	Wed,  6 Aug 2025 12:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C06C4CEF7;
	Wed,  6 Aug 2025 12:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754483468;
	bh=ugoVhQHbxpxicy+yvfLzFYQthVuUyMFjby3B3/SZtCM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZJ8p1qyK58NCihD2YTnyscO7HufPzXRUOT33W6vZXygT38Id4Qoc84kmP6ncgMnWy
	 Y4DF8ePC08LtCUHFRsDG9pTULNsGO9UD+LhOUjzw/vUsm3NNUFxQi0z6fKtlx5OblP
	 +Z+HQJYogVYXFrfrcMOBrJ2Ig9HQgsbZ0zwRGbawpg2GQ1qHynm7Hz44nZtH1tHZoU
	 VaSjsQyllJq9AzqT/lCnIBsHsCBWEyODIt73UCymcgLJtOpajPYPIbmKBjPXFRCJ9A
	 pHb5YvFRcBuyoB2kaCqbYS/QlW9sse3yE+swEEO5OTk/aMjetI0OBOp//eH+6m3hw5
	 yU7P52XDQ/5bw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com
In-Reply-To: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
References: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 0/4] Add audio support for acp7.2 platform
Message-Id: <175448346634.51650.6553312678264736417.b4-ty@kernel.org>
Date: Wed, 06 Aug 2025 13:31:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
Message-ID-Hash: HQQ2OZ554CMCVOZ7KCKB6DX2YO3UWEFJ
X-Message-ID-Hash: HQQ2OZ554CMCVOZ7KCKB6DX2YO3UWEFJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQQ2OZ554CMCVOZ7KCKB6DX2YO3UWEFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Aug 2025 11:51:34 +0530, Venkata Prasad Potturu wrote:
> This patch series is to add legacy and sof audio support
> for acp7.2 platform.
> 
> Venkata Prasad Potturu (4):
>   ASoC: SOF: amd: Add sof audio support for acp7.2 platform
>   ASoC: amd: ps: Add SoundWire pci and dma driver support for acp7.2
>     platform
>   ASoC: amd: acp: Add SoundWire legacy machine driver support for acp7.2
>     platform
>   ASoC: amd: acp: Add SoundWire SOF machine driver support for acp7.2
>     platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: amd: Add sof audio support for acp7.2 platform
      commit: 918b744af3d4d11a087814ebb6c390016e5242f2
[2/4] ASoC: amd: ps: Add SoundWire pci and dma driver support for acp7.2 platform
      commit: 60e5b2441d7c035e732e4a1166779c6cc316c46b
[3/4] ASoC: amd: acp: Add SoundWire legacy machine driver support for acp7.2 platform
      commit: 0df24f34794d2eea4bdc819fba0ba28f226286e6
[4/4] ASoC: amd: acp: Add SoundWire SOF machine driver support for acp7.2 platform
      commit: 1c4c768d068616fa8948826ab714a4ac1f3b9aa9

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

