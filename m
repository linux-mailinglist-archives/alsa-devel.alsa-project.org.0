Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF598BC30
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 730C6828;
	Tue,  1 Oct 2024 14:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 730C6828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786196;
	bh=GZc63eXCJHLz2doVRvuGzvZovQYn0B8xHq46bwGnFE4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pyDFjOD2j8MZeKIvGdRiqat2cb6VBNR3QZHoH7IopYJ69rITv5Ao4Tw1KCKFvaq3P
	 ZTZZtxBJCADuTYm9Ls3YPhsoH1+17NRF2pTeqe2O8qys9ZxhKlIDb4fdeWW6Yjj3lo
	 OE63eMrh9gi42QoU+6ZrKsMBmr01ZeeDIBTeNojE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41339F8065A; Tue,  1 Oct 2024 14:35:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 111D8F80638;
	Tue,  1 Oct 2024 14:35:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D220F802DB; Tue, 24 Sep 2024 10:13:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C896CF80107
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C896CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=AsLov3Oj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727165606; x=1758701606;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GZc63eXCJHLz2doVRvuGzvZovQYn0B8xHq46bwGnFE4=;
  b=AsLov3OjjIQ5BaSfxUN1KYYR3mmh+29s0TtvGhUO9YGt9+UJLfo2Te9O
   FO4mQN+veKU8PPKOMTYlCNEJPzYNHAYn8/6rNAn7JtfTL0Tv0ay+a/tzl
   6rfiEeZqyN162KPsJ7mM1s2lHEy01zYJ2EjlSXO1Y/XjH6e5kDZKqud2i
   M98X0/0F5AxbIxut4rxSUD1grpNEcupoH/grKp8gSpn0SHw4+2xy/KGAV
   Ur/ZYbxC6geyztJ99UpslbeXt4PMm8Ee8I1uBc4YUUwM15GBu8E4XMFMZ
   nQNmxBLwbf9rBDzcwtb2Og603H0Pnk3bmekMyoVHAXe+3WsyvnjiLI70D
   w==;
X-CSE-ConnectionGUID: az7ICeymT/y/jLAHNtXqzg==
X-CSE-MsgGUID: qObPW9fWTl6T45AWPAfa/g==
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600";
   d="scan'208";a="32031723"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Sep 2024 01:13:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 24 Sep 2024 01:12:59 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 24 Sep 2024 01:12:57 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if substream
 runtime is uninitialized
Date: Tue, 24 Sep 2024 11:12:38 +0300
Message-ID: <20240924081237.50046-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=99060207b=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3BTEZKYMC7APX3U24RETWB6IBSW3HCQU
X-Message-ID-Hash: 3BTEZKYMC7APX3U24RETWB6IBSW3HCQU
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:34:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BTEZKYMC7APX3U24RETWB6IBSW3HCQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update the driver to prevent alsa-restore.service from failing when
reading data from /var/lib/alsa/asound.state at boot. Ensure that the
restoration of ALSA mixer configurations is skipped if substream->runtime
is NULL.

Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 939cd44ebc8a..06dc3c48e7e8 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -302,6 +302,9 @@ static int mchp_pdmc_chmap_ctl_put(struct snd_kcontrol *kcontrol,
 	if (!substream)
 		return -ENODEV;
 
+	if (!substream->runtime)
+		return 0; /* just for avoiding error from alsactl restore */
+
 	map = mchp_pdmc_chmap_get(substream, info);
 	if (!map)
 		return -EINVAL;

base-commit: 4d0326b60bb753627437fff0f76bf1525bcda422
-- 
2.34.1

