Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6027369A37B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 02:38:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4005EC5;
	Fri, 17 Feb 2023 02:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4005EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676597930;
	bh=nZ48bL2nDC0jDj02u01EfLV1iBL1rit/oK436TBHbCw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fgbhSgusTkwRowl9TynLJ8LYtigoejacWMwXB3gHsdn0Dc2gQVfnwLoGrg7sEvGSv
	 /UDXM9EaRF02xcwhb6t925AUXLjH8rWqsmnpT/P31VJgFM3nrusp5BuxOTt+5iyyTu
	 Juhl6vK9j2NL8od50K8TYXXzvhFPUij2p0jKaabE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2949AF800E4;
	Fri, 17 Feb 2023 02:38:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43C56F80171; Fri, 17 Feb 2023 02:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0C8FF800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 02:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C8FF800B6
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PHvXX0pQszGp2D;
	Fri, 17 Feb 2023 09:35:56 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 17 Feb
 2023 09:37:44 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: soc-ac97: fix wrong pointer pass to PTR_ERR()
Date: Fri, 17 Feb 2023 09:37:02 +0800
Message-ID: <20230217013702.4009448-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
Message-ID-Hash: 735MTM5Z4T6UDW54D5RNNJQT547KP3MK
X-Message-ID-Hash: 735MTM5Z4T6UDW54D5RNNJQT547KP3MK
X-MailFrom: yangyingliang@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 andriy.shevchenko@linux.intel.com, yangyingliang@huawei.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/735MTM5Z4T6UDW54D5RNNJQT547KP3MK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix wrong pointer pass to PTR_ERR() if devm_gpiod_get_index() fails.

Fixes: 3ee0d39c50dc ("ASoC: soc-ac97: Convert to agnostic GPIO API")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/soc-ac97.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 40051f513c6a..4e4fe29ade50 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -336,12 +336,12 @@ static int snd_soc_ac97_parse_pinctl(struct device *dev,
 
 	cfg->sdata_gpio = devm_gpiod_get_index(dev, "ac97", 1, GPIOD_ASIS);
 	if (IS_ERR(cfg->sdata_gpio))
-		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-sdata gpio\n");
+		return dev_err_probe(dev, PTR_ERR(cfg->sdata_gpio), "Can't find ac97-sdata gpio\n");
 	gpiod_set_consumer_name(cfg->sdata_gpio, "AC97 link sdata");
 
 	cfg->reset_gpio = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_ASIS);
 	if (IS_ERR(cfg->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-reset gpio\n");
+		return dev_err_probe(dev, PTR_ERR(cfg->reset_gpio), "Can't find ac97-reset gpio\n");
 	gpiod_set_consumer_name(cfg->reset_gpio, "AC97 link reset");
 
 	return 0;
-- 
2.25.1

