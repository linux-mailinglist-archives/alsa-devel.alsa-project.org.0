Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6177C337
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 00:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D39682B;
	Tue, 15 Aug 2023 00:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D39682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692050835;
	bh=CQcmGe5bZfSPRSqhxNbQQp5kRcAPSC60YCbtXXCMLwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Iasl+2dbtg9QitGrQXg0B6TSqLAtG69JMjgGmbfK3HbvXSqvTfLrtt2tByBbokJz1
	 V7dKzP6xnD42Aa4cOkKFCCXFKh7CFsWzqFjmorhu0gkGObO9edYQEgsN91lYaLounu
	 gBCpsEsclj7eKtAcE7H7VH8wOE/gmmD3iSOMh9ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91848F801EB; Tue, 15 Aug 2023 00:06:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C2A3F801EB;
	Tue, 15 Aug 2023 00:06:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33FF3F80254; Tue, 15 Aug 2023 00:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7724FF80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 00:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7724FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xy+u3857
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C9B2D6134E;
	Mon, 14 Aug 2023 22:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDCBC433C8;
	Mon, 14 Aug 2023 22:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692050761;
	bh=CQcmGe5bZfSPRSqhxNbQQp5kRcAPSC60YCbtXXCMLwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xy+u3857Ao6+lyq42DtEw+O0htZdT95p8zGr2rBX+gNoL+pIgZx9jTpqj/Z73WJbN
	 dpjFBa1Tt/PJkpL2Ky2DK9x6Ua7wC5OQtGkbcAjCoTqnwbLLncXUvgfTiXmQ+/MN1/
	 K5w9h5Y0ET3/MAyRlYoxCrgD8r/NQ8XnOQvayndBlmpml2722lm0CSeGw2K9Lho3YW
	 xvQ85gWSKraoofLlUkh4KJ+QBzDhRfegH56fy2/hdIryju3PyAJRy6EW5d6ZarF57Q
	 FiHwQgRDmHor8N5/T4z6NT8NQJmdFA3693hvo8xpiMuC1POkUkmJBfKjc6VmOjzctu
	 DSOQG0+M+JFig==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87v8dpb0w6.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
 <87v8dpb0w6.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 01/39] ASoC: soc-dai.h: merge DAI call back
 functions into ops
Message-Id: <169205075988.98708.15537446354136173987.b4-ty@kernel.org>
Date: Mon, 14 Aug 2023 23:05:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: N5ZME6JUCRPKTSO77QV5AVARE5SZKGJC
X-Message-ID-Hash: N5ZME6JUCRPKTSO77QV5AVARE5SZKGJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5ZME6JUCRPKTSO77QV5AVARE5SZKGJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Aug 2023 22:54:50 +0000, Kuninori Morimoto wrote:
> snd_soc_dai_driver has .ops for call back functions (A), but it also
> has other call back functions (B). It is duplicated and confusable.
> 
> 	struct snd_soc_dai_driver {
> 		...
>  ^		int (*probe)(...);
>  |		int (*remove)(...);
> (B)		int (*compress_new)(...);
>  |		int (*pcm_new)(...);
>  v		...
> (A)		const struct snd_soc_dai_ops *ops;
> 		...
> 	}
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/39] ASoC: soc-dai.h: merge DAI call back functions into ops
        commit: 3e8bcec0787d1a73703c915c31cb00a2fd18ccbf
[02/39] ASoC: ti: merge DAI call back functions into ops
        commit: c64f5bd3afa0bf7a3b550bb63b9a5644acb04404
[03/39] ASoC: adi: merge DAI call back functions into ops
        commit: db49eb7b3855cc9bd422663b1cd84a36f5bd8d1f
[04/39] ASoC: adi: merge DAI call back functions into ops
        commit: db49eb7b3855cc9bd422663b1cd84a36f5bd8d1f
[05/39] ASoC: amd: merge DAI call back functions into ops
        commit: d86eb53532362f738dd840d7b953b2a769ccdd4b
[06/39] ASoC: dwc: merge DAI call back functions into ops
        commit: 2c88ba731fec284af52ed19b6c6eaacffb0c50f0
[07/39] ASoC: pxa: merge DAI call back functions into ops
        commit: 208b8395f79e4ad9196849b744f6e4a7abd2b836
[08/39] ASoC: bcm: merge DAI call back functions into ops
        commit: 59cd0ba842771946e922291199ce8c7a662484d4
[09/39] ASoC: fsl: merge DAI call back functions into ops
        commit: 5e5f68ca836e740c1d788f04efa84b37ed185606
