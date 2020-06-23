Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D3206E99
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 10:06:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 266281829;
	Wed, 24 Jun 2020 10:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 266281829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592985984;
	bh=XDYdvawqUqAQcFACuMMYMm7r91+voMmCRbGpKCeoI10=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BIk3jCF7CN5Dvc02Th+pvqSy4La9uRK59z+wHjHQrHbaWJ+5rIF1dWbn8dLJZM1By
	 Zb/IL7qkVj+2bIrkeDxMCOy/AbHdsUW7O0BCyJmWhZeOD05+HCGIvrPlPvjlsqwcOg
	 YNA5kkVK4J+kK4ZA/nfzCZqT55Nj6vA9Iw/tst7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C696F803A6;
	Wed, 24 Jun 2020 09:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEB04F80249; Tue, 23 Jun 2020 11:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 358C2F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 358C2F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DTlOYZe6"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05N9XpeR127412;
 Tue, 23 Jun 2020 04:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592904831;
 bh=EdEpG3YZ7lf528l9/LLF9l6BWBDwPhOkI7mG9HYqzMQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DTlOYZe6izccy9+d9Z60BDmmtHhpeXwe/k3nKJ7pfSe9ONIgjsS63CyJqVbY55Kce
 aN5TehxW1Bfwiqgbw5Ob8ckCniNDWugUVrwaKirGBy4YX8cKVn9bohpSrcF6+3zjjC
 rc4Cb4kgc3TF99IMFUupCHTcaAVU3pdHQrBEbjY4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05N9XpuF044098;
 Tue, 23 Jun 2020 04:33:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 04:33:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 04:33:50 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05N9XZVC003504;
 Tue, 23 Jun 2020 04:33:36 -0500
Subject: Re: [PATCH 00/19] ASoC: merge .digital_mute() into .mute_stream()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87ftam37ko.wl-kuninori.morimoto.gx@renesas.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
X-Pep-Version: 2.0
Message-ID: <054cc698-913d-7f14-e035-aa7309726189@ti.com>
Date: Tue, 23 Jun 2020 12:34:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87ftam37ko.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Jonghwan Choi <charlie.jh@kakaocorp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Frank Shi <shifu0704@thundersoft.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "Andrew F. Davis" <afd@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Matthias Reichl <hias@horus.com>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniel Drake <drake@endlessm.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kukjin Kim <kgene@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Chuhong Yuan <hslester96@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 James Schulman <james.schulman@cirrus.com>, Inki Dae <inki.dae@samsung.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Vincent Abriou <vincent.abriou@st.com>, kbuild test robot <lkp@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jason Yan <yanaijie@huawei.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Rhodes <david.rhodes@cirrus.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, Pavel Dobias <dobias@2n.cz>,
 Philipp Puschmann <p.puschmann@pironex.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 Colin Ian King <colin.king@canonical.com>,
 Kevin Cernekee <cernekee@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Peter Rosin <peda@axentia.se>, Lucas Stach <l.stach@pengutronix.de>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

On 23/06/2020 4.16, Kuninori Morimoto wrote:
>=20
> Hi Mark
>=20
> ALSA SoC has 2 mute callbacks (=3D .digital_mute(), .mute_stream()).
> But the difference between these 2 is very small.
> 	.digital_mute() is for Playback
> 	.mute_stream()  is for Playback/Capture
>=20
> This patch-set merges .digital_mute() into .mute_stream(),
> and removes .digital_mute().

Instead of finding the patch to ack, I just checked the series and:
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

- P=C3=A9ter

