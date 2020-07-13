Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232321D408
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 12:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8E81673;
	Mon, 13 Jul 2020 12:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8E81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594637692;
	bh=/NxWqbrxqHS37kKZiHTcMOF00qUWOTU4rMNqfG9Jg9Y=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=adXkQlyMtrsnHxHvmGWObNoIW6GZOUER1UZ8U1GL9M1zGbFgPS742o9V5q25BrZyk
	 egxs9KZlq3sTYSq5Kle3RCnFOi7oGvkJIF9USlP8OByHFqWCBkYiirdPy9+1cMMiIr
	 Q+2qLnSqbGdyHS4iU65+wsdMkMcJxTtidkAw0eMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69806F8023F;
	Mon, 13 Jul 2020 12:53:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0698F80229; Mon, 13 Jul 2020 12:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FE40F80217
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 12:53:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE40F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="lxMgaEUS"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06DAqq0G170356;
 Mon, 13 Jul 2020 10:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5p1H8Inq6fO6+rbbZ/c2hQS2caboJT505k68LpcR9fQ=;
 b=lxMgaEUSs+HOtpGnJ/klzw93aoEd/f5QeM85ngkYzw2c+cdYz1LnlDpO5TdR4RI1K0N+
 K8Kk/GSV30eCVnyZcYWn23AWr1RkUQzMAVeUUonrMQ6ltnh6MrQgxmXwtJyDLEh4KHlL
 E766IDCvYbfl9Lb49PkwS++JtTRTwqTvcmluLgkwj9RQtN81sh+1WABlMXO3cY/o2ZHK
 Z0iCN06gPP1PWDer6lvtuouNoewLaYi97L56EluD3HJSoSbD36Dp5nQG2XWocYkxviem
 OEyOJFjmR6LaXqWmKi48gV5V/yg1K9/isgBa+gXaHbmb1QuwypR36W93Gba+HjhGSodg ig== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 3275ckx9rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 13 Jul 2020 10:53:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06DArULv111093;
 Mon, 13 Jul 2020 10:53:37 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 327qb0anau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 10:53:37 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06DArVkA011340;
 Mon, 13 Jul 2020 10:53:33 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Jul 2020 03:53:30 -0700
Date: Mon, 13 Jul 2020 13:53:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>, Mark Hills <mark@xwax.org>
Subject: [PATCH] ALSA: echoaudio: re-enable IRQs on failure path
Message-ID: <20200713105324.GB251988@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9680
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9680
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007130082
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org,
 Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

This should be spin_unlock_irq() instead of spin_lock().

Fixes: 6c3312544873 ("ALSA: echoaudio: Prevent races in calls to set_audio_format()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/echoaudio/echoaudio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index e81f42811f45..6aeb99aa2414 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -721,7 +721,7 @@ static int pcm_prepare(struct snd_pcm_substream *substream)
 	spin_lock_irq(&chip->lock);
 
 	if (snd_BUG_ON(!is_pipe_allocated(chip, pipe_index))) {
-		spin_unlock(&chip->lock);
+		spin_unlock_irq(&chip->lock);
 		return -EINVAL;
 	}
 
-- 
2.27.0

