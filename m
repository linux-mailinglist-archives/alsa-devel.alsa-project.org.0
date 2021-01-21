Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD72FE258
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 07:12:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66D31868;
	Thu, 21 Jan 2021 07:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66D31868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611209546;
	bh=tiLPoCgpxpsTeTGY2s73KJ0WbZINBIw32XLpXc6vPd8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZLP8Bt9ArlAdEuxlcvRRHxsUOxAc2r+5Bfw/Oaa03r2lzxPI5OCqTmCB3WEdTs9rW
	 7bYX40kItAatTKcp7DElk60h6Ko6yhxZJtFWSNZQQmy/HY/oKTck8K+TIy4go2ALTz
	 SYbyqAhXmkXfiz/Ec08PAcHdWO3okeUrzN5BkGCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EF7F8026A;
	Thu, 21 Jan 2021 07:10:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72B7BF80162; Thu, 21 Jan 2021 07:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F32EF80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 07:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F32EF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="TVWUrVKb"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L64inx056830;
 Thu, 21 Jan 2021 06:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=uidPYjAeACZRyzOOxUNENCvPuBjyBSqI1aLHV8h8sqU=;
 b=TVWUrVKbDXEQPLf+DyFxNeV/kp1YOCXpYKvavrdkfcerZGuwUa62s28tbclXtuCvITxO
 bO8LqApuj7tkW6KpNFIr42sKHZowrjY5AD9puYJ9hC4RZGSFug7hfXhshj2cTvJgRzax
 wKdc/7d6fWjeuDQUPsrJJF/fc9w6LJeT+7Rg2moq3tEPaXbSV7UzSNC++l5x+YypBIKu
 FuVcgkpneRHbEenype6ell5wJ+ZX8yEQ7WrIEcb2ooZDheKp9ijuc6QmprejRd977fFd
 Q6iGjH3aeocrtNLbqVPdS9r5ef2z7o2I84nvFMBAE8NqsFKhem7Sen1d+cnMgzM4jb3b DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3668qmwqgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 06:10:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10L65i1K007615;
 Thu, 21 Jan 2021 06:10:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3668recuvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 06:10:33 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10L6ANx5018550;
 Thu, 21 Jan 2021 06:10:26 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 Jan 2021 22:10:22 -0800
Date: Thu, 21 Jan 2021 09:09:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH 1/2] ALSA: oxfw: fix info leak in hwdep_read()
Message-ID: <YAkassrrWUtsW6aZ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210031
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

If "count" is too large and "oxfw->dev_lock_changed" is false then this
will copy beyond the end of the struct to user space.

Fixes: 8985f4ac1c42 ("ALSA: oxfw: Add hwdep interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/firewire/oxfw/oxfw-hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index 9e1b3e151bad..ca5477eeb663 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -35,12 +35,12 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
 	}
 
 	memset(&event, 0, sizeof(event));
+	count = min_t(long, count, sizeof(event.lock_status));
 	if (oxfw->dev_lock_changed) {
 		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
 		event.lock_status.status = (oxfw->dev_lock_count > 0);
 		oxfw->dev_lock_changed = false;
 
-		count = min_t(long, count, sizeof(event.lock_status));
 	}
 
 	spin_unlock_irq(&oxfw->lock);
-- 
2.29.2

