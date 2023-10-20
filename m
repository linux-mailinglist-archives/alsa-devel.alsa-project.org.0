Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 522D97D1056
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 15:14:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B56EB836;
	Fri, 20 Oct 2023 15:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B56EB836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697807681;
	bh=Se48mX1RIsOWJHEdvv2rMdzW08ORSpxMdT6dr3hoWng=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rx+gC3f21owQwoROmNSisM05n4mnwyJETgTxyjjIDx0arNtYRuinSiJJ+P7tFxqm1
	 6JcvtJXDvDNfo49jCBPSRQZHemq13PMkTqW5DE1W5FnLYhIgb6C64D+A0xRvFT8ged
	 khIjJ3SX6C82qWQXJJpgClIcBLS5cAA/r4wqdQTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D5CF805AC; Fri, 20 Oct 2023 15:12:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A247EF805AC;
	Fri, 20 Oct 2023 15:12:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DFB9F8032D; Fri, 20 Oct 2023 11:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 8938EF8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 11:51:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8938EF8019B
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1461497:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Fri, 20 Oct 2023 17:50:36 +0800 (CST)
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
Subject: [PATCH 0/3] ASoC: codecs: rtq9128: Several application fixes
Date: Fri, 20 Oct 2023 17:50:32 +0800
Message-ID: <1697795435-5858-1-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=165218EEE3=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SJXAHMVKUCD3KNSI55WH57KUAL7KVLO2
X-Message-ID-Hash: SJXAHMVKUCD3KNSI55WH57KUAL7KVLO2
X-Mailman-Approved-At: Fri, 20 Oct 2023 13:12:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJXAHMVKUCD3KNSI55WH57KUAL7KVLO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series fix several issues that comes from the real
application.

ChiYuan Huang (3):
  ASoC: codecs: rtq9128: Fix string compare in DAPM event callback
  ASoC: codecs: rtq9128: Fix TDM enable and DAI format control flow
  ASoC: codecs: rtq9128: Fix TKA470B E1 version amp on sequence

 sound/soc/codecs/rtq9128.c | 130 ++++++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 37 deletions(-)


base-commit: ca34c962d70ab42fb578a36103ba7b8bb01f1f9b
-- 
2.34.1

