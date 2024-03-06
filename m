Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E60873BE6
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AE1741;
	Wed,  6 Mar 2024 17:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AE1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741814;
	bh=ioYN/9YghUj0aCB+8sxcgLE59kh3ARmKIokGHWoPN0s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TEhyav3l0JTkf7d6sCylcjiUlnVHl7fC+zwsI/8n8fXLQFEEJe2ObCPOWSdKCHuXB
	 sEmsHXeDIwvYBzisJkUietaXMwB+GOK+GMWB8t7ataFczQWXZoqGdnhNHvmXjs1kkQ
	 uvrjD50r9kaoN/6HKlNqeloBdpBz5SmTOpDAAFA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 548D1F8063B; Wed,  6 Mar 2024 17:15:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F3DEF80642;
	Wed,  6 Mar 2024 17:15:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CDA5F805C9; Wed,  6 Mar 2024 17:15:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C753F805B0
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C753F805B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DzuFhK0x
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4268m45H016753;
	Wed, 6 Mar 2024 10:15:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=bRU53y88xZ5UTSTdeL7E9DlLRqfwscew8y4zZPeOtvw=; b=
	DzuFhK0xgLwkNfb/9rHkmebTTxtraSge9LlgHjAeC2to/86SSIItWaKJv6zboVu3
	qifYBzQ2rIQQdcWClGmXVV+FBnKLgan4HkOPWxPg3IyiR/IBPZo/1sQJqKzAMuBX
	3IJaMauPfr11MG2FuUYs2Sn9Pl7TEESesie7PIiyPQhYJiNarufIpQnGQtUZ1SoE
	OfuPDG/hQbbEBkep9FgIaa1PwmzLt1iQ9h9y60njAPJP1v04KRmqbD66GO9aif2M
	gGgMqh9fwrfSkbRW349eOP1wpYHFpp1pG1ANS8nlzYXc6xgyQr+hTT41Ppmr0MIk
	UX4PEaYkaTNIMdCXmIIiXw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn930g9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 10:15:10 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 6 Mar 2024
 16:15:08 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Wed, 6 Mar 2024 16:15:08 +0000
Received: from ediswws08.ad.cirrus.com (ediswws08.ad.cirrus.com
 [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BE609820243;
	Wed,  6 Mar 2024 16:15:08 +0000 (UTC)
From: Stuart Henderson <stuarth@opensource.cirrus.com>
To: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        "Stuart
 Henderson" <stuarth@opensource.cirrus.com>
Subject: [PATCH 5/5] ASoC: wm8962: Fix up incorrect error message in
 wm8962_set_fll
Date: Wed, 6 Mar 2024 16:14:39 +0000
Message-ID: <20240306161439.1385643-5-stuarth@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GQpgMBZCV7sidcX6J5TRZH52UMzzfD2J
X-Proofpoint-ORIG-GUID: GQpgMBZCV7sidcX6J5TRZH52UMzzfD2J
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K7O5SR4RQEQ2ZNEHAZTFKZDKJAGUJWSN
X-Message-ID-Hash: K7O5SR4RQEQ2ZNEHAZTFKZDKJAGUJWSN
X-MailFrom: prvs=079554e8cd=stuarth@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7O5SR4RQEQ2ZNEHAZTFKZDKJAGUJWSN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use source instead of ret, which seems to be unrelated and will always
be zero.

Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
---
 sound/soc/codecs/wm8962.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 24bd818c3345..5ad6850c591f 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2941,7 +2941,7 @@ static int wm8962_set_fll(struct snd_soc_component *component, int fll_id, int s
 				    WM8962_FLL_FRC_NCO, WM8962_FLL_FRC_NCO);
 		break;
 	default:
-		dev_err(component->dev, "Unknown FLL source %d\n", ret);
+		dev_err(component->dev, "Unknown FLL source %d\n", source);
 		return -EINVAL;
 	}
 
-- 
2.39.2

