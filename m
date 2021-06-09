Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C214A3A0CB2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 08:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A51F16D0;
	Wed,  9 Jun 2021 08:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A51F16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623221282;
	bh=kfp/C5rpGdkDmCxGrKLnTqEqG1Fw+l0VSm/2YQXrSF0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jp68F4j+q1CKbvONoOIY3nzYldQ0WJt/AK2/4IQEo5eG4PfH9hGvEvMhfCaljqJ8B
	 wxg/6fos7p6Q+XoO17VTLgjYgcdJdqyqLedG9wlZ80aYI8pxoPpDZLVRfAwwVBo+zn
	 CwigIjut6mxwS2yoMTeXm9q9UyzbzmRgCjpAmgtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E22F80212;
	Wed,  9 Jun 2021 08:46:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01876F8026C; Wed,  9 Jun 2021 08:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C826F800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 08:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C826F800F4
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=7; SR=0; TI=SMTPD_---0Ubq9jib_1623221176; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Ubq9jib_1623221176) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Jun 2021 14:46:18 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH -next] ASoC: codecs: wcd: Remove unneeded semicolon
Date: Wed,  9 Jun 2021 14:46:11 +0800
Message-Id: <1623221171-105359-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org, Yang Li <yang.lee@linux.alibaba.com>
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

Eliminate the following coccicheck warning:
./sound/soc/codecs/wcd-mbhc-v2.c:990:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index dee9410..405128c 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -987,7 +987,7 @@ static void wcd_mbhc_adc_update_fsm_source(struct wcd_mbhc *mbhc,
 		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
 		break;
 
-	};
+	}
 }
 
 static void wcd_mbhc_bcs_enable(struct wcd_mbhc *mbhc, int plug_type, bool enable)
-- 
1.8.3.1

