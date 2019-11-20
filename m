Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8130A10396B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 13:02:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA0216E3;
	Wed, 20 Nov 2019 13:01:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA0216E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574251344;
	bh=EDuPcEQJSCZfwQYZ3HV5Glfn5PjqOTSjaXSUgodQIMY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DuOvISqOCiNvkdyzI7K8IZHu2/l7hnxpUk7lpsM20kMtnU4vJlfSp+HwsTPSkTXFZ
	 0y5OtLW/kNHg3VSebTl8DTLEoghL15Qpcp7m4rC7N70kM5JaGWfqpS0mYh+GRmVRsC
	 RCvF5INZYSizmVAtaDReO7jMIhl8SFwW/gIajh/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87AB4F80159;
	Wed, 20 Nov 2019 12:59:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C39CF800C1; Wed, 20 Nov 2019 12:59:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC2CF800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 12:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC2CF800C1
IronPort-SDR: QC1K7lLQVTScuMLiFA/9aMifbeTYXK+P4yDFwYtkmIymwvLwmun5qUv87MfNBzmLStZCgdL+3m
 RdtOD1d80xi17v9k6ECzb9+pvLpq1lRLLSu94JyCmV4GMHjcMBEjflQRDXAE/4vCkJVfX0SNeF
 utrqBg5rC03WbuYggoPERkt/rOn9HsljtNt3soj/D+XAfmCB1Bo5XL+WMunCFr7NO8gs5mQHUT
 EvjliFueuiH5dYjljD1LWXvT1R5HTC/UzJFV1pO0Py/J6OuNuxz0qpEjG8JSALsnV402vKfMjm
 7Zg=
X-IronPort-AV: E=Sophos;i="5.69,221,1571731200"; d="scan'208";a="45209991"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa1.mentor.iphmx.com with ESMTP; 20 Nov 2019 03:59:31 -0800
IronPort-SDR: 7yMYWojQMMkoRD8ElqrDdLnDTuAyTtWTooEofI/KqCiQxKMmESwrwHe0hlXGV/RqDX6LDrMTQz
 k75VSt+DODR6olCbVbr4FZ7lWUYZKwU7HGXiHSoE2BoamoOB/lDxbfwhXjqxrmMNWYDVhQCFBS
 7hLRoeT2ImPlzz0/66c8cmrefBMUgjxQ7bR0NBjuv6fHfnUWYWSNcruC6a6+NLxJRn81H3I0SX
 987ZC1IfiNSay7sy454QvJeZmCmr/4Kwsdzz7EMv8d0VvnkX9BJGbHiOHigHVMW/4dOOGaa2/C
 M+A=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 20 Nov 2019 05:58:50 -0600
Message-ID: <20191120115856.4125-2-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120115856.4125-1-andrew_gabbasov@mentor.com>
References: <20191120115856.4125-1-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v4 1/7] ALSA: aloop: Describe units of variables
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

Describe the unit of the variables used to calculate the hw pointer
depending on jiffies ticks.

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 54f8b17476a1..573b06cf7cf5 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -102,8 +102,10 @@ struct loopback_pcm {
 	/* flags */
 	unsigned int period_update_pending :1;
 	/* timer stuff */
-	unsigned int irq_pos;		/* fractional IRQ position */
-	unsigned int period_size_frac;
+	unsigned int irq_pos;		/* fractional IRQ position in jiffies
+					 * ticks
+					 */
+	unsigned int period_size_frac;	/* period size in jiffies ticks */
 	unsigned int last_drift;
 	unsigned long last_jiffies;
 	struct timer_list timer;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
