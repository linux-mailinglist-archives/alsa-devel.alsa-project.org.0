Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9730D8646C
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B88A1612;
	Thu,  8 Aug 2019 16:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B88A1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565274899;
	bh=Kh8yzUi25BdS/WeI6P/SdSA1FqcekN7QS+8N9CsheW4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VfZS0qyu1qbtX3fv6hnaw0eeyGvCC6T69Fi7MrKg2g7kAl9WdHTm+eXvOaQkbfBXb
	 oON8BDk4HKEAm9Y12RlGTMn3fQRdzEeXxNMjsBFda4fsdT1iv+9d9O1elVZPpewp26
	 xwjM+Zz/Z7gYxE/Sqgmsq7GPys09ZC4KQGvwaTsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92159F8053A;
	Thu,  8 Aug 2019 16:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DEFEF80534; Thu,  8 Aug 2019 16:33:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86991F800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86991F800E3
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B9AE89DE7B6DE5071C57;
 Thu,  8 Aug 2019 22:33:05 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 8 Aug 2019
 22:32:59 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kstewart@linuxfoundation.org>
Date: Thu, 8 Aug 2019 22:32:15 +0800
Message-ID: <20190808143215.65904-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: max98926: remove two unused
	variables
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

sound/soc/codecs/max98926.c:28:26: warning:
 max98926_dai_txt defined but not used [-Wunused-const-variable=]
sound/soc/codecs/max98926.c:23:27: warning:
 max98926_boost_current_txt defined but not used [-Wunused-const-variable=]

They are never used, so can be removd.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/max98926.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index 818c030..c4dfa8a 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -20,15 +20,6 @@ static const char * const max98926_boost_voltage_txt[] = {
 	"6.5V", "6.5V", "6.5V", "6.5V", "6.5V", "6.5V", "6.5V", "6.5V"
 };
 
-static const char * const max98926_boost_current_txt[] = {
-	"0.6", "0.8", "1.0", "1.2", "1.4", "1.6", "1.8", "2.0",
-	"2.2", "2.4", "2.6", "2.8", "3.2", "3.6", "4.0", "4.4"
-};
-
-static const char *const max98926_dai_txt[] = {
-	"Left", "Right", "LeftRight", "LeftRightDiv2",
-};
-
 static const char *const max98926_pdm_ch_text[] = {
 	"Current", "Voltage",
 };
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
