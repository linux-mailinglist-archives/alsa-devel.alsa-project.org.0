Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CC76EF54
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 18:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030F4210;
	Thu,  3 Aug 2023 18:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030F4210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691079857;
	bh=+VBJlqtEEbh30Ly4Gx6tLiHgD5WnJqTuz+4H4Jh2jXE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CjUAeWw5i1XDED4OY/YNk8wFAKS2x8pAUbIYK+tQHz99Wn/16ygj27REJQCfWU3y2
	 SdzE5Z3ZOHAYH1ce88SxqGJRWfvOqLy3q8ltzpBh4BbyY5EUmXL+8SheeAkkwrx/u9
	 oi3b7p4nvCPbUeuDRMAP/D66wfvzcUXFlxbs+BVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88B87F80535; Thu,  3 Aug 2023 18:23:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43380F801D5;
	Thu,  3 Aug 2023 18:23:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EA32F8025A; Thu,  3 Aug 2023 18:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75273F80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 18:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75273F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=B4Dw/dRr
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37367YIr018231;
	Thu, 3 Aug 2023 11:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=z
	sBLhUvAZHDtEeJFuObfMcXDnu2U4ZsRAv3wWenIgnM=; b=B4Dw/dRrJ+U7JPUPN
	VaRl8JWuF0sbBjg9+9SC4xiKx007pf2fQ+pT0JCKRqjwr4yRU37Klrp13d0k6Zek
	uskld2NZ+aWuBfokVhFoptLVWONlV6LfNVFPRMT8XJo+WwBUm1ZeV3Sch8QAqYFb
	j7m49sUiRB9KBuxI38pxDv/rkzkSp7gAO/SKe+Lg+sZlVKWizRWXVrz9QWXsvqRt
	KcXwuzN5/3p2qAIzApj9ov3D6xzInVcf1e2eEr0RySZuCnvacfODY7Msfuee/+Yj
	jKWAAX78VC5oUzJxhvdjEAtDScIx+xNLM16xF9fVw3aEsj5X3jrs51O8n4wt2pSJ
	xdfaw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1x6xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 11:23:14 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 3 Aug
 2023 17:23:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Thu, 3 Aug 2023 17:23:12 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2BEDD3563;
	Thu,  3 Aug 2023 16:23:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: soc-acpi: Add missing kernel doc
Date: Thu, 3 Aug 2023 17:23:12 +0100
Message-ID: <20230803162312.117771-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E5ZRspWyMbP0Hdb1q7WxMkEWoQYHyjS0
X-Proofpoint-ORIG-GUID: E5ZRspWyMbP0Hdb1q7WxMkEWoQYHyjS0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BOD6YL77AY4F3ZHGJLUXWV4VUEEYTRMV
X-Message-ID-Hash: BOD6YL77AY4F3ZHGJLUXWV4VUEEYTRMV
X-MailFrom: prvs=3579f88d0f=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOD6YL77AY4F3ZHGJLUXWV4VUEEYTRMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The UID field in snd_soc_acpi_link_adr is not documented, add kernel doc
for it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-acpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 630bf7367fe69..6d31d535e8f6d 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -151,6 +151,7 @@ struct snd_soc_acpi_link_adr {
  * all firmware/topology related fields.
  *
  * @id: ACPI ID (usually the codec's) used to find a matching machine driver.
+ * @uid: ACPI Unique ID, can be used to disambiguate matches.
  * @comp_ids: list of compatible audio codecs using the same machine driver,
  * firmware and topology
  * @link_mask: describes required board layout, e.g. for SoundWire.
-- 
2.30.2

