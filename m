Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C29C4D1A7
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 17:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAE7166B;
	Thu, 20 Jun 2019 17:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAE7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561043287;
	bh=O2N750noiJ8waqfzwCtRDwSRyYRPmx+k1Ay6XXLhyEU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P3Xew2+s4bFLSJ/ipRXD6TpGy9KJLUgZoMwC3pVtwC9R4244OX4GpbMi2bV1YBMrf
	 RZbCEVHJh+tcENj1fwodHuytZqM7soXllwXVLfOoggQcInF/zr+AVUyRABsrdRvlvX
	 iOaJTs0WYWNsywyY8ufBmvcwAsr/nMi87PzrC85w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09CDAF89717;
	Thu, 20 Jun 2019 17:06:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C387AF89717; Thu, 20 Jun 2019 17:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15950F80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 17:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15950F80C15
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 00E8BD69FDD3116E966A;
 Thu, 20 Jun 2019 22:50:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 20 Jun 2019 22:49:56 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Zhu Yingjiang
 <yingjiang.zhu@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 20 Jun 2019 14:57:09 +0000
Message-ID: <20190620145709.122498-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: SOF: Intel: hda: remove duplicated
	include from hda.c
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

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/sof/intel/hda.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 51c1c1787de7..7f665392618f 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -19,7 +19,6 @@
 #include <sound/hda_register.h>
 
 #include <linux/module.h>
-#include <sound/hdaudio_ext.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include "../ops.h"





_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
