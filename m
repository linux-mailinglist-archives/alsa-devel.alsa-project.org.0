Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FBF83BEED
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:34:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B5D84D;
	Thu, 25 Jan 2024 11:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B5D84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706178841;
	bh=tT3rEg+Hnli5xVMR7wEmp2rtZ+JsRr53eHkR4QJp6Cg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y5gyqToU1BWoAqdZHtN/cFGZa2FVGpEAfQVsOkt6o8ELliKjbOu2tUjp0ZzjfV8KQ
	 Cnxfk6DI8pc7FLw5ufjCzehxSq+kHlzuwY49OTSdXW6pQRk7f+4TxKzPGF0EMZav12
	 GlmNfOKZ0kVhmCVwhI+sD8PIb4EzE1Rvdlcdx60w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF8BDF8069C; Thu, 25 Jan 2024 11:32:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7631DF8068A;
	Thu, 25 Jan 2024 11:32:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67519F805E0; Thu, 25 Jan 2024 11:31:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D9DA3F802BE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9DA3F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UPt9sLPs
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P6oFQ6010841;
	Thu, 25 Jan 2024 04:31:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=wM66v6KnK8q48bXk35LK6FA8cA2NdL6vYO6G9pylDtE=; b=
	UPt9sLPsCbGDrnbHiAOFVmPwyf6c41OPjV6kXUm+j48ZRMlIqO2fmYpaYpQlacdX
	SQDM5QTN08AiixYaekHXIoHLx8Mte2E4E5vY+31PZGx/KXb3hbVC98AsPKgc6RLJ
	P15e9JSfLojOyS5nONR1G1Ou4zdONnJMKsyIn1UQO14MhO2wnBiQKCqlrT2MSxEv
	ax5Qf6ani87a0GjdVL+3s4+WYTWqBK/Lihgw/jftZyR6kk32JB+RGnKJ4CKhl2t9
	9qtwxnfhCFSgI/4D3AFFt4LW11TmAbKE7KJkoiDf4pbwAPXrxmtCoN3Fb7QLdjNw
	5iQ83SAK9d3ftJd3LLY5lg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 84606820249;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 4/7] ASoC: cs42l43: Add pm_ptr around the power ops
Date: Thu, 25 Jan 2024 10:31:14 +0000
Message-ID: <20240125103117.2622095-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VyPs16uuCx-jB0x4IiOJZHQe2NylKGe_
X-Proofpoint-GUID: VyPs16uuCx-jB0x4IiOJZHQe2NylKGe_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4SGMPIO76DDK475PT4FQAYN36AFPLLTV
X-Message-ID-Hash: 4SGMPIO76DDK475PT4FQAYN36AFPLLTV
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SGMPIO76DDK475PT4FQAYN36AFPLLTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add missing pm_ptr around the power ops.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Added commit message

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d418c0b0ce9aa..1852cb072bd0e 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2349,7 +2349,7 @@ MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 static struct platform_driver cs42l43_codec_driver = {
 	.driver = {
 		.name	= "cs42l43-codec",
-		.pm	= &cs42l43_codec_pm_ops,
+		.pm	= pm_ptr(&cs42l43_codec_pm_ops),
 	},
 
 	.probe		= cs42l43_codec_probe,
-- 
2.30.2

