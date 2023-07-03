Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FCD7457EB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 11:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E7B73E7;
	Mon,  3 Jul 2023 11:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E7B73E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688375037;
	bh=GONHUpSJIfvyddAxHphRziAcBLD50ZjFd3LSQaNZXhw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Jrs2BoqWKzGF4QQIfCsyNQGcbu0fcZ6H+AsIltZ6IMZeypWYb2+d6XnhYTdJ8AvWQ
	 SdRrgCmh5Uqqq/BsQ2wvWZ4v1LOkREpZsrRVvT+jm1HdxG2zqSoHR1CNPdy9dadhpd
	 gmBP+E+9VaPK8/pOYZBjYQVlpWz3+VBV+eIBtFCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07D4F80535; Mon,  3 Jul 2023 11:03:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E70AF80104;
	Mon,  3 Jul 2023 11:03:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B182F80125; Mon,  3 Jul 2023 11:03:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F9EF80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 11:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F9EF80093
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36392dpF6011615,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36392dpF6011615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Mon, 3 Jul 2023 17:02:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 3 Jul 2023 17:02:42 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 3 Jul 2023 17:02:41 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 0/5] fix for JD event handling in ClockStop Mode0
Date: Mon, 3 Jul 2023 17:02:30 +0800
Message-ID: <20230703090230.25244-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: FTDTZJLNX3ZBXFR34WPOEHHDEWF7AWRS
X-Message-ID-Hash: FTDTZJLNX3ZBXFR34WPOEHHDEWF7AWRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTDTZJLNX3ZBXFR34WPOEHHDEWF7AWRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

Currently, the codec driver could re-enable SDCA interrupt mask when the devices are re-attached.
If the manager uses ClockStop Mode0 to peripherals, the SDCA interrupt mask will not be enabled 
when the system resumes.
These patches will fix this issue.

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
2.40.1

