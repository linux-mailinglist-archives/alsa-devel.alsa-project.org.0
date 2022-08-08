Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05B58C2DC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 07:31:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C2074E;
	Mon,  8 Aug 2022 07:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C2074E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659936680;
	bh=CCVJU6XqXKfXXPQz0m0S3G0nvgj/jMXEbMTpUpX/Oe4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I+RxU86FqVnwqxxI7OINHqzqTryeNOCSNUiTnpcJjPQah3K2QNkZLuHhA5S53k3nu
	 M4LAvhW/hcU2H5mtv1RCZUsatfPi4hZMG6KF0YoUPv6KIwWGEsj0ByVo/lvhwhaUx9
	 vj2JM58X5YVPX2qZpjo0UemYNeenaCZOXKkF2GEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E714EF80430;
	Mon,  8 Aug 2022 07:30:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AA0EF80510; Mon,  8 Aug 2022 07:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=NO_DNS_FOR_FROM,RDNS_NONE,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rtits2.realtek.com.tw (unknown [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 5DB47F8057D
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 07:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DB47F8057D
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2785SiWG2011013,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2785SiWG2011013
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Mon, 8 Aug 2022 13:28:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 8 Aug 2022 13:28:54 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 8 Aug 2022 13:28:53 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5640: Fix the JD voltage dropping issue
Date: Mon, 8 Aug 2022 13:28:36 +0800
Message-ID: <20220808052836.25791-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/08/2022 04:50:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzgvOCCkV6TIIDAyOjU4OjAw?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, jacal_tseng@realtek.com, albertchen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com,
 Mohan Kumar D <mkumard@nvidia.com>, flove@realtek.com
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

The patch fixes the JD voltage dropping issue in the HDA JD using.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reported-by: Mohan Kumar D <mkumard@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 38ab8d4291c..5a844329800 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1986,7 +1986,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component, RT5640_PWR_MIXER, 0x0000);
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
 			snd_soc_component_write(component, RT5640_PWR_ANLG1,
-				0x0018);
+				0x2818);
 		else
 			snd_soc_component_write(component, RT5640_PWR_ANLG1,
 				0x0000);
@@ -2600,7 +2600,8 @@ static void rt5640_enable_hda_jack_detect(
 	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x400, 0x0);
 
 	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
-		RT5640_PWR_VREF2, RT5640_PWR_VREF2);
+		RT5640_PWR_VREF2 | RT5640_PWR_MB | RT5640_PWR_BG,
+		RT5640_PWR_VREF2 | RT5640_PWR_MB | RT5640_PWR_BG);
 	usleep_range(10000, 15000);
 	snd_soc_component_update_bits(component, RT5640_PWR_ANLG1,
 		RT5640_PWR_FV2, RT5640_PWR_FV2);
-- 
2.34.1

