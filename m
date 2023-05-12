Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE2700A8E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 16:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51671203;
	Fri, 12 May 2023 16:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51671203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683902622;
	bh=07ctsY6GojbVLI+iPaRY5brjN2+FPEVenZWe7h49/xI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PKuSAH6X4SfdKuD6bosVP8JPsl3eOARF7V+Lamf8bIOK7UAauGirYB/w0uldz7ZI2
	 TTIBBRfqC+HQmmzssuGbC/oANewRw+k40tCJdrR6SL0Yyhbb4Qzwgw1mJyRAH6LTus
	 awsZ+be834yF55RdI4aJW7nuhOfazYlU7Xue6Kn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C87F80534; Fri, 12 May 2023 16:42:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62370F80087;
	Fri, 12 May 2023 16:42:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5CA3F8052E; Fri, 12 May 2023 16:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8F2EF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 16:42:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F2EF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=iRRoyX4j
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C79TbQ025224;
	Fri, 12 May 2023 09:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=ZcdklHf7gFBbvSHt4aqfeF7+CyANm3zTqWNEbRQXzG4=;
 b=iRRoyX4jveKFbAI+ViJsN0vYmdKh9UxXcLKoncjkx0RXXCfQ3PaxsYlr9Q9KZt666KtX
 0ZmhbFCNlO7mGnvwyj/RnYPke4PbZZGwtTa8cO9ZwkwhdUbroFJoEOSCkHVc2vSMb7ar
 budIfzYSdJ9OowPPiBk4gtSKVU07WtDynHLHdKKoQum19tHZ7umNn/Zx3gzUKGnPj9PV
 iooD5exIw2sO2/1VXXt4j0Rgx8/3WEp+8bPMTAcq/HuikW+cWaZSx822Oo2KmfoPG3Qj
 +ApMnKz9iVHn3vC8oG0mkuJXa0dQW4jbgY0fI2i7v8BJklfxchHGQLtik8jnxMzavbCe qA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46j73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 09:42:39 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 09:42:37 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 09:42:37 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2C52C45;
	Fri, 12 May 2023 14:42:37 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Prevent unbalanced pm_runtime in dsp_work() on
 SoundWire
Date: Fri, 12 May 2023 15:42:37 +0100
Message-ID: <20230512144237.739000-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mqAveudk8OufYnpDhtsyE9Jgo6oG-_H1
X-Proofpoint-GUID: mqAveudk8OufYnpDhtsyE9Jgo6oG-_H1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IVZGN2NLXLOLEEOOR4TTEATAZ4MMLUI3
X-Message-ID-Hash: IVZGN2NLXLOLEEOOR4TTEATAZ4MMLUI3
X-MailFrom: prvs=04962df89c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVZGN2NLXLOLEEOOR4TTEATAZ4MMLUI3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

Flush the SoundWire interrupt handler work instead of cancelling it.

When a SoundWire interrupt is triggered the pm_runtime is held
until the work has completed. It's therefore unsafe to cancel
the work, it must be flushed.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 46762f7f1449..d1677d76d018 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -852,10 +852,11 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	 */
 	if (cs35l56->sdw_peripheral) {
 		cs35l56->sdw_irq_no_unmask = true;
-		cancel_work_sync(&cs35l56->sdw_irq_work);
+		flush_work(&cs35l56->sdw_irq_work);
 		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
 		sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
 		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+		flush_work(&cs35l56->sdw_irq_work);
 	}
 
 	ret = cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_SHUTDOWN);
-- 
2.30.2

