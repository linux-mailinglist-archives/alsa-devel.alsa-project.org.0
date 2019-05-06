Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEBB14A44
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 14:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301C318B8;
	Mon,  6 May 2019 14:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301C318B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557147211;
	bh=VetTsS14Jir7ht5NL60tO7vV4TguFem7oOmOnwb55l4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=khh1GNfoqfovxE1sbE2i8ETMsoipe7WFCSkiCpvKZmJ4YHSbDDYMOU8iih6S9Vk+S
	 /iZfbav2PZicPXsvUoTKiUV66FciBMn8N89wLymMzV4sCa+9y3R6BjyGKKYILrlxxB
	 YHV4PWZhlIn2Xa2I77duoJ1duYGslE+m5ZvB+HY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE24F896FF;
	Mon,  6 May 2019 14:51:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7BE8F896F0; Mon,  6 May 2019 14:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39643F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 14:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39643F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="kWIJ4hR/"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46CiMga148036;
 Mon, 6 May 2019 12:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=TO5p6U844mSabPmFZ/xowTJwJRPCrR8Q/DL//O5FccE=;
 b=kWIJ4hR/ElT3WJJ3fe6F9qJg/VK1EZFY7AYa6nWB12LVaP8SmC8i46bzpFSZAeyLHg5k
 FlIA1swniW7ao5FxIZrCAG7cA9E2b4CPqySePmPyIzCHkjkhkEsWsqLeV5ZHdX3mNNby
 wjcVrHpmHmeltdSbd47YLIR357fM/LBDQYwT49v5xyZcBmM8HkDdFJ/gW+ZloLZpRCyh
 nydTkZYZIWw3iDLKtL5hZS7CKPgIQIs6YAAXo7ITS990ynrEUtsbHrSAD10WPpWcu2Eo
 a9Z1m5ELMau+h22VQwj/zyy3vNmkvzpr1Z1IvDqlsnu+cC+pd0LGnYaKGqaMN/vbwDm7 Tg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2s94bfp8v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 12:51:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46CpF5G068622;
 Mon, 6 May 2019 12:51:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2s94aevtxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 May 2019 12:51:35 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x46CpR8H025954;
 Mon, 6 May 2019 12:51:32 GMT
Received: from mwanda (/105.52.123.240)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 06 May 2019 05:51:26 -0700
Date: Mon, 6 May 2019 15:51:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20190506125119.GB13799@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060112
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060112
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: synth: emux: soundfont.c: divide by zero
 in calc_gus_envelope_time()
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

This function is called from load_guspatch() and the rate is specified
by the user.  If they accidentally selected zero then it would crash the
kernel.  I've just changed the zero to a one.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/synth/emux/soundfont.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index 31a4ea94830e..9b5d70104489 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -856,6 +856,8 @@ calc_gus_envelope_time(int rate, int start, int end)
 	int r, p, t;
 	r = (3 - ((rate >> 6) & 3)) * 3;
 	p = rate & 0x3f;
+	if (!p)
+		p = 1;
 	t = end - start;
 	if (t < 0) t = -t;
 	if (13 > r)
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
