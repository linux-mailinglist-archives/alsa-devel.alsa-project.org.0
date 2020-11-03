Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA52A418F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 11:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A5EA17A5;
	Tue,  3 Nov 2020 11:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A5EA17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604398812;
	bh=QMz4kxiIkzQj2HLKUerJyiVY7mW5U91JJT0z5mMIZmM=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YZVNfBF2h7yIWkf7KUtAiVmC/XOo17Gv7tOc0lGxyUt7Qsi5jV/spBcVVRUjyqP4N
	 uAsuLFeZy+dQVyeiP1F43RX1d8DKNzPCbE5P9FElrKle6KDi67zg5lf+1hrTf9JYlR
	 8gy2to9LH+DmEtDLz/IxYXdhvmhDvNFidUd6GIrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08A10F802A9;
	Tue,  3 Nov 2020 11:19:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 419D7F8028D; Tue,  3 Nov 2020 11:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E92EF80162
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 11:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E92EF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ewMyRh14"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AFft0061977;
 Tue, 3 Nov 2020 10:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=67RtaQPwR6pLPB0Bu0iVbw6jVufOlG2zz7X/ElvH6cU=;
 b=ewMyRh14dmXF6gyyyV7sfdji+F2fSI3iigLY74lt84GFamN7LrmvO/HrrWDN7CCkcSMW
 8c4aal5HK7l7dWYuW+bxO3iMttFVzFhGRdE6L7cGwwzSiBIFmnmMtE4F4ECLILAp4fOI
 s1t75FevVdc0D/sujTZeWIh+25mDPtsdJYSx4zbwiy3mdjBK35Xsrwzl+5KohXXSu4ml
 yUS9ftfQRkfUKi/yJDwtV7u4+XgoAgeOJq8VOR582vthbwa6ibGbfitvvaFX4OUzFqyG
 IWb1Bm+NIr6/dazw/PGS2zcU6Y6DWQZv88SzQdGYSsvp7KTB2O/mAWOse1FL/LejWjVA IQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34hhvc8fnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 03 Nov 2020 10:19:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AFhDU046939;
 Tue, 3 Nov 2020 10:19:01 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34hvrvka5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 10:19:01 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A3AJ0r7009232;
 Tue, 3 Nov 2020 10:19:00 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Nov 2020 02:19:00 -0800
Date: Tue, 3 Nov 2020 13:18:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Patrick Lai <plai@codeaurora.org>
Subject: [PATCH] ASoC: qcom: sc7180: Fix some indenting in
 sc7180_lpass_alloc_dma_channel()
Message-ID: <20201103101853.GD1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011030068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030068
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

This code is correct, but it should be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/lpass-sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index c6292f9e613f..61a208fe6875 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -96,8 +96,8 @@ static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
 						v->rdma_channels);
 
-		if (chan >= v->rdma_channels)
-			return -EBUSY;
+			if (chan >= v->rdma_channels)
+				return -EBUSY;
 		} else {
 			chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
 					v->wrdma_channel_start +
-- 
2.28.0

