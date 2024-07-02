Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A0E923C49
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 13:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8256921A1;
	Tue,  2 Jul 2024 13:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8256921A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719919224;
	bh=n5no851s4EqSpb91NEEhXc2fA3vfWAjE+sOHLwT1ZGw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MbE0abqkhS2SV/4E91Mf5MTFGB6xsnKKI57GXZKELcUpIaX0XuV/IWaBkISXq/5xy
	 wXYBuZvpVE8S0ORm22f0CIVBQnd13DDVw6bzvYCDQKdFQUhXoZF08kaf+AAIVV/Ajb
	 nTCkczU5kN7WghzVbJGSQ0gqNduNED9W9hZQTONw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E558FF805AE; Tue,  2 Jul 2024 13:19:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B348CF805B0;
	Tue,  2 Jul 2024 13:19:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9475F8014C; Tue,  2 Jul 2024 13:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D1CCF800FE
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 13:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D1CCF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XTCLedTV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4625w9tW022383;
	Tue, 2 Jul 2024 06:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=CSRl7sRT2Z1oI9e6
	B+Pg7fpYU5oWGS/FDqjHOl/KzEw=; b=XTCLedTVv4JZLYIn154fQ85Qmh81g3XR
	oXmb7G3Es5qBRlGDMdD+xRIG0LjsMbtVzPGAwzkxeMmiZ90v/9sBSbDuGbbY8DDh
	fI1qLRqvrEWm8kpZmJmwyScQ1guUQkbifTDiE0KqJF+PeE0IFOQgaGynRgYWSR1V
	O3jb/BauAXuZhHW6YVABNxk++jjuHEwSerhmxruPbrlISSzL3itSOt3kYWQxCZIm
	+eEuIf+ibxnCRofROi/DguDoAkblIRH2efkgkfpOonyyjJE8XKJixb4CRyp2iE5W
	uH3bfDGyT7Cm5Db5ELYc1bJcdq6OLkM0iLAIBpHvl6+yDMEnMt5Ltw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 402epjbte7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 06:08:14 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 12:08:13 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 2 Jul 2024 12:08:13 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AE3BF820244;
	Tue,  2 Jul 2024 11:08:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] firmware: cs_dsp: Don't allow writes to read-only controls
Date: Tue, 2 Jul 2024 12:08:09 +0100
Message-ID: <20240702110809.16836-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lBNBSqB8R0zprM-c8oEhesQYylmjmetz
X-Proofpoint-ORIG-GUID: lBNBSqB8R0zprM-c8oEhesQYylmjmetz
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: U2KWZKR3BY2XOFUCZA5ARGZY7WWN4LIZ
X-Message-ID-Hash: U2KWZKR3BY2XOFUCZA5ARGZY7WWN4LIZ
X-MailFrom: prvs=4913eea01d=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U2KWZKR3BY2XOFUCZA5ARGZY7WWN4LIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a check to cs_dsp_coeff_write_ctrl() to abort if the control
is not writeable.

The cs_dsp code originated as an ASoC driver (wm_adsp) where all
controls were exported as ALSA controls. It relied on ALSA to
enforce the read-only permission. Now that the code has been
separated from ALSA/ASoC it must perform its own permission check.

This isn't currently causing any problems so there shouldn't be any
need to backport this. If the client of cs_dsp exposes the control as
an ALSA control, it should set permissions on that ALSA control to
protect it. The few uses of cs_dsp_coeff_write_ctrl() inside drivers
are for writable controls.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 16484ab9b09d..be8747d227db 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -796,6 +796,9 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 
 	lockdep_assert_held(&ctl->dsp->pwr_lock);
 
+	if (ctl->flags && !(ctl->flags & WMFW_CTL_FLAG_WRITEABLE))
+		return -EPERM;
+
 	if (len + off * sizeof(u32) > ctl->len)
 		return -EINVAL;
 
-- 
2.39.2

