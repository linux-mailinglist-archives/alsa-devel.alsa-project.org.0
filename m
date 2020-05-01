Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3A1C107B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 11:42:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5C9216A3;
	Fri,  1 May 2020 11:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5C9216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588326147;
	bh=rzFNA86IuhXRi36aZ3zI0CW2KO3cl+A2hrskHAKaLGM=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hce7UCkGphd6gKnZkoIsD6ith/Wq/Xv4eiTspZhIcmcbMjYtqDVRK7L6vCCVHcf3r
	 cpOaOH376LIlQ6vU9wG1ZLxfE2gAcHZqx/IVpXX5QHBe/ZDJoRpkUDq2japuyWQO5H
	 2rWMYK0+5WAUicqRaQ9OiSAYJNPrPdBbSkdRMZLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDB5DF80232;
	Fri,  1 May 2020 11:40:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 515E1F8022B; Fri,  1 May 2020 11:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1129CF800B6
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 11:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1129CF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="XTViWQ4K"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0419YHgg128320;
 Fri, 1 May 2020 09:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=GRHnr61VEpxugJwcA5GIBL4LMtCIngxcQ00WjXi1C/Q=;
 b=XTViWQ4KX+HJ9Jz15z75LGXGJYOcBtGzRx6i4082TXptF8ZQ9jxUXvkzx2hnbHs52kV7
 Oc6NWiJLsK+1b/1DGB8K6icKxccNEwLgnkjEnazK4JdUMQ/pRMA+FIcMIKsBml4q9CRd
 q63n8/G0Dn0mV0Z/GPv5/wlvf9BzEpC24wvYpH2SUActYgT8TcoiTPcB+GzUZ/IEgHsQ
 LVsTpQqLXWOu7MLkAs9K2TYZ6aoPjBqyMktrIIPaPINimXY/+Q5aNOM5Z3s+xnj9Sujs
 hfZPAfuVcfpovCOW+zXSsce1HNmiAVIcox5tod3yE4meK0ACGSk5mnd9VS0djqhy2Kps 5A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30r7f3hkm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 May 2020 09:40:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0419Z5GC151742;
 Fri, 1 May 2020 09:40:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 30r7f9yb8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 May 2020 09:40:28 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0419eII1008274;
 Fri, 1 May 2020 09:40:18 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 01 May 2020 02:40:17 -0700
Date: Fri, 1 May 2020 12:40:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: isa/wavefront: prevent out of bounds write in ioctl
Message-ID: <20200501094011.GA960082@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9607
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=947
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005010073
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9607
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005010073
Cc: Armijn Hemel <armijn@tjaldur.nl>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Allison Randal <allison@lohutok.net>
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

The "header->number" comes from the ioctl and it needs to be clamped to
prevent out of bounds writes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This code predates git.

 sound/isa/wavefront/wavefront_synth.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index c5b1d5900eed2..d6420d224d097 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -1171,7 +1171,10 @@ wavefront_send_alias (snd_wavefront_t *dev, wavefront_patch_info *header)
 				      "alias for %d\n",
 				      header->number,
 				      header->hdr.a.OriginalSample);
-    
+
+	if (header->number >= WF_MAX_SAMPLE)
+		return -EINVAL;
+
 	munge_int32 (header->number, &alias_hdr[0], 2);
 	munge_int32 (header->hdr.a.OriginalSample, &alias_hdr[2], 2);
 	munge_int32 (*((unsigned int *)&header->hdr.a.sampleStartOffset),
@@ -1202,6 +1205,9 @@ wavefront_send_multisample (snd_wavefront_t *dev, wavefront_patch_info *header)
 	int num_samples;
 	unsigned char *msample_hdr;
 
+	if (header->number >= WF_MAX_SAMPLE)
+		return -EINVAL;
+
 	msample_hdr = kmalloc(WF_MSAMPLE_BYTES, GFP_KERNEL);
 	if (! msample_hdr)
 		return -ENOMEM;
-- 
2.26.2

