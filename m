Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 214CD206E9A
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 10:06:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C488D1802;
	Wed, 24 Jun 2020 10:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C488D1802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592986015;
	bh=Lvilq54I0zgkh25sNEzV+PXm8bKsLZMbBop0scFSF0M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uF3oQ2if23T5S17fZpgiqfTc7YXWZOQDf8ZsO2+TZb0OGJwcTBtb1BWIcGZ/rGFZI
	 PUbngeAQY545c7sLJkQo0XocXyPSI6jwhoDYXYVdYLb9AL5Z/vQ2+uGDxcKH5Fu6jh
	 FLo1tP2HAyN/MAj6vPWF8U5ThhJpzncmNSYbalXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D52ABF803B0;
	Wed, 24 Jun 2020 09:50:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0C3DF80234; Tue, 23 Jun 2020 12:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1E0CF8012F
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 12:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E0CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QlPiw4kC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05NARY0X014598; Tue, 23 Jun 2020 05:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Zs/4MpVetYiubHUxChGRHeQ5tsyMzbZZePwRgF6MCHc=;
 b=QlPiw4kCsOP97VlBtCNStGrWoYJjt6krVNu9USmAh02MhB0L+vp12MXE7KsKwZrChKSq
 g2E4zUi62+QWeTYoKqCTg6R/5/eynYzm/oOwNwbib7lxzM7gwps9VeJ9JKy9TFtPNI4j
 6jowuZjTPykmyYesDJmriYLTA/84NT/4RhKl3xf9iwCBX015wPxY6WmIqt6DHH3sLvY8
 8NMABBh2gzoXvZ1fCbG9MYeSIJrGBdvuE6rI5PZVeuQCZFAaWc6sWlfEHINdt+9B4e/z
 SMg3MGkNLnrT9y8VP+MnLD8owpKa6DWZVjF8fbyU06QfrTpFjT20GhXVmEKzDnooQ/wA vA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 31sf6ebthb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jun 2020 05:29:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 23 Jun
 2020 11:29:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 23 Jun 2020 11:29:06 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1E6CA2C8;
 Tue, 23 Jun 2020 10:29:06 +0000 (UTC)
Date: Tue, 23 Jun 2020 10:29:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 13/19] ASoC: codecs: wm*: merge .digital_mute() into
 .mute_stream()
Message-ID: <20200623102906.GX71940@ediswmail.ad.cirrus.com>
References: <87ftam37ko.wl-kuninori.morimoto.gx@renesas.com>
 <87wo3y1ssz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wo3y1ssz.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 clxscore=1011
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 cotscore=-2147483648 lowpriorityscore=0 malwarescore=0 mlxlogscore=851
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006230083
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Michael Walle <michael@walle.cc>,
 =?iso-8859-1?B?IkhlaWtvIFN0/GJuZXIi?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?utf-8?B?Ik1pY2hhxYIgTWlyb3PFgmF3Ig==?= <mirq-linux@rere.qmqm.pl>,
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
 Kevin Hilman <khilman@baylibre.com>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
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
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Chuhong Yuan <hslester96@gmail.com>, Robin
 Murphy <robin.murphy@arm.com>, James Schulman <james.schulman@cirrus.com>,
 Inki Dae <inki.dae@samsung.com>, Masahiro
 Yamada <masahiroy@kernel.org>, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Dan
 Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?iso-8859-1?B?Ik51bm8gU+Ei?= <nuno.sa@analog.com>,
 Vincent Abriou <vincent.abriou@st.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Support
 Opensource <support.opensource@diasemi.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jason Yan <yanaijie@huawei.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Rhodes <david.rhodes@cirrus.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, Pavel Dobias <dobias@2n.cz>,
 Philipp Puschmann <p.puschmann@pironex.de>, Kyungmin
 Park <kyungmin.park@samsung.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, Daniel
 Vetter <daniel@ffwll.ch>, Colin
 Ian King <colin.king@canonical.com>, Kevin Cernekee <cernekee@chromium.org>,
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Peter Rosin <peda@axentia.se>, M R Swami Reddy <mr.swami.reddy@ti.com>
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

On Tue, Jun 23, 2020 at 10:20:43AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_dai_digital_mute() is internally using both
> mute_stream() (1) or digital_mute() (2), but the difference between
> these 2 are only handling direction.
> We can merge digital_mute() into mute_stream
> 
> 	int snd_soc_dai_digital_mute(xxx, int direction)
> 	{
> 		...
> 		else if (dai->driver->ops->mute_stream)
> (1)			return dai->driver->ops->mute_stream(xxx, direction);
> 		else if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
> 			 dai->driver->ops->digital_mute)
> (2)			return dai->driver->ops->digital_mute(xxx);
> 		...
> 	}
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
