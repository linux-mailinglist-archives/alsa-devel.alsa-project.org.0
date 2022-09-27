Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682D5EC5EB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 16:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EC6282A;
	Tue, 27 Sep 2022 16:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EC6282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664288619;
	bh=Nq7nXZGauIeWT/K4KpIpeLP9wsoW2oAKiz3xhMaBDg8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYdifG1m9gmLatVjAQyiBG5P8HyS2Au6lGdUY0fDGls4rSHGy7YzGo5WRx3YYi3Xp
	 qJV+gRPzH3bNzxoA3e1x6DGJRZUU2ncprBZkGWTFkXUZ8VyEXBatZE87zvLuw/WJHz
	 NyX6izK91wbWumOIwYzKEgbgPwdtVajVMUgBTMVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A15F804D9;
	Tue, 27 Sep 2022 16:22:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F65CF804D0; Tue, 27 Sep 2022 16:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A46F800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 16:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A46F800AA
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McMFh539rzpSxX;
 Tue, 27 Sep 2022 22:19:36 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 22:22:31 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 22:22:31 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>
Subject: [PATCH v2 -next 0/2] Fix PM disable depth imbalance in stm32 probe
Date: Tue, 27 Sep 2022 22:25:59 +0800
Message-ID: <20220927142601.64266-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
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

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced. We fix it by moving pm_runtime_enable to the
endding of probe.
v2:
- Add reviewed-by

Zhang Qilong (2):
  ASoC: stm32: dfsdm: Fix PM disable depth imbalance in
    stm32_adfsdm_probe
  ASoC: stm32: spdifrx: Fix PM disable depth imbalance in
    stm32_spdifrx_probe

 sound/soc/stm/stm32_adfsdm.c  | 8 +++++---
 sound/soc/stm/stm32_spdifrx.c | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.25.1

