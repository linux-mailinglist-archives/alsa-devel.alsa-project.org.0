Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47687302423
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 12:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACEC81826;
	Mon, 25 Jan 2021 12:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACEC81826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611573306;
	bh=IZG/lBVlh7xAAgD8Sgd99ivrbKf1gDMXR7TYkPYrjmY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WmA1LkjStRlCLT+Q0AtovLXOBUQDeEwPzxeFphSFBG2HWWDfy4vaofaHkiIVGJ4BY
	 DjIY6F2h0V4RfZlO+ncMVV7KUZkSVPGM3az50mi73k9+PrqJvhnCeFaRe0+nQIFC+c
	 tN71wJi4oxpH6u5uK7/B+sUTWJXpCuZCS6+gsVKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96D5EF8014D;
	Mon, 25 Jan 2021 12:14:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FBC2F80269; Mon, 25 Jan 2021 12:14:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C88AF8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 12:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C88AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="oS+SniZq"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBATaP041976;
 Mon, 25 Jan 2021 11:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=IHBhLaGj6UWDWi1eekSLz6D/GroKcem/weopQXWweGo=;
 b=oS+SniZqR7QRSMGKFC6PQzV8iiRzxvSdqMNtjDbNZsA3fOKIwWnfFzvGVm/CNuufivwe
 lZ3GJUKz6sp0R+zjHOaKuP+DlzONBomiSRF7kvAsmiVUvvPFBECqarX5YgJ8blCtSzPF
 Lp/xPURH9TeQfGGT+G9SR4aVyeFzkblxX3U63+jO2n2qz9vDMSiztCSeoUBRy/d76ck/
 pR9G79WUp1ke9N737RuDuUAFEOwWDsN0wpMLGJFwyQxfGPjf4M5mfAk51L8duJsjqgPn
 HNgvHO4+byRngwT9yYrl0VdyFSX4fSDThv2NMJw5yw4XwphpUTn5wu/2EYt/eLg9eJOE WA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 368brkcrkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 11:13:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10PBAxdC007182;
 Mon, 25 Jan 2021 11:13:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 368wckeewf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 11:13:53 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10PBDpKI025099;
 Mon, 25 Jan 2021 11:13:51 GMT
Received: from mwanda (/10.175.173.24) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 25 Jan 2021 03:13:51 -0800
Date: Mon, 25 Jan 2021 14:13:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Clemens Ladisch <clemens@ladisch.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 2/2] ALSA: fireface: remove unnecessary condition in
 hwdep_read()
Message-ID: <YA6n6I8EcNAO5ZFs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122071354.GI20820@kadam>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250065
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250065
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

Smatch complains that "count" is not clamped when "ff->dev_lock_changed"
and it leads to an information leak.  Fortunately, that's not actually
possible and the condition can be deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: just delet the condition

 sound/firewire/fireface/ff-hwdep.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index 4b2e0dff5ddb..ea64a2a41eea 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -35,13 +35,11 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
-	if (ff->dev_lock_changed) {
-		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
-		event.lock_status.status = (ff->dev_lock_count > 0);
-		ff->dev_lock_changed = false;
+	event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
+	event.lock_status.status = (ff->dev_lock_count > 0);
+	ff->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
-	}
+	count = min_t(long, count, sizeof(event.lock_status));
 
 	spin_unlock_irq(&ff->lock);
 
-- 
2.29.2

