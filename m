Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9109399A008
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD38EAB;
	Fri, 11 Oct 2024 11:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD38EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638469;
	bh=48RXe2tnRUD2ASUDkJVHpgZ372XD3VHJKUM0XaPYyqg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KCqmbyfvqOBW4riYbImI/C5ghwsUHrZ/wrwAZQOvse49FvrITTt85e8PF8/YVMBw+
	 QgrT93Gp9mfNSGFwj7AeRi895nzxC8sfJSKRNDpX0xhMfio0l3pRHHz0i3U5PMYaSH
	 BidFPhckeShaZAD/kwfdYiZMSH+G2+1+ODcHsmLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6752AF805C0; Fri, 11 Oct 2024 11:20:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC5CF805B6;
	Fri, 11 Oct 2024 11:20:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94EEBF80528; Wed,  9 Oct 2024 11:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 088E1F80496
	for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2024 11:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 088E1F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2023-11-20 header.b=iQmE0MNr
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4991tmqP009661;
	Wed, 9 Oct 2024 09:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=1Y+JQsBrhP307R6cH/KS2Ql8Nbtlu
	DdFthIEx+ekpnU=; b=iQmE0MNrfxTIzXHw4XaDfeh4jIE2BpxVDaPdGzxgiJgD1
	tyPXEcLtU4OIZ71ZuSzxEsS6yijiF1l20JMayjmqGMHqL+Vv+urpNYSCTRAGw58y
	6myM7HD/aroKVkKSQZ+86qlYvlN2uUo7NYVUsSwpWqa2GL8ls7oN1c7VYAAH6T9+
	WSTnPrJRqSkMcvpeuzC23A8QX12879MBMGneFRN22tuXFOixfZIIs5ARbOfJ9gam
	A33ee1TX0vzd7OYnSujdhaY1dXEbvxu7v0lAwo98aaZTffUB75ZcAQvQf2yz8Fns
	2M++CyczsOK9B79IJMSweJWeo7NVGO0KUfhf6Ri0g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42308dqrmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Oct 2024 09:08:02 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 4998Iokh015320;
	Wed, 9 Oct 2024 09:07:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 422uw8a4tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Oct 2024 09:07:50 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49997o48010060;
	Wed, 9 Oct 2024 09:07:50 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 422uw8a4ss-1;
	Wed, 09 Oct 2024 09:07:50 +0000
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
To: perex@perex.cz, tiwai@suse.com
Cc: harshvardhan.j.jha@oracle.com, alsa-devel@alsa-project.org,
        stable@vger.kernel.org, vijayendra.suman@oracle.com
Subject: [PATCH 5.15.y 0/1] Fix of CVE-2023-52904 for stable-5.15
Date: Wed,  9 Oct 2024 02:07:47 -0700
Message-ID: <20241009090748.1116704-1-harshvardhan.j.jha@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_07,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=699
 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090059
X-Proofpoint-ORIG-GUID: 4FIgS3kzxu1BEFbgZEuC9PTn8x-vJ7wB
X-Proofpoint-GUID: 4FIgS3kzxu1BEFbgZEuC9PTn8x-vJ7wB
X-MailFrom: harshvardhan.j.jha@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: E75MII5L76J44XYX23S5W4OYTKMPUPQH
X-Message-ID-Hash: E75MII5L76J44XYX23S5W4OYTKMPUPQH
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:20:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E75MII5L76J44XYX23S5W4OYTKMPUPQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Folowing is a backport of commit  a474d4ad59cd ("ALSA: usb-audio: Fix
possible NULL pointer dereference in snd_usb_pcm_has_fixed_rate()") to
stable-5.15 branch which fixes broken commit bfd36b1d1869 ("ALSA:
usb-audio: Always initialize fixed_rate in
snd_usb_find_implicit_fb_sync_format()").

This was a clean pick and shouldn't be break anything. Basic smoke tests
were performed on this patch.

Jaroslav Kysela (1):
  ALSA: usb-audio: Fix possible NULL pointer dereference in
    snd_usb_pcm_has_fixed_rate()

 sound/usb/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.46.0

