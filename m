Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DD65E7610
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:44:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F33A20C;
	Fri, 23 Sep 2022 10:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F33A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663922697;
	bh=3658Tjx4a9jrff+BkNE3sIENj2CyeDzZPJ1jLD3ybpg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vtz1xQkbUEkA8eq9x6d8GQbzmvf0Y8SmtzACB6Gqg2WJNqw8JcZPGcWycBjA/uXHN
	 ZhLKT6y4Aks5sYlxGA+G9eHFvtQUq1gvyZCBf9jHOanCQ5M6hKipQJkojYghzQj2Aq
	 QYYdgn96wmW/kighNLKeXlw9Wxnb8lWBgdyJSWzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DAEF80551;
	Fri, 23 Sep 2022 10:42:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C92FF80169; Wed, 21 Sep 2022 05:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C8FBF80107
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 05:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C8FBF80107
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MXP6B1MqSzHpfS;
 Wed, 21 Sep 2022 11:29:22 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 11:31:30 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <fengzheng923@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-sunxi@lists.linux.dev>
Subject: [PATCH -next] sound: sunxi: fix declaration compile error
Date: Wed, 21 Sep 2022 11:38:19 +0800
Message-ID: <20220921033819.2188233-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 23 Sep 2022 10:42:24 +0200
Cc: liwei391@huawei.com, zengheng4@huawei.com
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

Just fix compile error without any logic changes.

sound/soc/sunxi/sun50i-dmic.c:62:1: error: ‘static’ is not at beginning of declaration [-Werror=old-style-declaration]
   62 | const static struct dmic_rate dmic_rate_s[] = {
      | ^~~~~

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index cd3c07f2070f..86cff5a5b1bd 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -59,7 +59,7 @@ struct dmic_rate {
 	unsigned int rate_bit;
 };
 
-const static struct dmic_rate dmic_rate_s[] = {
+static const struct dmic_rate dmic_rate_s[] = {
 	{48000, 0x0},
 	{44100, 0x0},
 	{32000, 0x1},
-- 
2.25.1

