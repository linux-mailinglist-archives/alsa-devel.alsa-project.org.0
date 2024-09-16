Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD197C9E6
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96CDDE8E;
	Thu, 19 Sep 2024 15:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96CDDE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751709;
	bh=yUY2mwNXerJkwLgbRFEiCz35UZmfMk8zFAqn458H3Bo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GNpoU5j+hhDWQefRlzJUitzRB3zAeA+FEzDBY7+3pbY0NO8UF/8VC+mCREVm9PALH
	 HOFR811DoavvZHCXVAV8/dBQkL1gmWGtKBo+ukoeZmu5zFGjeIz9lkLcfTQvCQqNit
	 vA4emAvzD8KyJnLPlUzE9RcHtk/84z6p8lPu5k9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55644F806AD; Thu, 19 Sep 2024 15:13:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B6ECF806A2;
	Thu, 19 Sep 2024 15:13:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99AEAF8020D; Mon, 16 Sep 2024 11:11:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BBB45F80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 11:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBB45F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=dODRYBaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726477906; x=1758013906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yUY2mwNXerJkwLgbRFEiCz35UZmfMk8zFAqn458H3Bo=;
  b=dODRYBaa/N8QYNAYbzZY43DH6VjxskIu2Orq2KUs4TIbPtiyh/MPVrEh
   Ff+zDOb3yYObIXTEXoSb/gBsLO7MopOh0iDm9iaNVYHixAEYwQE5bdrSZ
   Z6Ir9acgYzprxEH3xFvlOMwgNPEDOTY7UgWLX3UEEA7riEoaXuomttwQV
   B9jbcdcP3LcBtnzKOF0WaSMY0wda3Pr9EwxX7COu1J9tuwDTKji7ijbrB
   LZEWqukqCGSsvSiJvW1E8EjEmA8BXePKp8PiTQD5gbrXoyxUWS/EJuWor
   omndLYcvX4SLnLc9uTBWbroDm+QQV+6caAlRrlCzgk4TMzeM7l6MUFzDL
   w==;
X-CSE-ConnectionGUID: zBJi05dESDObnv88EXzWcg==
X-CSE-MsgGUID: X74qlIngRCeLSFQLyaNv/Q==
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600";
   d="scan'208";a="34997190"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2024 02:11:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Sep 2024 02:11:26 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 16 Sep 2024 02:11:23 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 1/2] ASoC: atmel: mchp-spdiftx: Remove interface name from
 stream_name
Date: Mon, 16 Sep 2024 12:10:56 +0300
Message-ID: <20240916091056.11910-2-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916091056.11910-1-andrei.simion@microchip.com>
References: <20240916091056.11910-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=98237714c=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5BEFYAGTL5Z2PTEG62NSNXJCDYE5WTVF
X-Message-ID-Hash: 5BEFYAGTL5Z2PTEG62NSNXJCDYE5WTVF
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:13:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BEFYAGTL5Z2PTEG62NSNXJCDYE5WTVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Remove the interface name from the stream_name. The interface name (and the
index of the interface) can be set in DT using the sound-name-prefix string
property.

[andrei.simion@microchip.com: Adjust the commit title.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 4c60ea652896..245c0352c141 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -707,7 +707,7 @@ static const struct snd_soc_dai_ops mchp_spdiftx_dai_ops = {
 static struct snd_soc_dai_driver mchp_spdiftx_dai = {
 	.name = "mchp-spdiftx",
 	.playback = {
-		.stream_name = "S/PDIF Playback",
+		.stream_name = "Playback",
 		.channels_min = 1,
 		.channels_max = 2,
 		.rates = MCHP_SPDIFTX_RATES,
-- 
2.34.1

