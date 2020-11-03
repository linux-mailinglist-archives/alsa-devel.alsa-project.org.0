Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB222A418B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 11:20:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAB21798;
	Tue,  3 Nov 2020 11:19:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAB21798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604398801;
	bh=Gi9iROCglO0W6nixqGeAK+S2D338AoUtiTPW69wS3Jo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NcALujJdyX2hd8Jj92Us0ta1qDSsOJXBpOVUr3Eei+DdPwt12YGyUSH9YAlq8TXVF
	 jucXq8QM7SY+B9bMyTMu5putxipbid7I65N9KXvS+qGlKSvYViO47CIPX56EZ8O+ca
	 A5yviPmnEaTTpsycaNKjEJVDTMKaCfWA/X2tVnTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41139F80272;
	Tue,  3 Nov 2020 11:18:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60080F80171; Tue,  3 Nov 2020 11:18:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAE25F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 11:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE25F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="SUNcwsrw"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AFcO3061974;
 Tue, 3 Nov 2020 10:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=HWfqNLnqz2StDV8mZWHFHnovhN5RNP0zPkbng7r5I0w=;
 b=SUNcwsrwpIvL1xJodn2e0DII7aeVo2qIXu0ejnH3NCNw7bbej8WZqUXjeMI0wDxZx8jB
 cqxZOHPIikLpRVq5/G3lxQ/GL9smTPnuRYrFuxjMZu0MK1/Qin7v6WX1KZ92gq06acgj
 fR0u8WS8d3M6dO9zRPiM3ybwXPSULa8zZMf6rhAojLVAmNnTW827fnYVHJlUBylAguv+
 ZkWsOdBR6ib6JFGhgn3bp+h1OHc5AlZ1wq1ezmV+luUHfkhz4/bJVKmMA3BgcJkMtXGS
 IfOHEgl+mSMP4iQKv7a5YtUQymeS6hTfB6rdicTUWXpCGcfp9KXrIytHN2zOK1gtP27B BA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 34hhvc8fkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 03 Nov 2020 10:18:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A3AEfVg054393;
 Tue, 3 Nov 2020 10:18:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 34hw0darpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Nov 2020 10:18:17 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A3AIGIs008989;
 Tue, 3 Nov 2020 10:18:16 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Nov 2020 02:18:15 -0800
Date: Tue, 3 Nov 2020 13:18:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>, Jeeja KP <jeeja.kp@intel.com>
Subject: [PATCH] ALSA: hda: prevent undefined shift in
 snd_hdac_ext_bus_get_link()
Message-ID: <20201103101807.GC1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030068
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9793
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011030068
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
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

This is harmless, but the "addr" comes from the user and it could lead
to a negative shift or to shift wrapping if it's too high.

Fixes: 0b00a5615dc4 ("ALSA: hdac_ext: add hdac extended controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/hda/ext/hdac_ext_controller.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index 4d060d5b1db6..b0c0ef824d7d 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -148,6 +148,8 @@ struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
 		return NULL;
 	if (bus->idx != bus_idx)
 		return NULL;
+	if (addr < 0 || addr > 31)
+		return NULL;
 
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
 		for (i = 0; i < HDA_MAX_CODECS; i++) {
-- 
2.28.0

