Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD087B3EF2
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A382DDF2;
	Sat, 30 Sep 2023 10:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A382DDF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061164;
	bh=K3gxoBXAbqKdlJDLl87Mn9L+joQrIbNCK51zUnZ9EAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KgOjUQwulwscuMaoB8zrE7jl8d53l/AvZkqHIv96tWHXHD/WCah9XIpmgTkvO49+a
	 QRA9pWvFr7AAFsIYdiJUD7mNCXL3tvY9LWahOFKlu6SYMYbOZIewsu1hEk2K86fCQ/
	 QY01JdBZxNkJvdWXU9H0bOkLn7lICkUHGvrpanG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D421F805FE; Sat, 30 Sep 2023 10:05:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F66CF805AB;
	Sat, 30 Sep 2023 10:05:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2ACEF801D5; Tue, 26 Sep 2023 17:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50E96F800AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 17:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E96F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JxG6TRAO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 00A68CE1677;
	Tue, 26 Sep 2023 15:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819E1C433C7;
	Tue, 26 Sep 2023 15:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695740829;
	bh=K3gxoBXAbqKdlJDLl87Mn9L+joQrIbNCK51zUnZ9EAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JxG6TRAOQsYrDn+s6S5ZDC6YKeOnxHdoElOS6kG/+BSIto+xynvW0yv2Iq0ETp+VL
	 55HkIsza3Ng5N8kYa8tjTWA79quQYliETN4DIiWfe8g7gmc8T8IQ3lSn9wh0AYJZar
	 k1xMVu8vpAxxDLqNsPEbfeH26Fc2+C6YXw8x+RlRqNjI7TjhF8ECkngqHVkqIyFfI0
	 zGOYO4p3kE1qLVym92QIL+bg38BLF75YQpuAT/PxGA5oZPpDJAtgT6aole91i6nxke
	 Jn1/4LNpn28veBh2xopLLwWBTFOjV1F5zZ/ttUM/OyGSmGKLqSltVuQe5gczE5wUh5
	 IOpeqbY0s+CNw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C3=85=EF=BF=BDawi=C3=85=EF=BF=BDski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?utf-8?q?Andreas_F=C3=83=C2=A4r_ber?= <afaerber@suse.de>,
 =?utf-8?q?Martin_Pov_i=C3=85=C2=A1er?= <povik+lin@cutebit.org>,
 =?utf-8?q?N=C3=83=C2=ADcolas_F=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>,
 =?utf-8?q?Pawe=C3=85=EF=BF=BD_Anikiel?= <pan@semihalf.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>, Ban Tao <fengzheng923@gmail.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Chen-Yu Tsai <wens@csie.org>, Chunxu Li <chunxu.li@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 James Schulman <james.schulman@cirrus.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Montleon <jmontleo@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Judy Hsiao <judyhsiao@chromium.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Orson Zhai <orsonzhai@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ray Jui <rjui@broadcom.com>, Ricardo Ribalda Delgado <ribalda@chromium.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Yangtao Li <frank.li@vivo.com>, YingKun Meng <mengyingkun@loongson.cn>,
 Yong Zhi <yong.zhi@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?q?P=C3=83=C2=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, asahi@lists.linux.dev,
 linux-actions@lists.infradead.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/54] ASoC: convert asoc_xxx() to snd_soc_xxx()
Message-Id: <169574081322.2649266.11829849428516551598.b4-ty@kernel.org>
Date: Tue, 26 Sep 2023 17:06:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6MZVAJTT44L263M2VOJO2BDSI676PKKY
X-Message-ID-Hash: 6MZVAJTT44L263M2VOJO2BDSI676PKKY
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:05:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MZVAJTT44L263M2VOJO2BDSI676PKKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Sep 2023 23:46:38 +0000, Kuninori Morimoto wrote:
> ASoC is using 2 type of prefix (asoc_xxx() vs snd_soc_xxx()), but there
> is no particular reason about that [1].
> To reduce confusing, standarding these to snd_soc_xxx() is sensible.
> 
> This patch adds asoc_xxx() macro to keep compatible for a while.
> It will be removed if all drivers were switched to new style.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/54] ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
        commit: 1d5a2b5dd0a8d2b2b535b5266699429dbd48e62f
