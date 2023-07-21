Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C775C27C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 11:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B7FFE87;
	Fri, 21 Jul 2023 11:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B7FFE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689930479;
	bh=pNtmDQRqLN0kXWVHsflignrMdRWeZoE5gaXDOPkYs0c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gYXv6oFnvIVIsFPLABIxhwen0iTSBhbFrVNjjsqxQWCKxltLcb5HbBPaXRcumdWiG
	 Fms8b7xnIR+rNu4H2KIpW2lC23hc8FfofKXnqb0Yj99sYaU/1i/V+fgsQCX72s3piD
	 m4M/sFyNznZ43hYs6DMn06sE9yvAGJ7dA8Jbaqj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5393FF804DA; Fri, 21 Jul 2023 11:07:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF4DAF8027B;
	Fri, 21 Jul 2023 11:07:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DE53F8047D; Fri, 21 Jul 2023 11:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E552F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 11:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E552F8007E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36L96TqeC027193,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36L96TqeC027193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 21 Jul 2023 17:06:29 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Jul 2023 17:06:39 +0800
Received: from ubuntu.localdomain (172.22.102.209) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 21 Jul
 2023 17:06:39 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        <pierre-louis.bossart@linux.intel.com>,
        "Shuming
 Fan" <shumingf@realtek.com>
Subject: [PATCH v2 0/5] fix for JD event handling in ClockStop Mode0
Date: Fri, 21 Jul 2023 17:06:33 +0800
Message-ID: <20230721090633.128196-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.209]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: RRA575VLWZE2F2W5U7W7IO2TXDTOIVXZ
X-Message-ID-Hash: RRA575VLWZE2F2W5U7W7IO2TXDTOIVXZ
X-MailFrom: shumingf@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRA575VLWZE2F2W5U7W7IO2TXDTOIVXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

Currently, the codec driver could re-enables SDCA interrupt mask and 
the bus driver re-enables Imp-defined interrupt mask when the devices are re-attached.
If the manager uses ClockStop Mode0 to peripherals, 
the SDCA/Imp-defined interrupt mask will not be enabled when the system resumes.
These patches will fix this issue.
--
v2 - modify the commit messages

Shuming Fan (5):
  ASoC: rt5682-sdw: fix for JD event handling in ClockStop Mode0
  ASoC: rt711: fix for JD event handling in ClockStop Mode0
  ASoC: rt711-sdca: fix for JD event handling in ClockStop Mode0
  ASoC: rt712-sdca: fix for JD event handling in ClockStop Mode0
  ASoC: rt722-sdca: fix for JD event handling in ClockStop Mode0

 sound/soc/codecs/rt5682-sdw.c     |  9 ++++++++-
 sound/soc/codecs/rt711-sdca-sdw.c | 10 +++++++++-
 sound/soc/codecs/rt711-sdw.c      |  9 ++++++++-
 sound/soc/codecs/rt712-sdca-sdw.c | 10 +++++++++-
 sound/soc/codecs/rt722-sdca-sdw.c | 10 +++++++++-
 5 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.34.1

