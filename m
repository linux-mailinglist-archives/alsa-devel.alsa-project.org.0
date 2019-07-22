Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9892C6FC23
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 11:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9B3E1754;
	Mon, 22 Jul 2019 11:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9B3E1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563787592;
	bh=VZCFngZBXyOftbJ4aAa3mVbpmv2vsEh2j7HW+9DWgQo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ma65MqSCeJtE+fIhyoaKeaThKUERdHwOZN+GxezPaTfMl8fpQeY3aRIXZzaGYrMV6
	 jmVdlyydqUC+0gGEzvlNz6gMZYAE8wmqwp4F0CD6ogo2aCSAvhtcO9IWX90ptNM8BO
	 qIM7nQ/Ad8Kto8vhMg0vnohXTbiZCnoNXwji3QFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76A58F803D7;
	Mon, 22 Jul 2019 11:24:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A28F803F3; Mon, 22 Jul 2019 11:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83798F800F5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 11:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83798F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Dg6fx/vt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6M9ONaS020809; Mon, 22 Jul 2019 04:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=ZS4UiOiA6jSpCRPnMf9iVuw07AwuXGnI6TdVb8syBpw=;
 b=Dg6fx/vtg1c4JUo+CL4QLTNsWHUx538eyHOk4doARg3t2P5CMjoZcQynxuHqmoSUj4yP
 UfSERvAUs3MY4b1NYI7v/gUNvLU49FsEpOSw2NR8m0iToLWVYY32CPqELqFccfBBxaD2
 A2O/BRrCjRy0ffsR0yclQFBgnGiSWR41Z/xpPZQZNkJ+HRmv0coD6K50w8yKnzsp54ol
 4OYnDSgxLywuC7z8NG1L5UIElyW92caxvA049fUr6jLtfQFhAkecW3c25peWmsTXHHsY
 9ntliuOktPTeGM8DXlDvwgQcfSYbIbIDa6axbFb7dP20790TYQARBrCBDRTH6Ed2U60c IA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tv0c0a5h6-2
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
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 135FC45;
 Mon, 22 Jul 2019 10:24:37 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>, <tiwai@suse.com>
Date: Mon, 22 Jul 2019 10:24:34 +0100
Message-ID: <20190722092436.651-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722092436.651-1-ckeepax@opensource.cirrus.com>
References: <20190722092436.651-1-ckeepax@opensource.cirrus.com>
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
Subject: [alsa-devel] [PATCH v2 2/4] ALSA: compress: Prevent bypasses of
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

No changes since v1.

Thanks,
Charles

 sound/core/compress_offload.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index d79aee6b9edd2..40dae723c59db 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -711,9 +711,15 @@ static int snd_compr_stop(struct snd_compr_stream *stream)
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
@@ -801,9 +807,14 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
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
@@ -840,9 +851,16 @@ static int snd_compr_next_track(struct snd_compr_stream *stream)
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
