Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819237E9BAB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:59:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7590E79;
	Mon, 13 Nov 2023 12:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7590E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876762;
	bh=O8nJWRN4IlXH4QxG11t+fxfNkM0nAzazg1mwplEvjNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BYpvMwfz1EHeODADdTyTIzWRJ+Mm1HVfvmFcAkhjZuUy/fMFcnvGzxuUgxkm901w3
	 q6+lRGBKf90v5LSxA9K3XXETXkkJwgQG8ssf9mMVsiyBrBkZ4k4jJ4CvHJ66Jjq3s6
	 UYKsnIBXotgmkjAs8+OwEco9YRyUn3xNZIbpXT4w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB09DF805BE; Mon, 13 Nov 2023 12:57:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D154BF805B6;
	Mon, 13 Nov 2023 12:57:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E870DF801D5; Mon, 13 Nov 2023 11:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68729F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 11:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68729F80093
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EF97AB80D26;
	Mon, 13 Nov 2023 10:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEDFC433C8;
	Mon, 13 Nov 2023 10:22:14 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 5/8] libv4l2util: recognize V4L2_CAP_AUDIO_M2M
Date: Mon, 13 Nov 2023 11:18:46 +0100
Message-ID: 
 <2bc531eda48302243dbebe70a229aae244aba930.1699870530.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.42.0
In-Reply-To: 
 <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
References: 
 <7889c22b922214ebcc0e62feeeb167b40d5042ec.1699870530.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: SRS0=a+Jp=G2=xs4all.nl=hverkuil-cisco@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3TMXVT2CVMGQBUDFDE3KCBPVQZHUP53S
X-Message-ID-Hash: 3TMXVT2CVMGQBUDFDE3KCBPVQZHUP53S
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:57:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TMXVT2CVMGQBUDFDE3KCBPVQZHUP53S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Detect the V4L2_CAP_AUDIO_M2M capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/libv4l2util/v4l2_driver.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/libv4l2util/v4l2_driver.c b/utils/libv4l2util/v4l2_driver.c
index 6b6366fa..0c881b0c 100644
--- a/utils/libv4l2util/v4l2_driver.c
+++ b/utils/libv4l2util/v4l2_driver.c
@@ -164,6 +164,8 @@ static char *prt_caps(uint32_t caps)
 		strcat (s,"META_OUTPUT ");
 	if(V4L2_CAP_TOUCH & caps)
 		strcat (s,"TOUCH ");
+	if(V4L2_CAP_AUDIO_M2M & caps)
+		strcat (s,"AUDIO_M2M ");
 	if(V4L2_CAP_IO_MC & caps)
 		strcat (s,"IO_MC ");
 
-- 
2.42.0

