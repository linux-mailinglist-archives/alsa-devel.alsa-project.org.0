Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE397C9ED
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 15:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ABC3E66;
	Thu, 19 Sep 2024 15:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ABC3E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726751790;
	bh=LtyrK8rT+ddKnOKr4OAF9a6sJB7r1UWxYnOf39Qe6Bg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=StE3bC4HsTPxXYdS7dnQKhsBEtWTEppV7PwkSxMfNfopr/Vath+xypuZaLjYL4ngw
	 fWGByLoSD+nTtU5YGHWYV+yyd+jd6zbSBQgASRpqjjXPWjRpHgYOJcK3qQ150QI9e0
	 TyG+jl5p8ONvtpl+2GfFDLwGfQxolsERQ8SoeX14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 599E2F8075A; Thu, 19 Sep 2024 15:13:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF8BF805EE;
	Thu, 19 Sep 2024 15:13:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADBBBF8020D; Mon, 16 Sep 2024 15:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72CE6F80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 15:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72CE6F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=g4BRnS1H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726492820; x=1758028820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LtyrK8rT+ddKnOKr4OAF9a6sJB7r1UWxYnOf39Qe6Bg=;
  b=g4BRnS1HIM6pVDia17xWtVk53PBjKfqA3k2AqN0D48nca3udNdWAJITF
   S4AObKxnAYEaa0bB0JOf4hglWFUCVrv2p/Ue0EYNUFmKi+afgPX7dPP1B
   wEXlHAoX+ztseaP9nTU2WVK0fjCV8gIHPuVIIF0SvuAakmx+K65j+KEbG
   PI5opxnydPWwnca0T4N/hBQmkXoDGVtGZDFG5UlHCquBjWtl8P4m5EReQ
   g3G+K3FqKv98w4ZFqrYtzW6KPeiQCjJpPwk8IfYZ6qv691Gnlv5I7HkYI
   boRDvbnIEl/xqiwMR6Rpg0oGKBr2SafP9M8T4EwYDq1bOiJK96bH7Z888
   g==;
X-CSE-ConnectionGUID: 50Z/Q3YNQtGxx5+pLOGVZA==
X-CSE-MsgGUID: UsZZD4kASkGvuL/uCyRMpQ==
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600";
   d="scan'208";a="262829818"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Sep 2024 06:20:16 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 16 Sep 2024 06:19:35 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 16 Sep 2024 06:19:32 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH v2 2/2] ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due to
 single channel limitation
Date: Mon, 16 Sep 2024 16:19:10 +0300
Message-ID: <20240916131910.22680-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916131910.22680-1-andrei.simion@microchip.com>
References: <20240916131910.22680-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=98237714c=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5WL4HWI2QTIHRAJZVWK3BPTJUEL2A4BZ
X-Message-ID-Hash: 5WL4HWI2QTIHRAJZVWK3BPTJUEL2A4BZ
X-Mailman-Approved-At: Thu, 19 Sep 2024 13:13:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WL4HWI2QTIHRAJZVWK3BPTJUEL2A4BZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Drop S24_LE format because it is not supported if more than 2 channels
(of TDM slots) are used. This limitation makes it impractical for use cases
requiring more than 2 TDM slots, leading to potential issues in
multi-channel configurations.

[andrei.simion@microchip.com: Reword the commit title and the commit
message. Add code comment to explain the removed code.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
v1 -> v2:
- add code comment to explain why S24_LE is dropped.
---
 sound/soc/atmel/atmel_ssc_dai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 7047f17fe7a8..89098f41679c 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -821,8 +821,9 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
 	return 0;
 }
 
+/* S24_LE is not supported if more than 2 channels (of TDM slots) are used. */
 #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
-			  SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+			   SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.startup	= atmel_ssc_startup,
-- 
2.34.1

