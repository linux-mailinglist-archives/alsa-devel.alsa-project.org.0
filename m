Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B86BDCB9
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 13:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2EAB16E2;
	Wed, 25 Sep 2019 13:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2EAB16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569409715;
	bh=VgW79svu9DiTk5D836Xrg9kZ70LXSyPeeK7c9k1CSYI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HIv/K0exAtiWvQDiFAhZeFJF/Iw8nOdXtlnUBr+GyN1IVp5t1S0cdBj+CA5hZ8Kzi
	 Y8yj8K0+3iJA0+mHMFAkiekMx5FJHGdYjndJDn8eURMN32BqXgYP4UlfSlBk+oHqmi
	 zAf74I1loJ2ICGO/WaWI6b5gsrXzH1oymlsyhMyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C991F80323;
	Wed, 25 Sep 2019 13:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A397F8044C; Wed, 25 Sep 2019 13:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 092C8F80213
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 13:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 092C8F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="IRv+ZXFZ"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PB4OmZ095135;
 Wed, 25 Sep 2019 11:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=jXlr/e80TuThV18DJdWjU8yhwhN6246i9hAHJPn81CU=;
 b=IRv+ZXFZrpCmx+EWqQ6sPBZav3IcKOG8LPAJWrcNBUR7oOX6RPfVqtax3PjnZLr3nFk6
 v35PSKmZJE9la9cRkmN490vcNfxGU9foWfrhTqEPN+0hKwQsGVBH6GOwXOQ6h7flLwNI
 /R8nmm+j/B0qO917Mq5sfpSsfG4ryrOpbceJ6301aGgPDN0B9fpuLiZ836+yOkvtXU/G
 d93dYox9Al2KrsX2TOK6+eaI/c9ZdpUNutuKxswkMtzahgjk06ZWz1udDjzX4R0aMPcB
 UgNoMp9FkKfrfFUqVvqragMNQQpqt/o49TQqyomw3NX3rp4N2i+0FM+D8kiFKPhLmlMp YA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2v5b9tuwcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 11:06:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PB44CX145953;
 Wed, 25 Sep 2019 11:06:34 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2v82tjpq33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 11:06:34 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8PB6Vsm011439;
 Wed, 25 Sep 2019 11:06:31 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 25 Sep 2019 04:06:31 -0700
Date: Wed, 25 Sep 2019 14:06:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>
Message-ID: <20190925110624.GR3264@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909250113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250113
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: topology: Fix a signedness bug in
 soc_tplg_dapm_widget_create()
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

The "template.id" variable is an enum and in this context GCC will
treat it as an unsigned int so it can never be less than zero.

Fixes: 8a9782346dcc ("ASoC: topology: Add topology core")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index aa9a1fca46fa..0fd032914a31 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1582,7 +1582,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 
 	/* map user to kernel widget ID */
 	template.id = get_widget_id(le32_to_cpu(w->id));
-	if (template.id < 0)
+	if ((int)template.id < 0)
 		return template.id;
 
 	/* strings are allocated here, but used and freed by the widget */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
