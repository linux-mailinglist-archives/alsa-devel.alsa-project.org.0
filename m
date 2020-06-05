Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E41EF607
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 13:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFE5166D;
	Fri,  5 Jun 2020 13:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFE5166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591355025;
	bh=D7ETs0PIbOrtxRkTAyntNG1MlqDJOvpMcBV7CmFZwxM=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FcbmqLCOKAW3a1jRO4dV5LKOIKSpxYqV8B5j+yY3reuR0QsaMuR65mh0B5h6o10Jq
	 7KX54FHmXt7lJBnIUMOUt3MCzvne+Twu2IkwGhC51o98aqI0ziYGQVTqRWLmk03jEv
	 r8vvCTtbHJCpp8j63mgKbP+SVO60LR9R8pN1+ccY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16FB2F80132;
	Fri,  5 Jun 2020 13:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A17F801ED; Fri,  5 Jun 2020 13:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E517F80132
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 13:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E517F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="kyOWvtGb"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 055AwQWk161962;
 Fri, 5 Jun 2020 11:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Mx+BqpuuCLvvrJLCUOoA+Q1GJiz6R0T3Bxyce55kH4U=;
 b=kyOWvtGbYmNJIt0vi4iJK6j6Uo94Y+kZBGbwmKCp7Chalm9j9h5dKflZmwerZjpHBxmh
 2F7m1mrVh5BNXp0buCo+eY7wHjbNaPOd0gKmwsFaG4rDfInIE9rZNOfqQRJyYGH/RPen
 zwzD2cBZFDr5Ud44Goou8ov7u1vGeS0rkUd/+LSBi/Cgxt33Cd9Q7H5+puh99cxH6t88
 VF7UOIeSy4JmcTDH3k2lBKAL0begjMHGmqUBDmWkoVGaXPLt0jz2L2KKcCNFcG1mKntR
 IN632+w+4qSL6b2fNSvxsvtwDDCEiwmHcdYhvp6xdIl0OKqh8aRcGpcrCwtFe9BxYDB1 UA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31f9262a04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 05 Jun 2020 11:01:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 055Avdp9010100;
 Fri, 5 Jun 2020 11:01:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 31f925a5jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Jun 2020 11:01:47 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 055B1fGt029976;
 Fri, 5 Jun 2020 11:01:44 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 05 Jun 2020 04:01:41 -0700
Date: Fri, 5 Jun 2020 14:01:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: emu10k1: delete an unnecessary condition
Message-ID: <20200605110134.GC978434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006050084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9642
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0
 suspectscore=0 cotscore=-2147483648 bulkscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006050084
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
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

The "val" variable is an unsigned int so it's always <= UINT_MAX.  This
check is always true so it can be removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/pci/emu10k1/emu10k1x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/emu10k1/emu10k1x.c b/sound/pci/emu10k1/emu10k1x.c
index ddb7c2ce3f7c9..def8161cde4c2 100644
--- a/sound/pci/emu10k1/emu10k1x.c
+++ b/sound/pci/emu10k1/emu10k1x.c
@@ -1040,7 +1040,7 @@ static void snd_emu10k1x_proc_reg_write(struct snd_info_entry *entry,
 		if (sscanf(line, "%x %x %x", &reg, &channel_id, &val) != 3)
 			continue;
 
-		if (reg < 0x49 && val <= 0xffffffff && channel_id <= 2)
+		if (reg < 0x49 && channel_id <= 2)
 			snd_emu10k1x_ptr_write(emu, reg, channel_id, val);
 	}
 }
-- 
2.26.2

