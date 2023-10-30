Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1477E065A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:24:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F232EBF;
	Fri,  3 Nov 2023 17:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F232EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028654;
	bh=dJvScpy2L+3WHD/3TsfLGFJjcGrfCJJTcUyd0rXEp7A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BWNBU7oQYN+ESe20ZQZ65AekCiXI4JiEaprZzMXemkflkNlvtdrV3DoGBx/FGayA5
	 k24RKTo+RdvdylfnP9SX3qJQc3NaSyFDr8Bz3do1iFF7LXZEALReAVZQhNh4huITfP
	 4G7N8pU5Z6tpeVT1OsVtN4Jfk1TLgA6uQePE6Lwk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E173FF80564; Fri,  3 Nov 2023 17:23:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 146FEF80564;
	Fri,  3 Nov 2023 17:23:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 880C7F8016D; Mon, 30 Oct 2023 08:08:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC597F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 08:08:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC597F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2023-03-30 header.b=mfaMaHN/
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39U3ee5e010986;
	Mon, 30 Oct 2023 07:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=aIxu7yh5wYJuZc53Lt9scwP9Vbcx6BNPRaxSyYFe7Jw=;
 b=mfaMaHN/z/yI+4q9NdIbisvzvXWPd+stfg1t+PKV3kaFfyEj5FShwbjY/twn8c5LFZ7h
 JJtPriCzO/tIa2j9ls7wlK/842S69B+zoo3komTP0gItpumrnxvu7IZpC9ozMQwHPOb1
 TWVB1/64pnDgXZvEEI9ZJ2dtvi0v8P9nzBOTrnhsPYHEbtdZI4K41NU3UqZsqys8LxuG
 nrgJyCnPzFvhKhWUZbpkLyrKgu7qFqHefjO3WVMoCJyr5GMwCYfR4LSbFigYDeSAnLAW
 jt2NGTpiR3eOQRqxZyth4Gz9J4MFnx6R1ExPj5pL7eaAzekRy+Rlwevdq3p4sY86V5gv DQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0s7bt2jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:08:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 39U6hbXV030752;
	Mon, 30 Oct 2023 07:08:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3u0rra4qt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:08:40 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39U78eAF024650;
	Mon, 30 Oct 2023 07:08:40 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3u0rra4qrs-1;
	Mon, 30 Oct 2023 07:08:40 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH next] ALSA: hda: cs35l41: Fix missing error code in
 cs35l41_smart_amp()
Date: Mon, 30 Oct 2023 00:08:36 -0700
Message-ID: <20231030070836.3234385-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_05,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300052
X-Proofpoint-GUID: bc-zOkdmnKuRWRdTO1gCctbjFzAf-h0D
X-Proofpoint-ORIG-GUID: bc-zOkdmnKuRWRdTO1gCctbjFzAf-h0D
X-MailFrom: harshit.m.mogalapalli@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KVY22OFQNTK7UPMZP2UXSGGGB3OG443A
X-Message-ID-Hash: KVY22OFQNTK7UPMZP2UXSGGGB3OG443A
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:23:17 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVY22OFQNTK7UPMZP2UXSGGGB3OG443A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When firmware status is invalid, assign -EINVAL to ret as ret is '0' at
that point and returning success is incorrect when firmware status is
invalid.

Fixes: a51d8ba03a4f ("ALSA: hda: cs35l41: Check CSPL state after loading firmware")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is found using smatch and only compile tested.
---
 sound/pci/hda/cs35l41_hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 496ff6a9d300..09f8d8fa4c71 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1042,6 +1042,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 	default:
 		dev_err(cs35l41->dev, "Firmware status is invalid: %u\n",
 			fw_status);
+		ret = -EINVAL;
 		goto clean_dsp;
 	}
 
-- 
2.39.3

