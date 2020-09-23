Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F327534B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 10:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B86171E;
	Wed, 23 Sep 2020 10:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B86171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600850083;
	bh=U//EXy7tHJRso7X6jKrQ53leXqv7JnK42q4790hMryI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PmveSBbkmT5JwcVkSDegBsW5gm/JhZ1muWVEFPhP+70BzSuDPJ0L3V/TKTwSGvK2t
	 1Ljg++YYETKmuYWDTI89GUn/UNxwNKcA+TNE+VlbM+hULV1kOfp4Sf7orSzgKEN89X
	 XBGqnnpINkzlSxhUzy87sx48qaxyTn++ARI2/eAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82809F8015F;
	Wed, 23 Sep 2020 10:33:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB8DF80171; Wed, 23 Sep 2020 10:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA22F8015F
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 10:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA22F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="k77NYtKg"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N8Shb2108840;
 Wed, 23 Sep 2020 08:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=NdXDzPdjbfkaULNKbSWYA1LbQygF53AGsX+jS6bcmYs=;
 b=k77NYtKg3nNRzgM7+tlEDwtNYdlHE+Urg9at7ZfO1hQAEhAJRtKzH4iMdrbfjxsV3gKr
 XeOoDRDEhnBq43fAp7qrr3/uXWamQxtjvekjOJb5chsmCYlKZr9YW8v7NKRTwdETDiLL
 Q8eBstv16ac+deqOeVNn3h8YEIGDIpEwguvO38aeJ/xULvhKWKnJj9WJcLeBX0WaILFv
 6pg+BnvjBPQEXUMv0+s7GFeaLlSRZOfwR2mxl2rm2stZ3UP2Go8JK3beC1a3VeaPWkYs
 WD4qEGbGLzocySeSAQOBb6hVR7virCD0AjzwrkoRJ+gH0wV14dAB4B/HYMXK2cPpUXsP yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 33ndnuh3qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 08:32:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N8U1nh016306;
 Wed, 23 Sep 2020 08:32:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 33r28uu7qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 08:32:47 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08N8WghJ003938;
 Wed, 23 Sep 2020 08:32:46 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Sep 2020 01:32:42 -0700
Date: Wed, 23 Sep 2020 11:32:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] soundwire: remove an unnecessary NULL check
Message-ID: <20200923083235.GB1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009230069
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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

The "bus" pointer isn't NULL so the address to a non-zero offset in
middle of "bus" cannot be NULL.  Delete the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 6088775b67a5..fdc0db71360e 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -342,15 +342,11 @@ static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
 static int sdw_compute_bus_params(struct sdw_bus *bus)
 {
 	unsigned int max_dr_freq, curr_dr_freq = 0;
-	struct sdw_master_prop *mstr_prop = NULL;
+	struct sdw_master_prop *mstr_prop = &bus->prop;
 	int i, clk_values, ret;
 	bool is_gear = false;
 	u32 *clk_buf;
 
-	mstr_prop = &bus->prop;
-	if (!mstr_prop)
-		return -EINVAL;
-
 	if (mstr_prop->num_clk_gears) {
 		clk_values = mstr_prop->num_clk_gears;
 		clk_buf = mstr_prop->clk_gears;
-- 
2.28.0

