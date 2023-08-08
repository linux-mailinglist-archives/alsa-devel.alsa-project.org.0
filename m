Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76361773F7B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 18:49:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA9382B;
	Tue,  8 Aug 2023 18:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA9382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691513342;
	bh=FtfO2/lHJ7MgPj1ij38zehTwwAo26N9qJMY1P0OjpFY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eWtXXkC8N7EGJhKJRi0/DgOSJnMgtzQrrJzXkU0qtGafnKhoxX1sS6hXFYwy+iR58
	 L684XSsVrXgEfFRewfs4KXwEdruR8UcCDb6AmUOgcJ40oRr4TfN/YxS+xSlls/ZzSN
	 v+azL1IluF85jJ0FJOjmZ7Qr/j/xaMs71mpXuVLU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90B43F80568; Tue,  8 Aug 2023 18:47:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8661F80558;
	Tue,  8 Aug 2023 18:47:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8680F80548; Tue,  8 Aug 2023 18:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6845CF80107
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 18:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6845CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Uh5hncoU
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378F5h5f030864;
	Tue, 8 Aug 2023 11:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=enamRFxwNNWkXUDA7dzl08MLaVLqHvLONRfo2RP3k/s=; b=
	Uh5hncoUkCW4siX1GIoA5jmqucwjEnu6mmXnnq+6QKnWEmEgxlJTxVxhEBpBKdbY
	KiQZwoN7exjyAYQ8VIeUcpF+VdaCZhNGShtxeQPurpLb/YlUUWJ3cwoOCHyx4Rfj
	Arew95VJCXsrxfKFxfdIpJJfXDZME/9ldJGfA07f/H6QVXWeXAF3jFkQtOIq8IXD
	h1QUlrzCGc206T3vzz1lh9SZWZiz06/eVpHJvPn8j1RllIxZLMFeiUiF+gU/BsJM
	cIbTCVVvzP6375TZbjAlZoM4/ZImDFFO/CwM/onAtlsHa71fhWcXosDy+JbT6oSR
	GqdpgHleG90miPDhwCb5/Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s9juhtucq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 11:47:07 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:47:06 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 17:47:06 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.220])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1C6B03578;
	Tue,  8 Aug 2023 16:47:06 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 5/5] ASoC: cs35l56: Call wm_adsp_power_down() before reloading
 firmware
Date: Tue, 8 Aug 2023 17:47:02 +0100
Message-ID: <20230808164702.21272-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808164702.21272-1-rf@opensource.cirrus.com>
References: <20230808164702.21272-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -S0Cs10N98DiKe82HW-XpWhskMJfyFLR
X-Proofpoint-ORIG-GUID: -S0Cs10N98DiKe82HW-XpWhskMJfyFLR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4KPXN5K7HREDSGOMJY3BSNWY5A247RUJ
X-Message-ID-Hash: 4KPXN5K7HREDSGOMJY3BSNWY5A247RUJ
X-MailFrom: prvs=3584a5a98c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KPXN5K7HREDSGOMJY3BSNWY5A247RUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

When cs35l56_system_resume() needs to reload firmware it should call
wm_adsp_power_down() to put cs_dsp into a powered-down state before
cs35l56_secure_patch() or cs35l56_patch() calls wm_adsp_power_up().

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 094bcbd0a174..80e7fddae926 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -976,6 +976,7 @@ int cs35l56_system_resume(struct device *dev)
 		return ret;
 
 	cs35l56->base.fw_patched = false;
+	wm_adsp_power_down(&cs35l56->dsp);
 	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
 
 	/*
-- 
2.30.2

