Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BDA398D7F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:56:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80AA216C3;
	Wed,  2 Jun 2021 16:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80AA216C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622645786;
	bh=M51G1tQ6cmW/v1KCl2gie+Z71me4DwBKMxhSFmohlGY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L0n0pXCF5MqxI2SQSmL3pEv1dLX3HiQJqmo9O8joFWO0wnoA1BvinqCPPBuDqckpc
	 2GnbqDKcrrfndJh3NfcflV4VRg9VoX0GZhmN0wujItLGPlGzK603qyRoiKHdb/tLFQ
	 3uOpOg9hyTzfQ9tODfx+AC6loFwumkFThuJ1xaTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D358F80425;
	Wed,  2 Jun 2021 16:54:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA42F80424; Wed,  2 Jun 2021 16:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E0CF80141
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 16:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E0CF80141
Received: from [123.112.64.4] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <hui.wang@canonical.com>)
 id 1loSGb-0005h5-P9; Wed, 02 Jun 2021 14:54:46 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, kai.heng.feng@canonical.com,
 kailang@realtek.com
Subject: [PATCH] ALSA: hda: update the power_state during the direct-complete
Date: Wed,  2 Jun 2021 22:54:24 +0800
Message-Id: <20210602145424.3132-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The patch_realtek.c needs to check if the power_state.event equals
PM_EVENT_SUSPEND, after using the direct-complete, the suspend() and
resume() will be skipped if the codec is already rt_suspended, in this
case, the patch_realtek.c will always get PM_EVENT_ON even the system
is really resumed from S3.

We could set power_state to PMSG_SUSPEND in the prepare(), if other
PM functions are called before complete(), those functions will
override power_state; if no other PM functions are called before
complete(), we could know the suspend() and resume() are skipped since
only S3 pm functions could be skipped by direct-complete, in this case
set power_state to PMSG_RESUME in the complete(). This could guarantee
the first time of calling hda_codec_runtime_resume() after complete()
has the correct power_state.

Fixes: 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use direct-complete optimization")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_codec.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index a31009afc025..5462f771c2f9 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2917,6 +2917,7 @@ static int hda_codec_runtime_resume(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 static int hda_codec_pm_prepare(struct device *dev)
 {
+	dev->power.power_state = PMSG_SUSPEND;
 	return pm_runtime_suspended(dev);
 }
 
@@ -2924,6 +2925,10 @@ static void hda_codec_pm_complete(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 
+	/* If no other pm-functions are called between prepare() and complete() */
+	if (dev->power.power_state.event == PM_EVENT_SUSPEND)
+		dev->power.power_state = PMSG_RESUME;
+
 	if (pm_runtime_suspended(dev) && (codec->jackpoll_interval ||
 	    hda_codec_need_resume(codec) || codec->forced_resume))
 		pm_request_resume(dev);
-- 
2.25.1

