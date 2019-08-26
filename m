Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C49D0FE
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 15:47:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED391689;
	Mon, 26 Aug 2019 15:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED391689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566827272;
	bh=IHNAMt4ogh0Fj9vIEdkT11HNtHTuTVL0PnW6j5VdhFI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oUFLzXX7UtrLFXLoYPzXI0YVxn66ENTKjRWEe7nGB7vS7wEmURfyXNUX9yia3H/lE
	 AhlE4WnC5v3e0c3VoYXd21VdZrDuuqXpV2fXktcbIxy0VbEyOBMFtJW4UnhQYYQF5v
	 ENI9id9hjMloBZD/tPi2LVEh4f35ChFwlcso53Yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28AF9F80377;
	Mon, 26 Aug 2019 15:46:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08117F801ED; Mon, 26 Aug 2019 15:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1F80F801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 15:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F80F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Dx/vG1Dv"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QDi73o161127;
 Mon, 26 Aug 2019 13:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=crU5vbansQYj72/7izrQoi4P6lT6mqQVmGlGvifPqFo=;
 b=Dx/vG1Dv5vbGboJ4wJWqf3aFdUXGleAT+BJV43pb8Vh6xRL1tFPHwenfxNuJ7DgdjnZX
 mpGTURdrYOg+SgORBnOOHv7Ul4LYtE3wLYoAXPJe34zYM0SvJV+YORuCEQ/H8srgVPnI
 IxnOzeDwQ1ETS+dkc1hCrxRz4wHP8CoEh6FJs5+6m9A281jAi7k3Yf7/WWWNkTWlMajS
 bzTy+NY6PAaoFzm2HQN1rqJI/pZYejox7Qy8XPuBArTcxBf60IHl9uwM9+DiKUl3Sgrp
 ffbyWufpvINGBLDcN7fDnDDSQdCz2B7YHyD5P+I5flUjLEs/XhJbcrpzUEF2QD29Rhdp Pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2ujw7018yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:45:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7QDi7wG111548;
 Mon, 26 Aug 2019 13:45:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2ujw79jray-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:45:58 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7QDjvqi011325;
 Mon, 26 Aug 2019 13:45:57 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Aug 2019 06:45:56 -0700
Date: Mon, 26 Aug 2019 16:45:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Message-ID: <20190826134550.GA8842@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908260150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9360
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908260150
Cc: Richard Fontana <rfontana@redhat.com>, alsa-devel@alsa-project.org,
 Hui Peng <benquike@gmail.com>, kernel-janitors@vger.kernel.org,
 Wenwen Wang <wang6495@umn.edu>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: remove some dead code
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

We recently cleaned up the error handling in commit 52c3e317a857 ("ALSA:
usb-audio: Unify the release of usb_mixer_elem_info objects") but
accidentally left this stray return.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/mixer.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a0468c4a6326..a607577f0097 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2633,7 +2633,6 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 		usb_audio_err(state->chip, "cannot malloc kcontrol\n");
 		err = -ENOMEM;
 		goto error_name;
-		return -ENOMEM;
 	}
 	kctl->private_value = (unsigned long)namelist;
 	kctl->private_free = usb_mixer_selector_elem_free;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