[02/54] ASoC: simple_card_utils.h: convert not to use asoc_xxx()
        commit: b5a95c5bf6d6953d05b2c12acc8c07783232bea9
[03/54] ASoC: sh: convert not to use asoc_xxx()
        commit: c4ccfe4e5fa5d36a418bdb78dbe00a97b77954f9
[04/54] ASoC: ti: convert not to use asoc_xxx()
        commit: 1af529320d56e99f0745e432966d5f6652353b99
[05/54] ASoC: arm: convert not to use asoc_xxx()
        commit: 3cdd333a36dae6c56ffceedce8737cca23b632ba
[06/54] ASoC: amd: convert not to use asoc_xxx()
        commit: d4f23dcd6906ad8f76df046bad9a0dea353c4543
[07/54] ASoC: bcm: convert not to use asoc_xxx()
        commit: aa435567d75fd5128d45141f81278abf1f7d47c4
[08/54] ASoC: dwc: convert not to use asoc_xxx()
        commit: f8af41a3ac938e3764d89f7e05b0a8d130f6075a
[09/54] ASoC: fsl: convert not to use asoc_xxx()
        commit: 14ec63f678e8beaaa1005ccae6c112bf672ba2b3
[10/54] ASoC: img: convert not to use asoc_xxx()
        commit: cc807acede357e2d05969bc52073f1ad678f4677
[11/54] ASoC: mxs: convert not to use asoc_xxx()
        commit: 59b8f7185ed402a90782e0e8b25ccf9284a7e8e3
[12/54] ASoC: pxa: convert not to use asoc_xxx()
        commit: 2f688d1ea1cc167fdc0a65d3b2f77dd752d55117
[13/54] ASoC: stm: convert not to use asoc_xxx()
        commit: d69bd6dbc651ba86fe40f4cc6b125a7fb3f4be51
[14/54] ASoC: au1x: convert not to use asoc_xxx()
        commit: 2162d45392c69b7976e5e294c2104236b15e47c1
[15/54] ASoC: qcom: convert not to use asoc_xxx()
        commit: 9b1a2dfa8a00ff10550d6ca103f494c60f13cb03
[16/54] ASoC: sprd: convert not to use asoc_xxx()
        commit: a87a5c6ee44e0a50f29268bab8b11d8da418af41
[17/54] ASoC: apple: convert not to use asoc_xxx()
        commit: 2bbb49e294acb690340693f5f54dc6ef29641d54
[18/54] ASoC: atmel: convert not to use asoc_xxx()
        commit: 6547effc3aea50cc3c60874f9a65a19f4919ef9d
[19/54] ASoC: meson: convert not to use asoc_xxx()
        commit: 0d102e68e1075dbfb24d35c29bf9e64e7936b9f8
[20/54] ASoC: sunxi: convert not to use asoc_xxx()
        commit: 7912371430a49daaa63a2098aa8c944a1ecb0b9b
[21/54] ASoC: tegra: convert not to use asoc_xxx()
        commit: 436f4c706c22682b357dbdb97a6196449293e2a8
[22/54] ASoC: ux500: convert not to use asoc_xxx()
        commit: 3a0901d771d77c6a6be45e0a912c246d1ddee05b
[23/54] ASoC: google: convert not to use asoc_xxx()
        commit: 08b7174fb8d126e607e385e34b9e1da4f3be274f
[24/54] ASoC: cirrus: convert not to use asoc_xxx()
        commit: 1880a434948346f00509ad9a9f0885a66e5432d0
[25/54] ASoC: generic: convert not to use asoc_xxx()
        commit: b4b7de99c6da461315bfcce28018ab9f660c913b
[26/54] ASoC: samsung: convert not to use asoc_xxx()
        commit: 21b6cd54c98efedd29a2f8c92c3ee64fb324f4ec
