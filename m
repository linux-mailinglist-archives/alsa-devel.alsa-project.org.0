Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C1410397C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 13:04:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 205FC16E6;
	Wed, 20 Nov 2019 13:04:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 205FC16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574251499;
	bh=hwlVRCrW6Ynhewv6WX3f6tGv16Et+l1IYyn+CtwwcQs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ggfpmkcDvSHVGm+Ps+OOXgaNxaztmI5H1yz5CXx97tA3rM2ycQdFs2P9Chij3xlvM
	 mp9HQ/jIlwKiUpGy1rLWPzTzk0YogqMtPvVV7FfaNla7f/tfGSZnLxzZDH5wQl85fQ
	 TdPfmAFu58GtGrxSRbgfSsIJg9ppg+Qco0K3x6PM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 688F4F8020B;
	Wed, 20 Nov 2019 13:00:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 207A3F801F7; Wed, 20 Nov 2019 13:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB2BBF801EC
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 13:00:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB2BBF801EC
IronPort-SDR: 29RKMHRbGrj3DgUd7PIsTEMtoVK8l2m1qCWikHhZfAs0udrOICeKhpMMEMfU+//nxbVoTDUw0y
 32Q5Aeb/o0MlsdSo/eAq9M6fcgp55XP20rRCusRQx5bpGYq1Pbrk8526vOeSk84Bg6SLb0vT2p
 8VdzXoLKEud9FJ+80HUtjM9/IchMN9Zf3j/3Vur65LoIVhMGxJgCW3PEKAZRnNXN8z6GfgZZsJ
 VHGdh0Vl33LxgGsXEtkfasduk67/BSaSXBanVvIUXClgPAEI8twwjJwKeUxizCtJloTaBYxyCJ
 M4k=
X-IronPort-AV: E=Sophos;i="5.69,221,1571731200"; d="scan'208";a="43282939"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 20 Nov 2019 04:00:02 -0800
IronPort-SDR: M1RGJJYL1O4xfWcRR3qoAvqTVwR7qqWdH+Jd3iuqh7Yo+ZCJGQngPf0MhlnX4erpKXvVpz8IKE
 JoP5CVmiueKYN0xUlDIGHkqvNh2sb5x1kkBDl40VJEwLPEJTwY7KRk1dMe1TWpO2JR5rRzFLsv
 1dILFDKGd5pxoN9HrCPBOW+W1nrqAOTbLCkyqO5hB4i4sxcRZ2hoYsmfCvOdwdvjvZYR4PsJfo
 Xlvxex/6BUBkml1lI1Gmm7qs7VXSEjTvhMLm7owk9+Nc8DrUz04ve3PIw68WoagRpRiccGhRfd
 H0c=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 20 Nov 2019 05:58:54 -0600
Message-ID: <20191120115856.4125-6-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120115856.4125-5-andrew_gabbasov@mentor.com>
References: <20191120115856.4125-1-andrew_gabbasov@mentor.com>
 <20191120115856.4125-2-andrew_gabbasov@mentor.com>
 <20191120115856.4125-3-andrew_gabbasov@mentor.com>
 <20191120115856.4125-4-andrew_gabbasov@mentor.com>
 <20191120115856.4125-5-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v4 5/7] ALSA: aloop: Move CABLE_VALID_BOTH to
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
