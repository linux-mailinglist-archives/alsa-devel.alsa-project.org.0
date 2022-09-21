Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698C5C012C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA0BA166A;
	Wed, 21 Sep 2022 17:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA0BA166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663773946;
	bh=jkPhLzCkUb77IudfipBigvBG74IiNn1M5XJWdxb1K24=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KXGzoOg5N0woYklqghfYcyLd8AwvCK7MWQ6AQ+Fjwnbvwf7DedFJRfhgPZ1Qc70I3
	 JMfvfgkp6P6kzSZB1kB088yvJThUlnuciZjMWi9+9fnsmcH1e+NO2eoCuJ0ZRWa1gZ
	 zNzgunPAE9NDRaQ93JsUSCSpCkSGM1D/Q3ciCaW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 375D2F80425;
	Wed, 21 Sep 2022 17:24:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECF1BF80256; Wed, 21 Sep 2022 17:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C99F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:24:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C99F800C9
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXhwB0YfLzpV10;
 Wed, 21 Sep 2022 23:21:46 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 23:24:35 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 23:24:34 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <asahi@lists.linux.dev>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: cs42l83: change cs42l83_regmap to static
Date: Wed, 21 Sep 2022 23:31:23 +0800
Message-ID: <20220921153123.1508144-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: povik+lin@cutebit.org, broonie@kernel.org
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

cs42l83_regmap is only used in cs42l83-i2c.c now, change it to static.

Fixes: 94d5f62a91aa ("ASoC: cs42l83: Extend CS42L42 support to new part")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/codecs/cs42l83-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l83-i2c.c b/sound/soc/codecs/cs42l83-i2c.c
index f90d43996a51..37629ebd90e0 100644
--- a/sound/soc/codecs/cs42l83-i2c.c
+++ b/sound/soc/codecs/cs42l83-i2c.c
@@ -145,7 +145,7 @@ static const struct reg_default cs42l83_reg_defaults[] = {
  * This is all the same as for CS42L42 but we
  * replace the on-reset register defaults.
  */
-const struct regmap_config cs42l83_regmap = {
+static const struct regmap_config cs42l83_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-- 
2.25.1