> Kuninori Morimoto (19):
>   ASoC: hdmi-codec: merge .digital_mute() into .mute_stream()
>   ASoC: ti: merge .digital_mute() into .mute_stream()
>   ASoC: spear: merge .digital_mute() into .mute_stream()
>   ASoC: meson: merge .digital_mute() into .mute_stream()
>   ASoC: atmel: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: tlv*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: tas*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: ssm*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: pcm*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: max*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: alc*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: wm*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: es*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: da*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: cs*: merge .digital_mute() into .mute_stream()
>   ASoC: codecs: ak*: merge .digital_mute() into .mute_stream()
>   ASoC: soc-dai: remove .digital_mute
>   ASoC: soc-core: snd_soc_dai_digital_mute() for both CPU/Codec
>=20
>  drivers/gpu/drm/bridge/sii902x.c       |  9 ++++---
>  drivers/gpu/drm/exynos/exynos_hdmi.c   |  8 ++++--
>  drivers/gpu/drm/i2c/tda998x_drv.c      |  9 ++++---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++--
>  drivers/gpu/drm/rockchip/cdn-dp-core.c |  9 ++++---
>  drivers/gpu/drm/sti/sti_hdmi.c         |  8 ++++--
>  drivers/gpu/drm/zte/zx_hdmi.c          |  9 ++++---
>  include/sound/hdmi-codec.h             |  3 ++-
>  include/sound/soc-dai.h                |  1 -
>  sound/soc/atmel/atmel-classd.c         | 10 +++++---
>  sound/soc/codecs/88pm860x-codec.c      |  9 ++++---
>  sound/soc/codecs/ad193x.c              |  7 ++++--
>  sound/soc/codecs/adau1701.c            |  7 ++++--
>  sound/soc/codecs/ak4458.c              |  7 ++++--
>  sound/soc/codecs/ak4535.c              |  8 ++++--
>  sound/soc/codecs/ak4641.c              |  9 ++++---
>  sound/soc/codecs/alc5623.c             |  7 ++++--
>  sound/soc/codecs/alc5632.c             |  7 ++++--
>  sound/soc/codecs/cpcap.c               | 15 ++++++++---
>  sound/soc/codecs/cq93vc.c              |  7 ++++--
>  sound/soc/codecs/cs4265.c              |  7 ++++--
>  sound/soc/codecs/cs4270.c              |  7 ++++--
>  sound/soc/codecs/cs42l42.c             |  7 ++++--
>  sound/soc/codecs/cs42l51.c             |  7 ++++--
>  sound/soc/codecs/cs42l52.c             |  7 ++++--
>  sound/soc/codecs/cs42l56.c             |  7 ++++--
>  sound/soc/codecs/cs42xx8.c             |  7 ++++--
>  sound/soc/codecs/cs4341.c              |  7 ++++--
>  sound/soc/codecs/cs4349.c              |  7 ++++--
>  sound/soc/codecs/da7210.c              |  7 ++++--
>  sound/soc/codecs/da7213.c              |  7 ++++--
>  sound/soc/codecs/da9055.c              |  7 ++++--
>  sound/soc/codecs/es8316.c              |  7 ++++--
>  sound/soc/codecs/es8328.c              |  7 ++++--
>  sound/soc/codecs/hdmi-codec.c          | 13 +++++-----
>  sound/soc/codecs/isabelle.c            | 21 +++++++++++-----
>  sound/soc/codecs/jz4770.c              |  7 ++++--
>  sound/soc/codecs/lm49453.c             | 35 ++++++++++++++++++--------=

