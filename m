Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9073D7A94B7
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D435CE76;
	Thu, 21 Sep 2023 15:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D435CE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302690;
	bh=IAcXaOLXJdM7zW3THpLltxV9v4Ww5ruOOwl8Tmhy13c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jf9CE9QNX3q3wiB0Ai+/Q1X20bAnUAfo9+1AdIdNHPTi5f1hF3cMweHfKn31hvvFy
	 +IvgvyEGW07/ZC1U7Vx52VzY1w/groCZJB0GuZyXmKhk6enwtjtKT7XxZJY/HM+yIP
	 aejOCpuG+4NcXUifl6fwnCw4fRYjS/g/ZEZSfPS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8D0F805D6; Thu, 21 Sep 2023 15:22:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45676F805D4;
	Thu, 21 Sep 2023 15:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E88F80494; Wed, 20 Sep 2023 05:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id D2862F80125
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 05:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2862F80125
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978098:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Wed, 20 Sep 2023 11:50:36 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 20 Sep
 2023 11:50:35 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Wed, 20 Sep 2023 11:50:35 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, ChiYuan Huang
	<cy_huang@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] ASoC: Add rtq9128 audio amplifier
Date: Wed, 20 Sep 2023 11:50:32 +0800
Message-ID: <1695181834-5809-1-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=16244D1BD6=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 47UOD2FKIB4DGPRFZ34F66HECFPODMO2
X-Message-ID-Hash: 47UOD2FKIB4DGPRFZ34F66HECFPODMO2
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47UOD2FKIB4DGPRFZ34F66HECFPODMO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series adds Richtek rtq9128 automotive audio amplifier
support. It can deliver up to 4x75W into 4Ohm speaker from a 25V
supply in automotive applications.

Change log
v3
- Add Reviewed-by tag for dt binding patch
- Refine the source code by reviewer's comments
  detail changes listed in the patch
- Add DVDD undervoltage threshold selection from HW guy's suggestion

v2
- dt document fix listed in patch extra comment

ChiYuan Huang (2):
  ASoC: dt-bindings: Add Richtek rtq9128 audio amplifier
  ASoC: codecs: Add Richtek rtq9128 audio amplifier support

 .../bindings/sound/richtek,rtq9128.yaml       |  54 ++
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/rtq9128.c                    | 766 ++++++++++++++++++
 4 files changed, 837 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
 create mode 100644 sound/soc/codecs/rtq9128.c

-- 
2.34.1

