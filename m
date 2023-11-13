Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F06277E9B7C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 12:54:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03BA0DEE;
	Mon, 13 Nov 2023 12:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03BA0DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699876444;
	bh=x6wqAroYwJ+l0RxC2ighdL/P7qfEsMBX+kYscYwm+rc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XWf2aXGzhCC+354uO61lieCD+yu5fGNyOgCHSgEGS3H7yToRP4aatPE282XQxxV/y
	 0eZLPURvBdu61kX/pidglCYzY/ry8dt58czo3uYhNss/fOqPLnq8BCkDTqb+tZDtAY
	 m1CQhBExjyEl2t8kqD+VSw/F/X+LYyGVW+XgvOzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49649F805BE; Mon, 13 Nov 2023 12:51:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D7AF805BA;
	Mon, 13 Nov 2023 12:51:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C786DF802E8; Mon, 13 Nov 2023 08:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id D187CF80152
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 08:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D187CF80152
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1769628:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Mon, 13 Nov 2023 15:56:18 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.27; Mon, 13 Nov
 2023 15:56:18 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1258.27 via Frontend
 Transport; Mon, 13 Nov 2023 15:56:18 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Oder Chiou <oder_chiou@realtek.com>,
	ChiYuan Huang <cy_huang@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>
Subject: [PATCH v1 1/3] ASoC: codecs: rtq9128: Fix PM_RUNTIME usage
Date: Mon, 13 Nov 2023 15:56:14 +0800
Message-ID: <1699862176-23710-2-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1699862176-23710-1-git-send-email-cy_huang@richtek.com>
References: <1699862176-23710-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=1680C42439=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H74EKX6T7B4JSXXZL7T6CUTDIWVQL76R
X-Message-ID-Hash: H74EKX6T7B4JSXXZL7T6CUTDIWVQL76R
X-Mailman-Approved-At: Mon, 13 Nov 2023 11:51:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H74EKX6T7B4JSXXZL7T6CUTDIWVQL76R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

If 'pm_runtime_resume_and_get' is used, must check the return value to
prevent the active count not matched problem.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index c22b047115cc..bda64f9eeb62 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -391,7 +391,11 @@ static int rtq9128_component_probe(struct snd_soc_component *comp)
 	unsigned int val;
 	int i, ret;
 
-	pm_runtime_resume_and_get(comp->dev);
+	ret = pm_runtime_resume_and_get(comp->dev);
+	if (ret < 0) {
+		dev_err(comp->dev, "Failed to resume device (%d)\n", ret);
+		return ret;
+	}
 
 	val = snd_soc_component_read(comp, RTQ9128_REG_EFUSE_DATA);
 
-- 
2.34.1

