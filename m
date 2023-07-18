Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD51757AE5
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 13:48:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB390868;
	Tue, 18 Jul 2023 13:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB390868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689680920;
	bh=ZvqThxrRF3azwHa8S6/JSLLxksS+HHQlbfFAk7L6Oe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ctJKM3QUoE67a3CBNKiOKdWrtaMJ+bxQ58Jse7oeZak88OVtQEbqlH5eGLhHTZGE5
	 MoYt+KpjppqL3nW/69qpmsQyTg9kTatNPxXgHDxSY19jtUYLio+VNeV7o0qkN6eqFy
	 Wv5+sis65JubmH3OJvA+TAWg1R8yW8XDSyYUb3TA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24270F80494; Tue, 18 Jul 2023 13:47:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4DAF8027B;
	Tue, 18 Jul 2023 13:47:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19773F8032D; Tue, 18 Jul 2023 13:47:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B522F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 13:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B522F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NiyIriaV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A6AB7614FB;
	Tue, 18 Jul 2023 11:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1932C433C8;
	Tue, 18 Jul 2023 11:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689680860;
	bh=ZvqThxrRF3azwHa8S6/JSLLxksS+HHQlbfFAk7L6Oe4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NiyIriaVDpbfpBBavIbmRiv2u8PnwyYoC11x/yVLsL8p8CCjVEDh2j4KeymwMZmkJ
	 p8wsaLShwILFEDbEuSei/n/AQ+DZfB8bhV67lMZseBDXL5HwxxG4eh4TprvyACTwb6
	 MBuHauz7LZm0c0omsmB7nO3KtGyB/RH7SetrcWypVSEdZC1uBeHTOD7vKhkwXS+gc9
	 4mnK2i9Mi6W5ybAsdow/KBDfBwm76sdzKItlfTStf52ceFbxabgRi8O83C4BLEzCjY
	 +Sr+BP4iatGJjSAKSsQhJAteHieNHZT6chdS3DmTyauRHyBvrdgGVQj50ERgnJv+DO
	 fL8t9lbrIuotQ==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matus Gajdos <matuszpd@gmail.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230712124934.32232-1-matuszpd@gmail.com>
References: <20230712124934.32232-1-matuszpd@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
Message-Id: <168968085762.37584.16109191743669606574.b4-ty@kernel.org>
Date: Tue, 18 Jul 2023 12:47:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: LD6T3JVA5MSTXLLYK35OHYR446VC6Q7Y
X-Message-ID-Hash: LD6T3JVA5MSTXLLYK35OHYR446VC6Q7Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LD6T3JVA5MSTXLLYK35OHYR446VC6Q7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 14:49:33 +0200, Matus Gajdos wrote:
> Otherwise bit clock remains running writing invalid data to the DAC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Disable bit clock with transmitter
      commit: 269f399dc19f0e5c51711c3ba3bd06e0ef6ef403

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

