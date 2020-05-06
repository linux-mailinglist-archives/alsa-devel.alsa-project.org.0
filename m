Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C369B1C6866
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 08:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 415191756;
	Wed,  6 May 2020 08:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 415191756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588746002;
	bh=cvNOKZWULrcwMFg/VOFSc0EEdi7kc4Al8H7RaG8BsYk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AgqgQA2Ll5VoA53X2GBhQW9J5biVfPwnk2VoL3oj2be0rsKItEbLCrQcHGYmYM8S1
	 Pdn+CNT1i0uRmfsVnJXuBGTkuIYJ1ZefoRTtEAbMv2nkBLM2Zfqq3UIJkr+MHe0eSe
	 nwj+amT0dnFkm6y9Db5pPmYByjlH2j4v/oQ0Y/WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465F1F800DF;
	Wed,  6 May 2020 08:18:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 758E8F80249; Wed,  6 May 2020 08:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F05F1F800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 08:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05F1F800DF
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D019A51FD00B3074541E;
 Wed,  6 May 2020 14:18:04 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 14:17:54 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ALSA: hda: Return true,false for return type bool
Date: Wed, 6 May 2020 14:17:16 +0800
Message-ID: <20200506061716.19209-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Cc: Jason Yan <yanaijie@huawei.com>
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

include/sound/hdaudio.h:210:73-74: WARNING: return of 0/1 in function
'snd_hdac_is_in_pm' with return type bool
include/sound/hdaudio.h:211:76-77: WARNING: return of 0/1 in function
'snd_hdac_is_power_on' with return type bool

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 include/sound/hdaudio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index d365297b3698..10945963d727 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -207,8 +207,8 @@ static inline int snd_hdac_power_down_pm(struct hdac_device *codec) { return 0;
 static inline int snd_hdac_keep_power_up(struct hdac_device *codec) { return 0; }
 static inline void snd_hdac_enter_pm(struct hdac_device *codec) {}
 static inline void snd_hdac_leave_pm(struct hdac_device *codec) {}
-static inline bool snd_hdac_is_in_pm(struct hdac_device *codec) { return 0; }
-static inline bool snd_hdac_is_power_on(struct hdac_device *codec) { return 1; }
+static inline bool snd_hdac_is_in_pm(struct hdac_device *codec) { return false; }
+static inline bool snd_hdac_is_power_on(struct hdac_device *codec) { return true; }
 #endif
 
 /*
-- 
2.21.1

