Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44085F8577
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Oct 2022 15:39:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5AAA163E;
	Sat,  8 Oct 2022 15:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5AAA163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665236397;
	bh=S4Rw4paKJ5VFdeojuiR4BvoBOpZNeqzsdZ/SL1xP7Hc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WHF0dudMNp7qjA8/DFdHcdg9rjvCOOFysKSdyA7UmmU9JUvuMOnspt4lMlWy1d7Sr
	 nRdrTYISp0nGzjV3f2X6v/d+O1/T3QaLojom9oBDLK1B6506+Shajxi5ZSqgGbIDfx
	 TxhvM8f6hVJWaJ/8kgg8o9KAP3VeQakrD7IIFvf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09A35F804D6;
	Sat,  8 Oct 2022 15:39:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A415F804D6; Sat,  8 Oct 2022 15:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABF9CF8012B
 for <alsa-devel@alsa-project.org>; Sat,  8 Oct 2022 15:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABF9CF8012B
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ml5ml6jfyzkXvR;
 Sat,  8 Oct 2022 21:36:23 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 21:38:51 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 8 Oct
 2022 21:38:50 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>
Subject: [PATCH -next 0/3] Revert old "Fix PM disable depth imbalance in
 wmxxxx_probe"
Date: Sat, 8 Oct 2022 21:43:55 +0800
Message-ID: <20221008134358.131712-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
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

Both the old and new patch have been applied, it will resulted in
redundant calling of pm_runtime_disable when error returns. We Just
revert the old three patches to fix it.

Zhang Qilong (3):
  Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
  Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
  Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"

 sound/soc/codecs/wm5102.c | 6 +++---
 sound/soc/codecs/wm5110.c | 6 +++---
 sound/soc/codecs/wm8997.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.25.1

