Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07E97C9D6
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:14:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C798847;
	Thu, 19 Sep 2024 15:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C798847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751644;
	bh=agf3oeyUZwHA5yCPkUYoM7WwczxPeDgbJzbwLLz7fCw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=obgAxYtWnbUn6GYnIJY6/8U1wL1bIhOVjDo+1IHTMe0xgy4cpB4al13mRjple5o6E
	 AIwULtZ8i210aJIWkP8NTlpo1Vp71unINwuVLPly8KcFOBqNfycVLf/Eqs+1xq9qQ1
	 UhY5kirugnoVqBlrUmEK+FQbV27nYGEmtxnHBZso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F2FEF80611; Thu, 19 Sep 2024 15:13:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 722E6F8060A;
	Thu, 19 Sep 2024 15:13:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B638F8020D; Mon, 16 Sep 2024 10:53:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4F98F80074
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 10:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F98F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=bjtMHAh7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726476818; x=1758012818;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=agf3oeyUZwHA5yCPkUYoM7WwczxPeDgbJzbwLLz7fCw=;
  b=bjtMHAh762cizdZ5AF2NoyqhizSg7d2vQGJXctVjdKKe8O5fBte2DwFO
   Q8/n84Wfi5J0DbHSzs8llbvU3gwB19eL0lTREsdwiBnfscV6ACixhQh3C
   AfbpGmWQgEx5KdxLgDlEeKPNB5/XLQ/QJiCQfXO/w+jmBZGueRngAeRw4
   VbXVCqSj41z8nH1/kumD4MiH7mzpvNTbVQ5urAF+LY6asETQSu+YRHPPS
   g9tRtmlYATYdWxF1MThH3Nj1Sbah/lbxt8xBwRRiMSg1Y6HwwhxytbcsH
   N4m5XrC0At2agDKHETABBGmQmyaXF9m7tYies7P9wRoonVzzw505+AuSP
   w==;
X-CSE-ConnectionGUID: ud22UtPZTBS6TJ0gR5tqlw==
X-CSE-MsgGUID: 8xch8a0mSs+WNU1z0l0vJA==
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600";
   d="scan'208";a="262819277"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2024 01:53:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Sep 2024 01:53:09 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 16 Sep 2024 01:53:06 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 0/2] Updates for Atmel SSC DAI
Date: Mon, 16 Sep 2024 11:52:13 +0300
Message-ID: <20240916085214.11083-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=98237714c=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K3ZNTM453FDZ7PJLF7JIGN2QFSHRXNDQ
X-Message-ID-Hash: K3ZNTM453FDZ7PJLF7JIGN2QFSHRXNDQ
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:13:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3ZNTM453FDZ7PJLF7JIGN2QFSHRXNDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch set includes two updates for the Atmel SSC DAI driver:
- Address the limitation with the S24_LE format.
- Add stream names for DPCM and future use-cases.

Codrin Ciubotariu (2):
  ASoC: atmel: atmel_ssc_dai: Add stream names
  ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due to single channel
    limitation

 sound/soc/atmel/atmel_ssc_dai.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)


base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
-- 
2.34.1

