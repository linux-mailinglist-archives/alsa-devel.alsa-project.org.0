Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3890F3D2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 18:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167E382C;
	Wed, 19 Jun 2024 18:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167E382C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718813813;
	bh=/9gD+/Wc/CC9JjUtsx/lTRqi4Fvhs7dJ20+T6SyU8U0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YfTbdqwkO7EmwmcKY+TESYTpRICLnrb2N1ExMMg0F4gASwKp5lJCN2hwBA4d6ffaZ
	 2TainL+D/SDL0dGwOpDssZtT4x1etM5ubkG+fNtGP05WwgvU/r3/cSPu9cNvDBMTp1
	 lHZ++1Jx+gXU4SwtsmI/bbf0pnd8zodVXgEcbbjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2B7F805B1; Wed, 19 Jun 2024 18:16:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A01C5F805AC;
	Wed, 19 Jun 2024 18:16:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E93F8023A; Wed, 19 Jun 2024 18:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 974B2F8010C
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 18:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974B2F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Oib80RlP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45JC1CF2003623;
	Wed, 19 Jun 2024 11:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=x23EWGEyKjOe0Qc/
	jXb6Ajz+1je5uzQF9+45zSHX5fU=; b=Oib80RlPiMNrYeMEpd65hbYzqkqNAudH
	DsmRuUHqG7NYxotgH7foni8SVc5nBoMMSV/dphvmrvWEqKzax56FqKPMtFDleHJC
	+jv1/tb5pPtcW865dKAjUMDTMQ6K8r9BCufjfXh8ysAQCRxUrbuWnyyf6uQ+oAu0
	ByCV58GEUM4KxBFW1gEn389gR1Qq9j9rg/Lq6R8wTUsfpwlqWdfWQLjXLnnyCMoG
	sl9KvOWMvrLgAHTlsGIwPoYfdWSA06rA9+bcf63HMi/tpsyz6HIDTGipX3KAX23T
	Ue1KdtRakb+U/g4mYSTxbA9tkiT6rPMaJ3Fg3WeRt+60MLm2b3oCeg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yujb10wmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 11:16:09 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 17:16:08 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 19 Jun 2024 17:16:08 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CCB10820248;
	Wed, 19 Jun 2024 16:16:07 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Select SERIAL_MULTI_INSTANTIATE
Date: Wed, 19 Jun 2024 17:16:02 +0100
Message-ID: <20240619161602.117452-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fwyS61R64BqESImpx5UxA0PTRM1INHs3
X-Proofpoint-GUID: fwyS61R64BqESImpx5UxA0PTRM1INHs3
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VUMCMPUB77J6NMJMEGOOH4GVJXFADGRR
X-Message-ID-Hash: VUMCMPUB77J6NMJMEGOOH4GVJXFADGRR
X-MailFrom: prvs=39007486e5=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUMCMPUB77J6NMJMEGOOH4GVJXFADGRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ACPI IDs used in the CS35L56 HDA drivers are all handled by the
serial multi-instantiate driver which starts multiple Linux device
instances from a single ACPI Device() node.

As serial multi-instantiate is not an optional part of the system add it
as a dependency in Kconfig so that it is not overlooked.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 1252632f0ffa..731f4e99bc75 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -162,6 +162,7 @@ config SND_HDA_SCODEC_CS35L56_I2C
 	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
 	select FW_CS_DSP
+	select SERIAL_MULTI_INSTANTIATE
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L56_SHARED
 	select SND_HDA_SCODEC_CS35L56
@@ -178,6 +179,7 @@ config SND_HDA_SCODEC_CS35L56_SPI
 	depends on ACPI || COMPILE_TEST
 	depends on SND_SOC
 	select FW_CS_DSP
+	select SERIAL_MULTI_INSTANTIATE
 	select SND_HDA_GENERIC
 	select SND_SOC_CS35L56_SHARED
 	select SND_HDA_SCODEC_CS35L56
-- 
2.34.1

