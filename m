Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E8777908
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:03:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3AF784D;
	Thu, 10 Aug 2023 15:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3AF784D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672637;
	bh=1rhxfDs7YDrceu9fCk+AMtQLNvr568H/URQRYaDGlyc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q/gVc5jI8Ikhs83Z/6kOguabOvIGeF5exK2fGrrRqIWWQOibari5In33eNtpE0qD4
	 9JFb0S17A06j+kTIImEacz95/GTcc6gYUEgCoWELk+it7mnU95JcHdgM+5sTS6fVbb
	 mC9pZv6G8SyEGwJ2ukgRgq/nEGdbPmHehWNs3qCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC1ABF805B4; Thu, 10 Aug 2023 15:01:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E3BF805B4;
	Thu, 10 Aug 2023 15:01:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B0A8F80508; Thu, 10 Aug 2023 13:48:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B101F800FB;
	Thu, 10 Aug 2023 13:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B101F800FB
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RM4pS6rDjzCrMw;
	Thu, 10 Aug 2023 19:44:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500012.china.huawei.com
 (7.221.188.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 10 Aug
 2023 19:48:01 +0800
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
Subject: [PATCH -next 2/2] ASoC: SOF: ipc3: Use devm_kmemdup to replace
 devm_kmalloc + memcpy
Date: Thu, 10 Aug 2023 19:47:38 +0800
Message-ID: <20230810114738.2103792-3-lizetao1@huawei.com>
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
Message-ID-Hash: VGBNVVZD62F4ORN24ADLG2RRAMFK5JXU
X-Message-ID-Hash: VGBNVVZD62F4ORN24ADLG2RRAMFK5JXU
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGBNVVZD62F4ORN24ADLG2RRAMFK5JXU/>
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
 sound/soc/sof/ipc3.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 33df028d4854..fb40378ad084 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -567,13 +567,10 @@ int sof_ipc3_get_cc_info(struct snd_sof_dev *sdev,
 	/* create read-only cc_version debugfs to store compiler version info */
 	/* use local copy of the cc_version to prevent data corruption */
 	if (sdev->first_boot) {
-		sdev->cc_version = devm_kmalloc(sdev->dev, cc->ext_hdr.hdr.size,
-						GFP_KERNEL);
-
+		sdev->cc_version = devm_kmemdup(sdev->dev, cc, cc->ext_hdr.hdr.size, GFP_KERNEL);
 		if (!sdev->cc_version)
 			return -ENOMEM;
 
-		memcpy(sdev->cc_version, cc, cc->ext_hdr.hdr.size);
 		ret = snd_sof_debugfs_buf_item(sdev, sdev->cc_version,
 					       cc->ext_hdr.hdr.size,
 					       "cc_version", 0444);
-- 
2.34.1

