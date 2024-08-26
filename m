Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1EE960987
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 14:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE675EC1;
	Tue, 27 Aug 2024 14:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE675EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724760290;
	bh=07YHEvvzJ+ri63RFfz6j3YSCckGbtMiGXtm3i6eRbLo=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ln18jierKclWsE1E73GLVubGlAQ88xNc/i9eC0s3s4R3eC4Sh/WqBtfNgvM3bOSq+
	 9bsq1YpjIPsRTJrOUhH4Njvyf1tosZ8W7ZUBvWCczZGF6FdiPYEQhUwWi3x9kXgHVP
	 7dryzv+gqTwGJ8vP3b0ud7DTY77Y+89G0wm0Uxzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0330FF8063A; Tue, 27 Aug 2024 14:03:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B8C4F805B0;
	Tue, 27 Aug 2024 14:03:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BFE3F80087; Mon, 26 Aug 2024 11:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AC5BF80087
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 10:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC5BF80087
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wsl0d6f9jz14Dk8;
	Mon, 26 Aug 2024 16:56:49 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 5DCEE1800A7;
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
Subject: [PATCH -next 0/4] ASoC: fix module autoloading
Date: Mon, 26 Aug 2024 08:49:20 +0000
Message-ID: <20240826084924.368387-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Message-ID-Hash: ZSMG6BXW6CQHUW2DXL6PDHKIYSEAMYAR
X-Message-ID-Hash: ZSMG6BXW6CQHUW2DXL6PDHKIYSEAMYAR
X-Mailman-Approved-At: Tue, 27 Aug 2024 12:02:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSMG6BXW6CQHUW2DXL6PDHKIYSEAMYAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi all,

This patchset aims to enable autoloading of some use modules.
By registering MDT, the kernel is allowed to automatically bind 
modules to devices that match the specified compatible strings.

Liao Chen (4):
  ASoC: intel: fix module autoloading
  ASoC: google: fix module autoloading
  ASoC: tda7419: fix module autoloading
  ASoC: fix module autoloading

 sound/soc/codecs/chv3-codec.c          | 1 +
 sound/soc/codecs/tda7419.c             | 1 +
 sound/soc/google/chv3-i2s.c            | 1 +
 sound/soc/intel/keembay/kmb_platform.c | 1 +
 4 files changed, 4 insertions(+)

-- 
2.34.1