[27/54] ASoC: extensa: convert not to use asoc_xxx()
        commit: c578d73e919b4805fbddf278627af1302b6246ec
[28/54] ASoC: kirkwood: convert not to use asoc_xxx()
        commit: fe4c755de065b156ddc884a5b21b38e7063468b1
[29/54] ASoC: loongson: convert not to use asoc_xxx()
        commit: 5f444041c1d225bcc8f44dc4b027eb41e2f2f175
[30/54] ASoC: mediatek: convert not to use asoc_xxx()
        (no commit info)
[31/54] ASoC: rockchip: convert not to use asoc_xxx()
        commit: 1a72df807968d259987f4e08fa7e2c92e3710717
[32/54] ASoC: starfive: convert not to use asoc_xxx()
        commit: b551aafeb9f6f5bce299f08c3799fb58e8372293
[33/54] ASoC: uniphier: convert not to use asoc_xxx()
        commit: 91941d84038ef392370172053cb8e0ca62ae9e56
[34/54] ASoC: soundwire: convert not to use asoc_xxx()
        commit: 50cd92e0c8d35d634275ae29f769244ad26b41fa
[35/54] ASoC: intel: convert not to use asoc_xxx()
        (no commit info)
[36/54] ASoC: intel: avs: convert not to use asoc_xxx()
        commit: 5d2d1a48a2f7734aee273303fadbb5929b5b8d37
[37/54] ASoC: codec: wm: convert not to use asoc_xxx()
        commit: 221a3d283ee57e75f68f83157d3a1c7cc88a5fa9
[38/54] ASoC: codec: rt5677: convert not to use asoc_xxx()
        commit: 4cfa9963faa42eb71550e7697df0889b66c11898
[39/54] ASoC: codec: cs47lxx: convert not to use asoc_xxx()
        commit: a62886e3e74552ce91a4de2a9012cfac678ab4a8
[40/54] ASoC: sof: convert not to use asoc_xxx()
        (no commit info)
[41/54] ASoC: sof: amd: convert not to use asoc_xxx()
        commit: b787e09f590656da9b2e5bd3e2484121368b6561
[42/54] ASoC: sof: intel: convert not to use asoc_xxx()
        commit: e79a972539628b626c4eb68e0c0341ffca1d6217
[43/54] ASoC: sof: mediatek: convert not to use asoc_xxx()
        commit: 80b72082e9677026f8874b3db6bf417f473a74cf
[44/54] ASoC: soc-dai: convert not to use asoc_xxx()
        commit: 52d98d06eb0bf26312b26fb2d7aa19ddad2a9288
[45/54] ASoC: soc-pcm: convert not to use asoc_xxx()
        commit: 2679a5b2f7d99e3a733cb229c95b4c2e78d17b23
[46/54] ASoC: soc-core: convert not to use asoc_xxx()
        commit: eeec74aa0ff8af329b9a4504a59a568b93ab2a0f
[47/54] ASoC: soc-dapm: convert not to use asoc_xxx()
        commit: 36570f3222fdfbcdd4cda28d4367efc17661290f
[48/54] ASoC: soc-link: convert not to use asoc_xxx()
        commit: 9099904bac50385721ef2e0d7e54a412f7527975
[49/54] ASoC: soc-utils: convert not to use asoc_xxx()
        commit: b1f96e94e860f7dfecedb30fc08e19424892b660
[50/54] ASoC: soc-topology: convert not to use asoc_xxx()
        commit: 8bfbdb18e2fd25385caece357a715cc058c40726
[51/54] ASoC: soc-compress: convert not to use asoc_xxx()
        commit: 28b11fd4ab604ff8a3650d10e37c2d1d93873b7b
[52/54] ASoC: soc-component: convert not to use asoc_xxx()
        commit: c35691ffcdbd57049d23ff4a596dd28635aabcdc
[53/54] ASoC: soc-generic-dmaengine-pcm: convert not to use asoc_xxx()
        commit: c067b1f83ea46346a352c2e43ac80f2166172d8a
[54/54] ASoC: remove asoc_xxx() compatible macro
        (no commit info)

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

