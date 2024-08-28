Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B9962DDF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 18:48:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C1DDF6;
	Wed, 28 Aug 2024 18:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C1DDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724863686;
	bh=j4jLeDpIzPZKbskW68/+PpTVh0tjaeer4IOaG6DDChY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a9ohlCN67sjjeHzI7U1TGLsU7DWGHHlpkmgaRitWGpdTM4TxAvVQ/ohp23Vka3lvH
	 rge7uGOphBAnLt+qdMCXGLsfOjNlGK59eYstOS4++bslpGKkRYSE3MP74iZCBzo0jm
	 Aci8RNZMYkqAjz7xSqX9Wj0HtF/qBNlZOWeBid/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 128A0F805B1; Wed, 28 Aug 2024 18:47:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDAEF805B2;
	Wed, 28 Aug 2024 18:47:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33EEAF80568; Wed, 28 Aug 2024 18:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7B3AF80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 18:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B3AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oZkPS99P
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 82D13A42547;
	Wed, 28 Aug 2024 16:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50236C4FEA7;
	Wed, 28 Aug 2024 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724862603;
	bh=j4jLeDpIzPZKbskW68/+PpTVh0tjaeer4IOaG6DDChY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oZkPS99PMjSQDlmejYO5DOcf0J3MZYC6EnN2Zr6EL6r2frkfw+sOqhNkQxVgAz9pg
	 qn0oMddBruo3l7QFyqNFw3zET4JnpwOuAoVc3lf0QRdSisREGea6eSAbEPr78wfqku
	 tUF1pHngBz7YASQgcya4e+3DZGy5g8czchAMrwZX90O3khwNU4jTA7M/e9Mx4uS9Xh
	 pMAksliy4Q3mCZVMEZJxuq3Yf4Vo+atWiwCMzVfZG57a4GIci6M8lddceEAkH7IUiO
	 iv3MFi7T9DwTwyVMYhr7dotfhQjE6lPKxdnwvgwxfJEkF3NPoqIuldShLB9GEqa6/x
	 aIQxdccnE40Ww==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v6 0/4] ASoC: grace time for DPCM cleanup
Message-Id: <172486259605.92851.6497771216257265041.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 17:29:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: BTV4OLXXQR5UWHHR77I6NMVY7YJCUGDA
X-Message-ID-Hash: BTV4OLXXQR5UWHHR77I6NMVY7YJCUGDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTV4OLXXQR5UWHHR77I6NMVY7YJCUGDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jun 2024 00:19:11 +0000, Kuninori Morimoto wrote:
> Cc each ASoC driver maintainer
> 
> This is resend of v6 of DPCM cleanup
> 
> As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> so we remove it. But we have been using it for 10 years, some driver might
> get damage. The most likely case is that the device/driver can use both
> playback/capture, but have only one flag, and not using xxx_only flag.
> [1/3] patch indicates warning in such case.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
      commit: fd69dfe6789f4ed46d1fdb52e223cff83946d997
[2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
      commit: 12806510481497a01d01edd64d7bb53a4d9ec28d
[3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
      commit: 46fb727a28d8c7195f915150a669d927d463069b
[4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
      commit: 61e1f74f739546415570ccc1ac14e1b26afe4705

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

