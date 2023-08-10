Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2977790A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B5C9AE9;
	Thu, 10 Aug 2023 15:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B5C9AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672661;
	bh=jmdfjuTPqYmWMBgd1Eep1jdqWDWMg2dFHeTG03z3bXU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wn7mcHQo8LcPds+zjJXb9jLdLtIGvNqqEDE5bLHTfRGiFLVFllH8/8WAWf+7so8yQ
	 rdJxW/oj+tWq8QVZRTkyLf+1bE1uO9kz+3v4bpeGzwa32+7RSWnH92Dim2CAvpGvoq
	 C87J2ooN/ZMbj4TyHVgjA9O1vNxJA/uuNhX7IsAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5627AF805D4; Thu, 10 Aug 2023 15:01:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D30EDF805CA;
	Thu, 10 Aug 2023 15:01:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE73EF8016E; Thu, 10 Aug 2023 13:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73379F80166;
	Thu, 10 Aug 2023 13:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73379F80166
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RM4s475ZRz1L9r1;
	Thu, 10 Aug 2023 19:46:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 19:48:00 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <daniel.baluta@nxp.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.beer@igorinstitute.com>,
	<Jonathan.Cameron@huawei.com>, <luca.ceresoli@bootlin.com>,
	<luzmaximilian@gmail.com>, <u.kleine-koenig@pengutronix.de>
CC: <lizetao1@huawei.com>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH -next 1/2] ASoC: tas5805m: Use devm_kmemdup to replace
 devm_kmalloc + memcpy
Date: Thu, 10 Aug 2023 19:47:37 +0800
Message-ID: <20230810114738.2103792-2-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810114738.2103792-1-lizetao1@huawei.com>
References: <20230810114738.2103792-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-MailFrom: lizetao1@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SYCCBXJYCYJORBII3TM5OY4OETAPAODD
X-Message-ID-Hash: SYCCBXJYCYJORBII3TM5OY4OETAPAODD
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYCCBXJYCYJORBII3TM5OY4OETAPAODD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the helper function devm_kmemdup() rather than duplicating its
implementation, which helps to enhance code readability.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 sound/soc/codecs/tas5805m.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index aca3756ffab6..3b53eba38a0b 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -520,12 +520,11 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 	}
 
 	tas5805m->dsp_cfg_len = fw->size;
-	tas5805m->dsp_cfg_data = devm_kmalloc(dev, fw->size, GFP_KERNEL);
+	tas5805m->dsp_cfg_data = devm_kmemdup(dev, fw->data, fw->size, GFP_KERNEL);
 	if (!tas5805m->dsp_cfg_data) {
 		release_firmware(fw);
 		return -ENOMEM;
 	}
-	memcpy(tas5805m->dsp_cfg_data, fw->data, fw->size);
 
 	release_firmware(fw);
 
-- 
2.34.1

