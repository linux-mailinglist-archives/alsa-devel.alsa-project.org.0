Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F848D658A
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 17:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 531C3105F;
	Fri, 31 May 2024 17:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 531C3105F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717168600;
	bh=fY7MkT5JoP238inIzvp80l8R/QuTlnYxL8jXzTxaxIk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uzQlRio/VwpBwqXuM7w+4KE7+PGgtp/ofOgf5sag4yf+F3Lb29BXCzDCpmjlIge7e
	 ZoBjvgEtwQ03+YT/yRPEspcNl+5z4d7XsXdOhIc9FKnjMpLaLxr1kEoGkZRBqBC7VC
	 3wRinDB18W62oOzZ/6BD2jVGUgBGLRHVPp8V8ygo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38EB3F8061A; Fri, 31 May 2024 17:15:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4E09F8060E;
	Fri, 31 May 2024 17:15:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CC2BF8059F; Fri, 31 May 2024 17:15:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C68FF8047C
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 17:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C68FF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YXdV7O+d
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44VB0WSs017940;
	Fri, 31 May 2024 10:15:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/31H52Kx5dI0pIOnMzUjAMQTByFunlPMmeUhLGzbe3M=; b=
	YXdV7O+dAioIHxo99tthgI5iI/xwthaDzsjt0ywr7hs4qN2g7mPYhtI7bgWsLDeV
	Pl4kxGunRXSLIxavNE5hcGfM0cgBa9+P7y941bdcRflcpnhY730uSQLJ34FQnY4G
	DcXupyofUqbpvZg5ia4MKDnx32ESsTo+MIGE7kvz3KDoJyN98BVbmp1QZkPfm3Qt
	Rp43I+CT93QGsHwWB1VxO4fZg1Tg4r34OQS7+B9rof0BAhJiFLn8WksLHQhgmMAH
	vz1X6p0+b4Ha1CdUWq71RUfG6dbsm9aeNbE4oLxClYwT0vj6aS0Yew2w03tX1yup
	vMZDi9aYMJSaARgB9y1cJw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ybcdhe0a3-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:15:13 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 16:15:10 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 16:15:10 +0100
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.65.72])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 258BF820244;
	Fri, 31 May 2024 15:15:10 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <soyer@irl.hu>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>, <kailang@realtek.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
Subject: [PATCH 2/7] ALSA: hda: cs35l41: Component should be unbound before
 deconstruction
Date: Fri, 31 May 2024 16:14:04 +0100
Message-ID: <20240531151409.80284-3-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240531151409.80284-1-simont@opensource.cirrus.com>
References: <20240531151409.80284-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HCZRzOeut7LNDgWaToKphYa35UK_rfmr
X-Proofpoint-ORIG-GUID: HCZRzOeut7LNDgWaToKphYa35UK_rfmr
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4L3Z7R4ITJ3HPP5SARURVNL6HFT272AW
X-Message-ID-Hash: 4L3Z7R4ITJ3HPP5SARURVNL6HFT272AW
X-MailFrom: prvs=3881dca93d=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4L3Z7R4ITJ3HPP5SARURVNL6HFT272AW/>
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
 sound/pci/hda/cs35l41_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d54d4d60b03e..031703f010be 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -2019,6 +2019,8 @@ void cs35l41_hda_remove(struct device *dev)
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 
+	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
+
 	pm_runtime_get_sync(cs35l41->dev);
 	pm_runtime_dont_use_autosuspend(cs35l41->dev);
 	pm_runtime_disable(cs35l41->dev);
@@ -2026,8 +2028,6 @@ void cs35l41_hda_remove(struct device *dev)
 	if (cs35l41->halo_initialized)
 		cs35l41_remove_dsp(cs35l41);
 
-	component_del(cs35l41->dev, &cs35l41_hda_comp_ops);
-
 	acpi_dev_put(cs35l41->dacpi);
 
 	pm_runtime_put_noidle(cs35l41->dev);
-- 
2.34.1

