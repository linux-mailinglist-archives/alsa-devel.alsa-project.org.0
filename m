Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97144977E51
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBF79EB6;
	Fri, 13 Sep 2024 13:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBF79EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226110;
	bh=QvFkFjmTvJ1ESC2x19Ky85o9+VWa1Z7r9DQ/wvoNEY8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TL4fNHSz3iWjfVmGMbHvr+ll7hsE9KLnEEj/VmmANa8sMF81Qw/Tgzdg+2b2AbPJD
	 rl7wpeZPD3aa7su8kikCdP5SVBcLGxfYdHhkpLYN6BeUBhLOT+jb+7H0wG09gagHDY
	 jnet13dIsZVRmWoOdAVDWRKrs+TriDRylSCH6wJM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D9BF8074D; Fri, 13 Sep 2024 13:12:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 116ADF8072A;
	Fri, 13 Sep 2024 13:12:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B67F801F5; Wed, 11 Sep 2024 14:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF554F80107
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 14:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF554F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=V/ZX501k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726057775; x=1757593775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QvFkFjmTvJ1ESC2x19Ky85o9+VWa1Z7r9DQ/wvoNEY8=;
  b=V/ZX501kjU/XXJALIxg0PgjNl1dc3AFFyxWJo75eufjqI04IgHIqBIJ1
   3snqShgF6yJrlimMRC0GSkvFK+yVZ1zZPLFO1AOFI7B9FtKw7bScCRlhz
   +1MZttyQIcuU/bnD++NpM/BE8ADtLgUXdFJ3s/oc3bTawdkMYsd7T2l9S
   1d0m9ueNsq/fIBUpwpFGeJHCBQ+I2Ahf9B1SWv70mf8PFOjL/aBUoNFUJ
   hhE/TwmIN1valWg3svyxyLOnFY+djtz9xf75IVIAi2xD72dAk/EiGphLl
   e9pr/c53nMW72wyy8lPTaL55DVZnPRiy3uu5LHXyNfdbNXJTci5QN/w/Q
   A==;
X-CSE-ConnectionGUID: 7yc5wvIRQsyrcBgBTvQNrw==
X-CSE-MsgGUID: cheCQQscS76IUrzwlChwnA==
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600";
   d="scan'208";a="262627889"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2024 05:29:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 11 Sep 2024 05:29:14 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 11 Sep 2024 05:29:11 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 0/3] Improvements for mchp-pdmc
Date: Wed, 11 Sep 2024 15:29:06 +0300
Message-ID: <20240911122909.133399-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=977ab1c01=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LWJNWI7FASNQU7TQDZPB3UXEZXD2ZOJG
X-Message-ID-Hash: LWJNWI7FASNQU7TQDZPB3UXEZXD2ZOJG
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:12:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWJNWI7FASNQU7TQDZPB3UXEZXD2ZOJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch set is intended to enhance the functionality and maintainability
of the mchp-pdmc driver:
- Enhances performance by refining maxburst logic.
- Introduces a name for better identification and management.
- Ensures controls remain intact when streams start/finish,
  returning -EBUSY if the controller is busy.

Codrin Ciubotariu (3):
  ASoC: atmel: mchp-pdmc: Improve maxburst calculation for better
    performance
  ASoC: atmel: mchp-pdmc: Add snd_soc_dai_driver name
  ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls

 sound/soc/atmel/mchp-pdmc.c | 118 +++++++++++++++++++-----------------
 1 file changed, 63 insertions(+), 55 deletions(-)


base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
-- 
2.34.1

