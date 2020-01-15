Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D2813CB51
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 18:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A241A17A5;
	Wed, 15 Jan 2020 18:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A241A17A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579110493;
	bh=cMcaZb3NpHtFTKNoGs3q2gEGAzUL4/1cpTo1JA67kl4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h4kj27ig7P9lofVOSRrjVcTdVvpgmVaz3GvffDVq2q+9UPnvKr6zJQRQqvqwpcS9j
	 e3JqJHLlPW1nYjBHPxc8oz9bTy4DC+GeWnkfgeuUJQKoXbSBu8F1SXFYcKQkRLGmuQ
	 iZNCy0wLpZJF3KlsT3qnvxpKCZsUZU6R0UTXQgXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EFC2F8014B;
	Wed, 15 Jan 2020 18:46:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88323F801EB; Wed, 15 Jan 2020 18:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3AE7F800CC
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 18:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3AE7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Babr94xZ"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHd2G9084874;
 Wed, 15 Jan 2020 17:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=KRiWwueiP8Z1EkoCa8M+5HzOaiYvTlULg/trtqvMRFc=;
 b=Babr94xZtkhmu2xEO5xpY2bVrGsPMqBnpCrHahMaPsz+knOu1MbtArNJK5uHtkSb6uki
 g9LVpflTONOwD6RnQivGwu6id+rNAszaAW3/VjpEVYA0X/3OT76yXgF9PJvLuYa3u6c9
 r+I52CNN+YXJDLk89ds5km6S0uYrG/OYpyL+Pz9/nXI9zwIsKesrZigWU0Mk6OciTd0y
 xviIRU6r0AHEjoQYTjLX0RO0YeatranQ3AnzOzy1iEag34+GZm8Kxp3QuUS+LwDBXruJ
 Bo3ILtbAp5Qw79dKqHG1T2fTYtDufSSIqWo1yIJfrWBQQcX0KJu8X33S4R5omkX0zsVn 0Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xf74sdp2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 17:46:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00FHd2Ym019547;
 Wed, 15 Jan 2020 17:46:21 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2xhy21t2mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jan 2020 17:46:21 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00FHkHb1015851;
 Wed, 15 Jan 2020 17:46:19 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 Jan 2020 09:46:13 -0800
Date: Wed, 15 Jan 2020 20:46:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>, Alexander Tsoy <alexander@tsoy.me>
Message-ID: <20200115174604.rhanfgy4j3uc65cx@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001150135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9501
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001150135
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 Shuah Khan <shuah@kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: unlock on error in probe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We need to unlock before we returning on this error path.

Fixes: 73ac9f5e5b43 ("ALSA: usb-audio: Add boot quirk for MOTU M Series")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/usb/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 2f582ac7cf78..827fb0bc8b56 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -602,7 +602,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	if (! chip) {
 		err = snd_usb_apply_boot_quirk_once(dev, intf, quirk, id);
 		if (err < 0)
-			return err;
+			goto __error;
 
 		/* it's a fresh one.
 		 * now look for an empty slot and create a new card instance
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
