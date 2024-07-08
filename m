Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD68192A9A2
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 21:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5F5B84A;
	Mon,  8 Jul 2024 21:15:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5F5B84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720466125;
	bh=MMzPt1qLEIBFPhRV9nvK5Pdc6T5Fmql+DzmSgYeT42g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ozi59RqehooLang7yZDwVOsI4Pmv6MOWNPLewC+crf3qddtwsgmlc/s4Erv2zZvra
	 /obCRhJqReHwtRSWuh44OC98uFA3eHP1crFdKh1vyoUyipeFDJt+YFld5sp6Enn8sE
	 8GVv+PT1yt6D9xdvPQG3tD2+WXJmvTP2P9aYdggk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0FF8F805B5; Mon,  8 Jul 2024 21:14:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBC8F805A8;
	Mon,  8 Jul 2024 21:14:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01B02F801F5; Mon,  8 Jul 2024 21:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 701ADF800FA
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 21:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 701ADF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CMQ2xoJs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D51636108A;
	Mon,  8 Jul 2024 19:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3CFC3277B;
	Mon,  8 Jul 2024 19:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720466077;
	bh=MMzPt1qLEIBFPhRV9nvK5Pdc6T5Fmql+DzmSgYeT42g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CMQ2xoJsPqqdADYwCDYy/gW5cLanL24QDbLS5EDVLOGfvwXCKdGPXIpY74Z5nlbL9
	 uNWjXkhyj/oUe3IvkDZw1Z7BguBh6Wx0i8cS867uhVrKRAzm1xGY6phABCfmqPchUf
	 OkCAYz+uEkGxFMsNsny71RPucWbcrDT6RefehqhWxantYEAClNfcIdRGt7zLetbBmb
	 l94yo3iBAZVfC+Wl1Y9858WifMJ2jWVm3TVImvj/0PU2mDAiOQAcelClasA+/9ApNb
	 4TQ1YPE1kNh1dvQx1oxzguLW9yCfr0t8ZQrpNxK13+IOehjz0AuDlwVLb1BzAkHbwX
	 hsJWsq2ou8CZQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org,
 Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
In-Reply-To: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
References: <20240627083104.123357-1-elinor.montmasson@savoirfairelinux.com>
Subject: Re: (subset) [PATCH v6 0/7] ASoC: fsl-asoc-card: add S/PDIF
 controller support
Message-Id: <172046607109.120366.13569145279464885226.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 20:14:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: QMX3NE723KYBVFV2UGY7OH74WS5CXNTU
X-Message-ID-Hash: QMX3NE723KYBVFV2UGY7OH74WS5CXNTU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMX3NE723KYBVFV2UGY7OH74WS5CXNTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 10:30:57 +0200, Elinor Montmasson wrote:
> This is the v6 of the series of patches aiming to make the machine
> driver `fsl-asoc-card` compatible with S/PDIF controllers on imx boards.
> The main goal is to allow the use of S/PDIF controllers with ASRC
> modules.
> 
> The `imx-spdif` machine driver already has specific support for S/PDIF
> controllers but doesn't support using an ASRC with it. However, the
> `fsl-asoc-card` machine driver has the necessary code to create a sound
> card which can use an ASRC module.
> It is then possible to extend the support for S/PDIF audio cards by
> merging the `imx-spdif` driver into `fsl-asoc-card`.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: fsl-asoc-card: add support for dai links with multiple codecs
      commit: a613b63db233b6e7d46ec72f009c1cbb7db8be66
[2/7] ASoC: fsl-asoc-card: add second dai link component for codecs
      commit: c68fa0d9b0f8cc7c3ae7d29c02adbc97622a73f5
[3/7] ASoC: fsl-asoc-card: add compatibility to use 2 codecs in dai-links
      commit: fcc6ace84f1f6ce2211af25c3c8fb30a0fb2bb2c
[4/7] ASoC: fsl-asoc-card: merge spdif support from imx-spdif.c
      commit: 6d174cc4f22461ad3fe383570527e86bf1948a2e
[5/7] ASoC: dt-bindings: update fsl-asoc-card bindings after imx-spdif merge
      commit: 4359caadd17fbde64d656c10bd6f2dc91b675a11

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

