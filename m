Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F2737D17
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 10:09:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1336C1;
	Wed, 21 Jun 2023 10:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1336C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687334950;
	bh=9oVIHwDNK6BensKHs81O5bNkv4Ac1SFzcewgoYIYqqA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K9IlKyS2oYEJDGWM2UZuHrS5JtR1BgDrBR35dskiJuYhGpRQuR2XRov6iT7+O8e8e
	 74rD9DiqiumsTa3vUcpgJliPSQXdt5accnxlsW/QbjlnWKa/Dt+oVdUBmu0dht+urV
	 WKFy8gDZ4QCJ7scaFMd4WVNcbg6QexsULh7f3SDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A643FF80124; Wed, 21 Jun 2023 10:08:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96A74F80141;
	Wed, 21 Jun 2023 10:08:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6535F80163; Wed, 21 Jun 2023 10:08:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FBDF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 10:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94FBDF80124
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 35L87bY52031637,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 35L87bY52031637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 21 Jun 2023 16:07:37 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 21 Jun 2023 16:07:58 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 21 Jun 2023 16:07:58 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <shumingf@realtek.com>,
        <derek.fang@realtek.com>, <jack.yu@realtek.com>
Subject: [PATCH] ASoC: rt722-sdca: Remove redundant sdca mask
Date: Wed, 21 Jun 2023 16:07:50 +0800
Message-ID: <20230621080750.13511-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: CWOHH4M5S6PRS7PM3XRRCDBXT5XOFCAF
X-Message-ID-Hash: CWOHH4M5S6PRS7PM3XRRCDBXT5XOFCAF
X-MailFrom: jack.yu@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWOHH4M5S6PRS7PM3XRRCDBXT5XOFCAF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove redundant sdca mask for clear code.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 2 +-
 sound/soc/codecs/rt722-sdca.c     | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index cc57e4e27805..a9416bd163e8 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -175,7 +175,7 @@ static int rt722_sdca_update_status(struct sdw_slave *slave,
 		 * This also could sync with the cache value as the rt722_sdca_jack_init set.
 		 */
 			sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0 | SDW_SCP_SDCA_INTMASK_SDCA_6);
+				SDW_SCP_SDCA_INTMASK_SDCA_6);
 			sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK2,
 				SDW_SCP_SDCA_INTMASK_SDCA_8);
 		}
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 9c0d34366c9e..0e1c65a20392 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -191,8 +191,7 @@ static void rt722_sdca_jack_detect_handler(struct work_struct *work)
 		return;
 
 	/* SDW_SCP_SDCA_INT_SDCA_6 is used for jack detection */
-	if (rt722->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_6 ||
-		rt722->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_0) {
+	if (rt722->scp_sdca_stat1 & SDW_SCP_SDCA_INT_SDCA_6) {
 		ret = rt722_sdca_headset_detect(rt722);
 		if (ret < 0)
 			return;
-- 
2.40.1

