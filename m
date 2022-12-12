Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61864A90A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:59:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA5D2A46;
	Mon, 12 Dec 2022 21:58:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA5D2A46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878768;
	bh=KVIdx677z1CmHj0pCRhJu1OwSjedx0eoXWO8TGKih94=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GzXndD5RYOBcPtQEgZ9BlU6260STaMxJPJXfDcPaBx5nXzR+uHqDO9o+6BOalF4/k
	 hWwSg/rVGz/tl8JiTVddcwWyJe53FXA+rTYnQPVNRMZQ2OcP3/vyw8W5ILMcddnnr2
	 uSD2Ik1PdONiYYOfFuRqCidDK1Xouvn8dlakmPwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC325F805C1;
	Mon, 12 Dec 2022 21:55:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 286AFF805BF; Mon, 12 Dec 2022 21:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE01F805B6
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE01F805B6
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poW-00015r-CC; Mon, 12 Dec 2022 21:54:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poP-00463n-C6; Mon, 12 Dec 2022 21:54:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poP-004ahQ-9A; Mon, 12 Dec 2022 21:54:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/15] ASoC: Drop empty platform remove functions
Date: Mon, 12 Dec 2022 21:53:51 +0100
Message-Id: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2095;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OFeqJ5svHAr/6hba7RW1SC7E2lDk/APU5pVRHLqjYsA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5S23A7EIBbyukC8k3+T+EIiTmhgI0FDjj7wlAUk
 RNtfwL6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eUtgAKCRDB/BR4rcrsCRkKB/
 0RocMtKm8RInXzqBHwgBSH+aR0V7IsoOvm16jXsy9Dv9EgnYNDvRRmIGPNaO0LC30aWAvxnfhP0uPp
 Ox+7L3CHxr2zxph8r6jPlgAvVhd1Thh1/HchzGNBlG+pNY+ep6gu+BMIlC5jYJKl1SPN/HMeGplBLk
 r1A6+buc3YrELz1LP7EWYvG4THqQE7pclc+ctKGsBOI7gdjHWQT+kl+1jRO/z9vVLYQkaw4DPrJDna
 RPXShpl/FrNfu0rUSqaxB2ASjraGXjcrmoUL2oKW516i3FQ1eH4QyHdzlHHkzwhdh/S3ws7xMHUJU6
 G42vUPw6mdGhNF9NeYA//uUqA04upf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, kernel@pengutronix.de,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Daniel Mack <daniel@zonque.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Uwe Kleine-König <uwe@kleine-koenig.org>

Hello,

this patch series removes all platform remove functions that only return
zero below sound/soc. There is no reason to have these, as the only
caller is platform core code doing:

        if (drv->remove) {
                int ret = drv->remove(dev);

                ...
        }

(in platform_remove()) and so having no remove function is both
equivalent and simpler.

Best regards
Uwe

Uwe Kleine-König (15):
  ASoC: pxa: Drop empty platform remove function
  ASoC: amd: Drop empty platform remove function
  ASoC: atmel-classd: Drop empty platform remove function
  ASoC: atmel-pdmic: Drop empty platform remove function
  ASoC: 88pm860x: Drop empty platform remove function
  ASoC: ac97: Drop empty platform remove function
  ASoC: adau7002: Drop empty platform remove function
  ASoC: bt-sco: Drop empty platform remove function
  ASoC: cq93vc: Drop empty platform remove function
  ASoC: mc13783: Drop empty platform remove function
  ASoC: wl1273: Drop empty platform remove function
  ASoC: pxa: e740_wm9705: Drop empty platform remove function
  ASoC: pxa: e750_wm9705: Drop empty platform remove function
  ASoC: pxa: e800_wm9712: Drop empty platform remove function
  ASoC: SOF: nocodec: Drop empty platform remove function

 sound/soc/amd/raven/acp3x-i2s.c   | 8 --------
 sound/soc/atmel/atmel-classd.c    | 6 ------
 sound/soc/atmel/atmel-pdmic.c     | 6 ------
 sound/soc/codecs/88pm860x-codec.c | 6 ------
 sound/soc/codecs/ac97.c           | 6 ------
 sound/soc/codecs/adau7002.c       | 6 ------
 sound/soc/codecs/bt-sco.c         | 6 ------
 sound/soc/codecs/cq93vc.c         | 6 ------
 sound/soc/codecs/mc13783.c        | 6 ------
 sound/soc/codecs/wl1273.c         | 6 ------
 sound/soc/pxa/e740_wm9705.c       | 6 ------
 sound/soc/pxa/e750_wm9705.c       | 6 ------
 sound/soc/pxa/e800_wm9712.c       | 6 ------
 sound/soc/pxa/spitz.c             | 6 ------
 sound/soc/sof/nocodec.c           | 6 ------
 15 files changed, 92 deletions(-)


base-commit: 3a28c2c89f4b412b648761430720d40a8dc326ef
-- 
2.38.1

