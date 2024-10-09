Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8082499A00B
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 114EADF8;
	Fri, 11 Oct 2024 11:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 114EADF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638478;
	bh=7tKRUYIy95hE5ID2SI8nmFTkstF2fydfazLMahzW3bU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vLJ7wo24JZB+nNWjqBEFOKDqGWTqr4y/J+5aFFjBjI07kFaoBjLf6HDWuEfNRARNG
	 W6X02THai63OSH+qLAosZaH/xE6S6eeDDMo7XHXH2I7JUYWznuiN/x1qtzmlBRz2VB
	 NPOPd0pRKMYmk7/TYyLBgvJtDr7UrOyRoo1ewaOc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEE53F805E0; Fri, 11 Oct 2024 11:20:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33EFBF805D6;
	Fri, 11 Oct 2024 11:20:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D529F80527; Wed,  9 Oct 2024 11:08:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 79EE8F800ED
	for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2024 11:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79EE8F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2023-11-20 header.b=l7MI+XX9
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4991tgXa009949;
	Wed, 9 Oct 2024 09:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=0CKFZ
	bBMZdktT5Oz/IahE5v8XY8g8j47y73eLv6wIBk=; b=l7MI+XX9+uUzAzdK9Kewb
	YY+JO1FPZ4DdGTLdSjW/W44xzmI35I/qly+4cIbykJjeaN5QQrIY7SdK1EagzuNz
	9n8CYNWCg8BlUPk1CNpS/klKfrpZIFDLVv+nXBoEQEr0GWT/jurivFhrNklckfet
	nntGwWUUbLpUJXlAcDqRcu8g7t4gzNsrzyI37/QjAODrGqKVevJ3dW/MmBMC85Lv
	k4YqYfzu0kYJVSQbtkXJ3s61uYIieWQ4zqHR1gy7gYcXl5g1Wx+ZHBn/rJD8Z6No
	l4Lwf2H1h7HTxFg6OlpSff/0YLULmBycyObcnKYLbXqXtyX0gdtoNLyKBApPNujQ
	Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42302pfmwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Oct 2024 09:08:13 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 49989Luk015335;
	Wed, 9 Oct 2024 09:07:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 422uw8a4ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Oct 2024 09:07:52 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49997o4A010060;
	Wed, 9 Oct 2024 09:07:51 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 422uw8a4ss-2;
	Wed, 09 Oct 2024 09:07:51 +0000
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
To: perex@perex.cz, tiwai@suse.com
Cc: harshvardhan.j.jha@oracle.com, alsa-devel@alsa-project.org,
        stable@vger.kernel.org, vijayendra.suman@oracle.com
Subject: [PATCH 5.15.y 1/1] ALSA: usb-audio: Fix possible NULL pointer
 dereference in snd_usb_pcm_has_fixed_rate()
Date: Wed,  9 Oct 2024 02:07:48 -0700
Message-ID: <20241009090748.1116704-2-harshvardhan.j.jha@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241009090748.1116704-1-harshvardhan.j.jha@oracle.com>
References: <20241009090748.1116704-1-harshvardhan.j.jha@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_07,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090059
X-Proofpoint-ORIG-GUID: pL3KAcQ8OmoZpmnxjfQ1_tM1RmtcNWSm
X-Proofpoint-GUID: pL3KAcQ8OmoZpmnxjfQ1_tM1RmtcNWSm
X-MailFrom: harshvardhan.j.jha@oracle.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N5VXWT6EYYCY4H3FTP2HWRZAN3HCOBDJ
X-Message-ID-Hash: N5VXWT6EYYCY4H3FTP2HWRZAN3HCOBDJ
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:20:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5VXWT6EYYCY4H3FTP2HWRZAN3HCOBDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

[ Upstream commit 92a9c0ad86d47ff4cce899012e355c400f02cfb8 ]

The subs function argument may be NULL, so do not use it before the NULL check.

Fixes: 291e9da91403 ("ALSA: usb-audio: Always initialize fixed_rate in snd_usb_find_implicit_fb_sync_format()")
Reported-by: coverity-bot <keescook@chromium.org>
Link: https://lore.kernel.org/alsa-devel/202301121424.4A79A485@keescook/
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Link: https://lore.kernel.org/r/20230113085311.623325-1-perex@perex.cz
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
(cherry picked from commit a474d4ad59cd4642d1b7e3a6c08cef9eca0992c8)
Signed-off-by: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
---
 sound/usb/pcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 580e2649641e4..737302cfede8f 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -160,11 +160,12 @@ find_substream_format(struct snd_usb_substream *subs,
 bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 {
 	const struct audioformat *fp;
-	struct snd_usb_audio *chip = subs->stream->chip;
+	struct snd_usb_audio *chip;
 	int rate = -1;
 
 	if (!subs)
 		return false;
+	chip = subs->stream->chip;
 	if (!(chip->quirk_flags & QUIRK_FLAG_FIXED_RATE))
 		return false;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
-- 
2.46.0

