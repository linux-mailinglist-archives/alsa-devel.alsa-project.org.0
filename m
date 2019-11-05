Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD34F0000
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 15:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44FE316E2;
	Tue,  5 Nov 2019 15:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44FE316E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572964673;
	bh=5qtaS+RqEhFPDCNLyPm0lnDcpfMV7raz5PKWGoOcJ7M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8KYV945b11522wY+TJujb+VdQ7Hj5ESTuanafRv5xkDi68vmTekXTsvpN34OL2gy
	 I273tluuuIiDAna1wRZoF4coWzJua2jhbHHdNdPzKQmV6N74M6dUgm5/DW1Z+WBtNJ
	 Qy/2QVgdVacTxlYSWcGdgI4uiSDU4Lqm/5h0Hs4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67992F80633;
	Tue,  5 Nov 2019 15:34:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93FB1F80446; Tue,  5 Nov 2019 15:34:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA2CF80446
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA2CF80446
IronPort-SDR: Pp5a2m71i0L9YrlAxC8qORBDbOGsjwAuXmY//QNL9CfsvlMBfoAhVKA6zYML/iOdz+7/wyDvOn
 SZjUoo07Zg/9sKM/tDXgjMCMHrok2Egj0hr2x+W49zA+0Cj/H3k7tQ08oiAnPm6shXqnoi9j48
 su7c473LGSYBNH9DuxEX9MKuvQKrMmtgT/YsoLU16JWINEDmnvT4ybvIPZs1eezoUlhm4Z7WLS
 4T4uhuMmPzUCFSnZzsrH++K30m11GO0QF7jk9AP3XqehXmgMKO5AsCNxgmnwctXMHZDoffvaiG
 mkU=
X-IronPort-AV: E=Sophos;i="5.68,271,1569312000"; d="scan'208";a="42878545"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 06:34:35 -0800
IronPort-SDR: 8egWQg81+5LreDHcOpMRCtMBtLfLF7C3VhqcTXg8LFfHs+8opw5R3oJoVoKs02F1ltrBDje42a
 WyR1E/Rm0VJvhFkIwvz0iveAfAsz/UQ81ttlwYvhKggKbavm8H5WqAdGYhiW1qm6VL5reNA6Gv
 AVs1dT61nwmqEno5qq9SCXC+qUfSLv2VZzJxTHyWkL9BVE8INzaL6Am5OqOixmTKyj5AZ1OZTK
 KwDFV7De1lmrMJhEfGPeqriYuCMLiVYpest6A3+lZI98d9ZUX0+iSDF/XheVdroIr3KYHr2mS4
 luI=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Tue, 5 Nov 2019 08:32:16 -0600
Message-ID: <20191105143218.5948-7-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105143218.5948-6-andrew_gabbasov@mentor.com>
References: <20191105143218.5948-1-andrew_gabbasov@mentor.com>
 <20191105143218.5948-2-andrew_gabbasov@mentor.com>
 <20191105143218.5948-3-andrew_gabbasov@mentor.com>
 <20191105143218.5948-4-andrew_gabbasov@mentor.com>
 <20191105143218.5948-5-andrew_gabbasov@mentor.com>
 <20191105143218.5948-6-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v2 6/8] ALSA: aloop: Move CABLE_VALID_BOTH to
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
index 178f7260a650..313d7ffe6c91 100644
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
