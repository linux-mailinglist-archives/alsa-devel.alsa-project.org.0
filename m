Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2F494ACE2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 17:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B420192E;
	Wed,  7 Aug 2024 17:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B420192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723044469;
	bh=9RcYMtMM4r+MQSxgDOMv3UjOKLUb1JBAjfVJavx3WSE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RKVLTo0gwA/1LlxlVTsM0NwFyoso+dvuwpxSmDXc4g2SG2giPF2XEMCO4BdxtXSWe
	 5yTGPDmK5eIqJ/9pAFiR6m9fhUx+90Ngt99T62XnqtHKC8FdHl7C6gwtBqBRxwBHOa
	 CkJX4rYM+AuawNO37EyOAJHGOmp+Vwd4SpNxQww8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDE98F80579; Wed,  7 Aug 2024 17:27:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B93F805AF;
	Wed,  7 Aug 2024 17:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59583F802DB; Wed,  7 Aug 2024 17:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE850F80236
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 17:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE850F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c+xSjutt
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4755WGqT021667;
	Mon, 5 Aug 2024 05:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=d2cHf22ZBP8FBiZHr6wfdXREEjqKc/hSUSPbj/TXBFw=; b=
	c+xSjuttdqX8ncc91jkijhbgVBzbb9knAtvIarBKShOMSWjlk9CcLux0QEqAWFdP
	cGAtXiE1SlZ6sVH1dDks1tzW7XTo7PanQ4lirmFEW0pnBF4iqpqSrX3XcCywb6wG
	DtZXdNz+lhHKuXIe9pewCTfm0hL+7ecsl/V8hz08jD2aJX+/FtNznhgmGNajqXUS
	1b8q/IWEt/Yd/LC8B95VlV5GpG/YXN0QbhR2VHsG1k6EeC+aDo1CrX334Xay7fa9
	+Jnr3VcOFatHUMdQXVy9l1G+0e0a7o/qMKooYLihqxY3tIbnvmdlaqeBG3TUrZp3
	AlZ61JyVr5Xfe3U1KIP5NA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40shxx1n3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 05:27:44 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 11:27:42 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 5 Aug 2024 11:27:41 +0100
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com
 [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C8A62820241;
	Mon,  5 Aug 2024 10:27:41 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs35l56: Stop creating ALSA controls for firmware
 coefficients
Date: Mon, 5 Aug 2024 10:27:21 +0000
Message-ID: <20240805102721.30102-3-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805102721.30102-1-simont@opensource.cirrus.com>
References: <20240805102721.30102-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: sBVzMXPYgLNwkSpv0ZkT_I88tf6S0Cns
X-Proofpoint-ORIG-GUID: sBVzMXPYgLNwkSpv0ZkT_I88tf6S0Cns
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XYTAQVGMY4GC47CJ5PJG37BSYL7NNF2M
X-Message-ID-Hash: XYTAQVGMY4GC47CJ5PJG37BSYL7NNF2M
X-MailFrom: prvs=59476c0938=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYTAQVGMY4GC47CJ5PJG37BSYL7NNF2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A number of laptops have gone to market with old firmware versions that
export controls that have since been hidden, but we can't just install a
newer firmware because the firmware for each product is customized and
qualified by the OEM. The issue is that alsactl save and restore has no
idea what controls are good to persist which can lead to
misconfiguration.

There is no reason that the UCM or user should need to interact with any
of the ALSA controls for the firmware coefficients so they can be
removed entirely.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 84c34f5b1a51..757ade6373ed 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1095,6 +1095,11 @@ int cs35l56_system_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs35l56_system_resume);
 
+static int cs35l56_control_add_nop(struct wm_adsp *dsp, struct cs_dsp_coeff_ctl *cs_ctl)
+{
+	return 0;
+}
+
 static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 {
 	struct wm_adsp *dsp;
@@ -1117,6 +1122,12 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
 	dsp->fw = 12;
 	dsp->wmfw_optional = true;
 
+	/*
+	 * None of the firmware controls need to be exported so add a no-op
+	 * callback that suppresses creating an ALSA control.
+	 */
+	dsp->control_add = &cs35l56_control_add_nop;
+
 	dev_dbg(cs35l56->base.dev, "DSP system name: '%s'\n", dsp->system_name);
 
 	ret = wm_halo_init(dsp);
-- 
2.43.0

