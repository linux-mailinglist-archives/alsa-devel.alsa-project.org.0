Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D12FCDB4
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 11:01:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189D81858;
	Wed, 20 Jan 2021 11:00:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189D81858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611136875;
	bh=kbwa+cMCRO1Q0T7J57b75gUeVzEJDdEl1vstFEXUYbU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZHPljDgfUjbjovM9HdJ0qjFMOQ8g6ifToD6SwwQkcJI5TU/gtas3Q3b2FNBUJGtKJ
	 6vBE/3t3lj2rETsWynlo2Zf42QKch61jj1xvI4byJ49wF4SCDSxJTCQgE9f9GLYmNN
	 yq5NOmDDAnxaehHRtM01ZTjd2025/KFFSk2Ew5SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 760A9F80164;
	Wed, 20 Jan 2021 10:59:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9E92F8016E; Wed, 20 Jan 2021 10:59:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F75AF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:59:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F75AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="VSrx8klN"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10K9oF7t193341;
 Wed, 20 Jan 2021 09:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=XCc1VDD4/Cd613sC4Bo4DtbwqBpJQiWj8GB6xMClUl4=;
 b=VSrx8klNJPidglCtWhsHGzhQA6KTZZRf/jAnRUbrTCIXhgmwPXlcnyTg2sAC9TywM1wH
 daNa/e2sN7mgXMqZ2qoYiO+aSw5e6RSivXyyqpkHb4k6y79AMqDcsxsmhy/thBuX7u4G
 Pa3rn0seHdF2IZ5DuwHKnZAU9rTpOrvQzBo/0MbS5gNg5K7PWGqzCXlHrl9ymoaU66ez
 9L8Rdx1IaSZxSZ6miEB/709xaEjA5fpE6KRV9AZzi2rRb4SpJ0p+FE9PsTPVHO+LJFCC
 hWV54eZ6SOJFnFriDgWYCgrkD16lVf8pZEqwtD0ufwLYwshcGyYaDb0zdrgyJSAQz5Xr 5Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 3668qmspyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 09:59:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10K9sdTx125900;
 Wed, 20 Jan 2021 09:59:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 3668quxxje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 09:59:27 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10K9xLFj000887;
 Wed, 20 Jan 2021 09:59:21 GMT
Received: from mwanda (/10.175.34.136) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 Jan 2021 01:59:20 -0800
Date: Wed, 20 Jan 2021 12:59:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: topology: Fix memory corruption in
 soc_tplg_denum_create_values()
Message-ID: <YAf+8QZoOv+ct526@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200056
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200055
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
so it leads to memory corruption later in the function when the data is
initialized.

Fixes: 5aebe7c7f9c2 ("ASoC: topology: fix endianness issues")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is from static analysis, not from testing.  Obviously we don't
want memory corruption, so my patch is an improvement.  But I feel like
a better approach might be to change the type of dvalues[] to u32.  I
took the less risky approach because I'm not an expert and can't test
it.  But if someone else can take a look at it, then I'll redo the
patch.

 sound/soc/soc-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 950c45008e24..37a5d73e643b 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -902,7 +902,7 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
 		return -EINVAL;
 
 	se->dobj.control.dvalues = devm_kcalloc(tplg->dev, le32_to_cpu(ec->items),
-					   sizeof(u32),
+					   sizeof(*se->dobj.control.dvalues),
 					   GFP_KERNEL);
 	if (!se->dobj.control.dvalues)
 		return -ENOMEM;
-- 
2.29.2