[10/39] ASoC: img: merge DAI call back functions into ops
        commit: a98bd9e1173872cdbfc3ca7a2c43382f1417ab7e
[11/39] ASoC: sof: merge DAI call back functions into ops
        commit: f522af4cbe0158de3f518ed76b328ea6297a52b2
[12/39] ASoC: sti: merge DAI call back functions into ops
        commit: f33b8df2233a8f7007a289e4cf1bfce403fa6bf0
[13/39] ASoC: stm: merge DAI call back functions into ops
        commit: 2fb00b84cdb7dd2a8fe0d584236990b2392c5a57
[14/39] ASoC: pxa: merge DAI call back functions into ops
        commit: 208b8395f79e4ad9196849b744f6e4a7abd2b836
[15/39] ASoC: rsnd: merge DAI call back functions into ops
        commit: 47ca9f546ef6806925077e5ea6e084af660ee41b
[16/39] ASoC: qcom: merge DAI call back functions into ops
        commit: 9174fd60e55d7ff1ad2c909c67de48ebe7008e5a
[17/39] ASoC: au1x: merge DAI call back functions into ops
        commit: 4fc3331cb5f93b5a5ed5ee153b442960d11e1049
[18/39] ASoC: ux500: merge DAI call back functions into ops
        commit: 2870ffb31c58a301417ee12151122b337b316d0a
[19/39] ASoC: sunxi: merge DAI call back functions into ops
        commit: 331cd4d326244d853eb2e9fd3dcf55969055187e
[20/39] ASoC: tegra: merge DAI call back functions into ops
        commit: b36e672b6b6fa4f68fc74c3b85ba9b4a615fc1d9
[21/39] ASoC: atmel: merge DAI call back functions into ops
        commit: 2e85e70608c5d7233244c19ec2253dd1acb01e17
[22/39] ASoC: intel: merge DAI call back functions into ops
        commit: 3a8b7fd088d74c43eeb14406b7a1f0666a8d8594
[23/39] ASoC: meson: merge DAI call back functions into ops
        commit: 17821c2f6c53009b4c00aa5fd051425e19d46616
[24/39] ASoC: jz4740: merge DAI call back functions into ops
        commit: b3a7e76d7f7afd259dea954e9247dcccd361ed3a
[25/39] ASoC: cirrus: merge DAI call back functions into ops
        commit: af8a0e0391308258b2338b3b72e8fad5fac2d5d7
[26/39] ASoC: drm/vc4: merge DAI call back functions into ops
        commit: 3964f1d944c9dba5444ed85a9fcdf69991f17e5c
[27/39] ASoC: samsung: merge DAI call back functions into ops
        commit: 69b33471a2986f655006a37b1ae7b6cccf812b53
[28/39] ASoC: mediatek: merge DAI call back functions into ops
        commit: df775a399e1a6eb6eeab3d23f7c200f1dd4dcce0
[29/39] ASoC: rockchip: merge DAI call back functions into ops
        commit: 7575bec582876d295b34488cd39854c9e840ef04
[30/39] ASoC: uniphier: merge DAI call back functions into ops
        commit: 7142b49f5742d4bf5706b44db931906a45061b68
[31/39] ASoC: loongson: merge DAI call back functions into ops
        commit: 69c4f41b9e3c18bac11ada4b31abea3eed60f610
[32/39] ASoC: starfive: merge DAI call back functions into ops
        commit: de046f2ddbf929a0af73dd295902ea9a55ebc741
[33/39] ASoC: hisilicon: merge DAI call back functions into ops
        commit: d1f1c345562d31b1b5e2aaf03bfcdf1835778f65
[34/39] ASoC: codecs/wm*: merge DAI call back functions into ops
        commit: a350c5562318f798ef7b3e1e72bf947f0816ca45
[35/39] ASoC: soc-topology: merge DAI call back functions into ops
        commit: 7fdd0672678245dddd008fb2aea3b6952a5da795
[36/39] ASoC: codecs/cs47lxx: merge DAI call back functions into ops
        commit: 6bbb65c39a8468f12784bfa01d06a800c81310c5
[37/39] ASoC: codecs/cx2072x: merge DAI call back functions into ops
        commit: 707844f66ee3a79e3c1256e1b1667c9c43f6021d
[38/39] ASoC: codecs/hdmi-codec: merge DAI call back functions into ops
        commit: acd3e6256edf6d81eb01ab9a6fcbc48bf038a9a6
[39/39] ASoC: soc-dai.h: remove unused call back functions
        commit: 8e1eb11cd4579decc8e928be2face7c43f2a9c67

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

