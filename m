Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6309E527032
	for <lists+alsa-devel@lfdr.de>; Sat, 14 May 2022 11:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 468E017A7;
	Sat, 14 May 2022 10:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 468E017A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652518839;
	bh=7WCCrWPtLf5d0hNTRDwbSnDvZi/vA19G8AZzrJI8df0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CMsN/bu8xzH/VsecztIsUTuKT8JZHohULiaiKH6P7++7IZNRFD8Gvg9TbiCS7sJIs
	 tp0vYuuCtjo95rMBXuakVbTvrZ2VNJulA3vIiIMRGpHClhugsTA4lZJp1qTPYYPH/t
	 FrF6Ap4fzpSg9z7ld5IbnAkzKxsEML4Ab3eD7tOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB352F80166;
	Sat, 14 May 2022 10:59:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAB39F80163; Sat, 14 May 2022 10:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9CE7F80107
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 10:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CE7F80107
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L0fWl6xgqzGpgT;
 Sat, 14 May 2022 16:56:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 14 May 2022 16:59:27 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 14 May
 2022 16:59:26 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH -next] ASoC: wm2000: fix missing clk_disable_unprepare() on
 error in wm2000_anc_transition()
Date: Sat, 14 May 2022 17:10:53 +0800
Message-ID: <20220514091053.686416-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Cc: broonie@kernel.org, lgirdwood@gmail.com
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

Fix the missing clk_disable_unprepare() before return
from wm2000_anc_transition() in the error handling case.

Fixes: 514cfd6dd725 ("ASoC: wm2000: Integrate with clock API")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/codecs/wm2000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 72e165cc6443..97ece3114b3d 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -536,7 +536,7 @@ static int wm2000_anc_transition(struct wm2000_priv *wm2000,
 {
 	struct i2c_client *i2c = wm2000->i2c;
 	int i, j;
-	int ret;
+	int ret = 0;
 
 	if (wm2000->anc_mode == mode)
 		return 0;
@@ -566,13 +566,13 @@ static int wm2000_anc_transition(struct wm2000_priv *wm2000,
 		ret = anc_transitions[i].step[j](i2c,
 						 anc_transitions[i].analogue);
 		if (ret != 0)
-			return ret;
+			break;
 	}
 
 	if (anc_transitions[i].dest == ANC_OFF)
 		clk_disable_unprepare(wm2000->mclk);
 
-	return 0;
+	return ret;
 }
 
 static int wm2000_anc_set_mode(struct wm2000_priv *wm2000)
-- 
2.25.1

