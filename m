Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5E840B84
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:32:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22288852;
	Mon, 29 Jan 2024 17:31:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22288852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545925;
	bh=aNsf8rFngmr4TYBrPemJAolCtcIkgvbOTrD34WK1ofM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bi+R8QZEeSnkU9/1kl756NgyxGbSOqfl3UNnI70sA6buOEm0EqUTlWSA/E1pBT5eS
	 hdyDaa5G1TtTs152pTCqP5ODLkPF/eNlPJzWnHEf7/2T/SJotZ4q33QDba4grRtsID
	 DGXMO8be+DvC8yXCWmyNiXQCxw42Ehj3UuqnmEkY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB95F80606; Mon, 29 Jan 2024 17:29:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39484F807A6;
	Mon, 29 Jan 2024 17:29:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F151F805AE; Mon, 29 Jan 2024 17:28:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC9D1F80587
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC9D1F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=g4/gtMUe
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0J006968;
	Mon, 29 Jan 2024 10:27:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=hWIZx3SVGmXaP46UN8UM0rv5QCRd2JlcYKJUxWaPxiw=; b=
	g4/gtMUeCr9LbazmIhlkHShBXNV42hHdSdW2QsTwJ85mYLvYrMvjj+nyjALN5i0x
	t0mOzbvGnCJTqUPKjr8H5CB23gXVsnnc1coY4vVromAJ1O8sRFfEJCkR9MJuOIRC
	HXOxRwbrdoXtRwX6B/9OhdWeOEThox9UNKURdQahUfnk6qgb3O/V0CRC6Dh+nJR6
	JCFteRbZUqBFm+WqQ0D7sfxVHHd/+3Xbg5goPC9gwVXykri260haT0KbdALa4LVl
	T7y9jIaSThvLqIqmlS5TX9dLG95WUr/AEKjAyyRM7DEnIXf1fqHXRkoBHbi0TiZA
	66fgSWjv6Qmx1Ox/ja+hmA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8p-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:44 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7E545820247;
	Mon, 29 Jan 2024 16:27:44 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 09/18] ALSA: hda: cs35l56: Initialize all ASP1 registers
Date: Mon, 29 Jan 2024 16:27:28 +0000
Message-ID: <20240129162737.497-10-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: naKf23TEBYC8V5T512tzgCeMK3gg3Fb0
X-Proofpoint-GUID: naKf23TEBYC8V5T512tzgCeMK3gg3Fb0
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PKTI7AHQTBFSJKMP6WIU572WZVGF5DCC
X-Message-ID-Hash: PKTI7AHQTBFSJKMP6WIU572WZVGF5DCC
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKTI7AHQTBFSJKMP6WIU572WZVGF5DCC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ASP1_FRAME_CONTROL1, ASP1_FRAME_CONTROL5 and the ASP1_TX?_INPUT
registers to the sequence used to initialize the ASP configuration.
Write this sequence to the cache and directly to the registers to
ensure that they match.

A system-specific firmware can patch these registers to values that are
not the silicon default, so that the CS35L56 boots already in the
configuration used by Windows or by "driverless" Windows setups such
as factory tuning.

These may not match how Linux is configuring the HDA codec. And anyway
on Linux the ALSA controls are used to configure routing options.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index b61e1de8c4bf..f22bcb104a4e 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -30,14 +30,23 @@
   *  ASP1_RX_WL = 24 bits per sample
   *  ASP1_TX_WL = 24 bits per sample
   *  ASP1_RXn_EN 1..3 and ASP1_TXn_EN 1..4 disabled
+  *
+  * Override any Windows-specific mixer settings applied by the firmware.
   */
 static const struct reg_sequence cs35l56_hda_dai_config[] = {
 	{ CS35L56_ASP1_CONTROL1,	0x00000021 },
 	{ CS35L56_ASP1_CONTROL2,	0x20200200 },
 	{ CS35L56_ASP1_CONTROL3,	0x00000003 },
+	{ CS35L56_ASP1_FRAME_CONTROL1,	0x03020100 },
+	{ CS35L56_ASP1_FRAME_CONTROL5,	0x00020100 },
 	{ CS35L56_ASP1_DATA_CONTROL5,	0x00000018 },
 	{ CS35L56_ASP1_DATA_CONTROL1,	0x00000018 },
 	{ CS35L56_ASP1_ENABLES1,	0x00000000 },
+	{ CS35L56_ASP1TX1_INPUT,	0x00000018 },
+	{ CS35L56_ASP1TX2_INPUT,	0x00000019 },
+	{ CS35L56_ASP1TX3_INPUT,	0x00000020 },
+	{ CS35L56_ASP1TX4_INPUT,	0x00000028 },
+
 };
 
 static void cs35l56_hda_play(struct cs35l56_hda *cs35l56)
@@ -133,6 +142,10 @@ static int cs35l56_hda_runtime_resume(struct device *dev)
 		}
 	}
 
+	ret = cs35l56_force_sync_asp1_registers_from_cache(&cs35l56->base);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:
@@ -976,6 +989,9 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 
 	regmap_multi_reg_write(cs35l56->base.regmap, cs35l56_hda_dai_config,
 			       ARRAY_SIZE(cs35l56_hda_dai_config));
+	ret = cs35l56_force_sync_asp1_registers_from_cache(&cs35l56->base);
+	if (ret)
+		goto err;
 
 	/*
 	 * By default only enable one ASP1TXn, where n=amplifier index,
-- 
2.39.2

