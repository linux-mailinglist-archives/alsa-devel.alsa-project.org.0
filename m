Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2FF7D1054
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:14:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB875A4A;
	Fri, 20 Oct 2023 15:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB875A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697807654;
	bh=NqdnZpTmS5JvXZXngk2rPkQiJMbrznCNKxD2K54KooQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=naJABUVfHNszfDurAmwksb3x6EDOLS1m3EV0QQLyzIgoVEO5Ax5zSIE+mdZt/2Waa
	 86+EGEQgTvMJHkxT4gApRZsghqx7hb5cEo5D5PzpggP0oNW0EiozR7wCihZyDZVm7x
	 jHaHtnBKAERS+GvrnRZju/yzWTFbAX11x9AGzlnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9BECF8057C; Fri, 20 Oct 2023 15:12:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFAB3F80570;
	Fri, 20 Oct 2023 15:12:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF34AF80536; Fri, 20 Oct 2023 11:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E87F800C9
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 11:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E87F800C9
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1461660:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Fri, 20 Oct 2023 17:50:37 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 20 Oct
 2023 17:50:36 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 20 Oct 2023 17:50:36 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Allen
 Lin <allen_lin@richtek.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: codecs: rtq9128: Fix string compare in DAPM event
 callback
Date: Fri, 20 Oct 2023 17:50:33 +0800
Message-ID: <1697795435-5858-2-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
References: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=165218EEE3=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XD6K3ZWRLIJU6LX3W7H6FTEVR2CDRSBV
X-Message-ID-Hash: XD6K3ZWRLIJU6LX3W7H6FTEVR2CDRSBV
X-Mailman-Approved-At: Fri, 20 Oct 2023 13:12:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XD6K3ZWRLIJU6LX3W7H6FTEVR2CDRSBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Since widget name may concatenate the component prefix. To compare the
the name with 'strcmp' function in shared DAPM event callback will
cause the wrong RG field control. Use 'strstr' function, instead.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 371d622c6214..8c1c3c65475e 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -291,11 +291,11 @@ static int rtq9128_dac_power_event(struct snd_soc_dapm_widget *w, struct snd_kco
 
 	dev_dbg(comp->dev, "%s: %s event %d\n", __func__, w->name, event);
 
-	if (strcmp(w->name, "DAC1") == 0)
+	if (strstr(w->name, "DAC1"))
 		shift = 6;
-	else if (strcmp(w->name, "DAC2") == 0)
+	else if (strstr(w->name, "DAC2"))
 		shift = 4;
-	else if (strcmp(w->name, "DAC3") == 0)
+	else if (strstr(w->name, "DAC3"))
 		shift = 2;
 	else
 		shift = 0;
-- 
2.34.1

