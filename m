Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9801B921E
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Apr 2020 19:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EE21669;
	Sun, 26 Apr 2020 19:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EE21669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587922604;
	bh=XrIHlGlfSi011eOxwM5TdLhyWsSAIFjbEoqh3Ynepf0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EvzJQL/4sAxGIk46NkWye3iikZOhfmrNRcF3onmW/l+5KtAb4JZDIKLwPH7ba//iF
	 DmOF4lOZNuPKr35jf8bVtET1o8GmNUSSTggxXAIHSDjulbtxwx2HacTZGXXyqIcYaU
	 sIOGvL783JLHv4+ujcxBEnFF517NrFBaMMPLo0tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80CEF80136;
	Sun, 26 Apr 2020 19:35:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93BD0F801DB; Sun, 26 Apr 2020 15:18:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B02D7F80105
 for <alsa-devel@alsa-project.org>; Sun, 26 Apr 2020 15:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B02D7F80105
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F0527690B6900E72B260;
 Sun, 26 Apr 2020 21:18:22 +0800 (CST)
Received: from huawei.com (10.175.105.27) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 21:18:13 +0800
From: Wu Bo <wubo40@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <libin.yang@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <nmahale@nvidia.com>, <aplattner@nvidia.com>, 
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] sound:hdmi:fix without unlocked before return
Date: Sun, 26 Apr 2020 21:17:22 +0800
Message-ID: <1587907042-694161-1-git-send-email-wubo40@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.105.27]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 26 Apr 2020 19:34:58 +0200
Cc: linfeilong@huawei.com, wubo40@huawei.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liuzhiqiang26@huawei.com
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

Fix the following coccicheck warning:
sound/pci/hda/patch_hdmi.c:1852:2-8: preceding lock on line 1846

After add sanity check to pass klockwork check,
The spdif_mutex should be unlock before return true
in check_non_pcm_per_cvt().

Signed-off-by: Wu Bo <wubo40@huawei.com>
---
 sound/pci/hda/patch_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4eff1605..c24832b 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1848,8 +1848,10 @@ static bool check_non_pcm_per_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 	/* Add sanity check to pass klockwork check.
 	 * This should never happen.
 	 */
-	if (WARN_ON(spdif == NULL))
+	if (WARN_ON(spdif == NULL)) {
+		mutex_unlock(&codec->spdif_mutex);
 		return true;
+	}
 	non_pcm = !!(spdif->status & IEC958_AES0_NONAUDIO);
 	mutex_unlock(&codec->spdif_mutex);
 	return non_pcm;
-- 
1.8.3.1

