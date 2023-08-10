Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA03777909
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4AC7828;
	Thu, 10 Aug 2023 15:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4AC7828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672653;
	bh=XJecVbWsQbddEitctmlg05mQxMRQUazsqb5hAR7kMOQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kIolBYZo3ZHY0Pvb+4kZGyWzYPgEHpESKqLFEteezZTtxP8x9krcsxKXNRobZAE5H
	 Yzx2jUtCSI0ceQydCLzoxlSo8Mdyg5cYPa4bVAXCPq4LzebMgVpLmsvxqqBaUQc1gB
	 h0ZQiFzBY1xA1LZ0sXaJF7RMZUetu28eHre8ePDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76C9BF805C6; Thu, 10 Aug 2023 15:01:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B38F805C1;
	Thu, 10 Aug 2023 15:01:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F198F801EB; Thu, 10 Aug 2023 13:48:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32FA6F800F4;
	Thu, 10 Aug 2023 13:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32FA6F800F4
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RM4s42xQ1z1L9tJ;
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
Subject: [PATCH -next 0/2] Use devm_kmemdup to replace devm_kmalloc + memcpy
Date: Thu, 10 Aug 2023 19:47:36 +0800
Message-ID: <20230810114738.2103792-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Message-ID-Hash: E7E7NMW3BYCSSCCHD3AZXGXLPRA4A2OK
X-Message-ID-Hash: E7E7NMW3BYCSSCCHD3AZXGXLPRA4A2OK
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7E7NMW3BYCSSCCHD3AZXGXLPRA4A2OK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch set use the helper function devm_kmemdup() to replace
devm_kmalloc + memcpy, which is the same as implementing the function
separately.

Li Zetao (2):
  ASoC: tas5805m: Use devm_kmemdup to replace devm_kmalloc + memcpy
  ASoC: SOF: ipc3: Use devm_kmemdup to replace devm_kmalloc + memcpy

 sound/soc/codecs/tas5805m.c | 3 +--
 sound/soc/sof/ipc3.c        | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
2.34.1

