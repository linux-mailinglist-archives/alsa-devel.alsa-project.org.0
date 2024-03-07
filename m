Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFC874D2A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 12:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF36DE5;
	Thu,  7 Mar 2024 12:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF36DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709810067;
	bh=3rWMw8R+NsnkFdzxFdqowjz8po9SnkV8ho17BYS6idY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Brib+iqk1eD07DmzuirOzpXS/cNN+JYeeEp69Dr3ZarEGNV6mHMEzl6Ct74+9FBDH
	 Q1EJ2YBkTcn2oEfw91Mw3AB0uokE9Mm6YVhVY+Uo91Srcvyfs9gJaaIRHx4gCNd7ky
	 lx4uMsv/UAbZ6kQ+2uLBqPUPWrCYKj/A57D0tnNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 889FEF805D8; Thu,  7 Mar 2024 12:13:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B297DF805AE;
	Thu,  7 Mar 2024 12:13:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD1C7F8024E; Thu,  7 Mar 2024 12:12:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ABBCDF8014B
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 12:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABBCDF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lo2RdtTu
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4278beip008605;
	Thu, 7 Mar 2024 05:12:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=FiXXVGoZ6B/v7js0WzJUH1DmMPvwXnS9aA/7lbdCnac=; b=
	lo2RdtTuwP162GMPOVP0PSg+54uZL6Pvkos432aC/zc7120PMo/errG2vt0U87QS
	5EDKIzGT6nhKxFrlEIXYjEFjYpKU6KZQ89VrIsMSSBU4hJIveAzwu2EFmhQqP49c
	hNqaP5iCs7sHjcFG8kEq5mgZD3ghgrG7hOLr6p+IzIGa5+Nm4+KHGA4ILS6xil+C
	sVWTL+XdpeEPfbTNiRX70nV0Qv50OcV4zaGanRNFkMIEhtOUBN3m7oPsSLBhImsA
	bOw0AZgfGJD75/gRZO7WQ7jhuR5kWo+eiddBQRF6R3k3dybzlZyl03HHxLb5T7N8
	vT50rBgXBk8LeZ0Sk1/bZw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn931ha8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 05:12:18 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 7 Mar 2024
 11:12:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Thu, 7 Mar 2024 11:12:17 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D746982024D;
	Thu,  7 Mar 2024 11:12:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 2/2] ALSA: hda: hda_component: Include sound/hda_codec.h
Date: Thu, 7 Mar 2024 11:12:16 +0000
Message-ID: <20240307111216.45053-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240307111216.45053-1-rf@opensource.cirrus.com>
References: <20240307111216.45053-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MYpp-lhqeIV3bEWwZXEjznVqAX-5uGuo
X-Proofpoint-ORIG-GUID: MYpp-lhqeIV3bEWwZXEjznVqAX-5uGuo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4WGZO3TEYQQ2G725UB2DFFQ4WARY7MK7
X-Message-ID-Hash: 4WGZO3TEYQQ2G725UB2DFFQ4WARY7MK7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WGZO3TEYQQ2G725UB2DFFQ4WARY7MK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

hda_component.h uses hda_codec_dev from sound/hda_codec.h.
Include sound/hda_codec.h instead of assuming that it has already
been included by the parent .c file.

This isn't causing any problems with current code, so no need to
backport to older kernels.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/hda_component.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index a0fcc723483d..c80a66691b5d 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/component.h>
+#include <sound/hda_codec.h>
 
 #define HDA_MAX_COMPONENTS	4
 #define HDA_MAX_NAME_SIZE	50
-- 
2.30.2

