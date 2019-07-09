Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1DE63496
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 12:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E0A1671;
	Tue,  9 Jul 2019 12:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E0A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562669752;
	bh=CZpY8V+v6Sj8/cLi/u5pAMaaqZuNBPAzWjprBVgBhoI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPYdabluVQhZNwNP19saIr96BpES1O32T6I8JE/b3WRXJr5U34bIqG9lLGHyx435I
	 80nDyGxno3RruGyF5ZwN8t1Zq15eXvEOpolAb8frIj+5FVZCBmMyC/hmPSYkCm4Lnv
	 oCwEVDgMb7H0lHOL5M1hpaeteD6Pw+gbF41uEhwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FEC6F802E0;
	Tue,  9 Jul 2019 12:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46A8F801A4; Tue,  9 Jul 2019 12:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BFD5F80275
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 12:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BFD5F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="HJnWsLgr"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69AnEXo027065; Tue, 9 Jul 2019 05:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=n6mOsrLEc1rquRsX7VcRJeg67j0IOHDnDDeq9aDydss=;
 b=HJnWsLgrbF57PXsYZp1dxLDjy7qAjsarXoGto00iMOXvet38shfNamJusYOhDrEH1VPt
 Cq00dDysuhbJh2n2/6931jS6VV/B0S32FqkBn8xURWHp8ZARyBX49S6nD3RiQR6BOUoD
 cmwWzdXwDx4HXLuBM/EBVAv8JDuROJTXI6dOPBwLA8eQQESbWhhLKYvofMs6v74c3Gfr
 c+eWD/O8L10KMM1kZOr0Q2Ke+DoDUO+1GIf9/XCG445Vy7Jxn0D9eKhp7wKJyXSrerfx
 klL4iZ3c39HIh+aQVqrMdSvmWcOn6MMNzCgH3kRR4L8eNAc0z1IFZ8XzFTzULpYJZaZp wQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tjs204d9u-1;
 Tue, 09 Jul 2019 05:52:12 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 40B85611C8B1;
 Tue,  9 Jul 2019 05:52:12 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 9 Jul
 2019 11:52:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 9 Jul 2019 11:52:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 961A02A1;
 Tue,  9 Jul 2019 11:52:11 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>, <tiwai@suse.com>
Date: Tue, 9 Jul 2019 11:52:10 +0100
Message-ID: <20190709105211.11741-3-ckeepax@opensource.cirrus.com>
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
Subject: [alsa-devel] [PATCH 3/4] ALSA: compress: Don't allow drain
	operations on capture streams
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

Partial drain and next track are intended for gapless playback and
don't really have an obvious interpretation for a capture stream, so
makes sense to not allow those operations on capture streams. Drain
would make sense on a capture stream but currently the implementation
of drain involves the kernel waiting for the DSP to consume its
available data, whereas a capture drain would involve waiting for
user-space to consume the data available on the DSP. Disallow drain
on capture streams until that is implemented.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/core/compress_offload.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index e1a216fd832f9..c7d56cee0d510 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -829,6 +829,10 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
 		break;
 	}
 
+	/* drain not implemented for capture streams yet */
+	if (stream->direction == SND_COMPRESS_CAPTURE)
+		return -EPERM;
+
 	retval = stream->ops->trigger(stream, SND_COMPR_TRIGGER_DRAIN);
 	if (retval) {
 		pr_debug("SND_COMPR_TRIGGER_DRAIN failed %d\n", retval);
@@ -847,6 +851,10 @@ static int snd_compr_next_track(struct snd_compr_stream *stream)
 	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
 		return -EPERM;
 
+	/* next track doesn't have any meaning for capture streams */
+	if (stream->direction == SND_COMPRESS_CAPTURE)
+		return -EPERM;
+
 	/* you can signal next track if this is intended to be a gapless stream
 	 * and current track metadata is set
 	 */
@@ -874,6 +882,10 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 		break;
 	}
 
+	/* partial drain doesn't have any meaning for capture streams */
+	if (stream->direction == SND_COMPRESS_CAPTURE)
+		return -EPERM;
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
