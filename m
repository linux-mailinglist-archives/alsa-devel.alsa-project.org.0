Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B892CF67
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 12:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F25DDE0D;
	Wed, 10 Jul 2024 12:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F25DDE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720607956;
	bh=zF/m62KFHKl1kmqt/e6pzUb5JBWZP5A6EyAaMuq66Zw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IrLzoM5P9QjqLMcfG104/Yx7eogHaDf+nSa7kVh6MEMtsnzpG/7lw9FLiDu5sGS1p
	 YM7BcpfduK0Ocu9ZH/A0ujJ4vXTehMINoCcmg6VULimObxYACRv7SPGzZ18NxHIS8/
	 sQJDOr3q2ITIDtRzhDCGCzCTpamrlH3FJoSf0jFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA792F805EE; Wed, 10 Jul 2024 12:38:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94954F805E8;
	Wed, 10 Jul 2024 12:38:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7DD4F80494; Wed, 10 Jul 2024 12:37:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD6BDF800FA
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 12:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD6BDF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hr2Col9X
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46A4s4Gp006601;
	Wed, 10 Jul 2024 05:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=jko0pG9aWSLJku4a2f5zSYrs/rJboXoCk1FQ/DCAegY=; b=
	hr2Col9Xy6CMQG6iuIqeQVbhGIkibfGsHI+9WDF/OYy26ncDLuBpIY9Pv021cv/H
	zhwwCk2ygzCY/INIS87MQldUI/l+UXve/ZJBLu2NCEnq8uIBV5z/ylb/7pB45nuV
	I2z29A9gsKSxqVPZ9yt6shET0Azn7OAQ9RvfChybb511hobt5cbtY8oP+GQUnXxh
	U1J82950b/AKc+53rWb4GPW0oYMJ3hnUNA7ydjf2CYsXVj+fO/fILVsMFd+ZBK0P
	wzGs17XJfiJqG6HgxE8YJv3y2jyXP9NdgP/QBAKytopoyx1N+QSGslo1GEASeSJ6
	N41qeC7qkLOs6SlmLWaJfg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 409c9a8h0p-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 05:36:46 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 11:36:40 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 11:36:40 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 79866820258;
	Wed, 10 Jul 2024 10:36:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH v2 3/4] firmware: cs_dsp: Clarify wmfw format version log
 message
Date: Wed, 10 Jul 2024 11:36:39 +0100
Message-ID: <20240710103640.78197-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710103640.78197-1-rf@opensource.cirrus.com>
References: <20240710103640.78197-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VByPUurzjj4azDBKUwiZFAqV67xWOHV9
X-Proofpoint-GUID: VByPUurzjj4azDBKUwiZFAqV67xWOHV9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TY62EJK3U4ZZUMPCXBBPP74ZM4IUNFGI
X-Message-ID-Hash: TY62EJK3U4ZZUMPCXBBPP74ZM4IUNFGI
X-MailFrom: prvs=4921fba11f=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TY62EJK3U4ZZUMPCXBBPP74ZM4IUNFGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the log message of the wmfw format version to include
the file name, and change the message to say "format" instead
of "Firmware version". Merge this with the message that logs
the timestamp.

The wmfw format version is information that is useful to have
logged because the behaviour of firmware controls depends on
the wmfw format. So "unexpected" behaviour could be caused by
having expectations based on one format of wmfw when a
different format has been loaded.

But the original message was confusing. It reported the file
format version but didn't actually log the name of the file it
referred to. It also called it "Firmware version", which is
confusing when a later message also logs a firmware version
that is the version of the actual firmware within the wmfw.

The logging of the firmware timestamp has been merged into this.
That was originally a dbg-only message, but as we are already
logging a line of info, we might as well add a few extra
characters to log the timestamp. The timestamp is now logged
in hexadecimal - it's not particularly useful as a decimal
value.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes since V1:
This is a completely different commit from the original V1 #3.
The V1 commit merged the wmfw format version message into the
INFO_TEXT message.
The V2 commit keeps the wmfw format in its own message but
clarifies the message, and merges it with a trivial message that
logged the header timestamp.
---
 drivers/firmware/cirrus/cs_dsp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 1bc2e0b6d40b..cce81a3f68f9 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -1502,7 +1502,6 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 		goto out_fw;
 	}
 
-	cs_dsp_info(dsp, "Firmware version: %d\n", header->ver);
 	dsp->fw_ver = header->ver;
 
 	if (header->core != dsp->type) {
@@ -1526,8 +1525,8 @@ static int cs_dsp_load(struct cs_dsp *dsp, const struct firmware *firmware,
 		goto out_fw;
 	}
 
-	cs_dsp_dbg(dsp, "%s: timestamp %llu\n", file,
-		   le64_to_cpu(footer->timestamp));
+	cs_dsp_info(dsp, "%s: format %d timestamp %#llx\n", file, header->ver,
+		    le64_to_cpu(footer->timestamp));
 
 	while (pos < firmware->size) {
 		/* Is there enough data for a complete block header? */
-- 
2.39.2

