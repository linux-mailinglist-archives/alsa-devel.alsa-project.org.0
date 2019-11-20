Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C41042A4
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 18:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0440174B;
	Wed, 20 Nov 2019 18:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0440174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574272564;
	bh=hwlVRCrW6Ynhewv6WX3f6tGv16Et+l1IYyn+CtwwcQs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JN8WnK4bp8K8ZVANAiuK9WzxWmmT/vnOwLNr0Ta0BTjds9DoSknCJgBwo85p/TqDy
	 tvG/Dz48FZwbkq3HdCIK546ohyLcHbKmCrU7lNIS1PFQ/Ps8/Kw7ozHMPfbQWsFFyo
	 ZHMRKWLGz8R7f28GXAcnWf91KZEeYNJLJsME54/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B151F801F4;
	Wed, 20 Nov 2019 18:51:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E71F801F7; Wed, 20 Nov 2019 18:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A974F801F4
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 18:51:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A974F801F4
IronPort-SDR: BRJxMbVs5fOl3pFJJmr43cp+6vX9vUixpZjp6lu+yBpO2aaFwrMx63dqWiQWsycm+fxHVjEuGo
 cP9MixdX6D2pGtWrOEh7YMHSFXyq97zE65RP7KtObA+AfVSF8umWLu6gK4DkdpQ+9clHUMJdG0
 K0etkgqZfjjSY076qj0kYNSCzzlwRCbidfRhGbUgMYSxHfP7qRsDcZ4aMZhkcEu4vHyXNyt6pn
 m9PHjbhhVilT83X4WsIp6qAfpN00vSkD+P938TzVVu1D5QgDBcd5cdrc40jAVUU10gZPAsqmJ8
 ShI=
X-IronPort-AV: E=Sophos;i="5.69,222,1571731200"; d="scan'208";a="43299512"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 20 Nov 2019 09:51:30 -0800
IronPort-SDR: CUHHf9ZBNW0bhNaSV3L/eBL5GYoDBqLnsKtvfhZPRRBi6VrC/IunNhYsgFZOqPj5bW3rYiL5Vu
 4ukHEQiAS6acUXrV30D5vwu7Jk6jG97W78eBnlHGwpeD6rW2lxMvWLai/GqWdXSKUExUNbN0wa
 lpWwKtKLpqlQ1bEgh9kPnpOLF+omVW8Zcs6WphYVfhdP58FFDh+GDCOZPdBrhEAQgNu77kHiq5
 76+Skn90gNd/3ci2rULZlNtTrBDO0/iscRWYMHzNDGnDEzeFo7pzYsO1jONcx/fqjJD6Notc2l
 YSc=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 20 Nov 2019 11:49:53 -0600
Message-ID: <20191120174955.6410-6-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120174955.6410-5-andrew_gabbasov@mentor.com>
References: <20191120174955.6410-1-andrew_gabbasov@mentor.com>
 <20191120174955.6410-2-andrew_gabbasov@mentor.com>
 <20191120174955.6410-3-andrew_gabbasov@mentor.com>
 <20191120174955.6410-4-andrew_gabbasov@mentor.com>
 <20191120174955.6410-5-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v5 5/7] ALSA: aloop: Move CABLE_VALID_BOTH to
	the top of file
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

From: Timo Wischer <twischer@de.adit-jv.com>

so all functions can use the same.

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 2f208aaa54cf..0eacaa9d7862 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -55,6 +55,10 @@ MODULE_PARM_DESC(pcm_notify, "Break capture when PCM format/rate/channels change
 
 #define NO_PITCH 100000
 
+#define CABLE_VALID_PLAYBACK	BIT(SNDRV_PCM_STREAM_PLAYBACK)
+#define CABLE_VALID_CAPTURE	BIT(SNDRV_PCM_STREAM_CAPTURE)
+#define CABLE_VALID_BOTH	(CABLE_VALID_PLAYBACK | CABLE_VALID_CAPTURE)
+
 struct loopback_cable;
 struct loopback_pcm;
 
@@ -224,10 +228,6 @@ static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 	return 0;
 }
 
-#define CABLE_VALID_PLAYBACK	(1 << SNDRV_PCM_STREAM_PLAYBACK)
-#define CABLE_VALID_CAPTURE	(1 << SNDRV_PCM_STREAM_CAPTURE)
-#define CABLE_VALID_BOTH	(CABLE_VALID_PLAYBACK|CABLE_VALID_CAPTURE)
-
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
 	struct snd_pcm_runtime *runtime, *cruntime;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
