Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9965C88C6E2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:28:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F4827A6;
	Tue, 26 Mar 2024 16:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F4827A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466916;
	bh=jnDKCBGZ3mEKwOzhDtE+4+tTWxXMCbPw9/Yta9NdMSU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Jz4/V68iN21eMN6Rv08JoqMq6P5oRhoDexKqt8uPq8EhTf8dYN5ufSGffO1Gh8d98
	 x+3Sc8QV3BAhYpqjq5+U4KU0hjytnyRX+cNotbBGDVJggNNTCNzacz3qeRJ469J9zx
	 1O/fJAqf5YKM3cdMOb9ByTtQRwdsZrPVPcSFRb4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9683EF805C4; Tue, 26 Mar 2024 16:27:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEE0F805B4;
	Tue, 26 Mar 2024 16:27:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF80F8025F; Tue, 26 Mar 2024 16:27:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 961E0F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 961E0F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cneiOIVU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4ED4612BF;
	Tue, 26 Mar 2024 15:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A6BC43390;
	Tue, 26 Mar 2024 15:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466861;
	bh=jnDKCBGZ3mEKwOzhDtE+4+tTWxXMCbPw9/Yta9NdMSU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cneiOIVUSw3BIhivAzv7EQjXpMfXoxj46GIJw2UWv9LBhSZcI+8Yi55Oq07LD7G51
	 NqsrY++g921HTWD9o0mTh/l5wcYPQuNFK8W7f4UPFUz1cdWAD0J3LTxQ4aQV6bz2U9
	 blo7r8Er+d4IQtdlVHo+81d6QdYQ+smDe0FPSeMCYJNVw1TawIaKYZ2+k1qk+eud84
	 +La8Lh/eKF7BHyTnRK6feuaUcj0Mg9IWNzTNR8A6HUfn+KhhcCY3vqz3RYVXEUwFsy
	 VpzqEaUxk+KXWSHbvM/ZV5wO2OGTSvn+7+lO2jz8ptIQXJaan1vdB2oYGk7SAR2KZk
	 lGNXQMXuvvO7Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-imx@nxp.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
References: <20240311111349.723256-1-chancel.liu@nxp.com>
Subject: Re: [PATCH v3 0/5] ASoC: fsl: Support register and unregister
 rpmsg sound card through remoteproc
Message-Id: <171146685832.132239.2142300799841463466.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: HVVK2XUCTBYIV663KW37FFBOPK7WYTOI
X-Message-ID-Hash: HVVK2XUCTBYIV663KW37FFBOPK7WYTOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVVK2XUCTBYIV663KW37FFBOPK7WYTOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Mar 2024 20:13:44 +0900, Chancel Liu wrote:
> 	echo /lib/firmware/fw.elf > /sys/class/remoteproc/remoteproc0/firmware
> (A)	echo start > /sys/class/remoteproc/remoteproc0/state
> (B)	echo stop > /sys/class/remoteproc/remoteproc0/state
> 
> The rpmsg sound card is registered in (A) and unregistered in (B).
> After "start", imx-audio-rpmsg registers devices for ASoC platform driver
> and machine driver. Then sound card is registered. After "stop",
> imx-audio-rpmsg unregisters devices for ASoC platform driver and machine
> driver. Then sound card is unregistered.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: fsl: imx-pcm-rpmsg: Register component with rpmsg channel name
      commit: 41f96cd53f2838ac4894491ac5eadb06f1e5b858
[2/5] ASoC: fsl: imx-audio-rpmsg: Register device with rpmsg channel name
      commit: dacc7459745df168152b5cceba34efade9b5e063
[3/5] ASoC: fsl: Let imx-audio-rpmsg register platform device for card
      commit: c73524768e9e1a7ac9eb3a4d36a1ac0d34f22644
[4/5] ASoC: fsl: fsl_rpmsg: Register CPU DAI with name of rpmsg channel
      commit: 0aa7f5406afa828a93d84d75c9b9ac991cd75367
[5/5] ASoC: fsl: imx-rpmsg: Update to correct DT node
      commit: c14445bdcb98feddf9afaeb05e6193cc1f8eec1a

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