>  sound/soc/codecs/max98088.c            | 16 +++++++++---
>  sound/soc/codecs/max98090.c            |  8 ++++--
>  sound/soc/codecs/max9867.c             |  7 ++++--
>  sound/soc/codecs/ml26124.c             |  7 ++++--
>  sound/soc/codecs/nau8822.c             |  7 ++++--
>  sound/soc/codecs/pcm1681.c             |  7 ++++--
>  sound/soc/codecs/pcm1789.c             |  7 ++++--
>  sound/soc/codecs/pcm179x.c             |  7 ++++--
>  sound/soc/codecs/pcm3168a.c            |  7 ++++--
>  sound/soc/codecs/pcm512x.c             |  7 ++++--
>  sound/soc/codecs/rk3328_codec.c        |  7 ++++--
>  sound/soc/codecs/sgtl5000.c            |  7 ++++--
>  sound/soc/codecs/ssm2518.c             |  7 ++++--
>  sound/soc/codecs/ssm2602.c             |  7 ++++--
>  sound/soc/codecs/ssm4567.c             |  7 ++++--
>  sound/soc/codecs/sta529.c              |  7 ++++--
>  sound/soc/codecs/tas2552.c             |  7 ++++--
>  sound/soc/codecs/tas2562.c             |  7 ++++--
>  sound/soc/codecs/tas2770.c             |  7 ++++--
>  sound/soc/codecs/tas571x.c             |  7 ++++--
>  sound/soc/codecs/tas5720.c             |  7 ++++--
>  sound/soc/codecs/tas6424.c             |  7 ++++--
>  sound/soc/codecs/tfa9879.c             |  7 ++++--
>  sound/soc/codecs/tlv320aic23.c         |  7 ++++--
>  sound/soc/codecs/tlv320aic26.c         |  7 ++++--
>  sound/soc/codecs/tlv320aic31xx.c       |  8 ++++--
>  sound/soc/codecs/tlv320aic32x4.c       |  7 ++++--
>  sound/soc/codecs/tlv320aic3x.c         |  7 ++++--
>  sound/soc/codecs/twl6040.c             |  7 ++++--
>  sound/soc/codecs/uda134x.c             |  7 ++++--
>  sound/soc/codecs/wm8350.c              |  7 ++++--
>  sound/soc/codecs/wm8400.c              |  7 ++++--
>  sound/soc/codecs/wm8510.c              |  7 ++++--
>  sound/soc/codecs/wm8580.c              |  7 ++++--
>  sound/soc/codecs/wm8711.c              |  7 ++++--
>  sound/soc/codecs/wm8728.c              |  7 ++++--
>  sound/soc/codecs/wm8731.c              |  7 ++++--
>  sound/soc/codecs/wm8741.c              |  7 ++++--
>  sound/soc/codecs/wm8750.c              |  7 ++++--
>  sound/soc/codecs/wm8753.c              |  9 ++++---
>  sound/soc/codecs/wm8770.c              |  7 ++++--
>  sound/soc/codecs/wm8776.c              |  7 ++++--
>  sound/soc/codecs/wm8900.c              |  7 ++++--
>  sound/soc/codecs/wm8903.c              |  7 ++++--
>  sound/soc/codecs/wm8904.c              |  7 ++++--
>  sound/soc/codecs/wm8940.c              |  7 ++++--
>  sound/soc/codecs/wm8955.c              |  7 ++++--
>  sound/soc/codecs/wm8960.c              |  7 ++++--
>  sound/soc/codecs/wm8961.c              |  7 ++++--
>  sound/soc/codecs/wm8962.c              |  7 ++++--
>  sound/soc/codecs/wm8971.c              |  7 ++++--
>  sound/soc/codecs/wm8974.c              |  7 ++++--
>  sound/soc/codecs/wm8978.c              |  7 ++++--
>  sound/soc/codecs/wm8983.c              |  7 ++++--
>  sound/soc/codecs/wm8985.c              |  7 ++++--
>  sound/soc/codecs/wm8988.c              |  7 ++++--
>  sound/soc/codecs/wm8990.c              |  7 ++++--
>  sound/soc/codecs/wm8991.c              |  7 ++++--
>  sound/soc/codecs/wm8993.c              |  7 ++++--
>  sound/soc/codecs/wm8994.c              | 10 +++++---
>  sound/soc/codecs/wm8995.c              |  9 ++++---
>  sound/soc/codecs/wm9081.c              |  7 ++++--
>  sound/soc/meson/axg-spdifout.c         |  7 ++++--
>  sound/soc/soc-core.c                   |  4 +--
>  sound/soc/soc-dai.c                    |  4 ---
>  sound/soc/spear/spdif_out.c            | 10 +++++---
>  sound/soc/ti/ams-delta.c               | 11 +++++---
>  105 files changed, 576 insertions(+), 243 deletions(-)
>=20


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

