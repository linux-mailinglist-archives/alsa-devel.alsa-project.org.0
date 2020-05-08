Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BD1CB246
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 16:50:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC8B1614;
	Fri,  8 May 2020 16:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC8B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588949424;
	bh=UaveMLkieMljSTSwtb5ak7pTAd9zwAq8sDjwEx3LzpA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BLiPWR1z81XRoDWWJoL84/pYzWUfhiE67igR44CxgsNUMYF9bTPuqblja1Lj2qgoe
	 63PvxYkUX8uGuz2f0vGQz6rHBwEJSpnbba7KaW7o1v3W35iWPus9jH/t1zRpv8y2IF
	 m1O7oqNsxZZOGIJGV5u2KjgcmmMu5EA5Dt7rNVVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CDD7F800AD;
	Fri,  8 May 2020 16:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A15EF80234; Fri,  8 May 2020 16:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA69F800E7
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA69F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="SO3A08b4"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048ElnMD175280;
 Fri, 8 May 2020 14:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5H4orkD2izBpWqIS8JRYFxALT5OGEhF4U5DYeNYbJqE=;
 b=SO3A08b4wem/Yc3JPTC3wMm3HnFoPkx7u+gUwDgIdb/fNCBgII2Z9CDjhrtxTbx7WJEq
 P94n0C5RBsV/HIjmQa7nzVpMVo6HF709SrojCtmQSo4ub34id3jLd2X0ie/QZrFkt+jF
 DYYiPfK9lfdrFWaax9gRsL1OY+TRal/SXygAFCzJ95BkMce17s/fUrQjPIliW/XcVNII
 XhPvjOdmJ/v/jPUgV+Gyw6oAhAAX0KHVu7y+CiJ8ydKhLboLA8APYFmBNoD5C46hS72p
 A7A5cu1Jy4/BLbIKaskdkSwMVeOT2DKs7lGzTcOrrwhcDQPj8ZKZWjvfvv3c0xW1Mpa+ iQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30vtewuct1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 May 2020 14:48:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 048ElsVV155765;
 Fri, 8 May 2020 14:48:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 30vtecpm3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 May 2020 14:48:34 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 048EmPl1002703;
 Fri, 8 May 2020 14:48:31 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 May 2020 07:48:24 -0700
Date: Fri, 8 May 2020 17:48:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaya Kumar <jayakumar.alsa@gmail.com>
Subject: [PATCH] ALSA: cs5535audio: Fix a math error in
 cs5535audio_build_dma_packets()
Message-ID: <20200508144818.GA411239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005080132
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9614
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005080132
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

We want to allocate enough space for CS5535AUDIO_MAX_DESCRIPTORS + 1
elements and we also want the size to rounded up to PAGE_SIZE.  The
"+ 1" is because we don't use the zeroeth element.

CS5535AUDIO_MAX_DESCRIPTORS is 128.  Each element is 8 bytes.  So it
should be "(128 + 1) * 8 = 1032" but rounded up that becomes 4096.  In
the original code, it did the "+ 1" after rounding up so so it allocated
4097 bytes.  The DMA API will probably round this up to two pages.

Fixes: 9b4ffa48ae85 ("[ALSA] Add support for the CS5535 Audio device")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/cs5535audio/cs5535audio_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
index 4032b89b1fc1d..f6324636b355f 100644
--- a/sound/pci/cs5535audio/cs5535audio_pcm.c
+++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
@@ -100,7 +100,7 @@ static int snd_cs5535audio_playback_close(struct snd_pcm_substream *substream)
 }
 
 #define CS5535AUDIO_DESC_LIST_SIZE \
-	PAGE_ALIGN(CS5535AUDIO_MAX_DESCRIPTORS * sizeof(struct cs5535audio_dma_desc))
+	PAGE_ALIGN((CS5535AUDIO_MAX_DESCRIPTORS + 1) * sizeof(struct cs5535audio_dma_desc))
 
 static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 					 struct cs5535audio_dma *dma,
@@ -118,7 +118,7 @@ static int cs5535audio_build_dma_packets(struct cs5535audio *cs5535au,
 	if (dma->desc_buf.area == NULL) {
 		if (snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV,
 					&cs5535au->pci->dev,
-					CS5535AUDIO_DESC_LIST_SIZE+1,
+					CS5535AUDIO_DESC_LIST_SIZE,
 					&dma->desc_buf) < 0)
 			return -ENOMEM;
 		dma->period_bytes = dma->periods = 0;
-- 
2.26.2

