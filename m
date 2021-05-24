Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CDF38FBE0
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 09:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 198BD165D;
	Tue, 25 May 2021 09:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 198BD165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621928238;
	bh=QRfTlf3kFwJ2NXgW+r16gIHc+Qoetx7Zd+MTRjCxUso=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ms52yh4+D4itKcFJgCk2DkSMYBSOOQ5iakPXVZJX/Zm7kl74q0MsR557VZwjXKxw7
	 LDcuTPBr+8JZwZn58N9/3yKI6Zm5IsitAwamE/NcRrMBQdp+wCG83qZzXuiDFW+zCn
	 kp0LdYGpH4yFM5DnH0RqleMMrMlt0bA9l7gqgsjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91609F801F5;
	Tue, 25 May 2021 09:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5765F8022B; Mon, 24 May 2021 04:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD5DF80149
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 04:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD5DF80149
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FpLwX4x76zmZNT;
 Mon, 24 May 2021 10:37:48 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 10:40:06 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 10:40:05 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>
Subject: [PATCH] ASoC: core: Fix Null-point-dereference in fmt_single_name()
Date: Mon, 24 May 2021 10:49:41 +0800
Message-ID: <20210524024941.159952-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 May 2021 09:35:47 +0200
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Kefeng Wang <wangkefeng.wang@huawei.com>
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

Check the return value of devm_kstrdup() in case of
Null-point-dereference.

Fixes: 45dd9943fce0 ("ASoC: core: remove artificial component and DAI name constraint")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 1c0904acb935..a76974ccfce1 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2225,6 +2225,8 @@ static char *fmt_single_name(struct device *dev, int *id)
 		return NULL;
 
 	name = devm_kstrdup(dev, devname, GFP_KERNEL);
+	if (!name)
+		return NULL;
 
 	/* are we a "%s.%d" name (platform and SPI components) */
 	found = strstr(name, dev->driver->name);
-- 
2.26.2

