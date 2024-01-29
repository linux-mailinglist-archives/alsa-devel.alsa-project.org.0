Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F26840B67
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A8D8B70;
	Mon, 29 Jan 2024 17:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A8D8B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545770;
	bh=1HSK11Wfi7i7NJG5CuDvObzPSWsGrGhllG5djarUfjU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QAT1eKOM1TjfH0MWM+1Sbp6v6u54sgKD+/6qZdg/+6EsdhnEqpkmxBwXcmFsjiRKe
	 rCwTfBT7ptRyniME4+Mlklrsu2Brbq2FWhmGwhQrtf+ciRr/vJI0WkcEZ+5Na5Y7j/
	 5ARYnWqjv4f8QoevczcUtEgE7mYjvfWB8jE1voWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F724F8067B; Mon, 29 Jan 2024 17:28:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D183AF805C4;
	Mon, 29 Jan 2024 17:28:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5BB1F805AB; Mon, 29 Jan 2024 17:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3147EF80568
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3147EF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qBooUn/4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0A006968;
	Mon, 29 Jan 2024 10:27:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=9UZPrvwSETOvFqtQyagoZ3GxnlQC7ET9ALMxEkO6v10=; b=
	qBooUn/4uwNaOyczsOZntmdKFh4BK6kXo786TxxXqfXkki4Whh/0xrBr+5A4XfoB
	tzPBpup29qT+03Ziom7HJ2G4sAbt0h0gzs+x5d5VJijfXaiQSPrBgb4PEjmUNVdW
	f1g4ZVmyu51YhFzfUCv1ZzwNtoi7mPivf9aR7wBgSHOd3gC0IgSxF7vNiS+dW3C7
	/0p9bRP0Df69nV5nOgS0jqF0Tmf/gZ8TGu43WVSMsBe+9k8hA8NC6+aGv9vLxrAs
	8/vYiFpqEvxuAtmfv/+35tylQj/bm8jd9Kp4hXH2+8H8VT5wNO6uXwtzCHtHSDwC
	5VfC6LtoRgLM9a8NpDsLow==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:52 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:42 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:42 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6BDAE820247;
	Mon, 29 Jan 2024 16:27:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 03/18] ASoC: cs35l56: cs35l56_component_remove() must clear
 cs35l56->component
Date: Mon, 29 Jan 2024 16:27:22 +0000
Message-ID: <20240129162737.497-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _tgwHGyX_zM0B8maXPn7AKPgJFDm8Npk
X-Proofpoint-GUID: _tgwHGyX_zM0B8maXPn7AKPgJFDm8Npk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DQWIPIVPX4XFJFQEZP42PVE372B6M7JD
X-Message-ID-Hash: DQWIPIVPX4XFJFQEZP42PVE372B6M7JD
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l56->component pointer is used by the suspend-resume handling to
know whether the driver is fully instantiated. This is to prevent it
queuing dsp_work which would result in calling wm_adsp when the driver
is not an instantiated ASoC component. So this pointer must be cleared
by cs35l56_component_remove().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
---
 sound/soc/codecs/cs35l56.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 45b4de3eff94..09944db4db30 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -809,6 +809,8 @@ static void cs35l56_component_remove(struct snd_soc_component *component)
 	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
 
 	cancel_work_sync(&cs35l56->dsp_work);
+
+	cs35l56->component = NULL;
 }
 
 static int cs35l56_set_bias_level(struct snd_soc_component *component,
-- 
2.39.2

