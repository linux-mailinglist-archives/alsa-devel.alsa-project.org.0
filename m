Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFED22B4434
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 14:01:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7543A1765;
	Mon, 16 Nov 2020 14:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7543A1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605531708;
	bh=nA36sr3ml3N9XV+/TozAJrRYE+bkBD5g9M4GVtSU6HQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mEBf98Xjgd71YF/xMRmJSfAu5WDUX3ZBay6GwQEYfH5kU1UD9TzFyG7jlG0B6MSK8
	 sNpww0403W+78zDlHzd09z3FPv56P4uxKqrxPnSL7cghg1L84PJyhox6dmmMcBH1Ql
	 xUR5LkeQjldFGGqEnISCARt3sxb/AwoVFNFDEHZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BFB0F8014A;
	Mon, 16 Nov 2020 14:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EFCDF80168; Mon, 16 Nov 2020 14:00:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0524DF8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 14:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0524DF8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="mlmTDdRk"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGD00AJ053317;
 Mon, 16 Nov 2020 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=bN1JOGDwmqyy+KHv+zxQrD8gAc0Gh6sp/wEQJplAPXk=;
 b=mlmTDdRkhp6zpryf6Vn+fxTa8g+SyUvRmgRVjYsY5bsdV7iICZbM5fk3BaOzTsEdH1jj
 bCXH4aaU1jWBd2jCdWjGEH0y+YgV65copq2+OvdvGhfmn4fJEz66431yOPIdHX+e1cf0
 SAOMDN+6md409CPXsAcYkbeayDEMY6BOGV8lviDLcjDGyFi3uKsJ7vgOMlmisXZRx/eg
 LEujLp3OGsaLi43tiM3Y/04u6GjOZ7IbepgQxlYFfbLADxNwKPy+Ndg+J4a1TzyS5nyb
 Sn6nqqiVOw/fVtArJ1cmNkIVtVbwD3o/4o8rWRZ7e2QnPz4qYGZtd9nRapIpMFzHVaNV 0w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 34t7vmvu1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 13:00:02 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGCoiFl079689;
 Mon, 16 Nov 2020 13:00:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 34ts5unfdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 13:00:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AGCxvQH023727;
 Mon, 16 Nov 2020 12:59:57 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 04:59:57 -0800
Date: Mon, 16 Nov 2020 15:59:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Patrick Lai <plai@codeaurora.org>,
 xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Subject: [PATCH] ASoC: qcom: sc7180: initialize the "no_headphone" variable
Message-ID: <20201116125950.GA44063@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160077
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

The "no_headphone" variable is never set to "false" so it could be
uninitialized.

Fixes: e936619b7ce7 ("ASoC: qcom: sc7180: Modify machine driver for sound card")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Apparently we recently turned off uninitialized variable warnings by
default in commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized")

 sound/soc/qcom/sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index e2e6567566af..de70fa792aea 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -316,7 +316,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *link;
 	int ret;
 	int i;
-	bool no_headphone;
+	bool no_headphone = false;
 
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-- 
2.29.2

