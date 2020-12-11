Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD942D736E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 11:08:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60D321721;
	Fri, 11 Dec 2020 11:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60D321721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607681335;
	bh=uVUQlPC6vScWVou4MetlmlYtBQ23eE76RaTkIyCOIcU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mM2RBCyyGvhY2Vx2o2zPPcREqlJCBROwX1vxPqQTzXooOMNDATlJBXBIuD+1KkilR
	 +WOuZEXc7uEvuHBZ/8FUxLBV6ydlBs4ApfaCk0OP37rf4Kk5LEVL746RMGNDPuvHv+
	 C0ozR51gAgBpjANp5b4umCowHQ1S/VGjCQ/ZsHCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAAE5F801D8;
	Fri, 11 Dec 2020 11:07:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA67F8020D; Fri, 11 Dec 2020 11:07:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6196F8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 11:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6196F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="oGypySpN"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BB9xQvw104715;
 Fri, 11 Dec 2020 10:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=JImxBMKaa3RdyGk4mkBFq/GSb62ggB7gx8mMAoZPZeM=;
 b=oGypySpNBoVZuzkJF5FN2kn2dlKowjq9wCAB9Wlt5Urc/pV21Tz0hKANaARTSCBTyBqv
 6uKQgMt97cQpEzvpmROmwWzep5L4h6l/AHq100QRCeVUaVq9N2UQRuxrX7dvj3Pt1vmR
 1lqKoiD9vqiNBWNuZGk+M80kKuC85+RX7LgSxEhncRc2820mKCLtj0Yanl77pM+KzoNA
 XAGW7ONRA9ojgpNtqqrxAQqrSHiYZyKwUvU/s13GKHV/A8yGQOOgneQcaIEun0jPewYk
 mQtOJA2qlO000+UYLBKjLDUUrBZqhxJ3UzIwwyPNWTultwmRuVmyNSx+U7wAtKMUSGmm 6A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 35825mhw1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Dec 2020 10:07:07 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBA10hL152750;
 Fri, 11 Dec 2020 10:07:07 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 358kst34cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Dec 2020 10:07:07 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBA72eO023742;
 Fri, 11 Dec 2020 10:07:04 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 11 Dec 2020 02:07:01 -0800
Date: Fri, 11 Dec 2020 13:06:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [PATCH] ASoC: Intel: fix error code cnl_set_dsp_D0()
Message-ID: <X9NEvCzuN+IObnTN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110061
Cc: alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

Return -ETIMEDOUT if the dsp boot times out instead of returning
success.

Fixes: cb6a55284629 ("ASoC: Intel: cnl: Add sst library functions for cnl platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

 sound/soc/intel/skylake/cnl-sst.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index fcd8dff27ae8..1275c149acc0 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -224,6 +224,7 @@ static int cnl_set_dsp_D0(struct sst_dsp *ctx, unsigned int core_id)
 				"dsp boot timeout, status=%#x error=%#x\n",
 				sst_dsp_shim_read(ctx, CNL_ADSP_FW_STATUS),
 				sst_dsp_shim_read(ctx, CNL_ADSP_ERROR_CODE));
+			ret = -ETIMEDOUT;
 			goto err;
 		}
 	} else {
-- 
2.29.2

