Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 119E48BE666
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 16:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8CB1852;
	Tue,  7 May 2024 16:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8CB1852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715093349;
	bh=y6WKrVLOQiWpSilDvghHWU2H2C7Bg6g2vDY3+N3fXQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uMiwF8tvj4c++0nNWyECNLalo4UdRIWt16j8oDfP9tDDgrOCwut+Dj8+uSKz8PhsI
	 xMSIf1y6SPYf2AG+rp5UhwwXn4Zky42rlfzn9i7J/MRR8d25nxH24XpNOwZPkhree8
	 D0tIBlCN4e+bfMarMvJbtLgCdl8XX0VrIokgUTpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FB3BF805EA; Tue,  7 May 2024 16:48:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11C53F805F0;
	Tue,  7 May 2024 16:48:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4398F8049C; Tue,  7 May 2024 16:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6072BF804E7
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 16:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6072BF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jsh4qTC5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4F8DCCE126E;
	Tue,  7 May 2024 14:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16855C2BBFC;
	Tue,  7 May 2024 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092502;
	bh=y6WKrVLOQiWpSilDvghHWU2H2C7Bg6g2vDY3+N3fXQ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jsh4qTC5gVZ7sYBPuy5NlWFptghPLLD48L0GvjH4JiS3kx7qOWhxE7m21fp7sfw5c
	 OZfXdkbVtD4CmIf0rWQc/ADEFT+DencCfMXoMCOMYluT7CnDXVqh+Po/Z45ToGLJ4N
	 q/GfiRzpjYDI+kuA54dDD4j/cOQ6T81YZvpCLOiTrXY8Rsqbr2u3Pt4dWloOqnbdmK
	 dEF17UfmRG74qkmmf4YzoCKy1/QtSvaWf3ESfV5psZBtE0MmNvwqoDLyERgaX9ZgtU
	 ZOs30E1pnraWOyvvVNTqrFU7qisbhaGsGF5Z+19N7FUZM8OUy3ExYFzba4k3X0v+0X
	 dOQVG31vmlkFA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
Subject: Re: [PATCH 00/13] ASoC: Use snd_soc_substream_to_rtd() for
 accessing private_data
Message-Id: <171509249287.1985791.3932273255744591305.b4-ty@kernel.org>
Date: Tue, 07 May 2024 23:34:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: VFTHG4SDTI24FLLXI32YGB4SGT2K6EA5
X-Message-ID-Hash: VFTHG4SDTI24FLLXI32YGB4SGT2K6EA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFTHG4SDTI24FLLXI32YGB4SGT2K6EA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 16:02:09 +0200, Krzysztof Kozlowski wrote:
> Do not open-code snd_soc_substream_to_rtd() when accessing
> snd_pcm_substream->private_data.  This makes code more consistent with
> rest of ASoC and allows in the future to move the field to any other
> place or add additional checks in snd_soc_substream_to_rtd().
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: qcom: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 77678a25d1ecf70dc1d7ea2c0ab7609af15b83d3
[02/13] ASoC: tegra: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 3beb985abbf29e660edd1708f8a120ae9bbbddc3
[03/13] ASoC: ti: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 72a666f47f958a57db16b6bdd9ed385674069693
[04/13] ASoC: arm: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: a80f2f8443a4ae10c568566f57fe704ea52c5bdb
[05/13] ASoC: amd: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: a84d84077512fc64cf1fc2292a3638690a026737
[06/13] ASoC: fsl: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: b695d8be5bba9897ee670ec102ca608ecaf625c4
[07/13] ASoC: img: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 3b62178720594e08bdf8a87515ccca0328fe41fe
[08/13] ASoC: kirkwood: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: fe42c3b75b93dee9a4010e2297f1783e48684af7
[09/13] ASoC: loongson: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: ffad75cebb865fef6f8e40f921c08c79a8faf7e3
[10/13] ASoC: mediatek: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 410a45140fb76709cf2bbad84bc8a731acf632c8
[11/13] ASoC: meson: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 22f5680a9cbc7388f97e5386c15c325d6961b958
[12/13] ASoC: samsung: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 3e726593107d134221f666b4f2be612b278c3ddb
[13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing private_data
        commit: 47aa51677c975a5f66bc93d1c527e8878cf34d6c

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

