Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D673AB615
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28FA171E;
	Thu, 17 Jun 2021 16:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28FA171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940591;
	bh=8BzqWwaFC/7vdEBpTuwlkiroz81wWOuUXuM8tambKHk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LxISSHo77MbAprZt5UY04W7eIjOdtsbH+IFRUZOwa/uqQCw7NgQEONydDnAQ1gCmX
	 xVjnYRT1j9f4OyoXgt80cBdnNBI25a1jcfaSLp2TL/Y2DYWPxQw2USjRhEn+AW5dDR
	 eyQSCdzohluifEelizPRdAjHqOrtkQDCVFfQF1HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8FABF804BC;
	Thu, 17 Jun 2021 16:34:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED73F80171; Tue, 15 Jun 2021 13:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F64DF80113
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 13:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F64DF80113
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G45df6YCJzXg5V;
 Tue, 15 Jun 2021 19:27:34 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:32:34 +0800
Received: from ubuntu1804.huawei.com (10.67.174.98) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 19:32:34 +0800
From: Pu Lehui <pulehui@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>, <sfr@canb.auug.org.au>
Subject: [PATCH -next] ASoC: codecs: wcd938x: constify static struct
 snd_soc_dai_ops
Date: Tue, 15 Jun 2021 19:33:24 +0800
Message-ID: <20210615113324.238837-1-pulehui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.98]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:46 +0200
Cc: zhangjinhao2@huawei.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
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

The snd_soc_dai_ops structures is only stored in the ops field of a
snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
const to allow the compiler to put it in read-only memory.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 sound/soc/codecs/wcd938x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 2cf6145b7219..8ec9357fd855 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3425,7 +3425,7 @@ static int wcd938x_codec_set_sdw_stream(struct snd_soc_dai *dai,
 
 }
 
-static struct snd_soc_dai_ops wcd938x_sdw_dai_ops = {
+static const struct snd_soc_dai_ops wcd938x_sdw_dai_ops = {
 	.hw_params = wcd938x_codec_hw_params,
 	.hw_free = wcd938x_codec_free,
 	.set_sdw_stream = wcd938x_codec_set_sdw_stream,
-- 
2.17.1

