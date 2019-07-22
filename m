Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 676966FC29
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 11:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC8E825;
	Mon, 22 Jul 2019 11:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC8E825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563787681;
	bh=3gDo4x7zK5rV9QSmtMDJkBSlkShRIVKesQOa2NvrFak=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aFNIsznrKxWUbDu0TyH2UUjXKM22IhnOcuFhgZy05JbS6cXAqTe27twB0eKqvUBMt
	 9V5aAZnWsX6pDst13BJC+NG6BcCHo1rPuM6BMSvDftwXnBgEBuntT+X5cVIhh+rzWp
	 yrDqSoLTM8YI1hhkP2bBDvGrlQqG8n5l4JYZgl38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E99F8048F;
	Mon, 22 Jul 2019 11:24:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0800AF8015B; Mon, 22 Jul 2019 11:24:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC52F803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 11:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC52F803D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nRVpYQqj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6M9ONaR020809; Mon, 22 Jul 2019 04:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=bVfCyIo2LGakg/BrJlLLL1JdE7hIxpZQbw5Ewef2SRA=;
 b=nRVpYQqjPpmvViyJHJ9SD2uGQLyzCY6zSAZm2arLinY/uMeY+1fezql/PxDi5ghmpDg4
 qZUfTDF+fNbwzs2/HyQNy49wuDHFG9zM2wfdEjOAI1Jk/PevhbKPx/gJGZuEmP3Y+RyU
 jIl/VPlsZX2XyZ61X18Z8u5c1eLzvH0qM8CQK5ebHYx4zUwb3pQya4kbHcuZKf2T2B+/
 SqXSo80q3m3fI8WjhsxoXDyuVo0ROwLrD7Yw1xcIoixzSW6ARyUab6ydBp0AuddLgRik
 HUJGhwxCriQ7mm8Aud1FASA8sJIQT77gVaSC/I4eMBO9ahevlUJIF1NPfnOUlytH3Wg/ yg== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tv0c0a5h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 22 Jul 2019 04:24:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 22 Jul
 2019 10:24:37 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 22 Jul 2019 10:24:37 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 028C22C5;
 Mon, 22 Jul 2019 10:24:37 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>, <tiwai@suse.com>
Date: Mon, 22 Jul 2019 10:24:33 +0100
Message-ID: <20190722092436.651-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1904300001 definitions=main-1907220111
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2 1/4] ALSA: compress: Fix regression on
	compressed capture streams
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

A previous fix to the stop handling on compressed capture streams causes
some knock on issues. The previous fix updated snd_compr_drain_notify to
set the state back to PREPARED for capture streams. This causes some
issues however as the handling for snd_compr_poll differs between the
two states and some user-space applications were relying on the poll
failing after the stream had been stopped.

To correct this regression whilst still fixing the original problem the
patch was addressing, update the capture handling to skip the PREPARED
state rather than skipping the SETUP state as it has done until now.

Fixes: 4f2ab5e1d13d ("ALSA: compress: Fix stop handling on compressed capture streams")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

Thanks,
Charles

 include/sound/compress_driver.h |  5 +----
 sound/core/compress_offload.c   | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index c5188ff724d12..bc88d6f964da9 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -173,10 +173,7 @@ static inline void snd_compr_drain_notify(struct snd_compr_stream *stream)
 	if (snd_BUG_ON(!stream))
 		return;
 
-	if (stream->direction == SND_COMPRESS_PLAYBACK)
-		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
-	else
-		stream->runtime->state = SNDRV_PCM_STATE_PREPARED;
+	stream->runtime->state = SNDRV_PCM_STATE_SETUP;
 
 	wake_up(&stream->runtime->sleep);
 }
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 99b8821587053..d79aee6b9edd2 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -574,10 +574,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		stream->metadata_set = false;
 		stream->next_track = false;
 
-		if (stream->direction == SND_COMPRESS_PLAYBACK)
-			stream->runtime->state = SNDRV_PCM_STATE_SETUP;
-		else
-			stream->runtime->state = SNDRV_PCM_STATE_PREPARED;
+		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
 	} else {
 		return -EPERM;
 	}
@@ -693,8 +690,17 @@ static int snd_compr_start(struct snd_compr_stream *stream)
 {
 	int retval;
 
-	if (stream->runtime->state != SNDRV_PCM_STATE_PREPARED)
+	switch (stream->runtime->state) {
+	case SNDRV_PCM_STATE_SETUP:
+		if (stream->direction != SND_COMPRESS_CAPTURE)
+			return -EPERM;
+		break;
+	case SNDRV_PCM_STATE_PREPARED:
+		break;
+	default:
 		return -EPERM;
+	}
+
 	retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_START);
 	if (!retval)
 		stream->runtime->state = SNDRV_PCM_STATE_RUNNING;
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
