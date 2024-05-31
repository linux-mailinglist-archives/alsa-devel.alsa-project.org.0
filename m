Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCC28D65C6
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 17:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFF4DF6;
	Fri, 31 May 2024 17:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFF4DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717169524;
	bh=hsjA0x6Srt7WNltFPQm36M1XEQClgGGCUWLHMkEXdTw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sLKs4NwD9bGgJkcqS+RTtwMaVjXcbFxDUzGMTS8dBbXQc4maO1/Lwe6hbxvF81yJH
	 t6zIm/ngbj48HkS/O7qa7QvlyaikNE+SuDd7OL7BuaLnpJVdtEgzWA7+BqzRKU9Umc
	 KoFfGUorImL0vzpqRS5wq7eJDIngZJ6PD+VeuiB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 061F4F805D2; Fri, 31 May 2024 17:31:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8019EF805C8;
	Fri, 31 May 2024 17:31:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 712E6F80051; Fri, 31 May 2024 17:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 964F1F800AC
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 17:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 964F1F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YT+9jQg6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169455; x=1748705455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hsjA0x6Srt7WNltFPQm36M1XEQClgGGCUWLHMkEXdTw=;
  b=YT+9jQg6ROLiTIR2loc+gu467/qFCoLB+476yFr805YZDnr0VN6K/X0p
   klDTAbX4S4ZydlBmfDKNR+0iIOXLFhKVdqwVO6qhqu8wsyTcP4tMFDT1m
   nTidGRln19bVBDwb2TnH7zUZ04LC3xL0fwANSQK9nfuXpzDei5DzAXCV4
   6AngJDqIqVubArMxz24GSWqydv91S7IBmjCKzMiAusyZT5lyVRJ+5/Kiz
   TpYARsJItwZg+1wahSROCSj+c7R/MCkkgeeEklpzGvvsbL55lGeR8mDJu
   i589FVSV6QpKdRRsn1coVX70qfzixkCD6ZlskosUIyMbUBW3DiT3NyUFi
   Q==;
X-CSE-ConnectionGUID: GDXM+urSRzKxB5gBaoyuzA==
X-CSE-MsgGUID: UHdTOnWcRYy+zpcblqhCfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13839565"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="13839565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:30:50 -0700
X-CSE-ConnectionGUID: rj6obq2ERMO5QDiPGyKZ2g==
X-CSE-MsgGUID: q2N5xO0fShaiM6SvMI6SaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="40627259"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 08:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8ED9F228; Fri, 31 May 2024 18:30:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/6] ASoC: Drop or replace of_gpio.h
Date: Fri, 31 May 2024 18:29:27 +0300
Message-ID: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HUOHT3E5EL2TMSI37762XCI73INFLILF
X-Message-ID-Hash: HUOHT3E5EL2TMSI37762XCI73INFLILF
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUOHT3E5EL2TMSI37762XCI73INFLILF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace or drop the legacy header that is subject to remove.
Not all of them were compile-tested, the series might have
hidden compilation errors.

In v2:
- added tags (Kuninori, Charles)
- ripped out TAS2781 (it's a mess from GPIO handling perspective)

Andy Shevchenko (6):
  ASoC: codecs: Remove unused of_gpio.h
  ASoC: fsl: Remove unused of_gpio.h
  ASoC: rockchip: Remove unused of_gpio.h
  ASoC: codecs: Replace of_gpio.h by proper one
  ASoC: generic: Replace of_gpio.h by proper one
  ASoC: samsung: Replace of_gpio.h by proper one

 sound/soc/codecs/ak4118.c                           | 1 -
 sound/soc/codecs/ak4458.c                           | 1 -
 sound/soc/codecs/aw88395/aw88395.c                  | 2 +-
 sound/soc/codecs/aw88399.c                          | 1 -
 sound/soc/codecs/cs53l30.c                          | 1 -
 sound/soc/codecs/max98390.c                         | 1 -
 sound/soc/codecs/pcm3168a.c                         | 1 -
 sound/soc/codecs/rk817_codec.c                      | 1 -
 sound/soc/codecs/tas2552.c                          | 1 -
 sound/soc/codecs/tas2764.c                          | 1 -
 sound/soc/codecs/tas2770.c                          | 1 -
 sound/soc/codecs/tas2780.c                          | 1 -
 sound/soc/codecs/tlv320adc3xxx.c                    | 1 -
 sound/soc/codecs/tlv320adcx140.c                    | 1 -
 sound/soc/codecs/tlv320aic31xx.c                    | 1 -
 sound/soc/codecs/ts3a227e.c                         | 1 -
 sound/soc/codecs/wsa883x.c                          | 1 -
 sound/soc/fsl/imx-es8328.c                          | 1 -
 sound/soc/fsl/imx-rpmsg.c                           | 2 --
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
 sound/soc/rockchip/rockchip_i2s.c                   | 1 -
 sound/soc/rockchip/rockchip_spdif.c                 | 1 -
 sound/soc/samsung/aries_wm8994.c                    | 2 +-
 23 files changed, 4 insertions(+), 24 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

