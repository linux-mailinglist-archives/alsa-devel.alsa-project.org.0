Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7A1133B49
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 06:39:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 862E3180D;
	Wed,  8 Jan 2020 06:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 862E3180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578461965;
	bh=p+q8jlR+0ZKwXH3rfuahSzVUeVl0UjTFVHCULkMQgwk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oZm3aHtmnuddyberQEsHnMRWy5Hpvqk0Y9cUPnWQ5xqCLTs3smlkdhOtdW+XatX8r
	 3cZIgsb8tpweb1NXFiOEVTqLgA/sHBC7xdG59dqmyF8Laoje8BMokLsm2d4MNWTyHC
	 ET2hHfyJacW9b82yUJJJZmf2sIssnNed/LPlwnaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE11F80159;
	Wed,  8 Jan 2020 06:37:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7323F80159; Wed,  8 Jan 2020 06:37:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09446F8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 06:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09446F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="hOkYN8eW"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085TWaA082176;
 Wed, 8 Jan 2020 05:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=6yMY9tCUW+Zz3vJLeZlb0YXm9NayUfaLZuZW64OoMlo=;
 b=hOkYN8eWa/48COhJMrpIBVha8j5ZX3fSaF4lgvH+h5qFsP1VNHWMVNLt7lLUTP4HMgxU
 Dy2K61ciPeDIpkONf55XhOyGOVBthnR43k+rgXpuWcWbdph9FHXogngtVAlYbQ2vhWh1
 SyhiAaq+91jJ/t+Nma2qDi4MrV7jRIXC7JvuU8uwQud8JjJwfCKo1YTYFonuaD8vzEbH
 T3HHKYusRnnoLXDW5VswS1L4Zbd5WjJtrhmdIbzVHahjyphdNGoXWmO21Ub29aV8edES
 /OwJ9f6VHc8CQuqrK8DsOr40bsFsOWr4qv7h9q6zznwNvMrka6fgJfwZn3hBWkKi7yyK Yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2xakbqsk1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2020 05:37:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085Xojf187905;
 Wed, 8 Jan 2020 05:37:31 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2xcqbk90vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2020 05:37:31 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0085bEQ3011993;
 Wed, 8 Jan 2020 05:37:18 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Jan 2020 21:37:13 -0800
Date: Wed, 8 Jan 2020 08:37:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Message-ID: <20200108053706.h3hcnvmnf62wkjac@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=971
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001080048
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001080048
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Kirill Smelkov <kirr@nexedi.com>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] ALSA: control: potential uninitialized return
	value
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

Smatch complains that "ret" might be uninitialized.

Fixes: fbd3eb7f66c5 ("ALSA: control: Add verification for kctl accesses")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/core/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index d06033d418a8..aa0c0cf182af 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -896,7 +896,7 @@ static int sanity_check_elem_value(struct snd_card *card,
 				   u32 pattern)
 {
 	size_t offset;
-	int i, ret;
+	int i, ret = 0;
 	u32 *p;
 
 	switch (info->type) {
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
