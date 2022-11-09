Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF762267B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101AF823;
	Wed,  9 Nov 2022 10:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101AF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667985226;
	bh=OoP0fsJJXRrY9R+KUb3wvnCgDIL0OPcVMKGjrXs7K9k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nxcUjaTSvfNrrO0LFkDAwtUk7H4RniWdBMV7UHQkj7rllECKZx8hkhJm/tkSofwyp
	 E8F6hgYuKaBlew2YkNa5Dk8JPlRreTttozYfYlzipoQk8v2GsTWbHxjK172nV+pJyL
	 WCTTc264NaElUxV3vB7q6EUWsSny3F/GTGsCHVek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5A5F8023B;
	Wed,  9 Nov 2022 10:12:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EAFF80114; Wed,  9 Nov 2022 10:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id AFC7DF80114
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC7DF80114
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A99BoEwA021930,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A99BoEwA021930
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Wed, 9 Nov 2022 17:11:50 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 9 Nov 2022 17:12:29 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 9 Nov 2022 17:12:28 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 0/4] Set BQ parameters for some Dell models
Date: Wed, 9 Nov 2022 17:12:22 +0800
Message-ID: <20221109091222.17162-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2022 08:52:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzExLzkgpFekyCAwNzoxNTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jauliang@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, jfmiranda@gmail.com, flove@realtek.com,
 pierre-louis.bossart@intel.com
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

From: Shuming Fan <shumingf@realtek.com>

There are some Dell SKUs that need to set the parameters of the crossover filter (biquad).
Each amplifier connects to one tweeter speaker and one woofer speaker.
We should control HPF/LPF to output the proper frequency for the different speakers.
If the codec driver got the BQ parameters from the device property, it will apply these 
parameters to the hardware.

Shuming Fan (4):
  ASoC: rt1308-sdw: get BQ params property and apply them
  ASoC: rt1316-sdw: get BQ params property and apply them
  ASoC: Intel: sof_sdw_rt1308: add BQ params for the Dell models
  ASoC: Intel: sof_sdw_rt1316: add BQ params for the Dell models

 sound/soc/codecs/rt1308-sdw.c                 |  39 +++
 sound/soc/codecs/rt1308-sdw.h                 |   2 +
 sound/soc/codecs/rt1316-sdw.c                 |  39 +++
 sound/soc/codecs/rt1316-sdw.h                 |   2 +
 sound/soc/intel/boards/sof_sdw.c              |   2 +
 .../intel/boards/sof_sdw_amp_coeff_tables.h   | 300 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h       |   3 +
 sound/soc/intel/boards/sof_sdw_rt1308.c       | 120 +++++++
 sound/soc/intel/boards/sof_sdw_rt1316.c       | 119 +++++++
 9 files changed, 626 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h

-- 
2.38.1

