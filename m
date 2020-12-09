Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E52D3BBD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 07:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D1416F1;
	Wed,  9 Dec 2020 07:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D1416F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607497063;
	bh=8x7fYsl7QtSoraYuC+LPmCmrVWWoU98gfsrGFT92eSc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ELKWADs7fD4LlpVj4YxzGZ/6nByW26TvDrBBopBScQYJIoxZVG3ZByDiaSkDFP4J8
	 enCZASbFbwasPHD8IR5/vc/9RyI88HSUJ3t1X74H2A7v5Fvx4gun6PtWxR+V9Im8ty
	 xpXZM6FaMtFPc/scm8A5gTj2A+ygDO8s46aZr0c8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3BB8F8026A;
	Wed,  9 Dec 2020 07:56:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02436F8021D; Wed,  9 Dec 2020 07:56:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C8FAF8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 07:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C8FAF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="zWY0nC5F"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96tRj6084325;
 Wed, 9 Dec 2020 06:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=npaGBODiUebhrnP5uVe/n/+Gmor/ZdeOhj8yDGqH2iQ=;
 b=zWY0nC5F+6wqHT6KOF/AX6qzs4ESHQp9NGUK9p61usz0Vu036cJ9TMfhAB2/SahN3Q4l
 +aiqCsRnTTknZi+S5R0w8vYskshuFR3rXJBOpquNIUT3GEySwZTfiI8RjPuDrwDty1p7
 IMKTJp9VxOis8wBYU94yygX7NrgWozn59yPmX7oBkfG5dz5yWZuhJPudvclS41T91xhb
 zGEJlDpH9bqpgfeCbI8T6JC7SUj1xuxAQAKPeoz+iTxxfzHCtQcji+mwH0H5h7Bx0ts4
 8a62fbxIWXoZlt7ugr+JA9MyBRHAQXlM92zUKCZJ1UxTeEqAFkgCR1knLvjsoBZEYfst yA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 357yqbxn52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 06:56:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B96oaDZ138696;
 Wed, 9 Dec 2020 06:54:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 358m3ytq82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 06:54:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B96sKIj003448;
 Wed, 9 Dec 2020 06:54:20 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Dec 2020 22:54:19 -0800
Date: Wed, 9 Dec 2020 09:54:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: wm_adsp: remove "ctl" from list on error in
 wm_adsp_create_control()
Message-ID: <X9B0keV/02wrx9Xs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090046
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090047
Cc: alsa-devel@alsa-project.org, Adam Brickman <Adam.Brickman@cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>,
 Mark Brown <broonie@kernel.org>, Luo Meng <luomeng12@huawei.com>,
 James Schulman <james.schulman@cirrus.com>,
 Vlad Karpovich <Vlad.Karpovich@cirrus.com>
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

The error handling frees "ctl" but it's still on the "dsp->ctl_list"
list so that could result in a use after free.  Remove it from the list
before returning.

Fixes: 2323736dca72 ("ASoC: wm_adsp: Add basic support for rev 1 firmware file format")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/wm_adsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index e61d00486c65..dec8716aa8ef 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1519,7 +1519,7 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 	ctl_work = kzalloc(sizeof(*ctl_work), GFP_KERNEL);
 	if (!ctl_work) {
 		ret = -ENOMEM;
-		goto err_ctl_cache;
+		goto err_list_del;
 	}
 
 	ctl_work->dsp = dsp;
@@ -1529,7 +1529,8 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 
 	return 0;
 
-err_ctl_cache:
+err_list_del:
+	list_del(&ctl->list);
 	kfree(ctl->cache);
 err_ctl_subname:
 	kfree(ctl->subname);
-- 
2.29.2

