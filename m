Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF91B8D802C
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2024 12:37:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 375B983E;
	Mon,  3 Jun 2024 12:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 375B983E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717411078;
	bh=e+bL2RoRUJlaWlprGpWktgCZQsKmm2hk0ARDnnJF7nM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbOfHdG0sC0fMd/CAs5ZX0pCDQf4ktqnepJuqR0YInhFd3W+RYS94lMMSxa2kq0ck
	 7Cv8bPSnIKaa3AOkp+esStaBUaRQLjUm2eUqPJvGslTZKvqxvMwbOT060y3GKwyEof
	 j2nvRfB4X/mhgJR4kpcy7aiSbMaXVoJaOKO4cEGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3688F806B6; Mon,  3 Jun 2024 12:35:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA0C4F806AD;
	Mon,  3 Jun 2024 12:35:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA5C6F805D4; Mon,  3 Jun 2024 12:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91834F80236
	for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2024 12:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91834F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mqp/8NIM
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4535l7pZ018316;
	Mon, 3 Jun 2024 05:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qUsSAY8N7AKSenNGLa8xZV3wN1+8yO51gSj1XEWRIaQ=; b=
	mqp/8NIMfMXUEB1p+3SScrbswFbIZikggZm7YjPUVXzfqdG1lxLMebI278cgzOhu
	GnWmYeFaTPCf1oTTT/Ycnmy9YVgmwp0Ni75ymInN3d1CrK3y13YiWJBlR2KVYCNJ
	eaZD3QQ2MGsajIfGw4JmWYPtFkKwXwO8y17TDMlHLFSSxm9frp+1u17rG15bIe7a
	zDEv0C2ss+nkzJcVXzV82+YQxLtFQdPY7i+StcxtFK5NDOhe0ymX7ZqUSCzAmtpv
	cHnAr6tIDaOe9uXY0R0onTdNy/6MDgfL5eL+k4K15KvsnV2gfyjUFOg1+PHbH/ro
	CsfRupQ6MtqGsy/zigLu+Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xscbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 05:35:29 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 11:35:26 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 3 Jun 2024 11:35:26 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.166])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4FF3F82024A;
	Mon,  3 Jun 2024 10:35:26 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 1/7] ALSA: hda: cs35l56: Component should be unbound before
 deconstruction
Date: Mon, 3 Jun 2024 11:35:18 +0100
Message-ID: <20240603103524.32442-2-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603103524.32442-1-simont@opensource.cirrus.com>
References: <20240603103524.32442-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TTkyztoDiUDSkeFZwReoU0LNOof7MjL_
X-Proofpoint-ORIG-GUID: TTkyztoDiUDSkeFZwReoU0LNOof7MjL_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YH4EWJYRQABYS64K62CFMRJZYD7G4NNI
X-Message-ID-Hash: YH4EWJYRQABYS64K62CFMRJZYD7G4NNI
X-MailFrom: prvs=388426604e=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YH4EWJYRQABYS64K62CFMRJZYD7G4NNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The interface associated with the hda_component should be deactivated
before the driver is deconstructed during removal.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 0923e2589f5f..e134ede6c5aa 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1077,12 +1077,12 @@ void cs35l56_hda_remove(struct device *dev)
 {
 	struct cs35l56_hda *cs35l56 = dev_get_drvdata(dev);
 
+	component_del(cs35l56->base.dev, &cs35l56_hda_comp_ops);
+
 	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
 	pm_runtime_get_sync(cs35l56->base.dev);
 	pm_runtime_disable(cs35l56->base.dev);
 
-	component_del(cs35l56->base.dev, &cs35l56_hda_comp_ops);
-
 	cs_dsp_remove(&cs35l56->cs_dsp);
 
 	kfree(cs35l56->system_name);
-- 
2.34.1

