Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3751087404
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 10:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65631661;
	Fri,  9 Aug 2019 10:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65631661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565339298;
	bh=FjDMFhtZVhWqv0gd6t/29XyS+5SSkiqrAdiWCJLeOMI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SKU7nSZAIaihQF2TqS0CCzmOpVXECTbQ06Sd8m3yeKfklKaXbZswWXT6jLEiBIvDo
	 FNygOP5YEspkz5sXyc+6acus/qDY2lWVJnOeIbEx/AM4drKWxYTIvr0a0rr3eDbeIe
	 rY+uvg66zx5lmYLCPzvsYR2ImCgNKqJl65DcSZeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 057DBF80391;
	Fri,  9 Aug 2019 10:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21E1DF803F3; Fri,  9 Aug 2019 10:27:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 122ECF800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 10:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 122ECF800E4
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1A4159A14057AC15E2D3;
 Fri,  9 Aug 2019 16:26:56 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Fri, 9 Aug 2019
 16:26:47 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <gregkh@linuxfoundation.org>, <rfontana@redhat.com>
Date: Fri, 9 Aug 2019 16:24:40 +0800
Message-ID: <20190809082440.67412-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: ml26124: remove unused variable
	'ngth'
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In file included from ./include/sound/tlv.h:10:0,
                 from sound/soc/codecs/ml26124.c:19:
sound/soc/codecs/ml26124.c:59:35: warning: ngth defined but not used [-Wunused-const-variable=]
 static const DECLARE_TLV_DB_SCALE(ngth, -7650, 150, 0);
                                   ^
./include/uapi/sound/tlv.h:64:15: note: in definition of macro SNDRV_CTL_TLVD_DECLARE_DB_SCALE
  unsigned int name[] = { \
               ^~~~
sound/soc/codecs/ml26124.c:59:14: note: in expansion of macro DECLARE_TLV_DB_SCALE
 static const DECLARE_TLV_DB_SCALE(ngth, -7650, 150, 0);
              ^~~~~~~~~~~~~~~~~~~~

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/ml26124.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index 3abd278..55823bc 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -56,7 +56,6 @@ static const DECLARE_TLV_DB_SCALE(alclvl, -2250, 150, 0);
 static const DECLARE_TLV_DB_SCALE(mingain, -1200, 600, 0);
 static const DECLARE_TLV_DB_SCALE(maxgain, -675, 600, 0);
 static const DECLARE_TLV_DB_SCALE(boost_vol, -1200, 75, 0);
-static const DECLARE_TLV_DB_SCALE(ngth, -7650, 150, 0);
 
 static const char * const ml26124_companding[] = {"16bit PCM", "u-law",
 						  "A-law"};
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
