Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1F213207
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 05:06:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76EEB16BF;
	Fri,  3 Jul 2020 05:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76EEB16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593745603;
	bh=jGZlEEh4dUNM3cX/GGZ8DLajU57/vj0n+tKQmCryuNM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UY3l8BFY+Oz+UhJsALar1iEwpUgcvOWQwm2CmG8gJfU8t1LG2j6DtBWmGRf05CcYk
	 A9OqckrTee365jtBnyf+jV562oo3bMElLPmWJvTzFpcMdz1La/Hdg4rR3duUnmjrnA
	 yPAHd7vCAtOp4RGJuMbxukys2rY+QkpCgTJl5jHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56751F8021D;
	Fri,  3 Jul 2020 05:05:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3511AF80217; Fri,  3 Jul 2020 05:04:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8686CF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 05:04:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8686CF800E0
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 22DB6E5DE6A194980ED4;
 Fri,  3 Jul 2020 11:04:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Jul 2020 11:04:27 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH -next] ASoC: ti: j721e-evm: Fix missing unlock on error in
 j721e_audio_hw_params()
Date: Fri, 3 Jul 2020 03:09:10 +0000
Message-ID: <20200703030910.75047-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>
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

Add the missing unlock before return from function j721e_audio_hw_params()
in the error handling case.

Fixes: 6748d0559059 ("ASoC: ti: Add custom machine driver for j721e EVM (CPB and IVI)")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/ti/j721e-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 3a2a8b1f3aa3..174306cf53ad 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -330,7 +330,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 2,
 					       slot_width);
 		if (ret && ret != -ENOTSUPP)
-			return ret;
+			goto out;
 	}
 
 	ret = j721e_configure_refclk(priv, domain_id, params_rate(params));



