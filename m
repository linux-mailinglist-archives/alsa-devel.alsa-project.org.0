Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE09863491
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 12:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 632AE1607;
	Tue,  9 Jul 2019 12:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 632AE1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562669687;
	bh=ry6HJM5ZZE4ErUODb+dlJUOIfi81KtMA/gyl5pDTUCI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9fkY9mXgdCBW1V0YCIcoCe8NswIn4ni+5VZBjo8VsncdtpWY3i1ml0FekqexRXFO
	 NKU1NLlZ4QarIqH4GKKx3Zca0+8oNw5RICawGCbSeOEBKQMR1/+kIEVhY/f+U3DIym
	 R+FXQuybGzMvUbu7syar9AxuzC5TUwa1Uxd9OIYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB26F80291;
	Tue,  9 Jul 2019 12:52:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 360D5F800E0; Tue,  9 Jul 2019 12:52:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AA84F80273
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 12:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA84F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oY/rzRDg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69AnWOa030937; Tue, 9 Jul 2019 05:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=S2kgSC89PPGo4ARkpTYN+EH1hMiZ6T0R9qbXANwpzhg=;
 b=oY/rzRDg+9ezl2JhxABtaj3hSBSpDZxjQ4z1ynkvsyaz3u3TYIASiuJeH+boz3G6V8Rr
 LdD+8FLpwjPTOz/b/QEswouIeyrYV5MahctLDT5MXFxn3aRS7ttVikkXL8ALwPAvLvHD
 D7qxjPzzI4MwhzTxBlbcg6Qd3rX+3I7tnrd5rRoUN7+ULGXqBQJKxU1iZ0poW5wrhF+u
 Xa3BU+onbqfhb0gi37hSDhrj8JaWgpkZBilCFvmEkPCE8xvymbu1wXANmMVHnxe2cLbe
 gixKCDYRt+C/ZKfI5q19aueHEsCxmP8CB+WQqlFeIQaNh3G+4qleZpwRuVnRaH09zyT6 mA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tjr2nv7uh-1;
 Tue, 09 Jul 2019 05:52:12 -0500
Received: from EDIEX01.ad.cirrus.com (ediex01.ad.cirrus.com [198.61.84.80])
 by mail4.cirrus.com (Postfix) with ESMTP id 1F41D611C8B3;
 Tue,  9 Jul 2019 05:52:19 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 9 Jul
 2019 11:52:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 9 Jul 2019 11:52:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8647D2C5;
 Tue,  9 Jul 2019 11:52:11 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>, <tiwai@suse.com>
Date: Tue, 9 Jul 2019 11:52:09 +0100
Message-ID: <20190709105211.11741-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709105211.11741-1-ckeepax@opensource.cirrus.com>
References: <20190709105211.11741-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907090133
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/4] ALSA: compress: Prevent bypasses of
	set_params
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

Currently, whilst in SNDRV_PCM_STATE_OPEN it is possible to call
snd_compr_stop, snd_compr_drain and snd_compr_partial_drain, which
allow a transition to SNDRV_PCM_STATE_SETUP. The stream should
only be able to move to the setup state once it has received a
SNDRV_COMPRESS_SET_PARAMS ioctl. Fix this issue by not allowing
those ioctls whilst in the open state.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/core/compress_offload.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index f031495311ee4..e1a216fd832f9 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -724,9 +724,15 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_PREPARED ||
-			stream->runtime->state == SNDRV_PCM_STATE_SETUP)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_OPEN:
+	case SNDRV_PCM_STATE_SETUP:
+	case SNDRV_PCM_STATE_PREPARED:
 		return -EPERM;
+	default:
+		break;
+	}
+
 	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_STOP);
 	if (!retval) {
 		snd_compr_drain_notify(stream);
@@ -814,9 +820,14 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_PREPARED ||
-			stream->runtime->state == SNDRV_PCM_STATE_SETUP)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_OPEN:
+	case SNDRV_PCM_STATE_SETUP:
+	case SNDRV_PCM_STATE_PREPARED:
 		return -EPERM;
+	default:
+		break;
+	}
 
 	retval = stream->ops->trigger(stream, SND_COMPR_TRIGGER_DRAIN);
 	if (retval) {
@@ -853,9 +864,16 @@ static int snd_compr_next_track(struct snd_compr_stream *stream)
 static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 {
 	int retval;
-	if (stream->runtime->state == SNDRV_PCM_STATE_PREPARED ||
-			stream->runtime->state == SNDRV_PCM_STATE_SETUP)
+
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_OPEN:
+	case SNDRV_PCM_STATE_SETUP:
+	case SNDRV_PCM_STATE_PREPARED:
 		return -EPERM;
+	default:
+		break;
+	}
+
 	/* stream can be drained only when next track has been signalled */
 	if (stream->next_track == false)
 		return -EPERM;
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
