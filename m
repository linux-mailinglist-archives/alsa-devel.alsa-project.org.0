Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4E206EB1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 10:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6451844;
	Wed, 24 Jun 2020 10:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6451844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592986174;
	bh=he7XbJ0X5cGTthJvccL0ViHP8fdA0j+js4V9qHAOwmA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CoO9bg7I8lqeEAv5QhHxFbYbO+D7kGbjZyz+E0NMY8wQtaattZs9+52RBwA6gv+K9
	 cBkf5zcEeC+2gm2ipugP6pzYfl504oahg/LBy/fZBFtTEuYsasfOx3JYBAkbz019DL
	 iW4xdBW9PbLN6YWtueUzvQq7n+zZjWTeN/jl3eds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B496F80446;
	Wed, 24 Jun 2020 09:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18557F80234; Tue, 23 Jun 2020 17:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CFBAF800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CFBAF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wrftZ2hx"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05NFVAE3129071;
 Tue, 23 Jun 2020 10:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592926270;
 bh=uLEHz/OHzk1ME3oUbqR4BuAwuEDDTmmWf+QZUv9aRpw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=wrftZ2hxdZdy5Ycu7wJqynv5z5avLZ9o20iZ6o999yHnujIMMzvfjPynu0442vxqr
 oTyymjup9pXjP5TRreezd1Ah5L/j06W0uwx+a2OtcpZzZCjq3eH2O4kgxG+anIzbMB
 3K45PTDsG5LdSh9MDLsdjuXRh3Io62aQjff3yvrY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05NFV4sh037200
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 23 Jun 2020 10:31:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 10:31:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 10:31:03 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05NFV1rK067938;
 Tue, 23 Jun 2020 10:31:02 -0500
Subject: Re: [PATCH 18/19] ASoC: soc-dai: remove .digital_mute
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87ftam37ko.wl-kuninori.morimoto.gx@renesas.com>
 <87pn9q1ss8.wl-kuninori.morimoto.gx@renesas.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <4e8f7b7b-9d60-4e60-60db-91477cb1b1d8@ti.com>
Date: Tue, 23 Jun 2020 10:31:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87pn9q1ss8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Vincent Abriou <vincent.abriou@st.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
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

Kuninori

On 6/22/20 8:21 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> All drivers are now using .mute_stream.
> Let's remove .digital_mute.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc-dai.h | 1 -
>   sound/soc/soc-dai.c     | 4 ----
>   2 files changed, 5 deletions(-)
>
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index 212257e84fac..a3db208cd062 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -246,7 +246,6 @@ struct snd_soc_dai_ops {
>   	 * DAI digital mute - optional.
>   	 * Called by soc-core to minimise any pops.
>   	 */
> -	int (*digital_mute)(struct snd_soc_dai *dai, int mute);
>   	int (*mute_stream)(struct snd_soc_dai *dai, int mute, int stream);
>   
>   	/*
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index b05e18b63a1c..b0fc3d8b1798 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -301,10 +301,6 @@ int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
>   	if (dai->driver->ops &&
>   	    dai->driver->ops->mute_stream)
>   		ret = dai->driver->ops->mute_stream(dai, mute, direction);
> -	else if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
> -		 dai->driver->ops &&
> -		 dai->driver->ops->digital_mute)
> -		ret = dai->driver->ops->digital_mute(dai, mute);

Instead of putting the direction check in every codec driver can't the 
check just part of the function? And then maybe a flag in dai_ops to 
override that call to mute?

if (direction != SNDRV_PCM_STREAM_PLAYBACK)
         return 0;

I did not look at every codec driver as there are too many.

Dan


