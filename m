Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D76874D29
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 12:14:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A69828;
	Thu,  7 Mar 2024 12:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A69828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709810050;
	bh=FB7Ee8xJ/8PLMJkMvxznXrv4kOdB8Uc0kJwg08TJBIc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZN2Mk/dwliT9qKujOQA+E8J8oHmAYeGgzjEBlWv1kZVvlLBkCt0tIfypGS5lMnAkg
	 0EcZDzo8q6TEQOU1ncX7NW+tQq/yR0dWnoNlygLlyRYkOUNXJb0Tx7SkhmJ2ePfRLe
	 mmD106dfRmUhIHr7Y/O331QMERip92VD9OXVNdv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47D55F805B3; Thu,  7 Mar 2024 12:13:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF58DF801F5;
	Thu,  7 Mar 2024 12:13:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67EFBF802E8; Thu,  7 Mar 2024 12:12:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 17839F801F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 12:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17839F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=fP7DoONM
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4278beiq008605;
	Thu, 7 Mar 2024 05:12:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=l
	OdJujpe900SGega5RF4Bd47qBWiPBFNOAzo/3FsYBc=; b=fP7DoONMc+z4EtExj
	FkCG/KJiIlk4IaOe2L5bzUE9TsIPo7i0+eQ4rk29aglpRI2dqJOcGHXJv7L+PGEY
	fhPbatJaNaMgTawNlBK4vQ7nU27go8S0Ug/iLDnaGP50/ALGi+Il2S1VWHXp1eHF
	mSLNgSO2A88N6LMMTRTyTr7KmEH/oQ0SvcNEt30rRF3PXWa8ZYtrwdl1uHdS2W6V
	bPtfQ6fkWWrL6U1KWGURIdLnrooLUY0lMSe+IlELtOBYnMCyceUTo6WjCwakBz4F
	FzcZN30e7k5VSBNwQo6kkq9RUKLu1oa9OS5+Y0QR3Qq19vPLqNjYq/612UwNLT2S
	VwZsA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn931ha8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 05:12:19 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 7 Mar 2024
 11:12:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Thu, 7 Mar 2024 11:12:16 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C818882024B;
	Thu,  7 Mar 2024 11:12:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 1/2] ALSA: hda: hda_component: Add missing #include guards
Date: Thu, 7 Mar 2024 11:12:15 +0000
Message-ID: <20240307111216.45053-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: onFeZ66MZazGoqXDaIMo40DWcY2sgp5Y
X-Proofpoint-ORIG-GUID: onFeZ66MZazGoqXDaIMo40DWcY2sgp5Y
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2B3D7G262GY565BPJD65DKK4YLN3VQAY
X-Message-ID-Hash: 2B3D7G262GY565BPJD65DKK4YLN3VQAY
X-MailFrom: prvs=07964fdf23=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2B3D7G262GY565BPJD65DKK4YLN3VQAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the conventional include guards around the content of the
hda_component.h header file. This prevents double-declaration of
struct hda_component if the header gets included multiple times.

This isn't causing any problems with current code, so no need to
backport to older kernels.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index deae9dea01b4..a0fcc723483d 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -6,6 +6,9 @@
  *                    Cirrus Logic International Semiconductor Ltd.
  */
 
+#ifndef __HDA_COMPONENT_H__
+#define __HDA_COMPONENT_H__
+
 #include <linux/acpi.h>
 #include <linux/component.h>
 
@@ -82,3 +85,5 @@ static inline void hda_component_manager_unbind(struct hda_codec *cdc,
 {
 	component_unbind_all(hda_codec_dev(cdc), comps);
 }
+
+#endif /* ifndef __HDA_COMPONENT_H__ */
-- 
2.30.2

