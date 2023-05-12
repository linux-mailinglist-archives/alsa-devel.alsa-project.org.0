Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A47007E7
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 14:30:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EFF11E2;
	Fri, 12 May 2023 14:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EFF11E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683894602;
	bh=Mllg+e12Gmu1CW2IgMosJZZJuSVHfhQwSPfhsxnZVdg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ho95bp8DlxR/dJXm0zKw79KEjilckaFrLaiACizX7nVWisVbTzUuuDxuOQNu4DnGb
	 YEFkK4mx9sCcZSah+kCmFmHqKmzrzrhINBuxhWqCcF2pBqf012gxA1lYfpcExPmU0N
	 jypny0KdQfUm975NlJGBNCz8aUnge6e7Rl+mGCPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21EE7F8055C; Fri, 12 May 2023 14:29:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A21ACF80549;
	Fri, 12 May 2023 14:28:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA71F80552; Fri, 12 May 2023 14:28:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B055F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 14:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B055F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Er69sx5m
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C5eUj8031128;
	Fri, 12 May 2023 07:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=FF0MGgoGVYiyUdoLzrNTfui4hZc7QAdyPV9+R56x+60=;
 b=Er69sx5mItoC7ting41wXRkLDp8b5HO8s/fGyGkzhxBF+20TAD3DNqAeairtfRj2D38l
 7g17wC1+wGuZJyemUmRYv4eD2J9+I4gNNMP4uGmnz4y8jAB5dNT84mlw9GdjzHHc1EuR
 neKDzdPlX3s2bX5ChnlLn5yCXeV+2+XElpxubkHW0OvRRBrGitDGBgCsHtcAPg9TXzGV
 mYKOOs1ngblrB97SiHiQ0gFUmQzYayn+k+f9L2vXAZgskzj1hNM1y2fj5A+qJpQs2TW2
 92/k+82n1QHInNcC6QKtawwmdfRQjDa2m6OL/Y7oq9/cJDE0LfIOj6CHRc+pl7bNXW+t zA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46b2x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 07:28:40 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 07:28:38 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 May 2023 07:28:38 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5829715A4;
	Fri, 12 May 2023 12:28:38 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>
CC: <lgirdwood@gmail.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/10] ASoC: ak4118: Update to use new component control
 notify helper
Date: Fri, 12 May 2023 13:28:31 +0100
Message-ID: <20230512122838.243002-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tR8CwHcEE0q8AMCU_M3wg1mquGdZccCi
X-Proofpoint-GUID: tR8CwHcEE0q8AMCU_M3wg1mquGdZccCi
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2PELMIFHUJLPL5KYS5WTQVIATZPJAGO6
X-Message-ID-Hash: 2PELMIFHUJLPL5KYS5WTQVIATZPJAGO6
X-MailFrom: prvs=0496644b8b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PELMIFHUJLPL5KYS5WTQVIATZPJAGO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the driver to use the new ASoC core control notify helper.
This also fixes a bug where the control would not be found if the
CODEC was given a name prefix.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/ak4118.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index b6d9a10bdccdc..74ccfb0d921d6 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -264,8 +264,6 @@ static irqreturn_t ak4118_irq_handler(int irq, void *data)
 	struct ak4118_priv *ak4118 = data;
 	struct snd_soc_component *component = ak4118->component;
 	struct snd_kcontrol_new *kctl_new;
-	struct snd_kcontrol *kctl;
-	struct snd_ctl_elem_id *id;
 	unsigned int i;
 
 	if (!component)
@@ -273,13 +271,8 @@ static irqreturn_t ak4118_irq_handler(int irq, void *data)
 
 	for (i = 0; i < ARRAY_SIZE(ak4118_iec958_controls); i++) {
 		kctl_new = &ak4118_iec958_controls[i];
-		kctl = snd_soc_card_get_kcontrol(component->card,
-						 kctl_new->name);
-		if (!kctl)
-			continue;
-		id = &kctl->id;
-		snd_ctl_notify(component->card->snd_card,
-			       SNDRV_CTL_EVENT_MASK_VALUE, id);
+
+		snd_soc_component_notify_control(component, kctl_new->name);
 	}
 
 	return IRQ_HANDLED;
-- 
2.30.2

