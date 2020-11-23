Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BF2C2E28
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:13:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E0C117CE;
	Tue, 24 Nov 2020 18:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E0C117CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238002;
	bh=GZB3n1sSlXwPHrQjsmFdYZjyP/MGlb6P0VE3kijyXek=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=axCU9w2h1JXQNM7VArIkfYMWE2OiQ7i8oERWqweDP1HM761qE+/Vp8WHQPWj9EVYe
	 aceAq+bLXC0CmOwxCK6m28Os31ht+dhMUwe5HEC1x4Fcto4h5IL2Z3Mw3Tie9oBuwZ
	 oEg7Z3GTvPlpoAikI8PVMS8P4ejTWUIc8Wubd4p4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48610F805E9;
	Tue, 24 Nov 2020 17:58:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB2A3F80255; Mon, 23 Nov 2020 14:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E661F8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 14:35:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E661F8015B
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cfp6x4Yx8zhgVJ;
 Mon, 23 Nov 2020 21:35:05 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Nov 2020 21:35:11 +0800
From: Luo Meng <luomeng12@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <ckeepax@opensource.cirrus.com>,
 <kuninori.morimoto.gx@renesas.com>, <Vlad.Karpovich@cirrus.com>,
 <ranjani.sridharan@linux.intel.com>, <Adam.Brickman@cirrus.com>,
 <james.schulman@cirrus.com>, <piotrs@opensource.cirrus.com>,
 <rf@opensource.cirrus.com>, <wenshi@opensource.cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <luomeng12@huawei.com>
Subject: [PATCH] ASoC: wm_adsp: fix error return code in wm_adsp_load()
Date: Mon, 23 Nov 2020 21:38:39 +0800
Message-ID: <20201123133839.4073787-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:08 +0100
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

Fix to return a negative error code from the error handling case
instead of 0 in function wm_adsp_load(), as done elsewhere in this
function.

Fixes: 170b1e123f38 ("ASoC: wm_adsp: Add support for new Halo core DSPs")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 sound/soc/codecs/wm_adsp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index bcf18bf15a02..e61d00486c65 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1937,6 +1937,7 @@ static int wm_adsp_load(struct wm_adsp *dsp)
 			mem = wm_adsp_find_region(dsp, type);
 			if (!mem) {
 				adsp_err(dsp, "No region of type: %x\n", type);
+				ret = -EINVAL;
 				goto out_fw;
 			}
 
-- 
2.25.4

