Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02314773F98
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 18:50:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5813F84D;
	Tue,  8 Aug 2023 18:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5813F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691513400;
	bh=kTgjJBad6FC5V6sljDaNHr39zw8lz9cMbAMMSi8jUrs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UwWSjTaOTcKLD+5sPR5lUeFLYYcprM6hq21n6OmiObwQD8wsKIFX1+lM/rsVclBNY
	 25Wr7HfUzQ/RwKUgThdIw0B05vXyR6u2ZVgtCVUysLxg9y/41DKSn1Dhf4v4oW+6MR
	 vxi2XRSYlx8AE43gHlJGCiSIykOFovQRgeP8tn8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 310A7F805B6; Tue,  8 Aug 2023 18:47:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AAA0F805B3;
	Tue,  8 Aug 2023 18:47:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9102DF80587; Tue,  8 Aug 2023 18:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C8EDF80544
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 18:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C8EDF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NgvX80+c
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378GfYwF012826;
	Tue, 8 Aug 2023 11:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=AuMoPk2SddtMqxj2LNmox9QFPh23Jlu82ndLix93u4E=; b=
	NgvX80+c/S3jRDKQoq6/Tl6nnBWUNJTjjr1K9/iNKeMNkkkmjtGDpevVnEXj9d9Z
	OaxEI8uh7N79xrF0Qj32phy0DgEr1O/bbtPnWBnqwX/GL2pCblCLYiaNWTEZK4ui
	xwnIViwTgSsxbGEkDDaqgz8H2xJMTrGsPu6WEUGdvXACPOBg9cmeqqel8Z4EdmGq
	p2ZvTZ1KLF6qSql5NYIOIV53wt7ltBqu7w2ZDU2YzH58uaUfJmXfnZ8jfTFYZHON
	0WRiwcnmHMU4De2Pi+0MncwwTsOcXBlrTDcIyu0WACX1H6OGbPMO10VT2lIjzVNO
	C9/ODoE5Z15I55dNaDB//g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s9juhtucr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 11:47:07 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:47:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 8 Aug 2023 17:47:05 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.220])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F32E43563;
	Tue,  8 Aug 2023 16:47:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 2/5] ASoC: cs35l56: Don't rely on GPIOD_OUT_LOW to set RESET
 initially low
Date: Tue, 8 Aug 2023 17:46:59 +0100
Message-ID: <20230808164702.21272-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808164702.21272-1-rf@opensource.cirrus.com>
References: <20230808164702.21272-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VpSh-Y7tixG6CeifcVqE4kD-QZaxSsK7
X-Proofpoint-ORIG-GUID: VpSh-Y7tixG6CeifcVqE4kD-QZaxSsK7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZZF5RMKYIQZINDHEP5PEUN4YLFJCBS5L
X-Message-ID-Hash: ZZF5RMKYIQZINDHEP5PEUN4YLFJCBS5L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZF5RMKYIQZINDHEP5PEUN4YLFJCBS5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ACPI setting for a GPIO default state has higher priority than the
flag passed to devm_gpiod_get_optional() so ACPI can override the
GPIOD_OUT_LOW. Explicitly set the GPIO low when hard resetting.

Although GPIOD_OUT_LOW can't be relied on this doesn't seem like a
reason to stop passing it to devm_gpiod_get_optional(). So we still pass
it to state our intent, but can deal with it having no effect.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index be400208205a..9560059c867b 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1069,6 +1069,8 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 		return dev_err_probe(cs35l56->base.dev, ret, "Failed to enable supplies\n");
 
 	if (cs35l56->base.reset_gpio) {
+		/* ACPI can override GPIOD_OUT_LOW flag so force it to start low */
+		gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 		cs35l56_wait_min_reset_pulse();
 		gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 1);
 	}
-- 
2.30.2

