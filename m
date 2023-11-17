Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C8F7EF43F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 15:15:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF440852;
	Fri, 17 Nov 2023 15:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF440852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700230550;
	bh=1HDjnB4GgHEMB6TAT/RN5S5DWSoShJ+48qbmAlrGMhk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dusc2X2mof3tFgmgIhDrn8rbmYs0lCbrBvnhAuadaE8/m1aJ3JnKb2LyY7Hk3K2VQ
	 KPhnZgznkL/WcSjeBd+qrob3s/b9XBrkLqR8KiT5wvEWJKoQ/EA1xcjnnGCwCWyHgQ
	 hJqQSX0zHD2VagzQiTIrUNO+AAEyehufd5VK1W6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08281F80570; Fri, 17 Nov 2023 15:14:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B49F8057A;
	Fri, 17 Nov 2023 15:14:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE684F80551; Fri, 17 Nov 2023 15:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AD40F80166
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 15:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD40F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JY4FcnGf
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AH8IefI017599;
	Fri, 17 Nov 2023 08:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=6nw9/LmGLszAOwC3SVOIkEn6mwCimN6BH+fyeN1E600=; b=
	JY4FcnGfg/NLLmPgZ6b4ftgL57/L0XL0ft2i5nU/bd6onECrHuBqBo1kKFzL0nEk
	GF0pLqfbyTRpb9c9F5s8a6du9UJAicD7t0uqpKV9KhPmtMyzFRKaipyODhVrtQCE
	QDuXNJOSdQ3obq6/udukjoWgpEkvvKz8K6GOwtHXqnOmK0v2Ot7hNPr5uVOrMMzP
	g9PyGfYcv6EXqMdrBZ8gay4i+8HZhAHXj3pdEvvkFNMfTtBwV2ppCEdHRLyB/D7r
	cJuRhUjyyTWRfsuSiSr6uJGkkREpU2xVTa1x4tkuH9o2YM23wc+p0l5PIMErBrsJ
	wwsreBaxI2YS3sy5gBD3Tg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ua7w2qj86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:13:49 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 17 Nov
 2023 14:13:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Fri, 17 Nov 2023 14:13:46 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C5BC73581;
	Fri, 17 Nov 2023 14:13:46 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH 2/7] ASoC: cs43130: Fix incorrect frame delay configuration
Date: Fri, 17 Nov 2023 14:13:39 +0000
Message-ID: <20231117141344.64320-3-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
References: <20231117141344.64320-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xMJZgkaxrt8opvDPw-9hKzLQEeckuZRw
X-Proofpoint-GUID: xMJZgkaxrt8opvDPw-9hKzLQEeckuZRw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DHFGV6VIKBSE7EVAOE6YZW36ENKIID2M
X-Message-ID-Hash: DHFGV6VIKBSE7EVAOE6YZW36ENKIID2M
X-MailFrom: prvs=668552b693=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHFGV6VIKBSE7EVAOE6YZW36ENKIID2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 sound/soc/codecs/cs43130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 20f06679b8f7..d8ec325b9cc9 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -578,7 +578,7 @@ static int cs43130_set_sp_fmt(int dai_id, unsigned int bitwidth_sclk,
 		break;
 	case SND_SOC_DAIFMT_LEFT_J:
 		hi_size = bitwidth_sclk;
-		frm_delay = 2;
+		frm_delay = 0;
 		frm_phase = 1;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-- 
2.34.1

