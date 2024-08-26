Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1380D960984
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 14:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B098BE7F;
	Tue, 27 Aug 2024 14:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B098BE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724760269;
	bh=xIeOdHl759IGucjrXycsnNIQn5ujjKHlbnv6vH7Q4ss=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aExNciXRv0u6zwUFjAn0+7ao+FhnA89n8BqGfti4vAPWK7RXWIHHbvSW2cvUf/3fE
	 nuf0cwZc4v6J+c6Ju3eEs7ZRBWOKjp30tH0iYAzJtMz6+hSrlUI6Uj8hkUCmFS2vgC
	 qDxS3YxzjoVcR2iajKL2Msvfhy86rvKZkx8ArvBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9399FF80614; Tue, 27 Aug 2024 14:03:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E89F8060D;
	Tue, 27 Aug 2024 14:03:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09E22F80494; Mon, 26 Aug 2024 10:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 111A9F80423
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 10:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 111A9F80423
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wskzc6QSTzpTYc;
	Mon, 26 Aug 2024 16:55:56 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id BBF4A14037E;
	Mon, 26 Aug 2024 16:57:35 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 26 Aug
 2024 16:57:35 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <liaochen4@huawei.com>,
	<u.kleine-koenig@pengutronix.de>, <andy.shevchenko@gmail.com>,
	<kuninori.morimoto.gx@renesas.com>, <robh@kernel.org>
Subject: [PATCH -next 2/4] ASoC: google: fix module autoloading
Date: Mon, 26 Aug 2024 08:49:22 +0000
Message-ID: <20240826084924.368387-3-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826084924.368387-1-liaochen4@huawei.com>
References: <20240826084924.368387-1-liaochen4@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-MailFrom: liaochen4@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: O3EVGX75G6F2J52UWEGISAOZAQGYCO5M
X-Message-ID-Hash: O3EVGX75G6F2J52UWEGISAOZAQGYCO5M
X-Mailman-Approved-At: Tue, 27 Aug 2024 12:02:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3EVGX75G6F2J52UWEGISAOZAQGYCO5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 sound/soc/google/chv3-i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 08e558f24af8..0ff24653d49f 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -322,6 +322,7 @@ static const struct of_device_id chv3_i2s_of_match[] = {
 	{ .compatible = "google,chv3-i2s" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, chv3_i2s_of_match);
 
 static struct platform_driver chv3_i2s_driver = {
 	.probe = chv3_i2s_probe,
-- 
2.34.1

