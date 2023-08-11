Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D7778870
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6195828;
	Fri, 11 Aug 2023 09:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6195828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691739718;
	bh=F++/TBO/j03K2EQmjQ1A0/mJ61XDXml0RFX2a9Ri4wI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o1QgO5egoUv+E2PMY/6o3WfmNRqEpP+dvUBcxFZgv9Np4ekwgsOq7RIQ30BLz726c
	 v0aCK9Mmwl5FQsygyk6As3SWdWH7F8mInYOBXpNvMw8LCKlBKkAwVqkuNAK3a0O3xZ
	 Mg5F63mn8bzaS957XPcJKwe/dmDzWpWjRy+PxmxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5445F805BA; Fri, 11 Aug 2023 09:39:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C69F805B6;
	Fri, 11 Aug 2023 09:39:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74240F80510; Fri, 11 Aug 2023 09:15:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D359DF800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 09:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D359DF800EE
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RMZhz5Yd9zCrk9;
	Fri, 11 Aug 2023 15:11:31 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:14:59 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <claudiu.beznea@tuxon.dev>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <peda@axentia.se>, <lars@metafoo.de>,
	<nuno.sa@analog.com>, <povik+lin@cutebit.org>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <asahi@lists.linux.dev>,
	<linux-sunxi@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/5] sound: Remove redundant of_match_ptr() macro
Date: Fri, 11 Aug 2023 15:14:21 +0800
Message-ID: <20230811071426.2343133-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-MailFrom: ruanjinjie@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CFVVM7QDAZDYTB22JXWD7HCJGT7WNRX2
X-Message-ID-Hash: CFVVM7QDAZDYTB22JXWD7HCJGT7WNRX2
X-Mailman-Approved-At: Fri, 11 Aug 2023 07:39:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFVVM7QDAZDYTB22JXWD7HCJGT7WNRX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since these sound drivers depend on CONFIG_OF, there is
no need to wrap the macro of_match_ptr() here.

Ruan Jinjie (5):
  ASoC: atmel: Remove redundant of_match_ptr()
  ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
  ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
  ASoC: ssm3515: Remove redundant of_match_ptr()
  ALSA: Remove redundant of_match_ptr()

 sound/drivers/serial-generic.c   | 2 +-
 sound/soc/atmel/atmel-i2s.c      | 2 +-
 sound/soc/atmel/atmel-pdmic.c    | 2 +-
 sound/soc/atmel/mchp-i2s-mcc.c   | 2 +-
 sound/soc/atmel/mchp-spdifrx.c   | 2 +-
 sound/soc/atmel/mchp-spdiftx.c   | 2 +-
 sound/soc/atmel/tse850-pcm5142.c | 2 +-
 sound/soc/codecs/ssm3515.c       | 2 +-
 sound/soc/sunxi/sun4i-spdif.c    | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1

