Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC39663493
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 12:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE6238;
	Tue,  9 Jul 2019 12:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE6238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562669733;
	bh=rk+R47fd86zUruVk9XOMl1NURRL9WFX3prOS8b6LJqc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLa+AlVS5D4Pq4XPgg9K6wYE49fFkZ4T1WodgWwhWtBZ0Gnc4xLgXzqP+ouI9YkxR
	 brDcFONfm/dvG8CcHgj2BvkQPz77jXPtMwsc/CuLKHQb0SE4IeXEziyABNb7yA0pS6
	 iQkxOQpMbnAdobWPqL2v+endoILxrC/kjJxovy3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE02F80273;
	Tue,  9 Jul 2019 12:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CEA9F80273; Tue,  9 Jul 2019 12:52:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3609DF80274
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 12:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3609DF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="q0sV75Gf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69Ao53D027594; Tue, 9 Jul 2019 05:52:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=K6W3UgBGQKK0RMk9ZcV7yxdzMr8xHOWcu91QWBy6hsw=;
 b=q0sV75Gfg4tKgz4/I3dPQGAgzMYWBfT3plljvBfe6PcktmuSd8TWG6xZh81xQ3LjxgzL
 J0+1DJuYN+GWlnGDcd1aJn+qmUYvt6bhrbbl9bPezzvrelHIO8sXWiSU5dfsAySJNfZm
 lsCn2TdnX9Dn2iMU0ZljmAMtxc5t8iQDFyYAqkeQ9kH6kIptKOBj4E/M2RX0WNYBF+nH
 OzgIdQ0FOhgM5uubZeAtq28EfTa3BTcDqvpY6E3gSTPJn7Ff6p1ysgGW0K91Ef2lCvOh
 Qbq4SzyJ0xP5a7enG2LVQ2zelrIWHbt+9XzhyGE98pyuBS0pKlhV85V4AlicfNCmNYW3 aA== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
 by mx0a-001ae601.pphosted.com with ESMTP id 2tjs204d9v-1;
 Tue, 09 Jul 2019 05:52:13 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail1.cirrus.com (Postfix) with ESMTP id 98486611C8B8;
 Tue,  9 Jul 2019 05:52:12 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 9 Jul
 2019 11:52:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 9 Jul 2019 11:52:11 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A46672DB;
 Tue,  9 Jul 2019 11:52:11 +0100 (BST)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>, <tiwai@suse.com>
Date: Tue, 9 Jul 2019 11:52:11 +0100
Message-ID: <20190709105211.11741-4-ckeepax@opensource.cirrus.com>
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
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=911 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907090133
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 4/4] ALSA: compress: Be more restrictive about
	when a drain is allowed
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

Draining makes little sense in the situation of hardware overrun, as the
hardware will have consumed all its available samples. Additionally,
draining whilst the stream is paused would presumably get stuck as no
data is being consumed on the DSP side.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/core/compress_offload.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index c7d56cee0d510..9fcd06395a046 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -824,7 +824,10 @@ static int snd_compr_drain(struct snd_compr_stream *stream)
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
+	case SNDRV_PCM_STATE_PAUSED:
 		return -EPERM;
+	case SNDRV_PCM_STATE_XRUN:
+		return -EPIPE;
 	default:
 		break;
 	}
@@ -877,7 +880,10 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 	case SNDRV_PCM_STATE_OPEN:
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
+	case SNDRV_PCM_STATE_PAUSED:
 		return -EPERM;
+	case SNDRV_PCM_STATE_XRUN:
+		return -EPIPE;
 	default:
 		break;
 	}
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
