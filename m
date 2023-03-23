Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B16CEEAB
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9693F20F;
	Wed, 29 Mar 2023 18:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9693F20F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680105993;
	bh=84z9dvZQZ7AFbL5YOyZwdk0KE8WG2QAZL6b2FyR4pzs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QrM8rugKmG5n6HrDEOV5Co0tgRHs6OKssxUt4rSXVEIVHWzRa4AdIb3m5Rl1EXMyK
	 jRmPfWdfvsjT0wrwSsH0KFFdVutMieAdKKIx129GSjRQPQ7wZMAzA1iUpsDIwyy/Uz
	 q9BIOV82VIZYT5BAqhK0I8b3RCni7zFixkLAzjeY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD1D8F8052D;
	Wed, 29 Mar 2023 18:05:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 536A4F802E8; Thu, 23 Mar 2023 17:58:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6ACCF800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 17:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6ACCF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2022-7-12 header.b=0PtONMNR
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NGhxFR029981;
	Thu, 23 Mar 2023 16:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=k0nkBOpBPQn3qEZsCqp0qC0xkDKC3vHQpmGwoMe+jmo=;
 b=0PtONMNRTTgheSl+oucIktTj3HqdJ9DHo5WegQEn7fJlll+6Fc3ZyHq2LikK7z1b95OO
 ZhmYRUs1sNXh3D0TpRZxdLkxocI53rkwPIkji3pEpOAAdo++mzKmUurUDWj6VHX2MQB5
 ZtzlvKjwKb0/VVEMPbu9Kefkd6CGh1R3rfg+PActM+EavLRZaqYyMXA4wr3XdBBejYHc
 N7cybiRGrS8Vr7McQXlNCriE/Hgc5SPV1gujO/IEd1MOnZbsJts30LgDWBjw54mhTtjj
 PvxKizOfFPtO0Bn/VSmSTmDmhMyHWFs3GTO6HMq6Zj6DDAWcSZPGPfcQDfvHGz59q0G0 7Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pd4wtcbug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 16:58:31 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32NGsQoc028052;
	Thu, 23 Mar 2023 16:58:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pgtpvg4bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 16:58:30 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NGwTr4040712;
	Thu, 23 Mar 2023 16:58:30 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3pgtpvg49s-1;
	Thu, 23 Mar 2023 16:58:29 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Subject: [PATCH next] ASoC: cs35l56: Fix unsigned 'rv' comparison with zero in
 cs35l56_irq()
Date: Thu, 23 Mar 2023 09:58:25 -0700
Message-Id: <20230323165825.1588629-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303230123
X-Proofpoint-GUID: LMFp-spo0qJRomp9eCU3LxurxeNtTS1d
X-Proofpoint-ORIG-GUID: LMFp-spo0qJRomp9eCU3LxurxeNtTS1d
X-MailFrom: harshit.m.mogalapalli@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TWSMK72EODFBENBZCI6V2JRDQPZN3CA7
X-Message-ID-Hash: TWSMK72EODFBENBZCI6V2JRDQPZN3CA7
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:21 +0000
CC: error27@gmail.com, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWSMK72EODFBENBZCI6V2JRDQPZN3CA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'rv' is of type unsigned int, which can never be less than zero.

	rv = pm_runtime_resume_and_get(cs35l56->dev);
	if (rv < 0) { // can never be true.
		...
	}

As pm_runtime_resume_and_get returns integers, change the type of 'rv'
to int to fix this.

This is found by static analysis with smatch.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.
---
 sound/soc/codecs/cs35l56.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 90fc79b5666d..b3772005668a 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -321,7 +321,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	struct cs35l56_private *cs35l56 = data;
 	unsigned int status1 = 0, status8 = 0, status20 = 0;
 	unsigned int mask1, mask8, mask20;
-	unsigned int rv, val;
+	unsigned int val;
+	int rv;
 	irqreturn_t ret = IRQ_NONE;
 
 	if (!cs35l56->init_done)
-- 
2.38.1

