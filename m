Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC0798584
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 12:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D20846;
	Fri,  8 Sep 2023 12:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D20846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694168012;
	bh=4W+LTfcH2nPjypIZuquEVzxWc1B5e/qtJj8iHOvkKQE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mMoOWesA6QMHjruXlMDxpvlIz2OhxJ7w47LhvMm9z2l2CSTIvs7BCPZXhQHAX2KRM
	 Exc+tfLX83cq+c/1OISsVeyCoPVG0baLR5nMKI2XTxpOb1Upev4bqL6kPdtJx0tYLU
	 wFsLoRs1RLcQ/nCP2C01jdPVw7AAaoMQatytw6pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37107F80537; Fri,  8 Sep 2023 12:12:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F55CF8047D;
	Fri,  8 Sep 2023 12:12:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84345F80494; Fri,  8 Sep 2023 12:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A000BF80236
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 12:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A000BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lFc2aiwv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3885cugZ025352;
	Fri, 8 Sep 2023 05:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=Z
	JkzVi89kTdSUWvlVXK/bb8Ue3nL1QfrlwR8JcnKNZ8=; b=lFc2aiwvlS+FNBqAO
	6II5AROoLG27GlC5y7UsrPGQdfzm+OdC7PLOrEegozNQK7QC5StoztWnNNUoNsSg
	EVX3N6FfZj/EA1I+hrIsDO4guRsagb57E2dVclq3jPa8Ytk/vmM8D5kIxFnNW7JU
	+r5Av7tq619wKyRnEnMnr0P2HHdUYAId3kkjFzm/S4EKLc3pcBUzeIPGHlcwSgIO
	hvyGz6SsFKfYVQksgn5ivEjqTKQqLbD+UAMSgZmyJu798dPRuoffX4SR1HujnUtN
	ZCnESVX1xtclD+O8DA+UUTjpHVaJD1bvgUIm55dCyZy/AEMo3sfhqcouj/j0rPXa
	jbdwg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex7vq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 05:12:25 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 8 Sep
 2023 11:12:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 8 Sep 2023 11:12:23 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A54B415B6;
	Fri,  8 Sep 2023 10:12:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Call pm_runtime_dont_use_autosuspend()
Date: Fri, 8 Sep 2023 11:12:23 +0100
Message-ID: <20230908101223.2656901-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VwBTvCevhKQ7XB3gtlaJijQR5Pk2HvvR
X-Proofpoint-GUID: VwBTvCevhKQ7XB3gtlaJijQR5Pk2HvvR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PNAEZEFS2PMYPI5CCI3XUJT5PJY4OQWJ
X-Message-ID-Hash: PNAEZEFS2PMYPI5CCI3XUJT5PJY4OQWJ
X-MailFrom: prvs=46155e09a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNAEZEFS2PMYPI5CCI3XUJT5PJY4OQWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver remove() must call pm_runtime_dont_use_autosuspend().

Drivers that call pm_runtime_use_autosuspend() must disable
it in driver remove(). Unfortunately until recently this was
only mentioned in 1 line in a 900+ line document so most
people hadn't noticed this. It has only recently been added
to the kerneldoc of pm_runtime_use_autosuspend().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2a930a6da8ec ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 76b9c685560b..9e4976bdb5e0 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1003,6 +1003,7 @@ void cs35l56_hda_remove(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 
+	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_get_sync(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
 
-- 
2.30.2

