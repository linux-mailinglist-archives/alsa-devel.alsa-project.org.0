Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BB3ACCEF
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 15:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1713A1711;
	Fri, 18 Jun 2021 15:57:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1713A1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624024727;
	bh=4a3LIlfuZVIahdgAVLFMOAKLxo3VwvjFmVdLQzOCXgk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eOnK+43F1P+4dSK9YcCPr9RW1L7cKfse3c1tqfs/ZUu1BuiV0+Sbq1lVIUqybhtwl
	 E8DQPfh+/VJUkI266XagRl9gKpPIcnawyEdHyiusuXJsHyXYrRGVF2afDpbpHlXK1M
	 L8SwF8DwbjKsy9fPwL+BPlR3kuFS6Pb9KpcsECkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B17F80424;
	Fri, 18 Jun 2021 15:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54BB5F8032D; Fri, 18 Jun 2021 15:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5BB6F8032D
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 15:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5BB6F8032D
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G60hz6R0SzXfb6;
 Fri, 18 Jun 2021 21:52:03 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 21:57:08 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 21:57:07 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH -next 0/2] Fix unbalanced pm_runtime_enable in error handle
Date: Fri, 18 Jun 2021 22:11:02 +0800
Message-ID: <20210618141104.105047-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

This two patches fixed the unbalanced PM disable depth. It could
avoid pm_runtime implementation complains when removing and probing
again the driver.

Zhang Qilong (2):
  ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in
    mt8192_afe_pcm_dev_probe
  ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in
    mt8183_afe_pcm_dev_probe

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 43 ++++++++++++++--------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 27 +++++++++-----
 2 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.31.1

