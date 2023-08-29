Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BEC78C731
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26869112;
	Tue, 29 Aug 2023 16:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26869112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318677;
	bh=IrxtE5DOTCwvvdyNrQ3RENgjySFsyzoHDrEFhrBrpig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i9B2Ui/TZi1h51T6K9pjE2NRhIRdRaiKuzA3qE6Yt+YKYPV9emU+opMmzbNCIhGDe
	 uCJVWcV00ZXzV52Dc0zr9vj74VnzOMiq8qUgpxEWlgfu4tUZX+Nlu58Xucm1ygBIQ3
	 IwNHPnov/WvTXunmV4SxXKV6vgcG3DyC+7tPizWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B180F805F0; Tue, 29 Aug 2023 16:14:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84CD8F805E9;
	Tue, 29 Aug 2023 16:14:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC552F80158; Tue, 29 Aug 2023 09:36:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CD768F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 09:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD768F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2023-03-30 header.b=EllaCH86
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37T6hrr0012633;
	Tue, 29 Aug 2023 07:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=BxK/SLJlbdVlGnbew4iPZrnJYslywfcoRRZh2jM1k9s=;
 b=EllaCH86CU2gCGrCfkwY3+/SvX7f3qdiZMddx0EVfjGXAb4l6Ql8MUZ77unC/FhSahbG
 v/C4yr8ri5EzG8AOCp5UReRiRQJTTZpKdS29TOqN/PCh9wChl8p9//Tc6/YoMwLI2Qj1
 iEUk4jvDm+oHL360V6VUIr6pvTdSEAfbMOEiDK7QVHpXz+Z7xkUI0eIqW4DqxdjqNqnb
 h9c7jCF5YKNWxqusZmCtifGF/koRBGdUzdZC6KYiSo9O4yQjvO27ra0qpeEOK+3nSYJN
 GhMo/UaKDj/QTW504zfiHSjgTFfaolpFB6YFmlegmZHS28YYZWjtyixlK1XpnZuZMZIX HA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sq9gcmarf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Aug 2023 07:36:40 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37T72EXE032686;
	Tue, 29 Aug 2023 07:36:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3sr6dn7sm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Aug 2023 07:36:39 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37T7acCA027124;
	Tue, 29 Aug 2023 07:36:38 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3sr6dn7ske-1;
	Tue, 29 Aug 2023 07:36:38 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH next] ASoC: cs42l43: Fix missing error code in
 cs42l43_codec_probe()
Date: Tue, 29 Aug 2023 00:36:35 -0700
Message-ID: <20230829073635.1877367-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_04,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290064
X-Proofpoint-ORIG-GUID: kw1aQ_vsj7yYeDlYbURxPTCNSw0YSGst
X-Proofpoint-GUID: kw1aQ_vsj7yYeDlYbURxPTCNSw0YSGst
X-MailFrom: harshit.m.mogalapalli@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: X5A4X7IDSH72B4NTFL6Z2BCI6766XUXH
X-Message-ID-Hash: X5A4X7IDSH72B4NTFL6Z2BCI6766XUXH
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:14:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5A4X7IDSH72B4NTFL6Z2BCI6766XUXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When clk_get_optional() fails, the error handling code does a 'goto
err_pm' with ret = 0, which is resturning success on a failure path.

Fix this by assigning the PTR_ERR(priv->mclk) to ret variable.

Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis with smatch, only compile tested.
---
 sound/soc/codecs/cs42l43.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 24e718e51174..1a95c370fc4c 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2205,7 +2205,8 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	// Don't use devm as we need to get against the MFD device
 	priv->mclk = clk_get_optional(cs42l43->dev, "mclk");
 	if (IS_ERR(priv->mclk)) {
-		dev_err_probe(priv->dev, PTR_ERR(priv->mclk), "Failed to get mclk\n");
+		ret = PTR_ERR(priv->mclk);
+		dev_err_probe(priv->dev, ret, "Failed to get mclk\n");
 		goto err_pm;
 	}
 
-- 
2.39.3

