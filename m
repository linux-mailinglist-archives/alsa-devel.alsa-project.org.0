Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F8352A52
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 13:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53E3916BF;
	Fri,  2 Apr 2021 13:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53E3916BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617363858;
	bh=akv+ego+Vr6ANURpuVu9YV5cG4pV06VIlHU55k16Zq8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KDiV5rJSvR+S5rKWQGzVHjrwCQhz0348bLyf06dMzuNPMhRzAc7nmjePH6ttqshNR
	 ALyKN2SJiu1+PVs11qGjR30w8Bc5FlzBA9kyrK+z52AGh6NbBMCKLowWrNORhMOSeB
	 qhP4e9ivibc0Cd5WT9cnPaFoJe1vGY73i/2ijeKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD7FDF80264;
	Fri,  2 Apr 2021 13:43:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3995F80259; Fri,  2 Apr 2021 13:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F006BF800F5
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 13:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F006BF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="HeiPHFaH"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132BdKGY176909;
 Fri, 2 Apr 2021 11:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=f2Qqg+QdMNEJAsl63Sldfs/x8lzeMiNgw6E8mw1zqCE=;
 b=HeiPHFaHVAC7GW42AU7dXVdBbJ4x3rTNTzbGM1M+I81isT8ykXAqk+MRK+pIDVIPTSJ7
 BOYAHLjoABcAj35jKp7Utuczv9heOiz/sNtskAUzUvWeeE9AlypbPG/5nOTEBABXE2td
 H/qd9xYpZE1FaT1JmJLQOkr3gau63o5J2EzDasACWzRvAx6t5MDjj1iKSmhg50BJU803
 P48U6qzFIuQU6p6Rd3ITN1kQtmqUe/nw5qdN6A2dMxBahgC7gpMvPIZq+qdY1WYdnr1I
 Mx56OgjLr5rTIYuhLirbyfVgA45UPAIX/H5fPUxJ8gS2HewT0gDqVMdioJPJZ6czskUo SA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37n30scdnw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Apr 2021 11:42:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132Bf0UL140619;
 Fri, 2 Apr 2021 11:42:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 37n2accncn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Apr 2021 11:42:58 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 132BgvqY011345;
 Fri, 2 Apr 2021 11:42:57 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Apr 2021 04:42:56 -0700
Date: Fri, 2 Apr 2021 14:42:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: control - off by one in store_mode()
Message-ID: <YGcDOtrimR46vr0k@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGcDETcdqVUIl1+y@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020086
X-Proofpoint-GUID: FHcbwHGHBFOgQDpOJm-8le-T87M0f9wr
X-Proofpoint-ORIG-GUID: FHcbwHGHBFOgQDpOJm-8le-T87M0f9wr
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020086
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

If count is 16 then this will put the NUL terminator one element beyond
the end of the array.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/core/control_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 202b475d0bf3..ab5a455723c8 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -391,7 +391,7 @@ static ssize_t store_mode(struct device *dev, struct device_attribute *attr,
 {
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	char _buf[16];
-	size_t l = min(count, sizeof(_buf) - 1) + 1;
+	size_t l = min(count, sizeof(_buf) - 1);
 	enum snd_ctl_led_mode mode;
 
 	memcpy(_buf, buf, l);
-- 
2.30.2

