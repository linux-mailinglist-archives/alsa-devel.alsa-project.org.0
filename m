Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CD6882E6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 16:43:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D18B31E3;
	Thu,  2 Feb 2023 16:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D18B31E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675352601;
	bh=U28dMvmnJFixBmubDP2GiRaI0xibIVnu7EZB+rLedA8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ayy7NAXFgEIJJaQNB516xgtUh8y8EcdezDpR6p6bAeSN/TwDOmPGSbWX27FOXzaZm
	 /n3pB/UXthS9w+H78KYWKdQnHAy3LHRNG3MtyHx9OIkOuZdTMuYHfoIWcUpQl28mGP
	 wJWru+X0JSyd7ybTyCPSP525r7XQLPo3JefW76Mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BDD6F80271;
	Thu,  2 Feb 2023 16:42:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F124AF804E0; Thu,  2 Feb 2023 16:42:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A13A1F800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 16:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13A1F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RXJzRnQF
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312BYUTG028651; Thu, 2 Feb 2023 09:42:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Mn4lAOTs+GTgL2RAnuWKoGB9jj5s+bhKNye0fFsP4NM=;
 b=RXJzRnQFj1S/gXEszIi/ota6zhQaNoKlF7VkEzwJrFw9CJ8SJKD7DHKQvoG5n2tA9+YQ
 nxyaMMA6T59WpVq+NpRfzRDbAzDv22U7O0WeFf0HE5KuOUXWnpIXEMepP4MBRWTQhpSE
 EHRUZbmH3G3wdtrtOSKcKiolPS7epJZbh9+jdDWzIubNTt8UdtGU7F2pQ9ycG+hP7big
 JDzqzVKkb02u4jBWGzTPMqkeWVqLbfDMoPyVfiS+KssHuLgjYynYSMb1mXflSqWw66we
 8HmOHrJWGPIszUPYE3quKZNWmlGUepyouJPcX/trfpLryJ/cCG8aycm8I53zTKwbwp1l Qg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nfqv9j15f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 09:42:13 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Thu, 2 Feb
 2023 09:42:12 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Thu, 2 Feb 2023 09:42:12 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 25FF1B06;
 Thu,  2 Feb 2023 15:42:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH 1/2] soundwire: bus: Prevent infinite loop in
 sdw_ch_mask_to_ch()
Date: Thu, 2 Feb 2023 15:42:11 +0000
Message-ID: <20230202154212.1098736-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230202154212.1098736-1-rf@opensource.cirrus.com>
References: <20230202154212.1098736-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: a5gOryFcbXVJmWujMZzjE485Q9BkEFzX
X-Proofpoint-ORIG-GUID: a5gOryFcbXVJmWujMZzjE485Q9BkEFzX
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Define the ch_mask argument of sdw_ch_mask_to_ch() as an unsigned
so that the shift right is guaranteed to eventually make the
value of ch_mask==0.

Previously ch_mask was defined as a signed int, but a right
shift of a signed value preserves the sign bit. So if the sign
bit was 1, ch_mask would never become 0 and the for loop would
be infinite.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 7631ef5e71fb..28bedc919b78 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -160,7 +160,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf);
 
 /* Retrieve and return channel count from channel mask */
-static inline int sdw_ch_mask_to_ch(int ch_mask)
+static inline int sdw_ch_mask_to_ch(unsigned int ch_mask)
 {
 	int c = 0;
 
-- 
2.30.2

