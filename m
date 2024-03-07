Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD2874CC7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 11:55:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 093A7A4D;
	Thu,  7 Mar 2024 11:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 093A7A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709808958;
	bh=c2pfRKegllUwre/PwJmQYxRG47uR59AYi5sXveb40mc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kazGEgILfzFjAfNXENpoqa+CSoT+agxa8V6TI5YjFcg/gZ2GMc/3+M0HwcpZT9Cpg
	 USO6zg/XzzzkDsD1C6H1KGEIYwT1hi7rJyJkR+TtxeNTz16uGC98YOpsQPR4L1tcJk
	 y/PLrO+wOB0Fkm1tgm/UWhyI/Orp+2FdDfzS9LgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70478F8024E; Thu,  7 Mar 2024 11:55:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 298E9F8024E;
	Thu,  7 Mar 2024 11:55:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 863DEF80496; Thu,  7 Mar 2024 11:55:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 829C2F80494
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 11:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829C2F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=gbcrLtK5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4276U3Nt025228;
	Thu, 7 Mar 2024 04:55:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=+
	6itJG20D909fOrrsxMInYc0fNTy/L9GVmmhKAtl9s4=; b=gbcrLtK5xt02wAlmo
	9AJp5VNInXpqgucouatAeBtSL7q/7F8dju+ct7ywGXL02bNnEKiTJk7JKJ2ZBXfW
	YXynqBiyzC6enVLXLkZvCyCho/USqAHGHGSWNbDhl6M2WqKWGWfayuN2IMYlvU9U
	IdU3fRas1XnpE4t2RbKm4hVblk3M2S6uyvnpOJvnPzaBlpUEY5gPMPZKb1GVg1TN
	N70wUuePaFvQuGM2SW/Pr1Hy1JsBya5KlfRLX7hNVA0iHI19Ak7wwl9F9gXzSRck
	1kbRAthDZEin81TTf6QL/eJaC0L0WFjzMgp+crmpDOBSNbDAUS0cdgJpkv2LFzEm
	x+9wg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn931gtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 04:55:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 7 Mar 2024
 10:55:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Thu, 7 Mar 2024 10:55:16 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B63BF82024B;
	Thu,  7 Mar 2024 10:55:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] firmware: cirrus: cs_dsp: Remove non-existent member from
 kerneldoc
Date: Thu, 7 Mar 2024 10:55:16 +0000
Message-ID: <20240307105516.40250-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6035ksXV5TBZiMrwZ5Q4wTBH6YWgkHpN
X-Proofpoint-ORIG-GUID: 6035ksXV5TBZiMrwZ5Q4wTBH6YWgkHpN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6VRUEO3YNNQMWAH4ITTFUL5AM2EDKNDI
X-Message-ID-Hash: 6VRUEO3YNNQMWAH4ITTFUL5AM2EDKNDI
X-MailFrom: prvs=07964fdf23=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VRUEO3YNNQMWAH4ITTFUL5AM2EDKNDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The kerneldoc for struct cs_dsp refers to a fw_file_name member but
there's no such member.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/linux/firmware/cirrus/cs_dsp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 29cd11d5a3cf..23384a54d575 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -123,7 +123,6 @@ struct cs_dsp_client_ops;
  * @sysclk_mask:	Mask of frequency bits within sysclk register (ADSP1 only)
  * @sysclk_shift:	Shift of frequency bits within sysclk register (ADSP1 only)
  * @alg_regions:	List of currently loaded algorithm regions
- * @fw_file_name:	Filename of the current firmware
  * @fw_name:		Name of the current firmware
  * @fw_id:		ID of the current firmware, obtained from the wmfw
  * @fw_id_version:	Version of the firmware, obtained from the wmfw
-- 
2.30.2

