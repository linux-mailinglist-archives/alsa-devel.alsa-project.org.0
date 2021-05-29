Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DC8394B3E
	for <lists+alsa-devel@lfdr.de>; Sat, 29 May 2021 11:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2DB816BE;
	Sat, 29 May 2021 11:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2DB816BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622279810;
	bh=Q68c7+7KHRrQs2nkWN9aopb1jMaIkk0KREt0dDohBgw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MPGIMA0GVU7hax4vColM5Gm8Cd+aXe+viETcUc0m27L7gUwXXZHBWbKvZLK/K9Ros
	 RFz6a7TgkliY3OPjHNLp1/0+YrV8zwkFrvqMPU1IJoTOl8V61kB6tGhzviKLNzQoVu
	 jBh9UmDYJWFEWFOyXOaWlXByTexEhZwwBJ/d4D20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C63F8025C;
	Sat, 29 May 2021 11:15:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D857AF80169; Sat, 29 May 2021 11:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 432D3F8013A
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 11:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 432D3F8013A
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FsbRQ29TdzYqPl;
 Sat, 29 May 2021 17:12:18 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 17:14:59 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 17:14:59 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: sigmadsp: Remove the repeated declaration
Date: Sat, 29 May 2021 17:14:50 +0800
Message-ID: <1622279690-3740-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>, Mark Brown <broonie@kernel.org>
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

Function 'sigmadsp_reset' is declared twice, so remove the repeated
declaration.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 sound/soc/codecs/sigmadsp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/sigmadsp.h b/sound/soc/codecs/sigmadsp.h
index d63b8c366efb..2783eff633a1 100644
--- a/sound/soc/codecs/sigmadsp.h
+++ b/sound/soc/codecs/sigmadsp.h
@@ -44,7 +44,6 @@ struct sigmadsp {
 
 struct sigmadsp *devm_sigmadsp_init(struct device *dev,
 	const struct sigmadsp_ops *ops, const char *firmware_name);
-void sigmadsp_reset(struct sigmadsp *sigmadsp);
 
 int sigmadsp_restrict_params(struct sigmadsp *sigmadsp,
 	struct snd_pcm_substream *substream);
-- 
2.7.4

