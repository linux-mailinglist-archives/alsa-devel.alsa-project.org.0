Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD4178A059
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49EBDF6;
	Sun, 27 Aug 2023 19:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49EBDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693155861;
	bh=hsoviXCUIrJ/3q6153p81RHeB81CXmrjT0B3BJMlA0Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HwaZvsoiGFGdjmEMbzvejgKc/syGpGKE4kRrVH4631oaITWBJ6Lb6r5if4ZqzWuZm
	 OwKXEecKZjWvpWAnzSLhJcdpcV3Cp5bFuThuxm/RKrOpCFW0Un0ojX+xTRshgawOVq
	 NX4d7iHtvP9Q3Y3vyAoUfWRU9Td/sTF0HizjV1Bc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50DEEF805AE; Sun, 27 Aug 2023 19:01:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A10C6F805AD;
	Sun, 27 Aug 2023 19:01:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BEB8F80158; Thu, 24 Aug 2023 21:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82E95F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 21:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82E95F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2023-03-30 header.b=v/FwLPmh
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37OJEJ9u009509;
	Thu, 24 Aug 2023 19:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=ie1xPRR4qBkUMu82YM5u8Hszy21ND7rb5N7h4LosZ3w=;
 b=v/FwLPmha//ef1DvHp9NjK4HEv9WfLz61mK2SZon+H86+5y6Qazgr7YzRTtRoJJr2SZO
 UNDWEwQa4av38dLLIYqhcsmoJ00vCjNRjBy2t0wamZt5L06a0zcTkjC94saHztCKvNBT
 gdkFCCDx+E/p8USePUOo7uxX5elyj0k33kM3ugReRg9MT627VgkULXYOKG+l3ySj/ijm
 UZrpsqZsD40xMbTqb/FXSqzqPakwrXTlGuaLdu1kwUKk6PFrXGoWsnGyTxb4slg8eDdi
 kj3HelVx8+xNTve5WX6QWwDUphv29y5nqmfBxyZWWat5SEE84KeP7pmKDhWbK+UF6o9p GQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sn1ytvwwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 19:17:34 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37OHjGq9036111;
	Thu, 24 Aug 2023 19:17:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3sn1ywcs3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 19:17:34 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37OJEu7s015687;
	Thu, 24 Aug 2023 19:17:33 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3sn1ywcs25-1;
	Thu, 24 Aug 2023 19:17:33 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
 Arnd Bergmann <arnd@arndb.de>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, kernel test robot <lkp@intel.com>
Subject: [PATCH next] ASoC: codecs: Fix error code in aw88261_i2c_probe()
Date: Thu, 24 Aug 2023 12:17:10 -0700
Message-ID: <20230824191722.2701215-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_15,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240165
X-Proofpoint-ORIG-GUID: 8ZmfQOOK_gXxcNqu5Djc4-zMwMTqRWbY
X-Proofpoint-GUID: 8ZmfQOOK_gXxcNqu5Djc4-zMwMTqRWbY
X-MailFrom: harshit.m.mogalapalli@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AUMMCOB3RGXRO4UUTBFEO42KNW4YPTQE
X-Message-ID-Hash: AUMMCOB3RGXRO4UUTBFEO42KNW4YPTQE
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:01:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUMMCOB3RGXRO4UUTBFEO42KNW4YPTQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Passing zero to dev_err_probe is a success which is incorrect when
i2c_check_functionality() fails.

Fix this by passing -ENXIO instead of zero to dev_err_probe().

Fixes: 028a2ae25691 ("ASoC: codecs: Add aw88261 amplifier driver")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202308150315.CvOTIOKm-lkp@intel.com/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is only compile tested.
---
 sound/soc/codecs/aw88261.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 6e2266b71386..a697b5006b45 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1245,7 +1245,7 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 
 	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
 	if (!ret)
-		return dev_err_probe(&i2c->dev, ret, "check_functionality failed");
+		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed");
 
 	aw88261 = devm_kzalloc(&i2c->dev, sizeof(*aw88261), GFP_KERNEL);
 	if (!aw88261)
-- 
2.39.3

